-- 2.12 cross joins
-- join every record from 1st table to every record on 2nd table
use store;
select * from customers c cross join products p 
-- we can write as from customers c, orders o(implicant syntax)
order by customer_id;

-- Exercise
select * from shippers sh, products p order by shipper_id;
select * from shippers sh cross join products p order by shipper_id;