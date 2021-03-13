-- 1.5 in operator
use sql_store;
select *
from customers
where state in ('va', 'fl', 'ga');
select *
from customers
where state not in ('va', 'fl', 'ga');
-- exercise
select *
from products
where quantity_in_stock in (49, 38, 72);