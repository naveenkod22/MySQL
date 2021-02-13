-- 1.9 null operator

select * from store.customers where phone is null;
select * from store.customers where phone is not null;

-- exercise 
select * from store.orders where shipped_date is null;