-- 3.2 insertin a row(insert into)
use sql_store;
insert into customers
values (
        default,
        'john',
        'smith',
        '1990-01-01',
        null,
        '20 rock road',
        'Amaravathi',
        'AP',
        default
    );
insert into customers (first_name, last_name, address, city, state)
values (
        'ram',
        'rao',
        '21 rock road',
        'Nellore',
        'AP'
    );