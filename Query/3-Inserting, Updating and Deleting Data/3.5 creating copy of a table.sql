-- 3.5 creating copy of a table

create table orders_archived as 
select * from orders; 
-- copy table from orders; pk and other attributes are dissabled

TRUNCATE orders_archived;

insert into orders_archived
select * from orders where order_date < '2019-01-01';

-- exercise
use invoicing;


create table invoice_archived as
select 
	i.invoice_id, 
    i.number, 
    c.name as client, 
    i.invoice_total, 
    i.payment_total, 
    i.invoice_date,
	i.payment_date, 
    i.due_date 
from invoices i join clients c using (client_id)
where payment_date is not null;