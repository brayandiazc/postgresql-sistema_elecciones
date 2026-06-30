# Stack Tecnológico

> Fuente de verdad de las tecnologías y versiones del proyecto.
> **Última actualización**: 2026-06-30

## Núcleo

| Categoría     | Tecnología | Versión | Por qué                                              |
| ------------- | ---------- | ------- | ---------------------------------------------------- |
| Base de datos | PostgreSQL | >= 12   | Integridad referencial robusta y amplia disponibilidad. |
| Lenguaje      | SQL (DDL/DML) | estándar | Toda la lógica del proyecto es declarativa.       |
| Cliente       | psql       | acorde a PostgreSQL | Ejecuta los scripts `.sql`.              |

## Herramientas de desarrollo

| Categoría        | Tecnología | Uso                                  |
| ---------------- | ---------- | ------------------------------------ |
| Control de versiones | Git    | Historial y colaboración.            |
| Editor           | VS Code (`.vscode/`) | Conexiones SQLTools (opcional). |
| Documentación    | Markdown + Mermaid | Diagramas ER y de flujo.     |

## Servicios externos

Ninguno. El proyecto se ejecuta por completo contra una instancia local de PostgreSQL.

## Versiones mínimas soportadas

- PostgreSQL >= 12
- psql compatible con la versión del servidor
