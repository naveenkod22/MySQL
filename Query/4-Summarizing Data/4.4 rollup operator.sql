-- 4.4 rollup operator
-- only avalible in mysql
use sql_invoicing;
select state,
    city,
    sum(invoice_total) as total_sales
from invoices i
    join clients c using (client_id)
group by state,
    city with rollup;
-- Exercise
select pm.name as payment_method,
    sum(amount) as total
from payments p
    join payment_methods pm on p.payment_method = pm.payment_method_id
group by pm.name with rollup;
-- using with rollup; we need to use actual column name, not alias name