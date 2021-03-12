-- 5.10 subquires in fron clause

select * from 
(select client_id, name, 
	(select sum(invoice_total) from invoices where client_id = c.client_id) as total_sales,
    (select avg(invoice_total) from invoices ) as average,
    (select total_sales - average) as diffrence
from clients c) as sales_summary
where total_sales is not null;
