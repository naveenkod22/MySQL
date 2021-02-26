-- 5.7 corelated subquires

use sql_hr;
select * from employees e where salary > (select avg(salary) from employees where office_id = e.office_id);

-- exercise
use sql_invoicing;
select * from invoices i where invoice_total > (select avg(invoice_total) from invoices where client_id = i.client_id);
