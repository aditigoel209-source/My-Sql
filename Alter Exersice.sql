Create database company_training;
use company_training;
Create table Departments(
    Department_id int not null,
    dept_name varchar(80) not null,
    city varchar(60)
);
INSERT INTO departments
(department_id, dept_name, city)
VALUES
(1, 'HR', 'Noida'),
(2, 'IT', 'Delhi'),
(3, 'Sales', 'Meerut'),
(4, 'Finance', 'Ghaziabad'),
(5, 'Marketing', 'Noida');
Create table Employees(
    employee_id int not null,
    employee_name Varchar(100) not null,
    email varchar(120),
    department_id int not null,
    salary decimal(10,2),
    status varchar(20)
);
INSERT INTO employees
(employee_id, employee_name, email, department_id, salary, status)
VALUES
(101, 'Amit Sharma', 'amit@gmail.com', 1, 25000.00, 'Active'),
(102, 'Priya Singh', 'priya@gmail.com', 2, 35000.00, 'Active'),
(103, 'Rahul Verma', 'rahul@gmail.com', 3, 28000.00, 'Inactive'),
(104, 'Neha Gupta', 'neha@gmail.com', 4, 40000.00, 'Active'),
(105, 'Ankit Kumar', 'ankit@gmail.com', 5, 30000.00, 'Active');

Select * from Departments;
Select * from employees;
Alter table departments ADD PRIMARY KEY(Department_id);
Alter table employees ADD PRIMARY KEY(employee_id);
Show index from departments;
show index from employees;
Alter table departments ADD COLUMN location varchar(100);
Alter table departments CHANGE COLUMN dept_name department_name varchar(80) not null;
Alter table employees MODIFY salary decimal(12,2) not null;
ALTER TABLE employees ALTER COLUMN status SET DEFAULT 'Active';
Alter table employees ADD CONSTRAINT uq_email unique(email);
RENAME table employees to Staff;
Alter table staff ADD CONSTRAINT fk_id FOREIGN KEY(department_id) references Departments(department_id);
show index from staff;
Alter table staff drop index uq_email;
Alter table staff drop foreign key fk_id;
Alter table staff drop primary key;
Alter table staff ADD PRIMARY KEY(employee_id);
Alter table departments DROP COLUMN location;
CREATE DATABASE company_management;
RENAME TABLE company_training.departments TO company_management.departments;
RENAME TABLE company_training.employees TO company_management.employees;

DROP DATABASE company_training;


