use kongu;
select * from employees;

WITH marksaverage AS (
    SELECT AVG(marks) AS avgm FROM aids
)
select a.name, a.marks, m.avgm from aids a, marksaverage m where a.marks>=m.avgm;

with deptavg as (
select department, avg(salary) as sal from employees group by department
)
select e.name, e.department, d.sal from employees e, deptavg d where e.department=d.department and e.salary>d.sal;

CREATE TABLE manager (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO manager (id, name, manager_id) VALUES
(1, 'Alice', NULL),     
(2, 'Bob', 1),          
(3, 'Carol', 2),        
(4, 'Dave', 2),         
(5, 'Eve', 4);          

INSERT INTO manager (id, name, manager_id) VALUES
(6, 'Frank', NULL),     
(7, 'Grace', 6),        
(8, 'Hank', 7);   

select * from manager;
with recursive alicemanaging as(
select id, name from manager where manager_id=1

union all

select m.id, m.name from manager m inner join alicemanaging am on m.manager_id = am.id
)
select * from alicemanaging;
