-- -----------------------------------------------------
-- function getNubanForID
-- -----------------------------------------------------

USE `ebank`;
DROP function IF EXISTS `ebank`.`getNubanForID`;

DELIMITER $$
USE `ebank`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getNubanForID`(ownerID INT(9), bankCode INT(3)) RETURNS int(13)
BEGIN

    DECLARE result INT(13);
    DECLARE checkDigit INT(1);

    DECLARE A INT(1);
    DECLARE B INT(1);
    DECLARE C INT(1);

    DECLARE D INT(1);
    DECLARE E INT(1);
    DECLARE F INT(1);
    DECLARE G INT(1);
    DECLARE H INT(1);
    DECLARE I INT(1);
    DECLARE J INT(1);
    DECLARE K INT(1);
    DECLARE L INT(1);
    
    DECLARE strResult CHAR(13);

    SET L = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET K = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET J = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET I = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET H = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET G = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET F = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET E = ownerID % 10;
    SET ownerID = ownerID / 10;
    SET D = ownerID % 10;



    SET C = bankCode % 10;
    SET bankCode = bankCode DIV 10;
    SET B = bankCode % 10;
    SET bankCode = bankCode DIV 10;
    SET A = bankCode % 10;
    
    SET checkDigit = (A*3 + B*7 + C*3 + D*3 + E*7 + F*3 + G*3 + H*7 + I*3 + J*3 + K*7 + L*3)%10;
    
    SET strResult = CONCAT(CHAR(bankCode),CHAR(ownerID),CHAR(checkDigit));
    SET result = CAST(strResult AS UNSIGNED);
        
    RETURN result;
END$$

DELIMITER ;