USE DWHNorthwindOrders;  -- base de datos correcta

USE DWHNorthwindOrders;
GO  -- <- Esto separa el lote

CREATE PROCEDURE sp_Load_DimProduct
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DimProduct (ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, LoadDate)
    SELECT 
        ProductID, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, GETDATE()
    FROM Northwind.dbo.Products;
END;
GO

