-- 3.7 updating Multiple Rows

 use invoicing;
update invoices 
set payment_total = 10, payment_date = '2019-03-03'
where client_id in (3,1);

-- exercise
use store;
update customers
set points = points + 50 where birth_date < '1990-01-01'


