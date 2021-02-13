-- REGXP(regular expressions) Operator
-- allow us to search more complex patterns

select * from store.customers where last_name regexp 'field'; -- search for field
select * from store.customers where last_name regexp '^field'; -- ^ indicates begining of a string
select * from store.customers where last_name regexp 'field$'; -- $ represent end of a string
select * from store.customers where last_name regexp 'field|mac|rose'; -- | is used to search for multiple character
select * from store.customers where last_name regexp '^field|mac|rose';
select * from store.customers where last_name regexp '^[gim]e'; -- [] any pattern with ge; ie; me
select * from store.customers where last_name regexp '[a-h]e'; [-] -- range from a to h; ends with e
select * from store.customers where last_name regexp 'e[a-h]';

-- Exercise
select * from store.customers where first_name regexp 'elka|ambur';
select * from store.customers where last_name regexp 'ey$|on$';
select * from store.customers where last_name regexp '^my|se';
select * from store.customers where last_name regexp 'b[ru]';