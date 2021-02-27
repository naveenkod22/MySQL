-- 7.3 updatable views

-- DISTINT, Aggregate function, group by / having, union : if we dont have this in query, views can be updated as regular table

create or replace view invoices_with_balanace as
select
	invoice_id,
	client_id,
    number,
    invoice_total,
    payment_total,
    invoice_total - payment_total as balance,
    invoice_date,
    due_date,
    payment_date
from invoices
where (invoice_total - payment_total) > 0;