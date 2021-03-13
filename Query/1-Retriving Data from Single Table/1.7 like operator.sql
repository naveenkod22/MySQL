-- 1.7 Like Operator
select *
from sql_store.customers
where last_name like 'brush%';
-- % any number of characters
select *
from sql_store.customers
where last_name like '%y';
select *
from sql_store.customers
where last_name like 'b%';
select *
from sql_store.customers
where last_name like '%b%';
-- any where if there is b
select *
from sql_store.customers
where last_name like 'b_____';
-- _ matches singel character
select *
from sql_store.customers
where last_name like 'b____y';
-- Exercise
select *
from sql_store.customers
where address like '%trail%'
	or address like '%avenue%';
select *
from sql_store.customers
where phone like '%9';
select *
from sql_store.customers
where phone not like '%9';