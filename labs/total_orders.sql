SELECT
    Product.Name AS Name,
    COUNT(SalesOrderDetail.ProductID) AS [Total Orders]
FROM
    SalesLT.Product
JOIN
    SalesLT.SalesOrderDetail ON Product.ProductID = SalesOrderDetail.ProductID
GROUP BY
    Product.ProductID, Product.Name
ORDER BY
    [Total Orders] DESC;