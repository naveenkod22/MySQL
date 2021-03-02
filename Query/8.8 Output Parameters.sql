-- 8.8 Output Parameters
USE `sql_invoicing`;
DROP procedure IF EXISTS `get_unpaid_invoices_for_clients`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE get_unpaid_invoices_for_clients 
(
	client_id int
)
BEGIN
	select count(*), sum(invoice_total)
    from invoices i 
    where i.client_id = client_id
		and payment_total = 0;
END$$

DELIMITER ;
call sql_invoicing.get_unpaid_invoices_for_clients(2);


USE `sql_invoicing`;
DROP procedure IF EXISTS `get_unpaid_invoices_for_clients`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE get_unpaid_invoices_for_clients 
(
	client_id int,
    out invoices_count int,
    out invoices_total decimal(9,2)
)
BEGIN
	select count(*), sum(invoice_total)
    into invoices_count, invoices_total
    from invoices i 
    where i.client_id = client_id
		and payment_total = 0;
END$$

DELIMITER ;

set @invoices_count = 0;
set @invoices_total = 0;
call sql_invoicing.get_unpaid_invoices_for_clients(2, @invoices_count, @invoices_total);
select @invoices_count, @invoices_total;