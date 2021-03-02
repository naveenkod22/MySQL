-- 8.7 Parameter validation

USE `sql_invoicing`;
DROP procedure IF EXISTS `make_payment`;

USE `sql_invoicing`;
DROP procedure IF EXISTS `sql_invoicing`.`make_payment`;
;

DELIMITER $$
USE `sql_invoicing`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_payment`(
	invoice_id int,
    payment_amount decimal(9,2),
    payment_date date
)
BEGIN
	if payment_amount <= 0 then
		signal sqlstate '22003' 
			set message_text = 'invalid payment amount';
    end if;
	update invoices i
    set
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	where i.invoice_id = invoice_id;
end$$

DELIMITER ;



call sql_invoicing.make_payment(2, 100, '2021-01-01');
call sql_invoicing.make_payment(2, -100, '2021-01-01');
