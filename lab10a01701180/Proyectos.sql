BULK INSERT a1701180.a1701180.[Proyectos]
   FROM 'e:\wwwroot\a1701180\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
    SELECT * FROM Proyectos