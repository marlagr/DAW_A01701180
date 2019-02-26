BULK INSERT a1701180.a1701180.[Provedores]
   FROM 'e:\wwwroot\a1701180\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
    SELECT * FROM Provedores