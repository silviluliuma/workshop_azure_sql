SELECT 
    CONCAT(Customer.FirstName, ' ', Customer.LastName) AS CustomerFullName,
    Product.Name AS ProductName
FROM
    SalesLT.Customer
JOIN
    SalesLT.SalesOrderHeader ON Customer.CustomerID = SalesOrderHeader.CustomerID
JOIN
    SalesLT.SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
JOIN
    SalesLT.Product ON SalesOrderDetail.ProductID = Product.ProductID

ORDER BY CustomerFullName;