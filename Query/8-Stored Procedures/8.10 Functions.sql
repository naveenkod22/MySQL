-- 9.10 Functions

USE `sql_invoicing`;
DROP function IF EXISTS `get_risk_factor_for_clent`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE FUNCTION get_risk_factor_for_clent ( client_id int)
RETURNS INTEGER
-- attributes
reads sql data
BEGIN
declare risk_factor decimal(9,2) default 0;
     declare invoices_total decimal(9,2);
     declare invoices_count int;
     
     select count(*), sum(invoice_total)
     into invoices_count, invoices_total
     from invoices i
     where i.client_id = client_id;
     
     set risk_factor = invoices_total / invoices_count * 5;
	RETURN ifnull(risk_factor, 0);
END$$

DELIMITER ;

select 
	client_id,
	name, 
    get_risk_factor_for_clent(client_id) as risk_factor
from clients;