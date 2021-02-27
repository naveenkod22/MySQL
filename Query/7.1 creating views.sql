-- views
-- 7.1 creating views
 
create view sales_by_client as
select 
	c.client_id,
    c.name,
    sum(invoice_total) as total_sales
from clients c
join invoices i using (client_id)
group by client_id, name;

select * from sales_by_client
join clients using (client_id);

-- view doesent store data
create view client_balance as
select 
	c.client_id,
    c.name,
    sum(i.invoice_total - i.payment_total) as balance
from clients c
join invoices i using(client_id)
group by c.client_id, c.name;
