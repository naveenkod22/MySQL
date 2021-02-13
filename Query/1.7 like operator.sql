-- 1.7 Like Operator

select * from store.customers where last_name like 'brush%'; -- % any number of characters
select * from store.customers where last_name like '%y'; 
select * from store.customers where last_name like 'b%';
select * from store.customers where last_name like '%b%'; -- any where if there is b
select * from store.customers where last_name like 'b_____'; -- _ matches singel character
select * from store.customers where last_name like 'b____y';

-- Exercise 
select * from store.customers where address like '%trail%' or 
									address like '%avenue%';
select * from store.customers where phone like '%9';
select * from store.customers where phone not '%9';


