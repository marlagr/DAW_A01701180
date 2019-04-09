SELECT * FROM ClientesBanca

BEGIN TRANSACTION PRUEBA2 
INSERT INTO ClientesBanca VALUES('Ricardo Rios Maldonado','004',19000); 
INSERT INTO ClientesBanca VALUES('Pablo Ortiz Arana','005', 15000); 
INSERT INTO ClientesBanca VALUES('Luis Manuel Alvarado','006',18000); 

SELECT * FROM ClientesBanca where NoCuenta='001'

--ATOMICIDAD DE LA BASE DE DATOS

BEGIN TRANSACTION PRUEBA3 
INSERT INTO TipoMovimiento VALUES('A','Retiro Cajero Automatico'); 
INSERT INTO TipoMovimiento VALUES('B','Deposito Ventanilla'); 
COMMIT TRANSACTION PRUEBA3 

SELECT * FROM TipoMovimiento

BEGIN TRANSACTION PRUEBA4 
INSERT INTO Realizan VALUES(GETDATE() ,500, '001','A'); 
UPDATE ClientesBanca SET SALDO = SALDO -500 
WHERE NoCuenta='001' 
COMMIT TRANSACTION PRUEBA4 

SELECT * FROM Realizan

--MANEJANDO FALLAS EN UNA TRANSACCION

BEGIN TRANSACTION PRUEBA5 
INSERT INTO ClientesBanca VALUES('Rosa Ruiz Maldonado','005',9000) 
INSERT INTO ClientesBanca VALUES('Luis Camino Ortiz','006',5000); 
INSERT INTO ClientesBanca VALUES('Oscar Perez Alvarado','007',8000); 

IF @@ERROR = 0 
COMMIT TRANSACTION PRUEBA5 
ELSE 
BEGIN 
PRINT 'A transaction needs to be rolled back' 
ROLLBACK TRANSACTION PRUEBA5 
END 

SELECT * FROM ClientesBanca 

-- Una transacción que registre el retiro de una cajero.
-- nombre del store procedure REGISTRAR_RETIRO_CAJERO que recibe 2 parámetros en NoCuenta y el monto a retirar. 

IF EXISTS (SELECT name FROM sysobjects
                WHERE name = 'REGISTRAR_RETIRO_CAJERO ' AND type = 'P')
                DROP PROCEDURE REGISTRAR_RETIRO_CAJERO 
            GO

            CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO 
                @ucuenta varchar(5),
                @umonto numeric(10,2)
            AS
                UPDATE ClientesBanca SET SALDO = SALDO - @umonto
            GO
EXECUTE REGISTRAR_RETIRO_CAJERO 001,500

BEGIN TRANSACTION PRUEBA6
EXECUTE REGISTRAR_RETIRO_CAJERO 001, 500
INSERT INTO Realizan VALUES(GETDATE() ,500, '001','A'); 
UPDATE ClientesBanca SET SALDO = SALDO -500 
WHERE NoCuenta='001' 
COMMIT TRANSACTION PRUEBA6

--Una transacción que registre el deposito en ventanilla. 
-- Nombre del store procedure REGISTRAR_DEPOSITO_VENTANILLA que recibe 2 parámetros en NoCuenta y el monto a depositar. 

IF EXISTS (SELECT name FROM sysobjects
                WHERE name = 'REGISTRAR_DEPOSITO_VENTANILLA' AND type = 'P')
                DROP PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA 
            GO

            CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
                @ucuenta varchar(5),
                @umonto numeric(10,2)
            AS
                UPDATE ClientesBanca SET SALDO = SALDO + @umonto
            GO
EXECUTE REGISTRAR_DEPOSITO_VENTANILLA 001,500

BEGIN TRANSACTION PRUEBA7
EXECUTE REGISTRAR_DEPOSITO_VENTANILLA 001, 500
INSERT INTO Realizan VALUES(GETDATE() ,500, '001','A'); 
UPDATE ClientesBanca SET SALDO = SALDO -500 
WHERE NoCuenta='001' 
COMMIT TRANSACTION PRUEBA7