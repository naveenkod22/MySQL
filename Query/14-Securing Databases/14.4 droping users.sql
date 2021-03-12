-- 14.4 droping users

create user bob@codewithmosh.com identified by '1234';
select * from mysql.user;
drop user bob@codewithmosh.com;
select * from mysql.user;