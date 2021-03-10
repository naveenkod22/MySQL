-- 12.26 crating and dropping tables

use sql_store2;
create table if not exists customers
(
customer_id int primary key auto_increment,
fitst_name 	varchar(50) not null,
point 		int not null default 0,
email 		varchar(255) not null unique
);

-- droping

drop table if exists customers;