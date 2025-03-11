-- Verifica si hay CustomerID en DimCustomer que no estén en la fuente
SELECT DimCustomer.CustomerID 
FROM DimCustomer 
LEFT JOIN Northwind.dbo.Customers ON DimCustomer.CustomerID = Customers.CustomerID
WHERE Customers.CustomerID IS NULL;

-- Verifica lo mismo para Employee y Shipper
SELECT DimEmployee.EmployeeID 
FROM DimEmployee 
LEFT JOIN Northwind.dbo.Employees ON DimEmployee.EmployeeID = Employees.EmployeeID
WHERE Employees.EmployeeID IS NULL;

SELECT DimShipper.ShipperID 
FROM DimShipper 
LEFT JOIN Northwind.dbo.Shippers ON DimShipper.ShipperID = Shippers.ShipperID
WHERE Shippers.ShipperID IS NULL;


CREATE INDEX idx_CustomerID ON DimCustomer(CustomerID);
CREATE INDEX idx_EmployeeID ON DimEmployee(EmployeeID);
CREATE INDEX idx_ShipperID ON DimShipper(ShipperID);


BACKUP DATABASE DWHNorthwindOrders 
TO DISK = 'C:\Backups\DWHNorthwindOrders.bak'
WITH FORMAT, MEDIANAME = 'SQLServerBackups', NAME = 'Full Backup of DWHNorthwindOrders';

EXEC xp_instance_regread
    N'HKEY_LOCAL_MACHINE',
    N'Software\Microsoft\MSSQLServer\MSSQLServer',
    N'BackupDirectory';


BACKUP DATABASE DWHNorthwindOrders  
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\DWHNorthwindOrders.bak'  
WITH FORMAT, NAME = 'Full Backup';

RESTORE VERIFYONLY FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\Backup\DWHNorthwindOrders.bak';
