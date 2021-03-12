-- 12.28 Crating Relationships

drop table if exists orders;
create table orders
(
order_id int primary key,
customer_id int not null,
foreign key fk_orders_customers (customer_id)
	references customers(customer_id)
    on update cascade 
    on delete no action
);

-- to delete a parent table, it should not have child