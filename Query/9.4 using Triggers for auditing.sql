-- 9.4 using Triggers for auditing

delimiter $$
drop trigger if exists payments_after_insert;
create trigger payments_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + new.amount
    where invoice_id = new.invoice_id;
    
    insert into payments_audit
    values(new.client_id, new.date, new.amount, 'Insert', now());
end $$
delimiter ;


drop trigger if exists payments_after_delete;
delimiter $$
create trigger payments_after_delete
	after delete on payments
    for each row
begin
	update invoices
    set payment_total = payment_total - old.amount
    where invoice_id = old.invoice_id;
    
	insert into payments_audit
    values(old.client_id, old.date, old.amount, 'Delete', now());
end $$
delimiter ;

insert into payments
values(default, 5, 3, '2019-01-01', 10, 1);
delete from payments
where payment_id = 11;