-- 3.3 inserting multiple rows

use store;

insert into shippers(name)
values ('shipper1'), ('shipper2'), ('shipper3');

-- Exercise

insert into products(name, quantity_in_stock, unit_price)
values 
	('potato chips', 44, 1.99),
	('red chilles' , 21, 2.49),
    ('tomato', 64, 3.00);