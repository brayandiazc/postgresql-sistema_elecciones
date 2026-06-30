<!--
  Instrucciones canónicas para agentes de Sistema de Votación PostgreSQL.
  Esta es la única fuente de verdad para los agentes de codificación con IA (Claude Code, Copilot,
  Cursor, etc.). CLAUDE.md importa este archivo. Manténlo conciso (<150 líneas) e
  incluye solo guía no evidente y específica del proyecto — las personas leen el README.
-->

# AGENTS.md — Sistema de Votación PostgreSQL

Instrucciones para los agentes de codificación con IA que trabajan en este repositorio.

## Resumen del proyecto

Sistema de votación simulado, implementado en **SQL puro sobre PostgreSQL**: un esquema
(`db/schema.sql`) y datos semilla (`db/seeds/`). No hay capa de aplicación, API ni auth.
La documentación completa vive en [`docs/`](docs/README.md) — léela antes de un trabajo
no trivial.

## Mapa del repositorio (lee esto primero)

| Necesitas saber…                  | Lee                                                                      |
| --------------------------------- | ------------------------------------------------------------------------ |
| Cómo está construido el sistema   | [`docs/architecture/architecture.md`](docs/architecture/architecture.md) |
| Stack y versiones                 | [`docs/architecture/stack.md`](docs/architecture/stack.md)               |
| Modelo de datos                   | [`docs/architecture/database.md`](docs/architecture/database.md)         |
| Convenciones de SQL/datos         | [`docs/conventions/database.md`](docs/conventions/database.md)           |
| Cómo escribimos código            | [`docs/conventions/`](docs/conventions/README.md)                        |
| Por qué se tomaron las decisiones | [`docs/decisions/`](docs/decisions/README.md)                            |

> Remítete siempre a `docs/conventions/` para el estilo y las reglas — son la fuente
> de verdad, no tus suposiciones previas.

## Configuración y comandos

```bash
# Crear la base de datos y las tablas
psql -U tu_usuario -f db/schema.sql

# Cargar los datos semilla EN ORDEN (los votos dependen del resto)
psql -U tu_usuario -d sistema_votacion -f db/seeds/01_candidatos.sql
psql -U tu_usuario -d sistema_votacion -f db/seeds/02_mesas.sql
psql -U tu_usuario -d sistema_votacion -f db/seeds/03_votantes.sql
psql -U tu_usuario -d sistema_votacion -f db/seeds/04_votos.sql
```

## Acuerdo de trabajo

- **Planifica antes de cambios grandes.** Para trabajo no trivial, redacta una especificación
  ligera en [`specs/`](specs/README.md) (o delega en el subagente `architect`).
- **Sigue Git Flow.** Crea ramas desde `develop` como `feat/…`, `fix/…`, etc. Consulta
  [`CONTRIBUTING.md`](CONTRIBUTING.md). Nunca hagas commit directamente a `main`.
- **Conventional Commits.** `type(scope): summary`. Añade la línea de coautoría de IA
  para los commits asistidos por IA (consulta [`docs/conventions/ai-agents.md`](docs/conventions/ai-agents.md)).
- **Pruebas con cada cambio.** Sigue [`docs/conventions/testing.md`](docs/conventions/testing.md).
- **Mantén la documentación sincronizada.** Actualiza los `docs/` correspondientes y `CHANGELOG.md`; registra
  las decisiones notables como un ADR en `docs/decisions/`.

## Reglas estrictas — nunca hagas esto

- Nunca hagas commit de secretos ni de valores reales de `.env`. Consulta [`SECURITY.md`](SECURITY.md)
  y [`docs/conventions/secrets.md`](docs/conventions/secrets.md).
- Nunca inventes tablas, columnas ni archivos — verifica primero el esquema en `db/schema.sql`.
- Nunca rompas la integridad referencial: respeta el orden de carga de los seeds.
- Nunca hagas push a `main` ni force-push a ramas compartidas.
- No reformatees código no relacionado ni hagas cambios masivos fuera de la tarea.

## Asistentes de IA y herramientas

- Este archivo es el contexto canónico. Los archivos específicos de cada herramienta (`CLAUDE.md`, etc.)
  apuntan aquí.
- Los subagentes reutilizables viven en [`.claude/agents/`](.claude/agents) y las skills en
  [`.claude/skills/`](.claude/skills) — son **ejemplos**; adáptalos o elimínalos
  según el proyecto.
- Reglas para trabajar con IA: [`docs/conventions/ai-agents.md`](docs/conventions/ai-agents.md).
