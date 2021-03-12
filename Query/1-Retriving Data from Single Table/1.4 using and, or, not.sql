-- 1.4 using and, or, not

use store;
select * from customers 
where birth_date > '1990-01-01' and points > 1000; 
select * from customers 
where birth_date > '1990-01-01' or points > 1000;  
select * from customers 
where birth_date > '1990-01-01' or (points > 1000 and state = 'va');
select * from customers 
where not(birth_date > '1990-01-01' or points > 1000 );
