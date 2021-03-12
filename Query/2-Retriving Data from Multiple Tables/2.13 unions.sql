-- 2.13 unions
-- we can combine rows

use store;
select order_id, order_date,'Active' as Status 
from orders where order_date >= '2019-01-01'
union
select order_id, order_date,'Archive' as Status 
from orders where order_date < '2019-01-01';

Select first_name as names from customers
union 
select name from shippers;
-- no of column must match in both quire
-- first quirey coloumn names are labeled

-- Exercise
select customer_id, first_name, points, 'Bronze' as Status
from customers where points < 2000
union
select customer_id, first_name, points, 'Silver' as Status 
from customers where points between 2000 and 3000
union 
select customer_id, first_name, points, 'Gold' as Status
from customers where points > 3000
order by first_name;