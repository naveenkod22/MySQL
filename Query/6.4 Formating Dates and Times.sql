-- 6.4 Formating Dates and Times

select date_format(now(), '%d %m %y');
select date_format(now(), '%D %M %Y');
select date_format(now(), '%H:%i%p');
select date_format(now(), '%H : %i %p');

-- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html