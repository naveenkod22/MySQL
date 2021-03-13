-- 1.3 where clause
use sql_store;
select *
from customers
where points > 3000;
select *
from customers
where state = 'va';
select *
from customers
where state != 'il';
-- exercise 
-- Get the order plased this year
select *
from orders
where order_date >= '2019-01-01';