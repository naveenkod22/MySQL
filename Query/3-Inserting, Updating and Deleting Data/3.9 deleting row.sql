-- 3.9 deleting rows
use sql_invoicing;
delete from invoices
where invoice_id = 1;
delete from invoices
where client_id = (
        select client_id
        from clients
        where name = 'Kwideo'
    );
select *
from clients
where name = 'Topiclounge'