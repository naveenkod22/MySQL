-- 4.2 Group by Clause
use sql_invoicing;
select client_id,
    sum(invoice_total) as total_sales
from invoices
group by client_id
order by total_sales desc;
select client_id,
    sum(invoice_total) as total_sales
from invoices
where invoice_date >= '2019-07-01'
group by client_id
order by total_sales desc;
select state,
    city,
    sum(invoice_total) as total_sales
from invoices i
    join clients using(client_id)
group by client_id
order by total_sales desc;
-- Exercise
select p.date,
    pm.name as Payment_method,
    sum(p.amount) as total_payments
from payments p
    join payment_methods pm on p.payment_method = pm.payment_method_id
group by p.date,
    Payment_method
order by date