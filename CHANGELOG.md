# Changelog

Todos los cambios notables de este proyecto se documentan en este archivo.

El formato se basa en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/)
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Added

- Documentación basada en plantilla: `docs/` (arquitectura, convenciones, ADRs),
  `specs/`, gobernanza (`CONTRIBUTING`, `CODE_OF_CONDUCT`, `SECURITY`, `CHANGELOG`).
- Capa de IA: `AGENTS.md`/`CLAUDE.md`, subagentes y skills en `.claude/`.
- Convención de nombres de repositorio y proyecto (`docs/conventions/naming.md`).

### Changed

- Reorganización de los scripts SQL en `db/schema.sql` y `db/seeds/` (numerados por orden de carga).
- README reescrito para reflejar el proyecto SQL puro.
- Repositorio renombrado a `sistema-votacion-postgresql` (kebab-case consistente).

### Removed

- Documentos y convenciones de la plantilla que no aplican (API, auth, UI, SEO, i18n, deploy).

## [0.1.0] - 2026-06-30

### Added

- Esquema de votación (votantes, candidatos, mesas, votos, actas) y datos semilla.

<!--
Enlaces de comparación entre versiones (ajusta a tu repositorio):
[Unreleased]: https://github.com/brayandiazc/sistema-votacion-postgresql/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/brayandiazc/sistema-votacion-postgresql/releases/tag/v0.1.0
-->
