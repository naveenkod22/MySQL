-- 6.5 caluculating Dates and Times

select date_add(now(), interval 1 day);
select date_add(now(), interval -1 year);
select date_sub(now(), interval -1 year);
select date_sub(now(), interval 1 year);
select datediff(now(), '2021-01-01'); 
select time_to_sec('09:00') - time_to_sec('09:02');