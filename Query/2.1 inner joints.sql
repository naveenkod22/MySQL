-- 2.1 inner joints

use store;
select  order_id, orders.customer_id, first_name, last_name 
from orders join customers on orders.customer_id = customers.customer_id;

select  order_id, o.customer_id, first_name, last_name 
from orders o join customers c on o.customer_id = c.customer_id;

-- exercise
select order_id, p.product_id, quantity, oi.unit_price 
from order_items oi join products p on oi.order_id = p.product_id;
