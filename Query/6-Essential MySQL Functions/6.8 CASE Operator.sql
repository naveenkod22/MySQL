-- 6.8 CASE Operator

select 
	order_id,
    case 
		when year(order_date) = year(now()) then 'Active'
		when year(order_date) = year(now()) - 1 then 'Last Year'
        when year(order_date) < year(now()) - 1 then 'Arhived'
        else 'Future'
	end as category
from orders;

-- Exercise

select 
	concat(first_name,' ',  last_name) as custoers,
    points,
    case
		when points > 3000 then 'Gold'
        when points >= 2000 then 'Silver'
        when points < 2000 then 'Bronze'
	end as category
from customers;