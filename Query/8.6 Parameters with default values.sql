-- 8.6 Parameters with default values

drop procedure if exists get_clients_by_state;

delimiter $$ 
create procedure get_clients_by_state
(
	state char(2)
)
begin
	if state is null then set state = 'ca';
    end if;
	select * from clients c where c.state = state;
end $$ 

delimiter ;

call get_clients_by_state(null);

drop procedure if exists get_clients_by_state;

delimiter $$ 
create procedure get_clients_by_state
(
	state char(2)
)
begin
	if state is null then 
		select * from clients;
    else
		select * from clients c 
        where c.state = state;
    end if;
	
end $$ 

delimiter ;

drop procedure if exists get_clients_by_state;

delimiter $$ 
create procedure get_clients_by_state
(
	state char(2)
)
begin
	select * from clients c 
	where c.state = ifnull(state, c.state);
end $$ 

delimiter ;

-- exercise
drop procedure if exists get_payments;

delimiter $$

create procedure get_payments
(
	client_id int,
    payment_method_id tinyint
)
begin
	select * from payments p where p.client_id = ifnull(client_id, p.client_id) and
    p.payment_method = ifnull(payment_method_id, p.payment_method);
end $$

delimiter ;

call get_payments(5, 2)