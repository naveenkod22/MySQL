-- 5.6 any keyword
-- in operator is equalant to = any

select * from clients where client_id in (select client_id from invoices group by client_id having count(*) >= 2);
select * from clients where client_id = any(select client_id from invoices group by client_id having count(*) >= 2);