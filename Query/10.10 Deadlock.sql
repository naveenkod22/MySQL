-- 10.10 Deadlock

use sql_store;
start transaction;
update orders set status = 1 where order_id = 1;
update customers set points = 50 where customer_id = 1;

commit;
-- we cant get rid of them, but we can minimize their likely hood
-- if possible, write sql statements in same order
-- transcation should be kept small duration, so likely to colide decreaces
-- schedule long transcation when there are less users(low peak time)