--  1.10 order by clause
 
select * from store.customers order by first_name;
select * from store.customers order by first_name desc;
select * from store.customers order by state, first_name desc;
select * from store.customers order by state desc, first_name desc;
select * from store.customers order by 2,4;-- produces unexpeted results when orginal table is changed

-- exercise

select *, quantity * unit_price as total_price from store.order_items where order_id = 2 
order by total_price desc; 

-- 