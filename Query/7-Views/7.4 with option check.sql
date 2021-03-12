-- 7.4 with option check 

select * from invoices_with_balanace;

update invoices_with_balanace
set payment_total = invoice_total
where invoice_id = 2;
-- above query results in deletion of row with invoice_id = 2; to prevent this

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
where (invoice_total - payment_total) > 0
with check option;

update invoices_with_balanace
set payment_total = invoice_total
where invoice_id = 3;
-- with check option; above query results error