-- 4.1 Aggirigate functions
-- max; min; avg;sum;count
-- they operate only on not null values/ null values are not counted or not included
use sql_invoicing;
select max(invoice_total) as highest,
    min(invoice_total) as lowest,
    avg(invoice_total) as average,
    sum(invoice_total) as total,
    count(invoice_total * 1.1) as no_of_Invoices,
    count(payment_date) as count_of_payments,
    count(*) as total_records
from invoices;
select max(invoice_total) as highest,
    min(invoice_total) as lowest,
    avg(invoice_total) as average,
    sum(invoice_total) as total,
    count(invoice_total * 1.1) as no_of_Invoices,
    count(payment_date) as count_of_payments,
    count(*) as total_records,
    count(distinct client_id) as no_of_clients
from invoices
where invoice_date > '2019-07-01';
-- Exercise
select 'First half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices
where invoice_date between '2019-01-01' and '2019-06-30'
union
select 'Second half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices
where invoice_date between '2019-07-01' and '2019-12-30'
union
select 'total' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as What_we_expect
from invoices
where invoice_date between '2019-01-01' and '2019-12-30'