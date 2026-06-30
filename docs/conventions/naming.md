# Convención de nombres — repositorio y proyecto

> Cómo nombramos el repositorio y el proyecto en Sistema de Votación PostgreSQL.
> **Última actualización**: 2026-06-30

## Nombre del repositorio

- **Formato**: `kebab-case` — solo minúsculas, palabras separadas por guion (`-`).
- **Sin** guiones bajos (`_`), espacios, mayúsculas ni palabras pegadas.
- **Patrón recomendado**: `<dominio>-<tecnología>` cuando ayude a ubicar el proyecto.
- **Ejemplo de este repo**: `sistema-votacion-postgresql`.

| ✅ Correcto                   | ❌ Evitar                     | Motivo                       |
| ----------------------------- | ----------------------------- | ---------------------------- |
| `sistema-votacion-postgresql` | `sistemavotacion-postgresql`  | Palabras pegadas             |
| `sistema-votacion-postgresql` | `sistema_votacion_postgresql` | Guion bajo en vez de guion   |
| `sistema-votacion-postgresql` | `Sistema-Votacion-PostgreSQL` | Mayúsculas                   |

> Renombrar un repo cambia su URL pública. GitHub crea un redirect automático, pero
> hay que actualizar los remotes locales y las referencias en la documentación.

## Nombre visible del proyecto

- **Formato**: Título legible en español, con mayúsculas y tildes correctas.
- **Valor canónico**: **Sistema de Votación PostgreSQL**.
- Úsalo de forma idéntica en `README.md`, `AGENTS.md`, encabezados de `docs/` y notas de release.

## Base de datos

- El nombre de la base de datos sí usa `snake_case`: `sistema_votacion` (ver
  [`database.md`](database.md) para el resto de convenciones de objetos SQL).

## Coherencia entre identificadores

| Identificador        | Convención        | Valor                         |
| -------------------- | ----------------- | ----------------------------- |
| Repositorio / carpeta | `kebab-case`     | `sistema-votacion-postgresql` |
| Proyecto (display)   | Título legible    | Sistema de Votación PostgreSQL |
| Base de datos        | `snake_case`      | `sistema_votacion`            |
