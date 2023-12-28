SELECT 
    Product.Name AS [Product Model],
    ProductDescription.Description AS Description
FROM
    SalesLT.Product
JOIN
    SalesLT.ProductModel ON Product.ProductModelID = ProductModel.ProductModelID
JOIN
    SalesLT.ProductModelProductDescription ON ProductModel.ProductModelID = ProductModelProductDescription.ProductModelID
JOIN
    SalesLT.ProductDescription ON ProductModelProductDescription.ProductDescriptionID = ProductDescription.ProductDescriptionID
WHERE
    SalesLT.Product.ProductID = 710
    AND SalesLT.ProductModelProductDescription.Culture = 'ar';