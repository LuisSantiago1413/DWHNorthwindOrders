SELECT COUNT(*) FROM dbo.DimShipper;

SELECT name FROM sys.objects WHERE type = 'P' AND name = 'sp_Load_DimShipper';

EXEC sp_helptext 'sp_Load_DimShipper';

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'DimShipper';


CREATE PROCEDURE sp_Load_DimShipper
AS  
BEGIN  
    SET NOCOUNT ON;  

    INSERT INTO DimShipper (ShipperID, CompanyName)  
    SELECT DISTINCT ShipperID, CompanyName  
    FROM Northwind.dbo.Shippers; -- Reemplaza con la tabla correcta  
END;

EXEC sp_Load_DimShipper;

SELECT * FROM DimShipper;
