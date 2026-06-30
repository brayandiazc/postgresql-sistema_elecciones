# Convenciones de secretos y credenciales

> Cómo gestionamos secretos en Sistema de Votación PostgreSQL.
> **Última actualización**: 2026-06-30

## Filosofía

- Los secretos **nunca** se commitean en texto plano.
- Separación clara entre **configuración** (no sensible) y **secretos** (sensible).

## Dónde vive cada cosa

| Tipo                         | Dónde                                         |
| ---------------------------- | --------------------------------------------- |
| Credenciales de PostgreSQL   | `.env` local o `~/.pgpass` (nunca versionado) |
| Variables de conexión        | Variables de entorno `PG*` (ver `.env.example`) |
| Secretos de CI/CD            | Secrets del proveedor (p. ej. GitHub Actions) |

## Reglas

- El archivo `.env` está en `.gitignore`; solo se versiona `.env.example` (sin valores).
- Comparte secretos con nuevos colaboradores **fuera de banda** (nunca por git, email plano ni chat público).
- Rota credenciales periódicamente (sugerido cada 90 días) y de inmediato ante sospecha de fuga.
- Si un secreto se commitea por error: **rota el secreto primero**, luego limpia la historia.

## Ejemplos

```bash
# Copiar la plantilla de variables
cp .env.example .env
# Completar valores reales (que nunca se suben)
```

## Credenciales de psql

```bash
# Evita escribir la contraseña en cada comando con un archivo ~/.pgpass:
#   hostname:port:database:username:password
chmod 600 ~/.pgpass
```

## Referencias

- [SECURITY.md](../../SECURITY.md) — política de seguridad.
- [PostgreSQL — The Password File (.pgpass)](https://www.postgresql.org/docs/current/libpq-pgpass.html).
