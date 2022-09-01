use AdventureWorks2019 ;

------Assignment 1------------------
select * from HumanResources.Employee ;
select * from Person.person ;

select E.Jobtitle , E.Birthdate , P.FirstName , P.LastName 
from HumanResources.Employee as E join person.person as P
on E.BusinessEntityID = P.BusinessEntityID ;

-----Assignment 2---------------------

select * from Person.Person ;
select * from sales.Customer ;

select C.CustomerID , C.storeID , C.TerritoryID , P.FirstName , P.Middlename , P.Lastname 
from Person.Person as P join Sales.Customer as C
on P.BusinessEntityID = C.PersonID ;

----Assignment 3----------------------

select * from sales.SalesOrderHeader ;
select * from sales.SalesPerson ;

select soh.salesOrderID , sp.SalesQuota , sp.Bonus 
from Sales.SalesOrderHeader as soh join Sales.SalesPerson as sp
on soh.SalesPersonID = sp.BusinessEntityID ;


-----Assignment 4---------------------

select * from production.productmodel ;
select * from production.product ;

select pop.color , pop.size , pom.catalogDescription from
Production.productmodel as pom right join production.product as pop
on pop.ProductModelID = pom.ProductModelID ;

----Assignment 5----------------------

select concat_ws(' ',per.firstname,per.middlename,per.Lastname) as Person_Name,
soh.Orderdate , sod.productID , sod.OrderQty , prod.Name , prod.StandardCost
from person.person as per 
join sales.customer as cus
on per.BusinessEntityID = cus.PersonID 
join sales.SalesOrderHeader as soh 
on cus.CustomerID = soh.customerID 
join sales.SalesOrderDetail as sod 
on soh.SalesOrderID = sod.SalesorderID 
join Production.Product as prod 
on sod.ProductID = prod.ProductID ;

---Assignment 6------------------------

select s.productID , s.OrderQty , prod.Name , S.SalesorderID
from  Production.product as prod left join Sales.SalesOrderDetail as S
on prod.ProductID = s.ProductID ;

--Assignment 7-------------------------

select cr.currencyrateID , cr.averagerate , soh.salesorderID , pur.shipbase 
from sales.CurrencyRate as cr right join  sales.SalesOrderHeader as soh
on soh.CurrencyRateID = cr.CurrencyRateID left join Purchasing.ShipMethod as pur 
on soh.ShipMethodID = pur.ShipMethodID ;

--Assignment 8---------------------------

select concat_ws(' ',per.firstname,per.middlename,per.Lastname) as Person_Name , ter.Name , percountry.Name ,
soh.Salesorderid , soh.OrderDate , soh.Shipdate ,soh.SalesOrderNumber , prod.Name as product_name , procat.Name as product_category  , 
prosubcat.Name as product_subcategory
from production.Productcategory as procat 
join production.ProductsubCategory as prosubcat
on prosubcat.ProductcategoryID = procat.ProductcategoryID
join Production.Product as prod 
on prosubcat.ProductsubCategoryID = prod.ProductSubcategoryID
join sales.SalesOrderDetail as sod 
on prod.ProductID =  sod.ProductID 
join sales.SalesOrderHeader as soh
on soh.SalesOrderID = sod.SalesOrderID 
join sales.customer as cus 
on cus.CustomerID = soh.CustomerID 
join person.person as per
on per.BusinessEntityID = cus.PersonID 
join person.person as per2 
on per2.BusinessEntityID = cus.personID
join sales.SalesTerritory as ter 
on ter.TerritoryID = cus.TerritoryID 
join person.CountryRegion as percountry 
on percountry.CountryRegionCode = ter.CountryRegionCode
 
---Assignment 9-----------------

select * from
(
	select * , Dense_RANK() over(order by birthdate desc) as DR from HumanResources.Employee 
) 
as OG where DR = 1 

--Assignment 10----------------


create table #Temp (
ProductID int not null,
color nvarchar(20),
Name nvarchar(50)
)

insert into #temp select productID , color , Name from Production.product where color='red'

select * from #temp



