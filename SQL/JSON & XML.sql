--                   JSON AND XML data

create table Employees(
	EmployeeID int primary key,
    EmployeeInfo json
    );
    
INSERT INTO Employees(EmployeeID,EmployeeInfo)
values (106, '{"Name":"Jhon Doe","Position": "Developer","Salary": 45000}'),
	(102, '{"Name":"Arun singh","Position": " Web Developer","Salary": 50000}'),
	(103, '{"Name":"Ravi rao","Position": "Developer","Salary": 40000}'),
	(104, '{"Name":"Rohan singh","Position": " Fronntend Developer","Salary": 70000}'),
	(105, '{"Name":"Shiv singhania","Position": " Software Developer","Salary": 1000000}');
     select *FROM Employees;
select EmployeeID,
	Json_Value(EmployeeInfo,'$.Name') as EmployeeName,
	Json_Value(EmployeeInfo,'$.Position') as EmployeePosition,
	Json_Value(EmployeeInfo,'$.Salary') as EmployeeSalar
    from Employees;


 
 
 CREATE TABLE Books(
 id int primary key,
 author VARCHAR(255),
 title  VARCHAR(255),
 genere VARCHAR(255),
 Price DECIMAL(10,2),
 publish_date DATE,
 description TEXT
 );



    
 