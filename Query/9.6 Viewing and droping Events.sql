-- 9.6 Viewing and droping Events
show events;
-- drop event if exists event_name

-- ALTER EVENT
delimiter $$
alter event yearly_delete_stale_audit_rows
on schedule 
	-- at '2019-05-01' -- for fixed date
    every 1 year starts '2019-01-01' ends '2029-01-01'
    do begin
		delete from payments_audit
        where action_date < now() - interval 3 year;
		-- we can also use dateadd(), datesub() functions insted of now() - interval 3 year
    end $$
    
    delimiter ;
    
    -- Alter event to enable or disable event
    alter event yearly_delete_stale_audit_rows disable;
    alter event yearly_delete_stale_audit_rows enable;