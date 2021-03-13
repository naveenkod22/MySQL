-- 1.9 null operator
select *
from sql_store.customers
where phone is null;
select *
from sql_store.customers
where phone is not null;
-- exercise 
select *
from sql_store.orders
where shipped_date is null;