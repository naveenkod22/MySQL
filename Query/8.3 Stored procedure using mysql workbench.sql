-- 8.3 Stored procedure using mysql workbench

-- Default code

-- CREATE PROCEDURE `new_procedure` ()
-- BEGIN

-- END


-- Code We Write

-- CREATE PROCEDURE `get_payments` ()
-- BEGIN
--	 select * from payments;
-- END

-- Code My SQl generates
USE `sql_invoicing`;
DROP procedure IF EXISTS `get_payments`;

DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE `get_payments` ()
BEGIN
	select * from payments;
END$$

DELIMITER ;

