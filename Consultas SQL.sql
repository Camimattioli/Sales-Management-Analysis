-- Consulta para ventas
SELECT
	t1.SalesOrderID
	,t1.OrderDate
	,t1.CustomerID
	,t1.SalesPersonID
	,t2.ProductID
	,t2.OrderQty
	,t2.UnitPrice
	,t2.OrderQty * t2.UnitPrice AS 'Monto'
	,t1.Status
	,t1.TerritoryID
	,t1.ShipDate
FROM Sales.SalesOrderHeader AS t1
	INNER JOIN Sales.SalesOrderDetail as t2 on t1.SalesOrderID = t2.SalesOrderID
	
-- Consulta para productos
SELECT
	t1.ProductID
	,t1.Name AS 'Producto'
	,t1.ProductSubcategoryID
	,t1.ListPrice AS 'Costo unitario'
FROM Production.Product as t1
WHERE T1.ProductSubcategoryID IS NOT NULL;

-- Categorias de los productos

SELECT
	t1.ProductSubcategoryID
	,t1.Name AS 'SubCategoria'
	,t1.ProductCategoryID
	,t2.Name AS 'Categoria'
FROM Production.ProductSubcategory AS t1
	INNER JOIN Production.ProductCategory AS t2 ON t1.ProductCategoryID = t2.ProductCategoryID;

-- Personas
SELECT
	t1.BusinessEntityID
	,concat(t1.FirstName,' ', t1.LastName) AS Persona
FROM Person.Person AS t1;


-- territorio
SELECT
	t1.Name
	,t1."Group" AS 'Region'
	,t1.CountryRegionCode
	,t1.TerritoryID AS ID
FROM Sales.SalesTerritory AS t1
