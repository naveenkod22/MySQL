-- 10.3 Concurency and locking
-- if ther are multiple users using same database, we caall it concurency
-- there will be problem if one user modifies data, and other user try to retrive it

use sql_store;
start transaction ;
update customers
set points = points + 10
where customer_id = 1;
commit;

-- we simulate other user using 
-- for concurency my sql does locking automatically in most of cases