-- 10.2 Creating Transcation
-- recreate data base

use sql_store;
start transaction;

insert into orders(customer_id, order_date, status)
values(1, '2019-01-01', 1);

insert into order_items
values (last_insert_id(), 1, 1, 1);

commit;

-- rollback will undo changes
use sql_store;
start transaction;

insert into orders(customer_id, order_date, status)
values(1, '2019-01-01', 1);

insert into order_items
values (last_insert_id(), 1, 1, 1);

rollback;

show variables like 'autocommit';
-- when we execute a single statement, mysql puts that statement into transaction 
-- and commits it if there is no error in executed statement