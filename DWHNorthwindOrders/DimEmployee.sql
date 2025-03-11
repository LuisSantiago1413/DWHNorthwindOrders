USE DWHNorthwindOrders;
GO

CREATE PROCEDURE dbo.sp_Load_DimEmployee
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DimEmployee (EmployeeID, EmployeeName)
    SELECT EmployeeID, FirstName + ' ' + LastName AS EmployeeName
    FROM Northwind.dbo.Employees;
END;
GO

EXEC dbo.sp_Load_DimEmployee;

SELECT * FROM DimEmployee;
