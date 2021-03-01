-- 8.2 creating stored procedures
delimiter $$
create procedure get_clients()
begin
	select * from clients;
end $$
 
delimiter ;

call sql_invoicing.get_clients();

delimiter $$

create procedure invoice_with_balance()
begin 
	select * from invoices
	where invoice_total - payment_total > 0;
    -- select * from invoices_with_balance where balance > 0(From view)
end $$

delimiter ;