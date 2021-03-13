-- 2.11 Natural Joint
-- can produce unexpeted results, try not to use
use sql_store;
select *
from orders o
    natural join customers c;