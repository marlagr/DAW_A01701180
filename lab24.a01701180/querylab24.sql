--Crear tablas
CREATE TABLE ClientesBanca
(
    Nombre varchar(30),
    NoCuenta varchar(5),
    Saldo numeric(10,2), 
    PRIMARY KEY(NoCuenta)
)

CREATE TABLE TipoMovimiento
(
    ClaveM varchar(2), 
    Descripcion varchar(30), 
    PRIMARY KEY(ClaveM)
)

CREATE TABLE Realizan
(
    Fecha datetime,
    Monto numeric(10,2),
    NoCuenta varchar(5),
    ClaveM varchar(2),
    CONSTRAINT FK_cuenta FOREIGN KEY(NoCuenta)
    REFERENCES ClientesBanca(NoCuenta),
    CONSTRAINT FK_clave FOREIGN KEY(ClaveM)
    REFERENCES TipoMovimiento(ClaveM)
)

BEGIN TRANSACTION PRUEBA1 
INSERT INTO ClientesBanca VALUES('Manuel Rios Maldonado', '001', 9000); 
INSERT INTO ClientesBanca VALUES('Pablo Perez Ortiz', '002', 5000); 
INSERT INTO ClientesBanca VALUES('Luis Flores Alvarado', '003',  8000); 
COMMIT TRANSACTION PRUEBA1

SELECT * FROM ClientesBanca 