SELECT
    Product.Name AS Name,
    ProductCategory.Name as Category,
    SUM(SalesOrderDetail.OrderQty) AS [Total Qty]
FROM
    SalesLT.Product
JOIN
    SalesLT.SalesOrderDetail ON Product.ProductID = SalesOrderDetail.ProductID
JOIN
    SalesLT.ProductCategory ON SalesLT.Product.ProductCategoryID = ProductCategory.ProductCategoryID   
GROUP BY
GROUPING SETS(
    (ProductCategory.Name,
    Product.Name),
    ProductCategory.Name
)
ORDER BY
    Category, Name;