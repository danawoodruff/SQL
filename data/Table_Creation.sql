DROP TABLE if exists dept_manager;
DROP TABLE if exists dept_emp;
DROP TABLE if exists salaries;
DROP TABLE if exists employees;
DROP TABLE if exists titles;
DROP TABLE if exists department;

--Create table of Employee Titles and Title IDs	
CREATE TABLE titles (
  emp_title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR(50)
);
	
SELECT * FROM titles;

--Create table of Department numbers and names
CREATE TABLE department (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);

SELECT * FROM department;

--Create table of Employees
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(5) NOT Null,
  birth_date DATE NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles (emp_title_id)
);
	
Select * from employees;
	
--Create table of Employee Salaries
CREATE TABLE salaries (
  emp_no INT PRIMARY KEY,
  salary MONEY,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
	
SELECT * FROM salaries;

--Create table of Departments that employees work in
CREATE TABLE dept_emp (
  emp_no INT NOT Null,
  dept_no VARCHAR(5) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  FOREIGN KEY (dept_no) REFERENCES department (dept_no)
);
	
Select * from dept_emp;
	
--Create table of Departments that employees work in	
CREATE TABLE dept_manager (
  dept_no VARCHAR(5) NOT NULL,
  emp_no INT,
  FOREIGN KEY (dept_no) REFERENCES department (dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
	
SELECT * FROM dept_manager;