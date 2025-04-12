use kongu;
select * from orders;

delimiter &&
create procedure get_total_amount( in startdate date, 
in enddate date)
begin
select sum(total_amount) as total from orders
where order_date between startdate and enddate;
end &&
delimiter ;

call get_total_amount('2024-03-01','2024-03-05');

delimiter &&
create function get_average_amount(
startdate date, enddate date) returns float
deterministic
begin
declare avg_price float;
select avg(total_amount) into avg_price from orders
where order_date between startdate and enddate;
return avg_price;
end &&
delimiter ;

SELECT get_average_amount('2024-03-01', '2024-03-05')
as Average;

delimiter &&
create procedure get_amount( in startdate date, 
in enddate date)
begin
select * from orders
where order_date between startdate and enddate;
end &&
delimiter ;

call get_amount('2024-03-01','2024-03-05');