-- implicit joint syntax 
select * from orders o, customers c
where o.customer_id = c.customer_id;

-- beter to use explicit joint syntax, in implicit joint syntax if we forgot where clause iy will crate 'CROSS JOINT'