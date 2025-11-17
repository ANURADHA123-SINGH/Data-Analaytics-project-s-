DROP DATABASE  if exists Information;
CREATE DATABASE if not exists Information;
use Information;

CREATE TABLE users(
					id int Primary key,
					user_name varchar(50),
					gmail varchar (255),
					gender ENUM('male','female','other'),
                    Course_id INT ,
                    Regestration_no INT UNIQUE,
					Date_of_birth DATE,
                    Salary INT  NOT NULL
);
SELECT*FROM users;

INSERT INTO users values
(1,'Anuradha singh','anu1@gmail.com','female',23012,134,'2006-01-01',70000),
(2,'Anu singh','anu13@gmail.com','female',13232,215,'2004-02-02',50000),
(3,'Radha singh','anr1@gmail.com','male',29812,14,'2002-02-06',45000),
(4,'Anuradha rao','anu156@gmail.com','male',24512,23,'2001-11-12',50000),
(5,'Saumya singh','anu1098@gmail.com','female',23562,33,'2005-01-01',90000);
select*from users;

/*
INSERT INTO users(user_name,gender,course_id)values
												('Anuradha singh','female',23012),
											    ('Anu singh','female',13232),
												('Radha singh','male',29812),
												('Anuradha rao','male',24512),
												('Saumya singh','female',23562);
SELECT*FROM users;
*/
 -- RENAME TABLE users to coustmer;
 -- RENAME TABLE coustmer to users;

 -- ALTERING THE DATA
 
 -- ALTER TABLE Information.users ADD column Salary INT auto_increment;
/*
  SELECT*FROM users;
  
-- ALTER TABLE Information.users DROP column Salary;
 ALTER TABLE information.users CHANGE column  email gmail varchar(255);
 
ALTER TABLE Information.users modify gmail varchar(255) after course_id;
select*from users;
*/
-- FUNCTIONS OF SQL
-- Aggregate functions returns single  column value these are different types
-- COUNT(),MIN(),MAX(),AVERAGE(), 
/*
 SELECT COUNT(*) FROM users;
 
 SELECT COUNT(*)FROM users WHERE gender="female";
 
SELECT MIN(salary)AS min_salary,MAX(regestration_no)AS max_salary from users;

SELECT course_id,gender ,lower(user_name)AS lower,length(user_name) AS user_name_len from users;

SELECT course_id,gender,UPPER(user_name) AS upper , LENGTH(user_name)AS user_name_len from users;	
		
SELECT course_id,gender ,lower(user_name)AS lower, concat(lower (user_name),"2345")AS username,NOW()as time,LENGTH(user_name) AS user_name_len from users;

SELECT course_id,gender ,lower(user_name)AS lower, concat(lower (user_name),"2345")AS username,DAY(date_of_birth)as date,LENGTH(user_name) AS user_name_len from users;

SELECT user_name, datediff(Curdate(),date_of_birth)AS days From users;
 -- TRUNCATE TABLE users;
*/
/*
 SET Autocommit = 1;
select*from users;
-- commit;
-- Rollback;
Delete from users Where id=4;
commit;
select*from users;
 */
 
 -- Primary key and auto increment
 -- subquery
 select avg(salary) from users;
 select*from users where salary < (select avg(salary) from users);
 
 -- subquery with in
 
 select id,user_name,regestration _no
 from users
 where regestration_no IN(select id from users where salary > 50000 );
 