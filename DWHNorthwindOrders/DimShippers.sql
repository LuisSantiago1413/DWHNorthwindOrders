CREATE PROCEDURE sp_Load_DimShippers
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DimShippers (ShipperID, CompanyName, Phone, LoadDate)
    SELECT 
        ShipperID, CompanyName, Phone, GETDATE()
    FROM Northwind.dbo.Shippers;
END;
GO

