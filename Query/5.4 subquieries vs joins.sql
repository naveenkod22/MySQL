-- 5.4 subquieries vs joins
-- depends on redabality of code and perfomance

use sql_invoicing;
select * from clients where client_id not in (select distinct client_id from invoices);

select * from clients left join invoices using(client_id) where invoice_id is null;

-- exercise
use sql_store;
select customer_id, first_name, last_name from customers where customer_id in
(select o.customer_id from order_items oi join orders o using (order_id)  where product_id = 3);

select distinct customer_id, first_name, last_name, product_id from customers 
join orders using(customer_id)
join order_items using(order_id)
-- right join products p using(product_id)
where product_id = 3;