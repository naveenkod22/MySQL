-- Tutorial 1.2
use store;
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

