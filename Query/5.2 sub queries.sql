-- 5.2 sub queries

use sql_store;
select * from products where unit_price > (select unit_price from products where product_id = 3);
-- subquires can also be written in from or where clause

use sql_hr;
select * from employees where salary > (select avg(salary) from employees);