
--	Mostramos la dirección de un cliente aleatorio
SELECT TOP 1 c.CustomerID, c.FirstName, c.LastName, a.AddressID, ca.AddressType, a.AddressLine1, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
FROM SalesLT.Customer AS c
    INNER JOIN SalesLT.CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
    INNER JOIN SalesLT.Address AS a ON ca.AddressID = a.AddressID
WHERE c.CustomerID = 29485
ORDER BY a.ModifiedDate DESC;


--	La modificamos
EXEC [SalesLT].[uspUpdateCustomerAddress]
    @CustomerID = 29485, 
	@AddressType = 'HOME', 
    @AddressLine = 'Nueva dirección', 
    @City ='Nueva ciudad', 
    @StateProvince = ' Nuevo Estado', 
    @CountryRegion = 'Nueva Región',  
    @PostalCode = '00000';

--	Mostramos la última dirección asignada del mismo cliente
SELECT TOP 1 c.CustomerID, c.FirstName, c.LastName, a.AddressID, ca.AddressType, a.AddressLine1, a.City, a.StateProvince, a.CountryRegion, a.PostalCode
FROM SalesLT.Customer AS c
    INNER JOIN SalesLT.CustomerAddress AS ca ON c.CustomerID = ca.CustomerID
    INNER JOIN SalesLT.Address AS a ON ca.AddressID = a.AddressID
WHERE c.CustomerID = 29485
ORDER BY a.ModifiedDate DESC;