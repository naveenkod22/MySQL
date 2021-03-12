-- 12.27 altering table 

alter table customers
	add last_name 	varchar(50) not null after first_name,
    add city 		varchar(50) not null,
    modify column first_name varchar(55) default '',
    drop points;