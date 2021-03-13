-- 1.11 limit clause
-- limit should come last in query
select *
from sql_store.customers
limit 3;
select *
from sql_store.customers
limit 6, 3;
-- outputs 7,8,9 positions
-- exercicise
select *
from sql_store.customers
order by points desc
limit 4;
