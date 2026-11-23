DROP DATABASE IF EXISTS interview_commands_practice;
CREATE DATABASE interview_commands_practice;
USE interview_commands_practice;

SET autocommit = 1;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(60) NOT NULL,
    department VARCHAR(30) NOT NULL,
    city VARCHAR(40),
    salary DECIMAL(10, 2) CHECK (salary > 0),
    employment_status ENUM('Active', 'Inactive') DEFAULT 'Active',
    phone VARCHAR(15) UNIQUE
) ENGINE = InnoDB;

INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
    (1, 'Rahul Sharma', 'IT', 'Delhi', 45000.00, 'Active', '9000000001'),
    (2, 'Priya Verma', 'HR', 'Mumbai', 42000.00, 'Active', '9000000002'),
    (3, 'Amit Patel', 'Sales', 'Ahmedabad', 38000.00, 'Inactive', '9000000003'),
    (4, 'Anjali Singh', 'IT', 'Kolkata', 50000.00, 'Active', '9000000004'),
    (5, 'Vijay Kumar', 'Finance', 'Bangalore', 55000.00, 'Active', '9000000005'),
    (6, 'Sanjay Reddy', 'Sales', 'Hyderabad', 36000.00, 'Active', '9000000006'),
    (7, 'Megha Iyer', 'IT', 'Chennai', 48000.00, 'Active', '9000000007'),
    (8, 'Neha Gupta', 'HR', 'Delhi', 32000.00, 'Inactive', '9000000008'),
    (9, 'Arjun Mehta', 'Finance', 'Pune', 52000.00, 'Active', '9000000009'),
    (10, 'Pooja Shah', 'Sales', 'Mumbai', 40000.00, 'Active', '9000000010');
Select * from Employees;
    
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
	(11, 'Karan Malhotra', 'IT', 'Noida', 41000.00, 'Active', '9000000011');
    
INSERT INTO employees
    (employee_id, employee_name, department, city, salary, employment_status, phone)
VALUES
	(12, 'Simran Kaur',' HR', 'Delhi', '35000.00', 'Active', '9000000012'),
	(13, 'Rohan Das', 'Sales', 'Pune', '33000.00', 'Inactive', '9000000013');
    
Update Employees
SET City = 'Gurgaon',
    Salary = '46000.00'
WHERE employee_id = '11';

UPDATE Employees
SET Salary = salary* 1.10
WHERE Employee_id IN (1,4,7);

DELETE from Employees
WHERE Employee_id IN(3,8,13);

Select * from Employees;

ALTER TABLE Employees ADD COLUMN Email Varchar(100) null;
Describe Employees;

ALTER TABLE Employees
MODIFY COLUMN Phone varchar(20) null;
Describe Employees;

ALTER TABLE Employees
RENAME COLUMN City TO work_city;

ALTER TABLE Employees
DROP COLUMN Email;
Describe Employees;

RENAME TABLE Employees TO Staff;
Describe staff;

START TRansaction;
INSERT INTO staff
(employee_id, employee_name, department, work_city, salary, Employment_status, phone)
VALUES
(14, 'Nisha Rao', 'IT', 'Noida', 44000.00, 'Active', 9000000014);
UPDATE Staff
SET Salary = '45000.00'
WHERE Employee_id = '2';
COMMIT;
ROLLBACK;
Select * from Staff;

Start Transaction;
UPDATE Staff
SET Salary = 60000.00
WHERE Employee_id = 5;
DELETE FROM Staff
WHERE Employee_id = 6;
ROLLBACK;
Select * from Staff;

START Transaction;
UPDATE Staff
SET Salary =47000.00
WHERE Employee_id=14;
SAVEPOINT Salary_saved;
UPDATE Staff
SET work_city = 'Jaipur'
WHERE Employee_id=14;
DELETE FROM Staff
WHERE Employee_id = 14;
ROLLBACK TO City_saved;
ROLLBACK TO Salary_saved;
SELECT employee_id, employee_name, salary, work_city
FROM staff
WHERE employee_id = 14;

START TRANSACTION;
TRUNCATE TABLE staff;
ROLLBACK;
SELECT *
FROM staff;
Describe Staff;

DROP TABLE staff;
DROP DATABASE interview_commands_practice;
SHOW Databases;

