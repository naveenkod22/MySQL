-- 14.2 creating user

-- create user naveen@127.0.0.1; -- ip address
-- create user naveen@localhost; -- host
-- create user naveen@codewithmosh.com; -- domain name, no acess to sub domain
-- create user naveen@'%.codewithmosh.com'; -- any sub domain 

create user john -- can conect from any where
identified by '1234'; -- password for user