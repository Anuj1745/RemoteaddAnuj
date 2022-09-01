use AdventureWorks2019 ;


---------Assignment 1-------------

SELECT COUNT(CustomerID) as Customers
FROM Sales.Customer 

---------Assignment 2--------------

SELECT MIN(ListPrice) as Minimum_LISTPRICE ,MAX(ListPrice) as Maximum_LISTPRICE, AVG(ListPrice) as Average_LISTPRICE
FROM Production.Product

--------Assignment 3----------------

SELECT ProductID ,SUM(OrderQty) as ORDER_QUANTITY, COUNT(ProductID) as NUMBER_OF_ITEMS
FROM Sales.SalesOrderDetail
GROUP BY ProductID

--------Assignment 4-----------------

SELECT SalesOrderID, COUNT(SalesOrderID) as TOTAL_ORDERS
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

--------Assignment 5-----------------

SELECT ProductLine, COUNT(*) as NUMBER_OF_PRODUCTLINE
FROM Production.Product
GROUP BY ProductLine

--------Assignment 6-----------------

SELECT CustomerID,YEAR(OrderDate) as YEARS , COUNT(OrderDate) as OrderDATE
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate),CustomerID
ORDER  BY YEAR(OrderDate)


---------Assignment 7----------------

SELECT SalesOrderID, SUM(LineTotal) as Sum_Linetotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal)>1000

--------Assignment 8------------------

SELECT ProductModelID, COUNT(ProductModelID)  as COUNT
FROM Production.Product
GROUP BY ProductModelID
HAVING COUNT(ProductModelID) = 1

--------Assignment 9------------------

SELECT CONVERT(DATE, OrderDate) as Order_Date ,p.ProductID,  COUNT(p.ProductID) as Count_of_Product_Sold
FROM Production.Product as p, Sales.SalesOrderHeader as soh, Sales.SalesOrderDetail as sod
WHERE p.ProductID = sod.ProductID AND sod.SalesOrderID = soh.SalesOrderID
GROUP BY p.ProductID, OrderDate

--------Assignment 10-----------------

SELECT BusinessEntityID
FROM HumanResources.Employee
ORDER BY HireDate
OFFSET 2 ROWS
FETCH FIRST  1 ROW ONLY

-------Assignment 11-----------------

SELECT COUNT(SalesOrderID) as total_salesorderId ,CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY COUNT(SalesOrderID) DESC
OFFSET 1 ROWS
FETCH FIRST 1 ROW ONLY


----Assignment 12--------------------

select ProductSubcategoryID,StandardCost from(
select  ProductSubcategoryID,StandardCost,Ntile(4) over (partition by  ProductSubcategoryID order by StandardCost) as NT  
from Production.Product
) as DT where NT = 1 and  ProductSubcategoryID is not null

----Assignment 13---------------------

create sequence seq1
    start with 1000
    increment by 1
    maxvalue 10000
    no cycle

create table #table1(
    table1ID int not null primary key,
    Name varchar(20)
)

create table #table2(
    table2ID int not null primary key,
    Age int not null    
)

-- same sequence seq1 is used for table1
insert into #table1 values(next value for seq1,'Anuj')



-- same sequence seq1 is used for table2
insert into #table2 values(next value for seq1,22)



select * from #table1
select * from #table2









