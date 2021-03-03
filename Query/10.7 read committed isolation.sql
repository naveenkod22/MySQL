-- 10.7 read committed isolation

use sql_store;
set transaction isolation level read committed;
select points
from customers
where customer_id = 1;

-- reads data from commited data, we can avoid dirty reads
-- we can have unrepeatable reads
set transaction isolation level read committed;
start transaction;
select points from customers where customer_id = 1;
select points from customers where customer_id = 1;
commit;