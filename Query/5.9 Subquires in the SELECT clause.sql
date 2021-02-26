-- 5.9 Subquires in the SELECT clause
use sql_invoicing;

select invoice_id, invoice_total,
	(select avg(invoice_total) from invoices) as invoices_average,
    invoice_total - (select invoices_average) as diffrence
from invoices;

-- exercise

select client_id, name, 
	(select sum(invoice_total) from invoices where client_id = c.client_id) as total_sales,
    (select avg(invoice_total) from invoices ) as average,
    (select total_sales - average) as average
from clients c;
