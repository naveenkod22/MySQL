-- 9.5 Events

-- A task (or block of sql code) that gets
-- executed according to a schedule

show variables like 'event%'; -- it mighit be off to save computational resources
set global event_scheduler = on;

delimiter $$
create event yearly_delete_stale_audit_rows
on schedule 
	-- at '2019-05-01' -- for fixed date
    every 1 year starts '2019-01-01' ends '2029-01-01'
    do begin
		delete from payments_audit
        where action_date < now() - interval 3 year;
		-- we can also use dateadd(), datesub() functions insted of now() - interval 3 year
    end $$
    
    delimiter ;