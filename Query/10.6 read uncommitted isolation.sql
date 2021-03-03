-- 10.6 read uncommitted isolation
use sql_store;
set transaction isolation level read uncommitted;
select points
from customers
where customer_id = 1;

-- use sql_store;
-- start transaction;

-- update customers
-- set points = 20
-- where customer_id = 1;
-- rollback;

-- lowest isolation level, with this we expect all concurency problems