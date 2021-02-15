-- 3.9 deleting rows/ file name as 3.9 deleting multiple rows with s at the end is not accepting

use invoicing;
delete from invoices where invoice_id = 1;

delete from invoices where client_id = (select client_id from clients where name = 'Kwideo');

select * from clients where name = 'Topiclounge'