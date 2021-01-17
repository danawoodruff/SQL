-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DK2yeX
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "Dept_no" varchar(4)   NOT NULL,
    "Dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "Dept_No" varchar(4)   NOT NULL,
    "Emp_No" int(6)   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_No" varchar(4)   NOT NULL,
    "Dept_Mngr" int(6)   NOT NULL
);

CREATE TABLE "Employees" (
    "Emp_No" int(6)   NOT NULL,
    "Emp_Title" varchar(5)   NOT NULL,
    "Birth_date" varchar(10)   NOT NULL,
    "First_Name" varchar(25)   NOT NULL,
    "Last_Name" varchar(25)   NOT NULL,
    "Sex" varchar(1)   NOT NULL,
    "Hire_Date" varchar(10)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Salaries" (
    "Emp_No" int(6)   NOT NULL,
    "Salary" int(10)   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_No"
     )
);

CREATE TABLE "Titles" (
    "Emp_Title" varchar(5)   NOT NULL,
    "Title" varchar(25)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Emp_Title"
     )
);

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Dept_Manager" ("Dept_No");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Department" ("Dept_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Salaries" ("Emp_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_No" FOREIGN KEY("Emp_No")
REFERENCES "Dept_Emp" ("Emp_No");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_Emp_Title" FOREIGN KEY("Emp_Title")
REFERENCES "Employees" ("Emp_Title");

