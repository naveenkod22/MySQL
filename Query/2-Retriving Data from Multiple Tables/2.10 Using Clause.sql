-- using clause
-- column names should be same
use sql_store;
select o.order_id,
    c.first_name,
    sh.name as shipper
from orders o
    join customers c using(customer_id) -- on o.customer_id = c.customer_id
    left join shippers sh using(shipper_id);
select *
from order_items oi
    join order_item_notes oin using(order_id, product_id);
-- on oi.order_id = oin.order_id and oi.product_id = oin.product_id
-- Exercise
use sql_invoicing;
select p.date,
    c.name,
    p.amount,
    pm.name as payment_method
from payments p
    join clients c using(client_id)
    join payment_methods pm on p.payment_method = pm.payment_method_id -- using does't work beacuse columns names are diffrent