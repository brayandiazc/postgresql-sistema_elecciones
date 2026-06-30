# Sistema de Votación PostgreSQL — Arquitectura

> Vista de alto nivel de cómo está construido el sistema. Para el stack real
> (versiones) ver [`stack.md`](stack.md). Para el modelo de datos ver
> [`database.md`](database.md).
>
> **Última actualización**: 2026-06-30

## Visión general

El proyecto es **SQL puro sobre PostgreSQL**: no hay capa de aplicación, API ni
servidor. Todo el sistema se compone de scripts `.sql` que se ejecutan con `psql`.

- `db/schema.sql` — crea la base de datos `sistema_votacion` y las tablas.
- `db/seeds/*.sql` — pueblan las tablas con datos de ejemplo, en orden de dependencia.
- Las consultas de auditoría se ejecutan ad hoc contra la base ya cargada.

## Diagrama

```mermaid
graph TD
    subgraph "Scripts (repositorio)"
        S[schema.sql]
        D1[01_candidatos.sql]
        D2[02_mesas.sql]
        D3[03_votantes.sql]
        D4[04_votos.sql]
    end
    subgraph "PostgreSQL"
        DB[(sistema_votacion)]
    end
    S -->|DDL| DB
    D1 --> DB
    D2 --> DB
    D3 --> DB
    D4 --> DB
    DB -->|SELECT / agregaciones| R[Resultados y actas]
```

## Componentes

| Componente      | Responsabilidad                                          | Tecnología |
| --------------- | -------------------------------------------------------- | ---------- |
| `db/schema.sql` | Define base de datos, tablas, claves y relaciones (DDL). | SQL / DDL  |
| `db/seeds/`     | Carga datos de ejemplo en orden de dependencia (DML).    | SQL / DML  |
| Consultas       | Auditoría y resultados (agregaciones sobre las tablas).  | SQL        |

## Decisiones clave

| Decisión                        | Razón                                                         |
| ------------------------------- | ------------------------------------------------------------ |
| SQL puro, sin capa de aplicación | Foco educativo en modelado relacional y consultas.          |
| Seeds numerados (`01_`, `02_`…)  | Garantizar el orden de carga que respeta las claves foráneas. |
| PostgreSQL como único motor      | Integridad referencial robusta y disponibilidad amplia.     |

> El detalle y las alternativas de cada decisión relevante se registran como ADRs
> en [`../decisions/`](../decisions/README.md).

## Reglas no negociables

- Los seeds se cargan **en orden numérico**: candidatos y mesas antes que votos.
- Toda relación entre tablas se modela con **claves foráneas** explícitas.
- Ningún script debe asumir datos preexistentes que otro seed no haya cargado.

## Flujo de carga

```mermaid
sequenceDiagram
    actor U as Operador
    participant P as psql
    participant DB as sistema_votacion
    U->>P: psql -f db/schema.sql
    P->>DB: CREATE DATABASE + CREATE TABLE
    U->>P: psql -f db/seeds/01..04
    P->>DB: INSERT (candidatos, mesas, votantes, votos)
    U->>P: SELECT de auditoría
    P->>DB: agregaciones
    DB-->>U: resultados
```

## Referencias

- [`stack.md`](stack.md) — stack tecnológico y versiones.
- [`database.md`](database.md) — modelo de datos.
- [`../conventions/`](../conventions/README.md) — convenciones de trabajo.
