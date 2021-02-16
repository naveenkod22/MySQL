-- 5.3 in operator
-- products that have never been ordered

use sql_store;
select * from products where product_id not in ( select distinct product_id from order_items);

-- exercise
use sql_invoicing;
select * from clients where client_id not in (select distinct client_id from invoices);