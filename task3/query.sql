use kongu;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO Employees (emp_id, name, department, salary) VALUES
(1, 'Alice', 'HR', 60000),
(2, 'Bob', 'IT', 75000),
(3, 'Charlie', 'Finance', 80000),
(4, 'David', 'HR', 62000),
(5, 'Eve', 'IT', 90000),
(6, 'Frank', 'Finance', 75000),
(7, 'Grace', 'IT', 85000),
(8, 'Hannah', 'HR', 58000);

select distinct department from Employees;

select * from Employees;

select name, department, max(salary) as Highsalary from Employees group by department; 

select department from Employees group by department having avg(salary)>60000;

select department, avg(salary) as AVEG from Employees group by department order by AVEG asc;

select avg(salary) from Employees group by department;

 