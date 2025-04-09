use kongu;
select * from Employees e where salary> (select avg(salary) from Employees where department = e.department);

select name, salary , (select salary - avg(salary) from Employees where department = e.department) as Diff from Employees e;