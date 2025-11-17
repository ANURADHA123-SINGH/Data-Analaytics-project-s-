-- Window functions
DROP DATABASE IF exists Window_Functions;
CREATE DATABASE IF NOT EXISTS Window_Functions;
use Window_functions;

Create TABLE Employees(
					EmployeeID INT  PRIMARY KEY,
                    EmployeeName varchar(50),
                    Department Varchar(50),
                    Salary DECIMAL (10,1)
);
-- INSERTING DATA IN EMPLOYEE TABLE
INSERT INTO Employees(EmployeeID, EmployeeName,Department,Salary) values
(13,'Anu','HR',25000),
(14,'Anuradha','Manager',50000),
(16,'Anurag','Dean',250000),
(19,'Shayam','Director',25000),
(21,'Anuradha Singh','CEO',100000),
(22,'Shourav','Tech Assistant',70000);

                    
SELECT EmployeeID,EmployeeName,Department,Salary,
avg(salary) over (partition by Department) as AvgSalary
from Employees;

-- Analytic Functions
-- ROW_NUMBER,RANK,DENSE_RANK

-- ROW_NUMBER FUNCTION
SELECT EmployeeID,employeeName,Department,Salary,
row_number() over(order by salary desc)as RowNumber from Employees;

-- RANK FUNCTION
SELECT EmployeeID,employeeName,Department,Salary,
Rank() over(order by salary desc)as EmployeeRank from Employees;

-- INSERT INTO Employees(EmployeeID,EmployeeName,Department,Salary)
-- values
-- (20,'Anu','HR',25000),
-- (29,'Anuradha','Manager',50000),
-- (27,'Anurag','Dean',250000),
-- (31,'Shayam','Director',25000),
-- (41,'Anuradha Singh','CEO',1000000);

/* 
SELECT EmployeeID,employeeName,Department,Salary,
dense_rank() over (order by salary desc)as EmployeeDense_rank from Employees;

-- Aggregate functions

Select EmployeeID,employeeName,Department,Salary,
SUM(Salary) over (order by Department)as DepartmentTotalSalary from Employees;

Select EmployeeID,employeeName,Department,Salary,
MIN(Salary) over (order by Department)as DepartmentMINSalary,
MAX(Salary) over (order by Department)as DepartmentMAXSalary from Employees;

*/


CREATE TABLE SALES(
				SaleID INT PRIMARY KEY,
                Product varchar(50),
                SalesAmount DECIMAL(10,2),
                SaleDate date
);

INSERT INTO SALES (SaleID,Product,SalesAmount,SaleDate)
Values
(29,'A',2500,'2023-12-12'),
(28,'B',2060,'2024-12-02'),
(27,'E',9000,'2022-12-11'),
(30,'D',4000,'2021-02-12');

-- Using the min and max functions
SELECT SaleID,Product,SalesAmount,SaleDate,
MIN(SalesAmount) over (order by Product)as MAXSALEAMOUNTT,
MAX(SalesAmount) over (order by Product)as MINNSALEAMOUNT from SALES;
-- USING AVG FUNCTIONS
SELECT SaleID,Product,SalesAmount,SaleDate,
AVG(SalesAmount) over (partition by Product)as AVGSALESperProduct from sales;

-- Partitioning data and applying window_functions

TRUNCATE TABLE SALES;

INSERT INTO SALES (SaleID,Product,SalesAmount,SaleDate)
Values
(29,'A',2500,'2023-12-12'),
(28,'B',2060,'2024-12-02'),
(27,'E',9000,'2022-12-11'),
(30,'D',4000,'2021-02-12');

SELECT SaleID,Product,SalesAmount,SaleDate,
SUM(SalesAmount) over (partition by Product)as TOTALSALESPERPRODUCT from sales;

SELECT SaleID,Product,SalesAmount,SaleDate,
RANK() over (PARTITION BY Product ORDER BY SalesAmount DESC)as SALESRANKPERPRODUCT from sales;

-- using partition by with date range
SELECT SaleID,Product,SalesAmount,SaleDate,
SUM(SalesAmount) over (PARTITION BY Product ORDER BY SaleDate RANGE BETWEEN INTERVAL 7 DAY preceding AND CURRENT ROW )as WEEKLYSALEDAta from sales;


