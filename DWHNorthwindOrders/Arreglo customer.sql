
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'DimCustomer';

INSERT INTO dbo.DimCustomer (CustomerID, CompanyName, Country)
SELECT CustomerID, CompanyName, Country
FROM Northwind.dbo.Customers;

SELECT COUNT(*) FROM dbo.DimCustomer;
