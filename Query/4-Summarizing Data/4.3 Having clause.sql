-- 4.3 Having clause
-- Where is used before rows are gouped; having is used after grouped but refrence should be done with select clause
select client_id,
    sum(invoice_total) as total_sales
from invoices - -
where total_sales > 500
group by client_id
having total_sales > 500;
select client_id,
    sum(invoice_total) as total_sales,
    count(*) as total_invoices
from invoices - -
where total_sales > 500
group by client_id
having total_sales > 500
    and total_invoices > 5;
-- Exercise
use sql_store;
select c.customer_id,
    c.first_name,
    sum(oi.quantity * oi.unit_price) as Amount_spent
from customers c
    join orders o using(customer_id)
    join order_items oi using(order_id)
where state in ('va')
group by c.customer_id,
    c.first_name
having Amount_Spent >= 100;
;