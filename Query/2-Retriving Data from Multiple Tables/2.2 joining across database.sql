-- joining across database
use sql_inventory;
select * from store.order_items oi join products p on oi.product_id = p.product_id;