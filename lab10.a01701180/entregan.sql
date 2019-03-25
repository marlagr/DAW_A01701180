SET DATEFORMAT dmy
BULK INSERT a1701180.a1701180.[Entregan]
   FROM 'e:\wwwroot\a1701180\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
