-- 7.2 Altering or Droping view
drop view client_balance;

create or replace view client_balance as
select 
	c.client_id,
    c.name,
    sum(i.invoice_total - i.payment_total) as balance
from clients c
join invoices i using(client_id)
group by c.client_id, c.name;