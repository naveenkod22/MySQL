-- 10.7 repetable read  isolation

use sql_store;
set transaction isolation level repeatable read ;
start transaction;
select points from customers where customer_id = 1;
select points from customers where customer_id = 1;
commit;

-- draws data from snapshot when transcation is started, uses same data until transcation is commited