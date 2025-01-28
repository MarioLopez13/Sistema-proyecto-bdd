Create database Proyect
go
use Proyect
go

CREATE TABLE Cliente (
                Id_Cliente NUMERIC(10) IDENTITY NOT NULL,
                Nombres VARCHAR(50) NOT NULL,
                Apellidos VARCHAR(50) NOT NULL,
                Cedula NUMERIC(10) NOT NULL,
                Correo VARCHAR(25) NOT NULL,
                Total_Cuenta money NOT NULL,
                Direccion VARCHAR(120) NOT NULL,
                Cuenta NUMERIC(10) NOT NULL,
				Contrasea VARCHAR(25) NOT NULL,
                CONSTRAINT Cliente_pk PRIMARY KEY (Id_Cliente)
)

CREATE TABLE Transaccion (
                Id_Transaccion NUMERIC(10) IDENTITY NOT NULL,
                Fecha_Transaccion DATETIME NOT NULL,
                Monto DECIMAL(10,2) NOT NULL,
                Estado VARCHAR(10) NOT NULL,
                Id_OrigenCli NUMERIC(10) NOT NULL,
                Id_Cliente NUMERIC(10) NOT NULL,
                CONSTRAINT Transaccion_pk PRIMARY KEY (Id_Transaccion)
)

CREATE TABLE Auditorias (
                Id_Aditoria NUMERIC(10) IDENTITY NOT NULL,
                Detalle_Auditoria VARCHAR NOT NULL,
                Fecha_Auditoria DATETIME NOT NULL,
                Ubicacion VARCHAR NOT NULL,
                Id_Transaccion NUMERIC NOT NULL,
                CONSTRAINT Auditorias_pk PRIMARY KEY (Id_Aditoria)
)

CREATE TABLE Usuario (
                Id_Usuario NUMERIC(10) IDENTITY NOT NULL,
                Cedula NUMERIC(10) NOT NULL,
                Nombres VARCHAR(50) NOT NULL,
                Apellidos VARCHAR(50) NOT NULL,
                Correo VARCHAR(25) NOT NULL,
                Direccion VARCHAR(120) NOT NULL,
                Rol VARCHAR(20) NOT NULL,
                Estado VARCHAR(10) NOT NULL,
                CONSTRAINT Usuario_pk PRIMARY KEY (Id_Usuario)
)

CREATE TABLE Logs (
                Id_LOG NUMERIC(10) NOT NULL,
                Evento VARCHAR(250) NOT NULL,
                Detalle VARCHAR(250) NOT NULL,
                Id_Usuario NUMERIC NOT NULL,
                CONSTRAINT Logs_pk PRIMARY KEY (Id_LOG)
)

CREATE TABLE Reportes (
                Id_Reporte NUMERIC(10) IDENTITY NOT NULL,
                Fecha_Reporte DATETIME NOT NULL,
                Contenido VARCHAR NOT NULL,
                Id_Usuario NUMERIC NOT NULL,
                CONSTRAINT Reportes_pk PRIMARY KEY (Id_Reporte)
)

ALTER TABLE Transaccion ADD CONSTRAINT Cliente_Transaccion_fk
FOREIGN KEY (Id_Cliente)
REFERENCES Cliente (Id_Cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Auditorias ADD CONSTRAINT Transaccion_Auditorias_fk
FOREIGN KEY (Id_Transaccion)
REFERENCES Transaccion (Id_Transaccion)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Reportes ADD CONSTRAINT Usuario_Reportes_fk
FOREIGN KEY (Id_Usuario)
REFERENCES Usuario (Id_Usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE Logs ADD CONSTRAINT Usuario_Logs_fk
FOREIGN KEY (Id_Usuario)
REFERENCES Usuario (Id_Usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION