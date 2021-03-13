-- 3.4 inserting hierarchical rows
-- insert data in to multiple tables
-- parent child relation ship; orders table--order_items table
insert into orders(customer_id, order_date, status)
values (1, '2019-01-02', 1);
insert into order_items
values(last_insert_id(), 1, 2, 2.95);
select last_insert_id();
-- to output last_insert_id()