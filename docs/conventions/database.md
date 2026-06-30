# Convenciones de base de datos

> Reglas y estándares de modelado de datos en Sistema de Votación PostgreSQL.
> Para el modelo de datos concreto del proyecto ver
> [`../architecture/database.md`](../architecture/database.md).
> **Última actualización**: 2026-06-30

## Stack

- **Motor**: PostgreSQL >= 12.
- **Acceso**: SQL puro ejecutado con `psql`. No hay ORM ni capa de aplicación.
- **Esquema y datos**: versionados como scripts en `db/`.

## Reglas de modelado

- **Primary keys**: `SERIAL PRIMARY KEY` autoincremental, consistente en todas las tablas.
- **Nombres**: tablas en singular/PascalCase tal como en el esquema actual (`Votantes`,
  `Candidatos`, `Mesas`, `Votos`, `Actas`); columnas en `snake_case` y en español.
- **Foreign keys**: declaradas explícitamente con `REFERENCES`. Las columnas FK usan el
  sufijo `_id` (`votante_id`, `candidato_id`, `mesa_id`).
- **Timestamps**: las marcas de tiempo usan `TIMESTAMP DEFAULT CURRENT_TIMESTAMP`.
- **Unicidad**: aplicar `UNIQUE` donde corresponda al dominio (p. ej. `votantes.cedula`).

## Organización de scripts

- `db/schema.sql` — DDL: crea la base de datos y todas las tablas.
- `db/seeds/NN_<tabla>.sql` — DML: datos semilla. El prefijo numérico (`01_`, `02_`…)
  define el **orden de carga**, que debe respetar las dependencias de claves foráneas.
- Cargar siempre las tablas referenciadas (candidatos, mesas, votantes) antes que `Votos`.

## Migraciones

- No se usa herramienta de migraciones. El esquema se versiona como un único archivo
  (`db/schema.sql`) y se recrea la base de datos al cambiarlo.
- Si un cambio rompe datos existentes, documentarlo en el `CHANGELOG.md` y, si es
  relevante, registrar un ADR en [`../decisions/`](../decisions/README.md).

## Ejemplo

```sql
CREATE TABLE Votos (
  id SERIAL PRIMARY KEY,
  votante_id INT REFERENCES Votantes(id),
  candidato_id INT REFERENCES Candidatos(id),
  mesa_id INT REFERENCES Mesas(id),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Referencias

- [Documentación de PostgreSQL](https://www.postgresql.org/docs/).
