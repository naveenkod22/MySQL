-- 3.8 using Subquires in udatae statement
update invoices
set payment_total = invoice_total * 0.5,
    payment_date = due_date
where client_id = (
        select client_id
        from clients
        where name = 'Myworks'
    );
-- My sql executes quirey in the () first and output from inner query is assigned to client_id;
update invoices
set payment_total = invoice_total * 0.5,
    payment_date = due_date
where client_id in (
        select client_id
        from clients
        where state in ('ca', 'ny')
    );
-- use IN insted of '=' for multiple values
-- before updating; see o/p of subquery or sub section to conform what u are updating
-- exercise
use sql_store;
update orders
set comments = 'Gold Customer'
where customer_id in (
        select customer_id
        from customers
        where points > 3000
    );