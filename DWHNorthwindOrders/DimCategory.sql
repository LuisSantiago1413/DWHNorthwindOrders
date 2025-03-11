CREATE PROCEDURE sp_Load_DimCategory
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DimCategory (CategoryID, CategoryName, Description, LoadDate)
    SELECT 
        CategoryID, CategoryName, Description, GETDATE()
    FROM Northwind.dbo.Categories;
END;
