select c.customer_id, c.first_name, o.order_id, sh.name as shipper
from customers c 
left join orders o on c.customer_id = o.customer_id
left join shippers sh on o.shipper_id = sh.shipper_id
order by c.customer_id;
 
-- exercise
select o.order_id,  o.order_date, c.first_name, sh.name as shipper, os.name as order_status
from orders o
left join shippers sh on o.shipper_id = sh.shipper_id
left join customers c on o.customer_id = c.customer_id
left join order_statuses os on o.status = os.order_status_id
order by os.name;