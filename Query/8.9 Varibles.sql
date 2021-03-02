-- 8.9 Varibles

USE `sql_invoicing`;
DROP procedure IF EXISTS `get_risk_factor`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE get_risk_factor ()
BEGIN
	 declare risk_factor decimal(9,2) default 0;
     declare invoices_total decimal(9,2);
     declare invoices_count int;
     
     select count(*), sum(invoice_total)
     into invoices_count, invoices_total
     from invoices;
     
     set risk_factor = invoices_total / invoices_count * 5;
     
     select risk_factor;
END$$

DELIMITER ;

