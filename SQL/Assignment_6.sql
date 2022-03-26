# CREATING DATABASE
create database assignments;

# USE ASSIGNMENT DATABASE
use assignments;

# CREATING TABLE
CREATE TABLE worker(
worker_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
department VARCHAR(20),
salary INT,
email VARCHAR(30),
joining_date DATE
);

# INSERTING VALUES INTO THE worker TABLE
INSERT INTO worker(worker_id, first_name, last_name, department, salary,email,joining_date)
VALUES
(1, "Jobin", "Mathew", "Electrical", 70000, "jobinmathewsp@gmail.com", "2018-01-04"),
(2, "Vipul", "Kumar", "Mechanical", 35000, "satishkumar@gmail.com", "2012-06-24"),
(3, "Satish", "Choudhary", "Workshop", 25000, "satishchoudhary@gmail.com", "2010-03-14"),
(4, "Amit", "Jana", "IT", 100000, "amitjana@gmail.com", "2004-12-22"),
(5, "Manik", "Aggarwal", "IT", 60000, "manikaggarwal@gmail.com", "2006-07-04"),
(6, "Priya", "Pal", "Civil", 120000, "priyapal@gmail.com", "2020-06-20"),
(7, "Biswanath", "Sharma", "Electrical", "170000", "biswanathsharma@gmail.com", "2016-09-24"),
(8, "Mani", "Punia", "Chemical", 80000, "manipunia@gmail.com", "2006-01-20"),
(9, "Pritam", "Patel", "Mechanical", 40000, "pritampatel@gmail.com", "2016-03-01"),
(10, "Sayak", "Sharma", "Workshop", 20000, "sayaksharma@gmail.com", "2007-05-10");

# Q1. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * 
FROM Worker 
WHERE YEAR(joining_date) = 2014 
AND 
MONTH(joining_date) = 2;

# Q2. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT department, COUNT(department)
FROM worker
GROUP BY department
HAVING COUNT(department)>1;

# Q3. How to remove duplicate rows from Employees table.
INSERT INTO worker VALUES(11, "Jobin", "Mathew", "Electrical", 70000, "jobinmathewsp@gmail.com", "2018-01-04");

SET SQL_SAFE_UPDATES = 0;

DELETE t1 FROM worker t1
INNER JOIN worker t2
WHERE
t1.worker_id> t2.worker_id
AND t1.first_name=t2.first_name
AND t1.last_name=t2.last_name
AND t1.department=t2.department
AND t1.salary=t2.salary
AND t1.email=t2.email;

SELECT * from worker;

