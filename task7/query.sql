use kongu;

insert into employees(emp_id,name,department, salary) values
(9, 'Vinayak','IT',85000.00);

select * from employees;

select *, rank() over (partition by department order by salary desc) as ranksalary
from employees
;

select *, dense_rank() over (partition by department order by salary desc) as ranksalary_dense
from employees
;

select *, lead(salary) over (partition by department order by salary desc) as lead_sal
from employees
;

select *, lag(salary) over (partition by department order by salary desc) as lag_sal
from employees
;

select *, rank() over (partition by department order by salary desc) as ranksalary,
dense_rank() over (partition by department order by salary desc) as ranksalary_dense,
lead(salary) over (partition by department order by salary desc) as lead_sal,
lag(salary) over (partition by department order by salary desc) as lag_sal
from employees