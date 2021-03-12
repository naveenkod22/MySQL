-- 6.6 ifnull and coalesce functions
-- coalesce : come together to form one mass or whole

use sql_store;
select 
	order_id,
    ifnull(shipper_id, 'Not Assigned') as shipper
from orders;

select 
	order_id,
    coalesce(shipper_id, comments, 'Not Assigned') as shipper
from orders;

-- exercise
select 
	concat(first_name, '', last_name) as customer,
    ifnull(phone, 'Unknown') as phone
from customers