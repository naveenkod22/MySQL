-- 9.1 Triggers
-- A block of code that automatically gets executed 
-- before or after an insert, update or delete statement.

delimiter $$

create trigger payments_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + new.amount
    where invoice_id = new.invoice_id;
end $$
delimiter ;

insert into payments
values (default, 5, 3, '2019-01-01', 10, 1);

-- Exercise
delimiter $$
create trigger payments_after_delete
	after delete on payments
    for each row
begin
	update invoices
    set payment_total = payment_total - old.amount
    where invoice_id = old.invoice_id;
end $$
delimiter ;

delete from payments where payment_id = 10;