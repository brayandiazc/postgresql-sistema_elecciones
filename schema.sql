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

-- Crear la tabla de candidatos
CREATE TABLE Candidatos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  partido VARCHAR(100)
);

-- Crear la tabla de mesas electorales
CREATE TABLE Mesas (
  id SERIAL PRIMARY KEY,
  ubicacion VARCHAR(100)
);

-- Crear la tabla de votos
CREATE TABLE Votos (
  id SERIAL PRIMARY KEY,
  votante_id INT REFERENCES Votantes(id),
  candidato_id INT REFERENCES Candidatos(id),
  mesa_id INT REFERENCES Mesas(id),
  fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

