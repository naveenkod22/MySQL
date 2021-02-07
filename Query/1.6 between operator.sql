-- section 1.6 between operator
use store;
select * from customers where points between 1000 and 3000;
-- exercise 
select * from customers where birth_date between '1990-1-1' and '2000-1-1';