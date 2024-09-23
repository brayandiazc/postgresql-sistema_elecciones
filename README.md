# Sistema de Votación Automatizado en PostgreSQL

Este proyecto es un sistema de votación automatizado diseñado para simular el proceso electoral en Wenenzuela, basado en la documentación y las mejores prácticas del proceso de votación. El sistema registra votantes, candidatos, mesas, votos emitidos y genera actas para verificar los resultados.

## Descripción del proyecto

El objetivo principal del sistema es ofrecer una plataforma segura y automatizada para gestionar elecciones, registrar los votos y generar actas de verificación. Este sistema es completamente auditable y permite la verificación de los resultados con base en los votos emitidos y las actas generadas en cada mesa electoral. Utiliza **PostgreSQL** como base de datos para almacenar la información del proceso.

## Prerrequisitos o Dependencias

Para ejecutar este proyecto necesitas las siguientes herramientas y versiones de software:

- **Sistema Operativo**: Ubuntu 20.04, Windows 10 o superior.
- **Base de datos**: PostgreSQL 12 o superior.
- **Lenguaje de Programación**: Python 3.8 (opcional, si se utiliza para manejo de datos).
- **Otras herramientas**: Git, cualquier cliente SQL para ejecutar los scripts de PostgreSQL.

## Instalación del Proyecto

Sigue estos pasos para configurar el entorno de desarrollo e instalar las dependencias necesarias:

```bash
# paso 1: Clonar el repositorio
git clone git@github.com:brayandiazc/postgresql-sistema_votaciones.git

# paso 2: Entrar al directorio del proyecto
cd sistema-votacion

# paso 3: Configurar PostgreSQL y crear la base de datos
psql -U tu_usuario -d postgres -c "CREATE DATABASE sistema_votacion;"
```

