USE DWHNorthwindOrders;
GO

SELECT 'DimCustomer' AS TableName, COUNT(*) AS TotalRows FROM dbo.DimCustomer
UNION ALL
SELECT 'DimEmployee', COUNT(*) FROM dbo.DimEmployee
UNION ALL
SELECT 'DimShipper', COUNT(*) FROM dbo.DimShipper
UNION ALL
SELECT 'DimCategory', COUNT(*) FROM dbo.DimCategory
UNION ALL
SELECT 'DimProduct', COUNT(*) FROM dbo.DimProduct;
