-- 14.6 granting privileges

-- 1st senerio web application with only read and write
create user moon_app identified by "1234";

grant select, insert, update, delete, execute
on sql_store.* -- all tables in database
to moon_app; -- can also mension @domain, ip, host, ...

-- 2nd senerio admin
grant all -- search web for more previlages
on sql_hr.*  --  *.* for all databases in server
to john;