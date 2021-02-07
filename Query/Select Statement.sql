-- Tutorial 1.1
use store;
select * from customers;
select * from customers where customer_id = 1;
-- (--)this can be used to comment. i,e this line is ignored 

-- Tutorial 1.2
select customer_id, first_name from customers order by first_name;
select last_name, first_name, points from customers; 
select last_name, first_name, points, points+10 from customers;
select 
	last_name, 
	first_name,
    points,  
    (points +10) * 100 as discount_factor
from customers;
select 
	last_name, 
	first_name,
    points,  
    (points +10) * 100 as "discount factor" -- To have a space in varible
from customers;
select distinct state from customers;

-- Exercise
use sql_inventory;
select 
	name, 
    unit_price,  
    unit_price*1.1 as 'new price' 
from products;

-- Tutorial 1.3 using where 
use store; -- as a deafult database
select * from customers where points > 3000;
select * from customers where state = 'va';
select * from customers where state != 'il';

-- exercise 
-- Get the order plased this year
select * from orders where order_date >= '2019-01-01';

-- section 1.4 using and, or, not
select * from customers 
where birth_date > '1990-01-01' and points > 1000; 
select * from customers 
where birth_date > '1990-01-01' or points > 1000;  
select * from customers 
where birth_date > '1990-01-01' or (points > 1000 and state = 'va');
select * from customers 
where not(birth_date > '1990-01-01' or points > 1000 );

