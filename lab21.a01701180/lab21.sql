IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO

    EXECUTE creaMaterial 5000,'Martillos Acme',250,15 

    SELECT * FROM Materiales

-- PROCEDIMIENTO modificaMateriales

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMateriales' AND type = 'P')
                DROP PROCEDURE modificaMateriales
            GO

            CREATE PROCEDURE modificaMateriales
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                UPDATE  Materiales 
                SET Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto
                WHERE clave = @uclave
            GO

    EXECUTE modificaMateriales 5000,'Martillos Acme L',250,15 

-- eliminaMateriales

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMateriales' AND type = 'P')
                DROP PROCEDURE eliminaMateriales
            GO

            CREATE PROCEDURE eliminaMateriales
                @uclave NUMERIC(5,0)
            AS
                DELETE  Materiales 
                WHERE clave = @uclave
            GO
    EXECUTE eliminaMateriales 5000

--Desarrollar los procedimientos (almacenados) creaProyecto , modificaproyecto y eliminaproyecto, hacer lo mismo para las tablas proveedores y entregan.

    SELECT * FROM Proyectos
--creaProyecto
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyecto' AND type = 'P')
                DROP PROCEDURE creaProyecto
            GO

            CREATE PROCEDURE creaProyecto
                @uNumero numeric(5), 
                @uDenominacion varchar(50)
            AS
               INSERT INTO Proyectos
               VALUES(@uNumero, @uDenominacion) 
            GO
    EXECUTE creaProyecto 5020, 'Seres Capaces'

    -- modificaProyectos
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProyectos' AND type = 'P')
                DROP PROCEDURE modificaProyectos
            GO

            CREATE PROCEDURE modificaProyectos
                @uNumero numeric(5), 
                @uDenominacion varchar(50)
            AS
                UPDATE  Proyectos 
                SET Denominacion = @uDenominacion
                WHERE Numero = @uNumero
            GO

    EXECUTE modificaProyectos 5020,'Martillos Acme L'

    -- eliminaProyectos
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProyectos' AND type = 'P')
                DROP PROCEDURE eliminaProyectos
            GO

            CREATE PROCEDURE eliminaProyectos
                @uNumero numeric(5)
            AS
                DELETE  Proyectos
                WHERE Numero = @uNumero
            GO
    EXECUTE eliminaProyectos 5020

-------------------------------------PROVEDORES---------------------------------------------
 SELECT * FROM Proveedores
--creaProveedor
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedor' AND type = 'P')
                DROP PROCEDURE creaProveedor
            GO

            CREATE PROCEDURE creaProveedor
                @uRFC char(13) , 
                @uRazonSocial varchar(50) 
            AS
               INSERT INTO Proveedores
               VALUES(@uRFC, @uRazonSocial) 
            GO
    EXECUTE creaProveedor 'GABR7312124X7', 'Seres Capaces'

    -- modificaProveedor
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProveedor' AND type = 'P')
                DROP PROCEDURE modificaProveedor
            GO

            CREATE PROCEDURE modificaProveedor
                @uRFC char(13) , 
                @uRazonSocial varchar(50) 
            AS
                UPDATE  Proveedores
                SET RFC = @uRFC, RazonSocial = @uRazonSocial
                WHERE RFC = @uRFC
            GO

    EXECUTE modificaProveedor 'GABR7312124X7', 'Proyecto X'

    -- eliminaProveedor
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProveedor' AND type = 'P')
                DROP PROCEDURE eliminaProveedor
            GO

            CREATE PROCEDURE eliminaProveedor
                @uRFC char(13)
            AS
                DELETE  Proveedores
                WHERE RFC = @uRFC
            GO
    EXECUTE eliminaProveedor 'GABR7312124X7'

    ----------      ENTREGAN

     SELECT * FROM Entregan

--crearEntrega
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'crearEntrega' AND type = 'P')
                DROP PROCEDURE crearEntrega
            GO

            CREATE PROCEDURE crearEntrega
                @uClave numeric(5), 
                @uRFC char(13), 
                @uNumero numeric(5), 
                @uFecha DateTime , 
                @uCantidad numeric (8,2)  
            AS
               INSERT INTO Entregan
               VALUES(@uClave, @uRFC, @uNumero, @uFecha, @uCantidad ) 
            GO
    EXECUTE crearEntrega 1431, 'GABR7312124X7', '5100', '1998-07-08 00:00:00.000', 130

    -- modificarEntrega
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificarEntrega' AND type = 'P')
                DROP PROCEDURE modificarEntrega
            GO

            CREATE PROCEDURE modificarEntrega
                @uClave numeric(5),  
                @uFecha DateTime , 
                @uCantidad numeric (8,2)  
            AS
                UPDATE  Entregan
                SET Fecha = @uFecha, Cantidad = @uCantidad
                WHERE @uClave = Clave 
            GO

    EXECUTE modificarEntrega 1431, '2019-11-08 00:00:00.000', 130

    -- eliminaProveedor
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaEntrega ' AND type = 'P')
                DROP PROCEDURE eliminaEntrega 
            GO

            CREATE PROCEDURE eliminaEntrega 
                @uClave numeric(5)
            AS
                DELETE  Entregan
                WHERE Clave = @uClave
            GO
    EXECUTE eliminaEntrega 1431

---------------------------- STORED PROCEDURE

 IF EXISTS (SELECT name FROM sysobjects
    WHERE name = 'queryMaterial' AND type = 'P')
        DROP PROCEDURE queryMaterial
    GO

    CREATE PROCEDURE queryMaterial
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2)
    AS
    SELECT * FROM Materiales WHERE descripcion
    LIKE '%'+@udescripcion+'%' AND costo > @ucosto
    GO

EXECUTE queryMaterial 'Lad',20 