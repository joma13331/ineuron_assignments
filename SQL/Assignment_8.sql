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

# CREATING TABLE worker_two
CREATE TABLE worker_two LIKE worker;

# INSERTING VALUES INTO THE worker_edu TABLE
INSERT INTO worker_two(worker_id, first_name, last_name, department, salary,email,joining_date)
VALUES
(1, "Jobin", "Mathew", "Electrical", 70000, "jobinmathewsp@gmail.com", "2018-01-04"),
(2, "Vipul", "Kumar", "Mechanical", 35000, "satishkumar@gmail.com", "2012-06-24"),
(3, "Satish", "Choudhary", "Workshop", 25000, "satishchoudhary@gmail.com", "2010-03-14"),
(4, "Amit", "Jana", "IT", 100000, "amitjana@gmail.com", "2004-12-22"),
(5, "Manik", "Aggarwal", "IT", 60000, "manikaggarwal@gmail.com", "2006-07-04"),
(6, "Priya", "Pal", "Civil", 120000, "priyapal@gmail.com", "2020-06-20");

# Q15. Write an SQL query to fetch intersecting records of two tables.
SELECT worker.worker_id, worker.first_name, worker.last_name, worker_two.department, worker_two.salary
FROM worker
INNER JOIN worker_two
ON worker.worker_id=worker_two.worker_id;

# Q16. Write an SQL query to show records from one table that another table does not have.
SELECT * 
FROM worker
WHERE worker_id NOT IN(
SELECT worker_two.worker_id
FROM worker_two);