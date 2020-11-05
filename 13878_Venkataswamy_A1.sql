---1)Employees table 
create table Employees
(EmpID int primary key,
 FirstName varchar(50) not null,
 MiddleName varchar(50),
 LastName varchar(50) not null,
 Date_of_Birth date not null,
 Email varchar(50) unique not null);


 ----2) inserting 10 records into the employee table

 insert into Employees
 values(12310, 'Venkat', 'Swamy','M', '15-Aug-1989','Venkat@MSSQL.com'),
        (12611,'Swamy','Kumar','H','12-Aug-1932','Swamy_Kumar@MSSQL.com'),
		(12612,'Maan','Dhingra','P','12-Aug-1990','Maan_Dhingra@MSSQL.com'),
		(12613,'Sheena','Iyengar','B','12-Nov-1960','Sheena_Iyengar@MSSQL.com'),
		(12614,'Mary','Dolly','J','22-Apr-1952','Mary_Dolly@MSSQL.com'),
		(12615,'Bob','Case','Ke','22-Oct-1962','Bob_Caam@MSSQL.com'),
		(12616,'Steve','Naam','K','12-Feb-1982','Steve_Naam@MSSQL.com'),
		(12617,'Naresh','Kumar','M','31-Aug-1974','Naresh_Kumar@MSSQL.com'),
		(12618,'Karan','Johar','J','13-Jun-1965','Karan_Johar@MSSQL.com'),
		(12619,'Veena','Kaam','K','15-Aug-1990','Veena_kaam@MSSQL.com'),
		(12620,'Kapoor','Nari','K','20-Aug-2011','Kapoor_Nari@MSSQL.com');

----3) Restriction on EmpID, primary key
insert into Employees
values(12620,'Neetu','Sharma','M','20-Aug-1994','Neetu_Sharma@MSSQL.com');

------4) Restriction on Email, unique key

insert into Employees
values(12621,'Gayani','Kumar','GK', '17-Jan-1992','Kapoor_Nari@MSSQL.com');
 
 -------5) Restriction on Date_of_Birth, should not enter a date value less than 31-Dec-1949

 alter table Employees with nocheck
 add constraint CK_DOB_grt1950
 check (Date_of_Birth > '31-Dec-1949');
 insert into Employees
values(126236,'Gayani','Kumar','GK', '15-Aug-1947','Gayani_Kumari@MSSQL.com');
 select * from employees;

 ----6) 

 update dbo.Employees
 set Email = 'assignment@pramati.com'
 where EmpID = 12620;

 select * from Employees;

