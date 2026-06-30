# Convenciones

Esta carpeta documenta **cómo trabajamos** en Sistema de Votación PostgreSQL: reglas y
estándares transversales que aplican al día a día, independientes de cualquier
feature concreta.

> Diferencia con `docs/architecture/`: aquí van las **reglas** ("cómo modelamos
> datos"); en `architecture/` va **este** proyecto en concreto ("cuál es nuestro
> modelo de datos").

## Convenciones incluidas

| Convención                                         | Tema                               |
| -------------------------------------------------- | ---------------------------------- |
| [ai-agents.md](ai-agents.md)                       | Trabajo con agentes de IA          |
| [database.md](database.md)                         | Modelado de datos en SQL           |
| [naming.md](naming.md)                             | Nombres de repositorio y proyecto  |
| [secrets.md](secrets.md)                           | Manejo de secretos y credenciales  |
| [testing.md](testing.md)                           | Estrategia y estándares de testing |

## Agregar una convención

Copia [`_template.md`](_template.md), renómbralo en `kebab-case` y documenta el
nuevo tema. Añádelo a la tabla de arriba.

## Convenciones adicionales opcionales

No se incluyen por defecto; créalas con `_template.md` si el proyecto las necesita
(p. ej. funciones/triggers, particionado, backups y restauración).
