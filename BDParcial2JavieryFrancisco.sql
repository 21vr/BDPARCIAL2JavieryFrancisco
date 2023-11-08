CREATE DATABASE BDParcial2JavieryFrancisco;

USE BDParcial2JavieryFrancisco;

-- Crear la tabla 'departamento'

CREATE TABLE departamento (
    DepartamentoID INT PRIMARY KEY,
    NombreDepartamento VARCHAR(50)
);

-- Crear la tabla 'Municipio'
CREATE TABLE Municipio (
    MunicipioID INT PRIMARY KEY,
    NombreMunicipio VARCHAR(50),
    DepartamentoID INT,
    CONSTRAINT FK_Municipio_Departamento
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID)
);

-- Crear la tabla 'Cliente'
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    DepartamentoID INT,
    MunicipioID INT,
    CONSTRAINT FK_Cliente_Departamento
    FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID),
    CONSTRAINT FK_Cliente_Municipio
    FOREIGN KEY (MunicipioID) REFERENCES Municipio(MunicipioID)
);

-- Insertar 4 departamentos
INSERT INTO Departamento (NombreDepartamento) VALUES
('Ahuachapan'),
('San Salvador'),
('Santa Ana'),
('Chalatenango');

-- Insertar 3 municipios por departamento
INSERT INTO Municipio (NombreMunicipio, DepartamentoID) VALUES
('Apaneca_Ahuachapan', 1),
('Atiquizaya_Ahuachapan', 1),
('Concepcion de Ataco_Ahuachapan', 1),
('Aguilares_San Salvador', 2),
('Apopa_San Salvador', 2),
('Ilopango_San Salvador', 2),
('Chalchuapa_Santa Ana', 3),
('Coatepeque_Santa Ana', 3),
('El Congo_Santa Ana', 3),
('Comalapa_Chalatenango', 4),
('La Palma_Chalatenango', 4),
('La Laguna_Chalatenango', 4);

-- Insertar 2 clientes
INSERT INTO Cliente (Nombre, Apellido, DepartamentoID, MunicipioID) VALUES
('Alexander', 'Naranjo', 1, 1),
('Andrés', 'García', 2, 5);

-- Realizar la consulta JOIN para unir tablas
SELECT Cliente.Nombre, Cliente.Apellido, Departamento.NombreDepartamento, Municipio.NombreMunicipio
FROM Cliente
JOIN Departamento ON Cliente.DepartamentoID = Departamento.DepartamentoID
JOIN Municipio ON Cliente.MunicipioID = Municipio.MunicipioID;