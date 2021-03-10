-- 12.29 altering primary key and foreigen key constraints

alter table orders
	add primary key(order_id),
    drop primary key, -- column names not specifed
	drop foreign key  orders_ibfk_4,
    drop foreign key  orders_ibfk_5,
    add foreign key fk_orders_customers(customer_id)
		references customers (customer_id)
        on update cascade
        on delete no action;