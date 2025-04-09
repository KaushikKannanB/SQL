create database kongu;
use kongu;
create table aids(rno int key, name varchar(50), age int, marks int);
insert into aids(rno, name, age, marks) values (20, 'Kaushik', 22, 90);
select * from aids;