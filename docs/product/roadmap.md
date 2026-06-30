# Roadmap — Sistema de Votación PostgreSQL

> Estado y dirección del proyecto. Documento vivo.
> **Última actualización**: 2026-06-30

## Leyenda

- ✅ Hecho
- 🚧 En curso
- 📋 Planificado
- ⏸️ Diferido

## Visión

Mantener una base de datos de votación clara y reproducible que sirva como material
educativo para practicar modelado relacional, integridad referencial y consultas de
auditoría en PostgreSQL.

## Estado actual

- ✅ Esquema con tablas `Votantes`, `Candidatos`, `Mesas`, `Votos` y `Actas`.
- ✅ Datos semilla de candidatos, mesas, votantes y votos.
- ✅ Carga reproducible ordenada por dependencias.

## Por fase

### v0.1 — Base de datos y seeds

- [x] Definir el esquema en `db/schema.sql`.
- [x] Cargar datos semilla en `db/seeds/`.

### v0.2 — Auditoría y verificación

- [ ] Consultas reutilizables de resultados (ranking, participación).
- [ ] Poblar `Actas` con conteos por mesa.
- [ ] Vistas SQL para resultados consolidados.

### v1.0 — Validación e integridad

- [ ] Restricciones adicionales (un voto por votante, `NOT NULL` en FKs).
- [ ] Scripts de validación de consistencia de datos.

## Backlog / ideas sin agendar

- Función/trigger que genere el acta de una mesa automáticamente.
- Conjunto de pruebas SQL (pgTAP) sobre el esquema.

## Fuera de alcance

- Interfaz de usuario o API: el proyecto es intencionalmente SQL puro.

## Cómo se actualiza este documento

- Revisar al cerrar cada fase.
- Las decisiones que cambian el rumbo se registran como ADRs en [`../decisions/`](../decisions/README.md).
