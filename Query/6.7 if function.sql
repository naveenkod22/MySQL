-- 6.7 if function

select 
	order_id,
    order_date,
    if (year(order_date) = year(now()), 'Active', 'Archive') as status
from orders;

-- Exercise
select 
	product_id,
    name,
    count(*) as orders,
    if(count(*) > 1 , 'Many times' , 'Once') as count
from products 
join order_items using(product_id)
group by product_id, name;