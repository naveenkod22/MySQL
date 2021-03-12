-- 1.11 limit clause

select * from store.customers limit 3;
select * from store.customers limit 6, 3; -- outputs 789 positions

-- exercicise
select * from store.customers order by points desc limit 4;
-- limit should come last in query
