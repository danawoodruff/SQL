--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", e.first_name AS "First Name",
	e.sex AS "Gender", s.salary AS "Salary"
FROM employees as e
LEFT JOIN salaries as s ON
e.emp_no = s.emp_no
ORDER BY e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.hire_date AS "Hire Date"
FROM employees AS e
WHERE EXTRACT (year FROM (hire_date)) = 1986;

--3. List the manager of each department with: dept number, dept name, the manager's employee number, last name, first name.
SELECT d.dept_no AS "Dept No.", d.dept_name AS "Dept Name", m.emp_no AS "Mngr Emp No.",
	e.last_name AS "Last Name", e.first_name AS "First Name"
FROM department as d
LEFT JOIN dept_manager as m ON 
m.dept_no = d.dept_no
LEFT JOIN employees as e ON
e.emp_no = m.emp_no;

--4. List the dept of each employee with: employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
LEFT JOIN dept_emp as de ON
e.emp_no = de.emp_no 
LEFT JOIN department as d ON
d.dept_no = de.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.sex AS "Gender"
FROM employees AS e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'
ORDER BY e.last_name;

--6. List all employees in the Sales dept, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
LEFT JOIN dept_emp as de ON
e.emp_no = de.emp_no 
LEFT JOIN department as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name;

--7. List employees in the Sales and Development depts, inc their employee number, last name, first name, and department name.
SELECT e.emp_no AS "Emp No.", e.last_name AS "Last Name", e.first_name AS "First Name", d.dept_name AS "Dept Name"
FROM employees AS e
LEFT JOIN dept_emp as de ON
e.emp_no = de.emp_no 
LEFT JOIN department as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'
ORDER BY e.last_name;

--8. In descending order, list the frequency count of employee last names 
SELECT COUNT(e.last_name) AS "No. of Occurrences", e.last_name AS "Last Name"
FROM employees AS e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;
