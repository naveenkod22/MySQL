-- 6.3 Date Functions
select now(), curdate(), curdate();
select year(now());
select hour(now());
select dayname(now());
select monthname(now());
select extract(day from now());

-- exercise
select * from orders where year(order_date) = year(now());