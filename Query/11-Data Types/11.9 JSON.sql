-- 11.9 JSON
-- lightweight format for storing amd transferring data over the internet

-- ALTER TABLE sql_store.products ADD COLUMN properties JSON NULL AFTER unit_price ;

update products
set properties = '{
	"Dimentions" : [1, 2, 3],
    "Weight" : 10,
    "Manufacturer" : {"name" : "sony"}
}'
where product_id = 1;

update products
set properties = json_object(
	"Dimentions" , json_array(1, 2, 3),
    "Weight" , 20,
    "Manufacturer" , json_object("name" , "Apple")
)
where product_id = 2;

-- above 2 quires are ssame

-- quering json object
select product_id, json_extract(properties, '$.Weight') 
from products where product_id = 2;

select product_id, properties -> '$.Weight'
from products where product_id = 1;

-- json strings are case sensitive

select product_id, properties -> '$.Dimentions'
from products where product_id = 1;

select product_id, properties -> '$.Dimentions[0]'
from products where product_id = 1;

select product_id, properties -> '$.Manufacturer'
from products where product_id = 1;

select product_id, properties -> '$.Manufacturer[0]'
from products where product_id = 1;

select product_id, properties -> '$.Manufacturer.name'
from products where product_id = 1;

select product_id, properties -> '$.Manufacturer.name'
from products 
where properties ->> '$.Manufacturer.name' = 'sony';

-- to get rid of "" in output use ->>

update products
set properties = json_set(
	properties, 
    '$.Weight', 30,
    '$.sold_by', 'AA Murchant',
    '$.age', 1
)
where product_id = 2;

update products
set properties = json_remove(
	properties, 
    '$.age'
)
where product_id = 2;