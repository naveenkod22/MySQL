select c.customer_id, c.first_name, o.order_id
from customers c 
left join orders o on c.customer_id = o.customer_id
order by c.customer_id;

select c.customer_id, c.first_name, o.order_id
from customers c 
right join orders o on c.customer_id = o.customer_id
order by c.customer_id;

-- outer key word is optional; when we mention left or right

-- exercise
select p.product_id, p.name, oi.quantity
from products p
left join order_items oi on p.product_id = oi.product_id;

