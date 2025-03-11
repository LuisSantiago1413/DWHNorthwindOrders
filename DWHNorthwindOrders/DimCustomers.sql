CREATE PROCEDURE usp_LoadDimCustomers
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO DimCustomers AS TARGET
    USING (
        SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone
        FROM Northwind.dbo.Customers
    ) AS SOURCE
    ON TARGET.CustomerID = SOURCE.CustomerID
    WHEN MATCHED THEN 
        UPDATE SET 
            TARGET.CompanyName = SOURCE.CompanyName,
            TARGET.ContactName = SOURCE.ContactName,
            TARGET.ContactTitle = SOURCE.ContactTitle,
            TARGET.Address = SOURCE.Address,
            TARGET.City = SOURCE.City,
            TARGET.Region = SOURCE.Region,
            TARGET.PostalCode = SOURCE.PostalCode,
            TARGET.Country = SOURCE.Country,
            TARGET.Phone = SOURCE.Phone
    WHEN NOT MATCHED THEN 
        INSERT (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone)
        VALUES (SOURCE.CustomerID, SOURCE.CompanyName, SOURCE.ContactName, SOURCE.ContactTitle, SOURCE.Address, SOURCE.City, SOURCE.Region, SOURCE.PostalCode, SOURCE.Country, SOURCE.Phone);
END;
GO
