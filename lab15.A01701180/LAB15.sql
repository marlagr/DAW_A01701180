-- Plantea ahora una consulta para obtener las descripciones de los materiales entregados en el año 2000
SELECT descripcion
FROM Entregan as e, Materiales as m
WHERE Fecha >= '2000/01/01' AND Fecha <= '2000/12/31' AND m.Clave = e.Clave

-- Plantea ahora una consulta para obtener las descripciones de los materiales entregados en el año 2000 CON DISTINCT
SELECT DISTINCT descripcion
FROM Entregan as e, Materiales as m
WHERE Fecha >= '2000/01/01' AND Fecha <= '2000/12/31' AND m.Clave = e.Clave

-- Los numeros y denominaciones de proyectos con fechas y cantidades de entregas ordenadas numero proyecto, fecha reciente-antigua
SELECT  e.Numero, Denominacion, Fecha, Cantidad
FROM Entregan as e, Proyectos as p
WHERE e.Numero = p.Numero
ORDER BY  e.Numero ASC, Fecha DESC 

--Operadores Cadena
SELECT * 
FROM Materiales 
where Descripcion 
LIKE 'Si'

--
DECLARE @o varchar(40); 
DECLARE @bar varchar(40); 
SET @o = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? ' 
SET @o += ' obtienes?'; 
PRINT @o + @bar; 

--[] ^ y _.
SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'; 
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

--Operadores Logicos
SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Fecha Between '2000/01/01' and '2000/12/31'

-- Exists
SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
Exists ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

--Tomando de base la consulta anterior del EXISTS, realiza el query que devuelva el mismo resultado, pero usando el operador IN 
SELECT RFC,Cantidad, Fecha,Numero
FROM Entregan
WHERE Numero Between 5000 and 5010 AND RFC IN(
SELECT RFC 
FROM Proveedores
WHERE RazonSocial LIKE 'La%' and Entregan.RFC = Proveedores.RFC ) 

--Tomando de base la consulta anterior del EXISTS, realiza el query que devuelva el mismo resultado, pero usando el operador NOT IN 
SELECT  p.RFC, p.RazonSocial, Numero, Cantidad
FROM Proveedores AS p, Entregan AS e
WHERE RazonSocial LIKE 'La%' and e.RFC = p.RFC AND Numero NOT IN(
SELECT Numero
FROM Proveedores AS p, Entregan AS e
WHERE Numero < 5000 OR Numero > 5010)

-- Realiza un ejemplo donde apliques algún operador : ALL, SOME o ANY.
-- CONSULTA DE RAZON SOCIAL QUE EMPIEZA POR LA 
SELECT  p.RFC, p.RazonSocial, Numero, Cantidad
FROM Proveedores AS p, Entregan AS e
WHERE RazonSocial LIKE 'La%' and e.RFC = p.RFC AND Numero = ANY(
SELECT Numero
FROM Proveedores AS p, Entregan AS e
WHERE  NUMERO Between 5000 and 5010)

--TOP
SELECT TOP 3 * FROM Proyectos

SELECT TOP 1 Numero FROM Proyectos 

--Agrega a la tabla materiales la columna PorcentajeImpuesto con la instrucción: 
ALTER TABLE Materiales 
ADD PorcentajeImpuesto NUMERIC(6,2)

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000
SELECT * FROM Materiales

--importe de las entregas, el total en dinero de lo entregado, basado en la cantidad de la entrega y el precio del material y el impuesto asignado
SELECT DISTINCT  SUM(m.PorcentajeImpuesto * m.Costo * cantidad) as 'Importe'
FROM Entregan AS e, Materiales AS m
WHERE e.Clave = m.Clave

-- Consultas

--  Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos".
SELECT e.Clave, Descripcion
FROM Materiales AS m, Proyectos AS p, Entregan as e
WHERE e.Clave = m.Clave  AND e.Numero = p.Numero AND Denominacion = 'Mexico sin ti no estamos completos'

-- Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 
SELECT e.Clave, Descripcion
FROM Materiales AS m, Proveedores AS p, Entregan as e
WHERE e.Clave = m.Clave  AND e.RFC = p.RFC AND RazonSocial = 'Acme tools'


--  El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales. 
SELECT p.RFC 
FROM Proveedores AS p, Entregan AS e 
WHERE p.RFC = e.RFC AND Fecha BETWEEN '2000/01/01' AND '2000/12/31' AND Cantidad <= 300

--El Total entregado por cada material en el año 2000. 
SELECT m.Descripcion, COUNT(Cantidad) as 'total' 
FROM  Entregan AS e, Materiales AS m
WHERE e.Clave = m.Clave  AND Fecha BETWEEN '2000/01/01' AND '2000/12/31'
GROUP BY M.Descripcion

--La Clave del material más vendido durante el 2001. (se recomienda usar una vista intermedia para su solución) 
SELECT TOP 1 e.Clave, SUM(Cantidad) 'mas vendido '
FROM  Entregan AS e
WHERE Fecha BETWEEN '2001/01/01' AND '2001/12/31'
GROUP BY e.Clave

--Productos que contienen el patrón 'ub' en su nombre. 
SELECT Descripcion
FROM Materiales
WHERE Descripcion LIKE '%ub%' 

--Denominación y suma del total a pagar para todos los proyectos.
SELECT DISTINCT Denominacion, SUM(Cantidad * m.Costo*m.PorcentajeImpuesto) as 'Total a pagar'
FROM Materiales AS m, Proyectos AS p, Entregan as e
WHERE e.Clave = m.Clave  AND e.Numero = p.Numero 
GROUP BY Denominacion

--Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acción que no se encuentran apoyando al proyecto Educando en Coahuila (Solo usando vistas). 
SELECT DISTINCT Denominacion, pr.RFC, RazonSocial
FROM Materiales AS m, Proyectos AS p, Proveedores AS pr, Entregan as e

-- Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acción que no se encuentran apoyando al proyecto Educando en Coahuila (Sin usar vistas, utiliza not in, in o exists)
SELECT DISTINCT proy.Denominacion, prov.RazonSocial, prov.RFC
FROM Materiales AS m, Entregan AS e, Proveedores AS prov, Proyectos AS proy
WHERE e.Clave = m.Clave  AND e.Numero = proy.Numero AND e.RFC = prov.RFC AND proy.Denominacion = 'Televisa en acción' AND prov.RFC NOT IN (
  SELECT prov.RFC
  FROM Entregan e, Proveedores prov, Proyectos proy
  WHERE e.RFC = prov.RFC AND e.Numero = proy.Numero  AND proy.Denominacion = 'Educando en Coahuila'
  )

--Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acción cuyos proveedores también suministran materiales al proyecto Educando en Coahuila. 
SELECT m.Descripcion, m.Costo, m.Clave 
FROM Materiales AS m, Entregan AS e, Proveedores AS prov, Proyectos AS proy
WHERE e.Clave = m.Clave  AND e.Numero = proy.Numero AND e.RFC = prov.RFC AND proy.Denominacion = 'Televisa en acción' AND prov.RFC IN (
  SELECT prov.RFC
  FROM  Entregan e, Proveedores prov, Proyectos proy
  WHERE e.RFC = prov.RFC AND e.Numero = proy.Numero  AND proy.Denominacion = 'Educando en Coahuila'
  )