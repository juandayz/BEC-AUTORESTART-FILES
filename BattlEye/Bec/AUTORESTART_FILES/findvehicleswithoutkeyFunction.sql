-- ----------------------------
-- Function structure for FindVehicleKeysCount
-- ----------------------------
DROP FUNCTION IF EXISTS `FindVehicleKeysCount`;
DELIMITER ;;
CREATE FUNCTION `FindVehicleKeysCount`(`keyId` INT) RETURNS int(11)
BEGIN
    DECLARE totalKeys INT DEFAULT 0;
    DECLARE keyName VARCHAR(32) DEFAULT "";
    DECLARE keysInChar INT DEFAULT 0;
    DECLARE keysInObj INT DEFAULT 0;

    SET keyName = (CASE
        WHEN `keyId` < 2501 THEN CONCAT('ItemKeyGreen', `keyId`)
        WHEN `keyId` < 5001 THEN CONCAT('ItemKeyRed', `keyId` - 2500)
        WHEN `keyId` < 7501 THEN CONCAT('ItemKeyBlue', `keyId` - 5000)
        WHEN `keyId` < 10001 THEN CONCAT('ItemKeyYellow', `keyId` - 7500)
        WHEN `keyId` < 12501 THEN CONCAT('ItemKeyBlack', `keyId` - 10000)
        ELSE 'ERROR'
    END);

    SET keysInChar = (SELECT COUNT(*) FROM `Character_DATA` WHERE `Alive` = '1' AND (`Inventory` LIKE CONCAT('%', keyName, '%') OR `Backpack` LIKE CONCAT('%', keyName, '%')));
    SET keysInObj = (SELECT COUNT(*) FROM `Object_DATA` WHERE `Inventory` LIKE CONCAT('%', keyName, '%'));

    RETURN (keysInChar + keysInObj);
END