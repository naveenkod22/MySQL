-- 8.5 Parameters

drop procedure if exists get_clients_by_state;

delimiter $$ 
create procedure get_clients_by_state
(
	state char(2)
)
begin
	select * from clients c where c.state = state;
end $$ 

delimiter ;

call get_clients_by_state('ca');
-- call get_clients_by_state(''); , this returns error

-- exercise

drop procedure if exists get_invoices_by_clients;

delimiter $$

create procedure get_invoices_by_clients
(
client_id int
)
begin
	select * from invoices i
    where i.client_id = client_id;
end $$

delimiter ;

call get_invoices_by_clients(1);