--PARTE 1
/*  
    TOTAL NETO: 43680.0000
    TOTAL IMPOTE: 110947.200000 
      */
--La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.
SELECT SUM(Cantidad*Costo) as 'Total neto' , SUM(Cantidad*m.PorcentajeImpuesto*Costo) as 'Total Importe'
FROM Entregan AS e, Materiales AS m
WHERE e.Clave=m.Clave AND FECHA BETWEEN '1997/01/01' AND '1997/12/31'
/*  8 ROWS
    Proveedor: Alvin Entregas:  15  IMPORTE: 1808120.640000
      */
--Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.
SELECT  RazonSocial as 'Provedor', Count(*) AS 'Numero de Entregas', SUM(Cantidad*m.PorcentajeImpuesto*Costo) as 'Total Importe'
FROM Entregan AS e, Materiales AS m, Proveedores AS prov
WHERE e.Clave=m.Clave AND e.RFC = prov.RFC
GROUP BY RazonSocial
/*  38 ROWS
    CLAVE: 1010 DESCRIPCION: Varilla 4/32 CANTIDAD MINIMA: 523.00 CANTIDAD MAXIMA:667.00 IMPORTE TOTAL: 197570.0000
    CLAVE: 1020 DESCRIPCION: Varilla 3/17 CANTIDAD MINIMA: 478.00CANTIDAD MAXIMA:582.00 IMPORTE TOTAL: 1137800.0000
      */
-- Por cada material obtener la clave y descripción del material...
SELECT M.Clave, M.Descripcion, MIN(Cantidad) AS 'Cantidad Minima', MAX(Cantidad) AS 'Cantidad Maxima', SUM(Cantidad*Costo)AS 'IMPORTE TOTAL'
FROM Entregan AS e, Materiales AS m
WHERE e.Clave=m.Clave AND Cantidad > 400
GROUP BY M.Clave , M.Descripcion
/*  38 ROWS
    PROVEDOR: Alvin DESCRIPCION: Recubrimiento P1019 CANTIDAD PROMEDIO: 1238.00 
    PROVEDOR: Alvin DESCRIPCION: Sillar rosa CANTIDAD PROMEDIO: 692.00
      */
--Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado,
SELECT  RazonSocial as 'Provedor', m.Descripcion, SUM(Cantidad) AS 'Cantidad Promedio'
FROM Entregan AS e, Materiales AS m, Proveedores AS prov
WHERE e.Clave=m.Clave AND e.RFC = prov.RFC AND Cantidad > 400
GROUP BY RazonSocial, m.Descripcion
ORDER BY RazonSocial ASC

--Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: 
SELECT  RazonSocial as 'Provedor', m.Descripcion, SUM(Cantidad) AS 'Cantidad Promedio'
FROM Entregan AS e, Materiales AS m, Proveedores AS prov
WHERE e.Clave=m.Clave AND e.RFC = prov.RFC AND 'Cantidad Promedio' < 370 AND prov.RFC IN(
    SELECT  prov.RFC
    FROM Entregan AS e, Materiales AS m, Proveedores AS prov
    WHERE e.Clave=m.Clave AND e.RFC = prov.RFC AND Cantidad > 450 
    GROUP BY prov.RFC
)
GROUP BY RazonSocial, m.Descripcion

-- INSERTANDO MATERIALES
SELECT * FROM Proveedores
SELECT * FROM Proyectos
-- INSERT INTO MATERIALES VALUES (1431, 'Cemento Moctezuma', 300, 2.2) 
-- INSERT INTO MATERIALES VALUES (1432, 'Madera Triplay', 50, 2.3) 
-- INSERT INTO MATERIALES VALUES (1433, 'Arcilla roja', 20, 2.3)
-- INSERT INTO MATERIALES VALUES (1434, 'Pegamento UHU', 13, 2.3)
-- INSERT INTO MATERIALES VALUES (1435, 'Azulejo Marmol', 130, 2.3) 

--Materiales nunca entregados
/*  
    LOS 5 AÑADI
      */
SELECT  Clave, Descripcion
FROM Materiales 
WHERE  Clave NOT IN
(
    SELECT DISTINCT e.Clave
    FROM  Entregan AS e
)

--Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'. 
/*  1 renglone 
      La Fragua
      */
SELECT DISTINCT prov.RazonSocial 
FROM Entregan AS e, Proveedores AS prov, Proyectos AS proy
WHERE e.Numero = proy.Numero AND e.RFC = prov.RFC AND proy.Denominacion = 'Vamos Mexico' AND prov.RFC IN (
  SELECT prov.RFC
  FROM  Entregan e, Proveedores prov, Proyectos proy
  WHERE e.RFC = prov.RFC AND e.Numero = proy.Numero  AND proy.Denominacion = 'Queretaro Limpio'
  )
/*  0 ROWS
      
      */
  -- Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 
SELECT prov.RazonSocial, AVG(Cantidad)
FROM Entregan AS e, Proveedores AS prov, Proyectos AS proy
WHERE e.Numero = proy.Numero AND e.RFC = prov.RFC AND cantidad < (
    SELECT Cantidad
    FROM Entregan AS e, Proveedores AS prov, Proyectos AS proy
    WHERE e.Numero = proy.Numero AND e.RFC = prov.RFC AND e.RFC = 'VAGO780901'
)
GROUP BY RazonSocial
 
