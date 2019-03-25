BULK INSERT a1701180.a1701180.[Materiales]
   FROM 'e:\wwwroot\a1701180\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
      SELECT * FROM Materiales