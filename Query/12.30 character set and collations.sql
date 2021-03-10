-- 12.30 character set and collations

-- charcter set is used map character set to numbers

show char set;

-- default collacation -- ci: case insensitive
-- Maxlen : max length for storing each character, charset with low maxlen is used for reducing database size

-- at database level
create database db_name
	character set latin1;

-- at table level
create table table1
(
customer_id int primary key auto_increment,
fitst_name 	varchar(50) not null,
point 		int not null default 0,
email 		varchar(255) not null unique
)
character set latin1;

-- at column level
-- fitst_name 	varchar(50) character set
create table table2
(
customer_id int primary key auto_increment,
fitst_name 	varchar(50) character set latin1 not null,
point 		int not null default 0,
email 		varchar(255) not null unique
);

-- same format goes for alter statements