-- 5.8 exists operator

select * from clients c where exists ( select client_id from invoices where client_id = c.client_id);

-- in and exists operators have some perfomance and execution order diffrence

-- exercise
use sql_store;
select * from products p where not exists (select product_id from order_items where product_id = p.product_id);
