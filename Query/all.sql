-- 1.1 select

use store; -- Deafult database
select * from customers;
select * from customers where customer_id = 1;
-- (--)this can be used to comment. i,e this line is ignored 

-- 1.2 select clause

use store;
select customer_id, first_name from customers order by first_name;
select last_name, first_name, points from customers; 
select last_name, first_name, points, points+10 from customers;
select 
	last_name, 
	first_name,
    points,  
    (points +10) * 100 as discount_factor
from customers;
select 
	last_name, 
	first_name,
    points,  
    (points +10) * 100 as "discount factor" -- To have a space in varible
from customers;
select distinct state from customers;

-- Exercise
use sql_inventory;
select 
	name, 
    unit_price,  
    unit_price*1.1 as 'new price' 
from products;

-- 1.3 where clause

use store; -- as a deafult database
select * from customers where points > 3000;
select * from customer
s where state = 'va';
select * from customers where state != 'il';

-- exercise 
-- Get the order plased this year
select * from orders where order_date >= '2019-01-01';
-- 1.4 using and, or, not

use store;
select * from customers 
where birth_date > '1990-01-01' and points > 1000; 
select * from customers 
where birth_date > '1990-01-01' or points > 1000;  
select * from customers 
where birth_date > '1990-01-01' or (points > 1000 and state = 'va');
select * from customers 
where not(birth_date > '1990-01-01' or points > 1000 );
-- 1.5 in operator

use store;
select * from customers where state in ('va', 'fl', 'ga');
select * from customers where state not in ('va', 'fl', 'ga');
-- exercise
select * from products where quantity_in_stock in (49, 38, 72); 
-- 1.6 between operator

use store;
select * from customers where points between 1000 and 3000;
-- exercise 
select * from customers where birth_date between '1990-1-1' and '2000-1-1';
-- 1.7 Like Operator

select * from store.customers where last_name like 'brush%'; -- % any number of characters
select * from store.customers where last_name like '%y'; 
select * from store.customers where last_name like 'b%';
select * from store.customers where last_name like '%b%'; -- any where if there is b
select * from store.customers where last_name like 'b_____'; -- _ matches singel character
select * from store.customers where last_name like 'b____y';

-- Exercise 
select * from store.customers where address like '%trail%' or 
									address like '%avenue%';
select * from store.customers where phone like '%9';
select * from store.customers where phone not '%9';


-- REGXP(regular expressions) Operator
-- allow us to search more complex patterns

select * from store.customers where last_name regexp 'field'; -- search for field
select * from store.customers where last_name regexp '^field'; -- ^ indicates begining of a string
select * from store.customers where last_name regexp 'field$'; -- $ represent end of a string
select * from store.customers where last_name regexp 'field|mac|rose'; -- | is used to search for multiple character
select * from store.customers where last_name regexp '^field|mac|rose';
select * from store.customers where last_name regexp '^[gim]e'; -- [] any pattern with ge; ie; me
select * from store.customers where last_name regexp '[a-h]e'; [-] -- range from a to h; ends with e
select * from store.customers where last_name regexp 'e[a-h]';

-- Exercise
select * from store.customers where first_name regexp 'elka|ambur';
select * from store.customers where last_name regexp 'ey$|on$';
select * from store.customers where last_name regexp '^my|se';
select * from store.customers where last_name regexp 'b[ru]';
-- 1.9 null operator

select * from store.customers where phone is null;
select * from store.customers where phone is not null;

--  1.10 order by clause
 
select * from store.customers order by first_name;
select * from store.customers order by first_name desc;
select * from store.customers order by state, first_name desc;
select * from store.customers order by state desc, first_name desc;
select * from store.customers order by 2,4;-- produces unexpeted results when orginal table is changed

-- exercise

select *, quantity * unit_price as total_price from store.order_items where order_id = 2 
order by total_price desc; 

-- 
-- 1.11 limit clause

select * from store.customers limit 3;
select * from store.customers limit 6, 3; -- outputs 789 positions

-- exercicise
select * from store.customers order by points desc limit 4;
-- limit should come last in query
-- exercise 
select * from store.orders where shipped_date is null;

-- 2.1 inner joints

use store;
select  order_id, orders.customer_id, first_name, last_name 
from orders join customers on orders.customer_id = customers.customer_id;

select  order_id, o.customer_id, first_name, last_name 
from orders o join customers c on o.customer_id = c.customer_id;

-- exercise
select order_id, p.product_id, quantity, oi.unit_price 
from order_items oi join products p on oi.order_id = p.product_id;
-- using clause
-- column names should be same
use store ;

select o.order_id, c.first_name, sh.name as shipper
from orders o 
join customers c using (customer_id) -- on o.customer_id = c.customer_id
left join shippers sh using (shipper_id);

