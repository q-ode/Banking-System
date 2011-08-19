SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `ebank` ;
CREATE SCHEMA IF NOT EXISTS `ebank` DEFAULT CHARACTER SET utf8 ;
USE `eBank` ;

-- -----------------------------------------------------
-- Table `eBank`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`customer` ;

CREATE TABLE IF NOT EXISTS`ebank`.`customer`(
    `customerID` INT(9) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `userLogin` CHAR(45) NOT NULL,
    `firstName` CHAR(45) NOT NULL,
    `middleName` CHAR(45) NULL DEFAULT NULL,
    `LastName` CHAR(45) NOT NULL,
    `dateOfBirth` DATE NOT NULL,
    `cityOfBirth` CHAR(45) NOT NULL,
    `nationality` CHAR(45) NOT NULL,
    `residentialAddress` CHAR(45) NOT NULL,
    `email` CHAR(45) NULL DEFAULT NULL,
    `password` BLOB NOT NULL,
    `customerSince` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`AccountType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`accounttype` ;

CREATE TABLE IF NOT EXISTS`ebank`.`accounttype`(
    `typeID` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `type` CHAR(15) NOT NULL,
    `interestRate` FLOAT NOT NULL,
    `monthlyCharges` FLOAT NOT NULL,
    `minimumBalance` DOUBLE NOT NULL,
    `overdraftAllowed` TINYINT(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`typeID`),
    UNIQUE INDEX `type_UNIQUE` (`type` ASC),
    INDEX `typeID` (`typeID` ASC)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`account` ;

CREATE TABLE IF NOT EXISTS`ebank`.`account`(
    `nuban` INT(13) UNSIGNED ZEROFILL NOT NULL,
    `ownerid` INT(9) UNSIGNED ZEROFILL NOT NULL,
    `type` CHAR(15) NOT NULL,
    `status` CHAR(10) NOT NULL,
    `balance` DOUBLE NOT NULL,
    `openedSince` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `closedOn` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`nuban`,`ownerid`),
    INDEX `fk_Account_AccountType` (`type` ASC),
    INDEX `fk_Account_Customer` (`ownerid` ASC),
    CONSTRAINT `fk_Account_AccountType` FOREIGN KEY (`type`)
        REFERENCES `ebank`.`accounttype` (`type`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_Account_Customer` FOREIGN KEY (`ownerid`)
        REFERENCES `ebank`.`customer` (`customerID`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`user` ;

CREATE TABLE IF NOT EXISTS`ebank`.`user`(
    `userID` INT(9) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `login` CHAR(45) NOT NULL,
    `firstName` CHAR(45) NOT NULL,
    `middleName` CHAR(45) NULL DEFAULT NULL,
    `lastName` CHAR(45) NOT NULL,
    `role` CHAR(15) NOT NULL,
    `userSince` DATE NOT NULL,
    `isActive` TINYINT(1) NOT NULL,
    `password` BLOB NOT NULL,
    PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`ActivityLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`activitylog` ;

CREATE TABLE IF NOT EXISTS`ebank`.`activitylog`(
    `logID` INT(10) UNSIGNED ZEROFILL NOT NULL,
    `timeStamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `userLogin` CHAR(45) NOT NULL,
    `activityDump` LONGTEXT NOT NULL,
    PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`role` ;

CREATE TABLE IF NOT EXISTS`ebank`.`role`(
    `roleID` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `eBank`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`transaction` ;

CREATE TABLE IF NOT EXISTS`ebank`.`transaction`(
    `transID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nuban` INT(13) UNSIGNED ZEROFILL NOT NULL,
    `amount` FLOAT NOT NULL,
    `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `remarks` VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (`transID`),
    INDEX `fk_Transaction_Account` (`nuban` ASC),
    CONSTRAINT `fk_Transaction_Account` FOREIGN KEY (`nuban`)
        REFERENCES `ebank`.`account` (`nuban`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


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
USE `ebank` ;

-- -----------------------------------------------------
-- Table `ebank`.`accounttype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`accounttype` ;

CREATE TABLE IF NOT EXISTS`ebank`.`accounttype`(
    `typeID` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `type` CHAR(15) NOT NULL,
    `interestRate` FLOAT NOT NULL,
    `monthlyCharges` FLOAT NOT NULL,
    `minimumBalance` DOUBLE NOT NULL,
    `overdraftAllowed` TINYINT(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`typeID`),
    UNIQUE INDEX `type_UNIQUE` (`type` ASC),
    INDEX `typeID` (`typeID` ASC)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`customer` ;

CREATE TABLE IF NOT EXISTS`ebank`.`customer`(
    `customerID` INT(9) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `userLogin` CHAR(45) NOT NULL,
    `firstName` CHAR(45) NOT NULL,
    `middleName` CHAR(45) NULL DEFAULT NULL,
    `LastName` CHAR(45) NOT NULL,
    `dateOfBirth` DATE NOT NULL,
    `cityOfBirth` CHAR(45) NOT NULL,
    `nationality` CHAR(45) NOT NULL,
    `residentialAddress` CHAR(45) NOT NULL,
    `email` CHAR(45) NULL DEFAULT NULL,
    `password` BLOB NOT NULL,
    `customerSince` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`account` ;

CREATE TABLE IF NOT EXISTS`ebank`.`account`(
    `nuban` INT(13) UNSIGNED ZEROFILL NOT NULL,
    `ownerid` INT(9) UNSIGNED ZEROFILL NOT NULL,
    `type` CHAR(15) NOT NULL,
    `status` CHAR(10) NOT NULL,
    `balance` DOUBLE NOT NULL,
    `openedSince` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `closedOn` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`nuban`,`ownerid`),
    INDEX `fk_Account_AccountType` (`type` ASC),
    INDEX `fk_Account_Customer` (`ownerid` ASC),
    CONSTRAINT `fk_Account_AccountType` FOREIGN KEY (`type`)
        REFERENCES `ebank`.`accounttype` (`type`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_Account_Customer` FOREIGN KEY (`ownerid`)
        REFERENCES `ebank`.`customer` (`customerID`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`activitylog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`activitylog` ;

CREATE TABLE IF NOT EXISTS`ebank`.`activitylog`(
    `logID` INT(10) UNSIGNED ZEROFILL NOT NULL,
    `timeStamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `userLogin` CHAR(45) NOT NULL,
    `activityDump` LONGTEXT NOT NULL,
    PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`role` ;

CREATE TABLE IF NOT EXISTS`ebank`.`role`(
    `roleID` INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `role` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`roleID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`transaction` ;

CREATE TABLE IF NOT EXISTS`ebank`.`transaction`(
    `transID` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `nuban` INT(13) UNSIGNED ZEROFILL NOT NULL,
    `amount` FLOAT NOT NULL,
    `time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `remarks` VARCHAR(50) NULL DEFAULT NULL,
    PRIMARY KEY (`transID`),
    INDEX `fk_Transaction_Account` (`nuban` ASC),
    CONSTRAINT `fk_Transaction_Account` FOREIGN KEY (`nuban`)
        REFERENCES `ebank`.`account` (`nuban`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`user` ;

CREATE TABLE IF NOT EXISTS`ebank`.`user`(
    `userID` INT(9) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    `login` CHAR(45) NOT NULL,
    `firstName` CHAR(45) NOT NULL,
    `middleName` CHAR(45) NULL DEFAULT NULL,
    `lastName` CHAR(45) NOT NULL,
    `role` CHAR(15) NOT NULL,
    `userSince` DATE NOT NULL,
    `isActive` TINYINT(1) NOT NULL,
    `password` BLOB NOT NULL,
    PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`user_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`user_has_role` ;

CREATE TABLE IF NOT EXISTS`ebank`.`user_has_role`(
    `user_userID` INT(9) UNSIGNED ZEROFILL NOT NULL,
    `role_roleID` INT(10) UNSIGNED ZEROFILL NOT NULL,
    PRIMARY KEY (`user_userID`,`role_roleID`),
    INDEX `fk_user_has_role_role1` (`role_roleID` ASC),
    INDEX `fk_user_has_role_user1` (`user_userID` ASC),
    CONSTRAINT `fk_user_has_role_user1` FOREIGN KEY (`user_userID`)
        REFERENCES `ebank`.`user` (`userID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_roleID`)
        REFERENCES `ebank`.`role` (`roleID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


-- -----------------------------------------------------
-- Table `ebank`.`activitylog_has_customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ebank`.`activitylog_has_customer` ;

CREATE TABLE IF NOT EXISTS`ebank`.`activitylog_has_customer`(
    `activitylog_logID` INT(10) UNSIGNED ZEROFILL NOT NULL,
    `customer_customerID` INT(9) UNSIGNED ZEROFILL NOT NULL,
    PRIMARY KEY (`activitylog_logID`,`customer_customerID`),
    INDEX `fk_activitylog_has_customer_customer1` (`customer_customerID` ASC),
    INDEX `fk_activitylog_has_customer_activitylog1` (`activitylog_logID` ASC),
    CONSTRAINT `fk_activitylog_has_customer_activitylog1` FOREIGN KEY (`activitylog_logID`)
        REFERENCES `ebank`.`activitylog` (`logID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_activitylog_has_customer_customer1` FOREIGN KEY (`customer_customerID`)
        REFERENCES `ebank`.`customer` (`customerID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8;


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
USE `eBank`;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createCustomer` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createCustomer`
BEFORE INSERT ON `ebank`.`customer`
FOR EACH ROW
SET NEW.customerSince = NOW(), 
NEW.password = AES_ENCRYPT('nairalandKennwort',NEW.Password)$$


DELIMITER ;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createAccount` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createAccount`
BEFORE INSERT ON `ebank`.`account`
FOR EACH ROW
SET NEW.nuban = getNubanForID(NEW.ownerid, 107), 
    NEW.openedSince = NOW()$$


DELIMITER ;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createUser` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createUser`
BEFORE INSERT ON `ebank`.`user`
FOR EACH ROW
SET NEW.UserSince = NOW(), 
NEW.password = AES_ENCRYPT('nairaland2', NEW.password)$$


DELIMITER ;
USE `ebank`;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createAccount` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createAccount`
BEFORE INSERT ON `ebank`.`account`
FOR EACH ROW
SET NEW.nuban = getNubanForID(NEW.ownerid, 107), 
    NEW.openedSince = NOW()$$


USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`updateAccount` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`updateAccount`
BEFORE UPDATE ON `ebank`.`account`
FOR EACH ROW
SET NEW.nuban = getNubanForID(NEW.ownerid, 107)$$


DELIMITER ;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createCustomer` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createCustomer`
BEFORE INSERT ON `ebank`.`customer`
FOR EACH ROW
SET NEW.customerSince = NOW(), 
NEW.password = AES_ENCRYPT('nairalandKennwort',NEW.Password)$$


DELIMITER ;

DELIMITER $$

USE `ebank`$$
DROP TRIGGER IF EXISTS `ebank`.`createUser` $$
USE `ebank`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `ebank`.`createUser`
BEFORE INSERT ON `ebank`.`user`
FOR EACH ROW
SET NEW.UserSince = NOW(), 
NEW.password = AES_ENCRYPT('nairaland2', NEW.password)$$


DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
