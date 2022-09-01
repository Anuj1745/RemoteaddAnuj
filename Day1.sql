create database Day2 ;

Use Day2 ;

--Assignment Day 1

create table Employee(
EmployeeID int primary key,
Designation varchar(20),
ManagerID int not null,
DateofJoining date,
DepartmentID int foreign key references Department(DepartmentID),
PersonID int foreign key references Person(PersonID)
);

create table Department(
DepartmentID int primary key,
DepartmentName varchar(30)
);

create table Person(
PersonID int primary key,
Title varchar(20),
FirstName varchar(30),
MiddleName varchar(30),
LastName varchar(30),
Gender varchar(20),
ModifiedDate date
);

create table Customer(
CustomerID int primary key,
PersonID int foreign key references Person(PersonID),
TerritoryID int foreign key references Territory(TerritoryID),
CustomerGrade varchar(30)
);

create table SalesOrderHeader(
SalesOrderHeaderID int primary key,
OrderDate date,
CustomerID int foreign key references Customer(CustomerID),
SalesPersonID int not null
);

create table SalesOrderDetail(
SalesOrderDetailID int primary key,
SalesOrderHeaderID int foreign key references SalesOrderHeader(SalesOrderHeaderID),
ProductID int foreign key references Product(ProductID),
OrderQuantity int 
);

create table Product(
ProductID int primary key,
ProductName varchar(30),
ProductCost int ,
QuantityInStock int ,
ProductSubCategoryID int foreign key references ProductSubCategory(ProductSubCategoryID)
);

create table ProductSubCategory(
ProductSubCategoryID int primary key,
ProductSubCategoryName varchar(30),
ProductCategoryID int foreign key references ProductCategory(ProductCategoryID)
);

create table ProductCategory(
ProductCategoryID int primary key,
ProductCategoryName varchar(30)
);

create table Country(
CountryID int primary key ,
CountryName varchar(30)
);

create table Territory(
TerritoryID int primary key,
TerritoryName varchar(30),
CountryID int foreign key references Country(CountryID)
);

--Assignment Day 2