select * from order_items oi
join order_item_notes oin using(order_id, product_id); 
-- on oi.order_id = oin.order_id and oi.product_id = oin.product_id
	
-- Exercise

use invoicing;

select p.date, c.name, p.amount, pm.name as payment_method 
from payments p
join clients c using(client_id)
join payment_methods pm on p.payment_method = pm.payment_method_id 
-- using does't work beacuse columns names are diffrent

-- 2.11 Natural Joint
-- can produce unexpeted results; try not to use

use store;
select *
from orders o natural join customers c;
-- 2.12 cross joins
-- join every record from 1st table to every record on 2nd table
use store;
select * from customers c cross join products p 
-- we can write as from customers c, orders o(implicant syntax)
order by customer_id;

-- Exercise
select * from shippers sh, products p order by shipper_id;
select * from shippers sh cross join products p order by shipper_id;
-- 2.13 unions
-- we can combine rows

use store;
select order_id, order_date,'Active' as Status 
from orders where order_date >= '2019-01-01'
union
select order_id, order_date,'Archive' as Status 
from orders where order_date < '2019-01-01';

Select first_name as names from customers
union 
select name from shippers;
-- no of column must match in both quire
-- first quirey coloumn names are labeled

-- Exercise
select customer_id, first_name, points, 'Bronze' as Status
from customers where points < 2000
union
select customer_id, first_name, points, 'Silver' as Status 
from customers where points between 2000 and 3000
union 
select customer_id, first_name, points, 'Gold' as Status
from customers where points > 3000
order by first_name;
-- joining across database
use sql_inventory;
select * from store.order_items oi join products p on oi.product_id = p.product_id;
-- self joints
use sql_hr;
select e.employee_id, e.first_name, m.first_name as manager
from employees e join employees m
	on e.reports_to = m.employee_id;
-- multiple joints
use store;

select  o.order_id, o.order_date, c.first_name, c.last_name, os.name as status
from orders o 
join customers c on o.customer_id = c.customer_id 
join order_statuses os on o.status = os.order_status_id;

-- exercise 
use invoicing ;
select p.date, p.invoice_id, p.amount, c.name, pm.name as payment_method
from payments p
join clients c on p.client_id = c.client_id
join payment_methods pm on p.payment_method = pm.payment_method_id;
use store;
select * from order_items oi
join order_item_notes oin
on oi.order_id = oin.order_id and oi.product_id = oin.product_id;
-- implicit joint syntax 
select * from orders o, customers c
where o.customer_id = c.customer_id;

-- beter to use explicit joint syntax, in implicit joint syntax if we forgot where clause iy will crate 'CROSS JOINT'
select c.customer_id, c.first_name, o.order_id
from customers c 
left join orders o on c.customer_id = o.customer_id
order by c.customer_id;

select c.customer_id, c.first_name, o.order_id
from customers c 
right join orders o on c.customer_id = o.customer_id
order by c.customer_id;

-- outer key word is optional; when we mention left or right

-- exercise
select p.product_id, p.name, oi.quantity
from products p
left join order_items oi on p.product_id = oi.product_id;

select c.customer_id, c.first_name, o.order_id, sh.name as shipper
from customers c 
left join orders o on c.customer_id = o.customer_id
left join shippers sh on o.shipper_id = sh.shipper_id
order by c.customer_id;
 
-- exercise
select o.order_id,  o.order_date, c.first_name, sh.name as shipper, os.name as order_status
from orders o
left join shippers sh on o.shipper_id = sh.shipper_id
left join customers c on o.customer_id = c.customer_id
left join order_statuses os on o.status = os.order_status_id
order by os.name;
-- self outer joint

use sql_hr;

select e.employee_id, e.first_name, m.first_name as manager
from employees e left join employees m on e.reports_to = m.employee_id;
	
-- 3.1 column atributes

-- pk : primery key
-- nn : not null
-- ai : auto increment
-- default/ expression : assign default value or exp to empty place
-- 3.10 Restoring data bases
-- to orginal state
-- 3.2 insertin a row(insert into)

use store;
insert into customers values (default, 'john', 'smith', '1990-01-01', null, '20 rock road', 'Amaravathi', 'AP', default);

insert into customers (first_name, last_name,  address, city, state) 
values ('ram', 'rao', '21 rock road', 'Nellore', 'AP')
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
-- 3.4 inserting hierarchical rows
-- insert data in to multiple tables
-- parent child relation ship; orders table--order_items table

insert into orders(customer_id, order_date, status)
values (1, '2019-01-02', 1);

insert into order_items
values(last_insert_id(), 1,  2, 2.95);

select last_insert_id(); -- to output last_insert_id()
-- 3.5 creating copy of a table

create table orders_archived as 
select * from orders; 
-- copy table from orders; pk and other attributes are dissabled

TRUNCATE orders_archived;

