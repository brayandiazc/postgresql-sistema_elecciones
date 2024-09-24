-- Crear la base de datos
CREATE DATABASE sistema_votacion;
-- Conectar a la base de datos
\c sistema_votacion;

-- Crear la tabla de votantes
CREATE TABLE Votantes (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  cedula VARCHAR(20) UNIQUE
);