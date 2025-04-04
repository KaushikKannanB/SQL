use kongu;

create table pilots(
id int,
status_fly varchar(50),
Date_of_status date
);

select * from pilots;
insert into pilots (id, status_fly, Date_of_status) values
(1, 'active', '2024-02-25'),
(2, 'sleep', '2024-02-25'),
(3, 'active', '2024-02-25'),
(2, 'active', '2024-02-26'),
(1, 'sleep', '2024-02-26');

select * from pilots;

select p1.id, p1.status_fly, p2.status_fly
from pilots p1 join pilots p2 on p1.id = p2.id 
where datediff(p1.Date_of_status, p2.Date_of_status)=1 and p1.status_fly<>p2.status_fly;


insert into pilots (id, status_fly, Date_of_status) values
(1, 'active', '2024-02-27'),
(2, 'sleep', '2024-02-27'),
(1, 'sleep', '2024-02-28'),
(2, 'active', '2024-02-28'),
(1, 'active', '2024-02-29'),
(2, 'sleep', '2024-02-29');


select p1.id, date_format(p1.Date_of_status, '%d-%m-%Y') as formatted_data, p1.status_fly, p2.status_fly
from pilots p1 join pilots p2 on p1.id = p2.id
where datediff(p1.Date_of_status, p2.Date_of_status)=1 
and datediff('2024-02-29', p1.Date_of_status)>=2 and p1.status_fly<>p2.status_fly;