insert into orders_archived
select * from orders where order_date < '2019-01-01';

-- exercise
use invoicing;


create table invoice_archived as
select 
	i.invoice_id, 
    i.number, 
    c.name as client, 
    i.invoice_total, 
    i.payment_total, 
    i.invoice_date,
	i.payment_date, 
    i.due_date 
from invoices i join clients c using (client_id)
where payment_date is not null;
-- 3.6 updating a single row
 
 use invoicing;
update invoices 
set payment_total = 10, payment_date = '2019-03-03'
where invoice_id = 1;

update invoices 
set payment_total = default, payment_date = Null
where invoice_id = 1;

update invoices
set payment_total = invoice_total*0.5, payment_date = due_date
where invoice_id = 3;

-- 3.7 updating Multiple Rows

 use invoicing;
update invoices 
set payment_total = 10, payment_date = '2019-03-03'
where client_id in (3,1);

-- exercise
use store;
update customers
set points = points + 50 where birth_date < '1990-01-01'


-- 3.8 using Subquires in udatae statement

update invoices
set payment_total = invoice_total*0.5, payment_date = due_date
where client_id = (select client_id from clients where name ='Myworks');

-- My sql executes quirey in the () first and output(2) is assigned to client_id;

update invoices
set payment_total = invoice_total*0.5, payment_date = due_date
where client_id in (select client_id from clients where state in ('ca', 'ny'));
-- use IN insted of '=' for multiple values
-- before updating; see o/p of subquery or sub section to conform what u are updating

-- exercise
use store;
update orders 
set comments = 'Gold Customer' where customer_id in (select customer_id from customers where points > 3000)
-- 3.9 deleting rows/ file name as 3.9 deleting multiple rows with s at the end is not accepting

use invoicing;
delete from invoices where invoice_id = 1;

delete from invoices where client_id = (select client_id from clients where name = 'Kwideo');

select * from clients where name = 'Topiclounge'
-- 3.9 deleting rows

use invoicing;
delete from invoices where invoice_id = 1;

delete from invoices where client_id = (select client_id from clients where name = 'Kwideo');

select * from clients where name = 'Topiclounge'
-- 4.1 Aggirigate functions

-- max; min; avg;sum;count
-- they operate only on not null values/ null values are not counted or not included

use sql_invoicing;
select
	max(invoice_total) as highest,
    min(invoice_total) as lowest,
    avg(invoice_total) as average,
    sum(invoice_total) as total,
    count(invoice_total * 1.1) as no_of_Invoices,
    count(payment_date) as count_of_payments,
    count(*) as total_records
from invoices;

select
	max(invoice_total) as highest,
    min(invoice_total) as lowest,
    avg(invoice_total) as average,
    sum(invoice_total) as total,
    count(invoice_total * 1.1) as no_of_Invoices,
    count(payment_date) as count_of_payments,
    count(*) as total_records,
    count(distinct client_id) as no_of_clients
from invoices where invoice_date > '2019-07-01';

-- Exercise
select 
	'First half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices where invoice_date between '2019-01-01' and '2019-06-30'
union
select 
	'Second half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices where invoice_date between '2019-07-01' and '2019-12-30'
union
select 
	'total' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices where invoice_date between '2019-01-01' and '2019-12-30'
-- 4.2 Group by Clause

use sql_invoicing;
select 
	client_id,
    sum(invoice_total) as total_sales
from invoices 
group by client_id
order by total_sales desc;

select 
	client_id,
    sum(invoice_total) as total_sales
from invoices 
where invoice_date >= '2019-07-01'
group by client_id
order by total_sales desc;

select 
	state, city,
    sum(invoice_total) as total_sales
from invoices i
join clients using(client_id)
group by client_id
order by total_sales desc;

-- Exercise
select 
	p.date, pm.name as Payment_method,
    sum(p.amount) as total_payments
from payments p
join payment_methods pm on p.payment_method = pm.payment_method_id
group by p.date, Payment_method
order by date
-- 4.3 Having clause
-- Where is used before rows are gouped; having is used after grouped but refrence should be done with select clause

select 
	client_id, 
    sum(invoice_total) as total_sales
from invoices
-- where total_sales > 500
group by client_id
having total_sales > 500;

select 
	client_id, 
    sum(invoice_total) as total_sales,
    count(*) as total_invoices

from invoices
-- where total_sales > 500
group by client_id
having total_sales > 500 and total_invoices > 5; 

-- Exercise

use sql_store;
select
	c.customer_id,
    c.first_name,
	sum(oi.quantity * oi.unit_price) as Amount_spent 
from customers c 
join orders o using(customer_id)
join order_items oi using(order_id)
where state in ('va')
having Amount_Spent > 100;

select
	*
from customers c 
join orders o using(customer_id)
join order_items oi using(order_id)
where state = 'va';







