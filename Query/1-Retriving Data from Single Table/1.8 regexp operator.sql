-- REGXP(regular expressions) Operator
-- allow us to search more complex patterns
select *
from sql_store.customers
where last_name regexp 'field';
-- search for field
select *
from sql_store.customers
where last_name regexp '^field';
-- ^ indicates begining of a string
select *
from sql_store.customers
where last_name regexp 'field$';
-- $ represent end of a string
select *
from sql_store.customers
where last_name regexp 'field|mac|rose';
-- | is used to search for multiple character
select *
from sql_store.customers
where last_name regexp '^field|mac|rose';
select *
from sql_store.customers
where last_name regexp '^[gim]e';
-- [] any pattern with ge; ie; me
select *
from sql_store.customers
where last_name regexp '[a-h]e';
-- [-] range from a to h; ends with e
select *
from sql_store.customers
where last_name regexp '^n[a-h]';
-- Exercise
select *
from sql_store.customers
where first_name regexp 'elka|ambur';
select *
from sql_store.customers
where last_name regexp 'ey$|on$';
select *
from sql_store.customers
where last_name regexp '^my|se';
select *
from sql_store.customers
where last_name regexp '[a-z]h$';