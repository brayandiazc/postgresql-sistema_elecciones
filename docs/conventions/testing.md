# Convenciones de testing

> Cómo verificamos el esquema y los datos en Sistema de Votación PostgreSQL.
> **Última actualización**: 2026-06-30

## Enfoque

No hay framework de pruebas automatizado todavía (ver
[`../product/roadmap.md`](../product/roadmap.md)). La verificación es **manual**, mediante
una carga limpia y consultas de comprobación. La opción futura preferida para tests
automatizados sobre el esquema es [pgTAP](https://pgtap.org/).

## Verificación manual

1. Recrear la base desde cero:

   ```bash
   psql -U tu_usuario -d postgres -c "DROP DATABASE IF EXISTS sistema_votacion;"
   psql -U tu_usuario -f db/schema.sql
   ```

2. Cargar los seeds en orden y confirmar que ninguno falla por claves foráneas:

   ```bash
   for f in db/seeds/0*.sql; do psql -U tu_usuario -d sistema_votacion -f "$f"; done
   ```

3. Comprobar la integridad con consultas de control:

   ```sql
   -- Conteos esperados
   SELECT 'candidatos' AS tabla, COUNT(*) FROM Candidatos
   UNION ALL SELECT 'mesas', COUNT(*) FROM Mesas
   UNION ALL SELECT 'votantes', COUNT(*) FROM Votantes
   UNION ALL SELECT 'votos', COUNT(*) FROM Votos;

   -- No debe haber votos huérfanos (FK rotas)
   SELECT COUNT(*) FROM Votos v
   LEFT JOIN Votantes va ON va.id = v.votante_id
   WHERE va.id IS NULL;
   ```

## Reglas

- Toda modificación del esquema o de los seeds se valida con una **carga limpia** completa.
- Las consultas de verificación deben ser deterministas (no dependen de `CURRENT_TIMESTAMP`).
- Si cambian los volúmenes esperados, actualiza la tabla en
  [`../architecture/database.md`](../architecture/database.md).

## Referencias

- [pgTAP — unit testing para PostgreSQL](https://pgtap.org/).
