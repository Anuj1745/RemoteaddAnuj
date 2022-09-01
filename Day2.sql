use AdventureWorks2019;

-------Assignment 1---------------------------

select BusinessEntityID , FirstName ,MiddleName, LastName , ModifiedDate from Person.Person where ModifiedDate > '2000-12-29' ;

-------Assignment 2---------------------------

select BusinessEntityID , FirstName , MiddleName , LastName , ModifiedDate from Person.Person where ModifiedDate not between '2000-12-01' and '2000-12-31' ;

-------Assignment 3-----------------------------

select ProductID , Name from Production.Product where Name like 'chain%' ; 

-------Assignment 4---------------------------

select BusinessEntityID ,  FirstName , MiddleName , LastName from Person.Person where MiddleName like '%E%' or MiddleName like '%B%' ;

-------Assignment 5-----------------------------

select SalesOrderID , OrderDate , TotalDue from Sales.SalesOrderHeader where OrderDate between '2001-09-01' and '2001-09-30' and Totaldue > 1000 ;

-------Assignment 6-------------------------------

select SalesPersonID,TotalDue,TerritoryID from Sales.SalesOrderHeader where Totaldue > 1000 and (SalesPersonID = 279 or TerritoryID = 6) ; 

-------Assignment 7-------------------------------

select ProductID, Name , Color from Production.Product where color <> 'blue' ;

-------Assignment 8--------------------------------

select BusinessEntityID, FirstName,MiddleName ,LastName from Person.Person order by LastName,FirstName,MiddleName ;

-------Assignment 9----------------------------------

select AddressLine1+' ('+PostalCode+')' as Address from Person.Address ; 

-------Assignment 10-----------------------------------


select ProductID , Name ,
	CASE
		when Color is null then 'No Color' else Color
	end
		as Color
from Production.Product ;

-----Assignment 11------------------------------

select ProductID , Name+':'+ISNULL(Color,'No Color') as NameColor from Production.Product ;
	
-----Assignment 12-------------------------------

select SpecialOfferID, Description ,(MaxQty-MinQty) as Diff from Sales.SpecialOffer ;

-----Assignment 13--------------------------------

select SpecialOfferID , Description , (ISNULL(MaxQty,10)*DiscountPct) as Multiply from Sales.Specialoffer ;

-----Assignment 14----------------------------------

select SUBSTRING(AddressLine1,1,10) as Address10chars from Person.Address; 

-----Assignment 15-----------------------------------

select SalesOrderID , OrderDate , ShipDate , DATEDIFF(day,OrderDate,ShipDate) as NumberOfDays from Sales.SalesOrderHeader  ;

----Assignmemt 16----------------------------------------

select convert(date,OrderDate) as Orderdateonly , convert(date,ShipDate) as Shipdateonly from Sales.SalesOrderHeader ;

---Assignment 17---------------------------------------

select SalesOrderID , OrderDate , dateadd(mm, 6, orderdate) as SixMonthsAdded from Sales.SalesOrderHeader ;

-----Assignment 18-------------------------

select datepart(yy,Orderdate) as Order_Year , datepart(mm,OrderDate) as Order_Month from Sales.SalesOrderHeader ;

----Assignment 19-------------------------------

SELECT floor(rand() * (10 + 1));

----Assignment 20-------------------------------

select SalesOrderID ,OrderDate from Sales.SalesOrderHeader where Orderdate between '2001-01-01' and '2001-12-31' ;

----Assignment 21----------------------------------

select datepart(yy,Orderdate) as Order_Year , datepart(mm,OrderDate) as Order_Month from Sales.SalesOrderHeader order by Order_Month,Order_Year ;
