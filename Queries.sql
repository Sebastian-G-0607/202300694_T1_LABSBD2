-- script para crear la base de datos
CREATE DATABASE IF NOT EXISTS SistemaLicencias;
USE SistemaLicencias;

CREATE TABLE TiposLicencia (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255)
);

CREATE TABLE Solicitante (
    DPI VARCHAR(13) PRIMARY KEY,
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL
);

CREATE TABLE Licencia (
    NumeroLicencia VARCHAR(20) PRIMARY KEY,
    IdTipoLicencia INT NOT NULL,
    DPI VARCHAR(13) NOT NULL,
    FOREIGN KEY (IdTipoLicencia) REFERENCES TiposLicencia(Id),
    FOREIGN KEY (DPI) REFERENCES Solicitante(DPI)
);

CREATE TABLE Examen (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    DPI VARCHAR(13) NOT NULL,
    TeoricoAprobado BOOLEAN NOT NULL DEFAULT FALSE,
    PracticoAprobado BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (DPI) REFERENCES Solicitante(DPI)
);

SELECT 
    s.DPI, 
    s.Nombres, 
    s.Apellidos, 
    l.NumeroLicencia, 
    t.Tipo 
FROM Solicitante s
JOIN Licencia l ON s.DPI = l.DPI
JOIN TiposLicencia t ON l.IdTipoLicencia = t.Id;

SELECT 
    s.DPI, 
    s.Nombres, 
    s.Apellidos, 
    e.TeoricoAprobado, 
    e.PracticoAprobado
FROM Solicitante s
JOIN Examen e ON s.DPI = e.DPI
WHERE e.TeoricoAprobado = TRUE AND e.PracticoAprobado = TRUE;

-- query para obtener las licencias de una persona
SELECT 
    s.DPI, 
    s.Nombres, 
    s.Apellidos, 
    l.NumeroLicencia, 
    t.Tipo 
FROM Solicitante s
JOIN Licencia l ON s.DPI = l.DPI
JOIN TiposLicencia t ON l.IdTipoLicencia = t.Id;

-- query para obtener los exámenes aprobados
SELECT 
    s.DPI, 
    s.Nombres, 
    s.Apellidos, 
    e.TeoricoAprobado, 
    e.PracticoAprobado
FROM Solicitante s
JOIN Examen e ON s.DPI = e.DPI
WHERE e.TeoricoAprobado = TRUE AND e.PracticoAprobado = TRUE;
