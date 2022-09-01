------Assignment 1----------------

create table Patient(
PT_ID int identity(1,1) primary key,
PT_FirstName varchar(50),
PT_LastName varchar(50)
)



create table PatientAddress(
PT_ID int foreign key references Patient(PT_ID),
PT_Address varchar(50)
)



--Procedure for Inserting data in Patient Table
create proc insert_data_patient
as insert into Patient values('Silent','Soham'),('Versatile','Vishal'),('Saurabh','Lengare');



exec insert_data_patient;
select * from Patient;



--Procedure for Inserting data in PatientAddress Table
create proc insert_data_patientaddress
as insert into PatientAddress values(1,'ABC'),(2,'XYZ'),(3,'EFG');



exec insert_data_patientaddress;
select * from PatientAddress;


------Assignment 2-------


CREATE TABLE Passenger(
PassengerId VARCHAR(25),
Pname VARCHAR(30) ,
Gender VARCHAR(10),
Birthdate Date
)
DROP TABLE Passenger



CREATE OR ALTER PROCEDURE Slicestring (@string VARCHAR(100))
AS
BEGIN
DECLARE @pid VARCHAR(25);
DECLARE @name VARCHAR(30);
DECLARE @gender VARCHAR(10);
DECLARE @date Date;



SELECT @pid = value FROM STRING_SPLIT(@string,',') ORDER BY (SELECT NULL) OFFSET 0 ROWS FETCH FIRST 1 ROW ONLY;
SELECT @name = value FROM STRING_SPLIT(@string,',') ORDER BY (SELECT NULL) OFFSET 1 ROWS FETCH FIRST 1 ROW ONLY;
SELECT @gender = value FROM STRING_SPLIT(@string,',') ORDER BY (SELECT NULL) OFFSET 2 ROWS FETCH FIRST 1 ROW ONLY;
SELECT @date = value FROM STRING_SPLIT(@string,',') ORDER BY (SELECT NULL) OFFSET 3 ROWS FETCH FIRST 1 ROW ONLY;




INSERT INTO Passenger VALUES(@pid,@name,@gender,@date)






END



EXEC Slicestring 'P9001,John Roy,Male,12-Jan-2009';



SELECT * FROM Passenger;


-------Assignment 3--------------

CREATE TABLE #Passenger(
PassengerId VARCHAR(25),
Pname VARCHAR(30) ,
Gender VARCHAR(10),
Birthdate Date
)
--drop proc insert_data_temp2

create proc insert_data_temp2 (@data varchar(200))
as
BEGIN
DECLARE @pid varchar(50);
DECLARE @name varchar(50);
DECLARE @gender varchar(50);
DECLARE @date varchar(50);



select @pid = value from string_split(@data, ',') order by (select null) offset 0 rows fetch first 1 row only;
select @name = value from string_split(@data, ',') order by (select null) offset 1 rows fetch first 1 row only;
select @gender = value from string_split(@data, ',') order by (select null) offset 2 rows fetch first 1 row only;
select @date = value from string_split(@data, ',') order by (select null) offset 3 rows fetch first 1 row only;



DECLARE @age int;
DECLARE @check VARCHAR(25);
SET @age = DATEDIFF(year,@date, GETDATE())



SELECT @check =  Passengerid  FROM #Passenger WHERE passengerid =  @pid ;



IF @check IS NOT NULL
BEGIN
PRINT 'Patient Id already exist'
END
ELSE IF @age<6 OR @age>90
BEGIN
PRINT 'Age must be in range of 6 to 90'
END
ELSE
BEGIN
INSERT INTO #Passenger VALUES(@pid,@name,@gender,@date)
END
END



EXEC insert_data_temp2 'P9001,John Roy,Male,12-Jan-2009';



SELECT * FROM #Passenger;