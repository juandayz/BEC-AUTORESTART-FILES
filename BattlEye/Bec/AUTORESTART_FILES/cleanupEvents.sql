-- Delete all vehicles not touched in 10 days.
-- ----------------------------
DELETE FROM `object_data`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY)
AND `Classname`
NOT REGEXP 'barrier|storage|shed|bench|wall|floor|fence|pump|wood|hrescue|stick|pole|generator|panel|house|rack|bag|stand|barrel|canvas|wire|hedgehog|net|trap|ramp|fort|sand|scaffold|nest|killhouse|villa|castle|pub|shelter|stodola|garage|MBG|warehouse|sara'

-- ----------------------------
-- Delete characters inactive for 15 days.
-- ----------------------------
DELETE FROM Character_DATA 
WHERE LastLogin < NOW() - INTERVAL 15 DAY


-- ----------------------------
-- Delete dead characters.
-- ----------------------------
DELETE from Character_data
USING Character_data, Character_data as tempchartable
WHERE (Character_data.PlayerUID = tempchartable.PlayerUID)
AND (NOT Character_data.alive = tempchartable.alive)
AND (Character_data.alive = 0)


-- ----------------------------
-- Delete empty storage objects.
-- ----------------------------
DELETE FROM `object_data`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 5 DAY)
AND ( (`Inventory` IS NULL) OR (`Inventory` = '[]') OR (`Inventory` = '[[[],[]],[[],[]],[[],[]]]') )
AND `Classname` IN ('Wooden_shed_DZ','WoodShack_DZ', 'TentStorage', 'TentStorageDomed', 'TentStorageDomed2', 'WoodCrate_DZ', 'GunRack_DZ', 'OutHouse_DZ', 'StorageShed_DZ')


-- ----------------------------
-- Delete objects that have 1 damage.
-- ----------------------------
DELETE FROM `object_data`
WHERE Damage = 1


-- ----------------------------
-- Delete player login data.
-- ----------------------------
DELETE FROM `player_login`


-- ----------------------------
-- Delete plot poles and doors not being deleted.
-- ----------------------------
DELETE FROM `object_data`
WHERE `LastUpdated` < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 10 DAY)
AND `Classname` IN ('Plastic_Pole_EP1_DZ','CinderWallDoorSmallLocked_DZ','CinderWallDoorLocked_DZ','CinderWallSmallDoorway_DZ','CinderWallDoorway_DZ','Land_DZE_WoodDoorLocked','CinderWallDoor_DZ','CinderWallDoorSmall_DZ','Land_DZE_WoodDoor','Land_DZE_GarageWoodDoor','Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_LargeWoodDoor','WoodLargeWallDoor_DZ')


-- ----------------------------
-- Fix inventory on maintainable objects.
-- ----------------------------

UPDATE `object_data`
SET `inventory` = '[]',`LastUpdated` = `LastUpdated`
WHERE `inventory` = '[[[],[]],[[],[]],[[],[]]]'
AND
`Classname` IN ('DSHKM_Gue','M2StaticMG','SearchLight_RUS','MAP_Shed_W01','MAP_Dkamna_bila','Land_Misc_Well_L_EP1','MAP_P_Stavebni_kozy','MAP_office_table_a','SmallTV','Loudspeaker','BagFenceRound_DZ','CinderWall_DZ','CinderWallDoorLocked_DZ','CinderWallDoorSmall_DZ','CinderWallDoorSmallLocked_DZ','CinderWallHalf_DZ','FireBarrel_DZ','GunRack_DZ','LightPole_DZ','MetalFloor_DZ','MetalPanel_DZ','OutHouse_DZ','TentStorage','TentStorageDomed','TentStorageDomed2','Sandbag1_DZ','Scaffolding_DZ','StickFence_DZ','StorageShed_DZ','WorkBench_DZ','WoodCrate_DZ','WoodFloor_DZ','WoodFloorQuarter_DZ','WoodLargeWall_DZ','WoodLargeWallWin_DZ','WoodShack_DZ','WoodSmallWall_DZ','WoodSmallWallThird_DZ','WoodSmallWallWin_DZ','Land_DZE_GarageWoodDoor','WoodFloorHalf_DZ','Fort_RazorWire','Land_DZE_LargeWoodDoorLocked','WoodStairsRails_DZ','WoodLadder_DZ','WoodStairsSans_DZ','M240Nest_DZ','Land_DZE_WoodDoor')


-- ----------------------------
-- Set 0.1 damage to objects daily.
-- ----------------------------

UPDATE `object_data`
SET `Damage` = IF( `Damage` = 0.0, 0.1, `Damage` + 0.1 )
WHERE `LastUpdated` <= DATE_SUB(NOW(), INTERVAL 1 DAY)
AND `ObjectUID` <> 0
AND `CharacterID` <> 0
AND ( (`Inventory` IS NULL) OR (`Inventory` = '[]') )



-- ----------------------------
-- Unlock vehicle's with no key.
-- ----------------------------
UPDATE `Object_DATA`
SET `Object_DATA`.`CharacterID` = 0,`LastUpdated` = `LastUpdated`
WHERE `Object_DATA`.`CharacterID` <> 0
AND`Object_DATA`.`CharacterID` <= 12500
AND`Object_DATA`.`Classname` NOT LIKE 'Tent%'
AND`Object_DATA`.`Classname` NOT LIKE '%Locked'
AND`Object_DATA`.`Classname` NOT LIKE 'Land%'
AND`Object_DATA`.`Classname` NOT LIKE 'Cinder%'
AND`Object_DATA`.`Classname` NOT LIKE 'Wood%'
AND`Object_DATA`.`Classname` NOT LIKE 'Metal%'
AND`Object_DATA`.`Classname` NOT LIKE '%Storage%'
AND`Object_DATA`.`Classname` NOT IN ('OutHouse_DZ', 'GunRack_DZ', 'WorkBench_DZ', 'Sandbag1_DZ', 'FireBarrel_DZ', 'DesertCamoNet_DZ', 'StickFence_DZ', 'LightPole_DZ', 'DeerStand_DZ', 'ForestLargeCamoNet_DZ', 'Plastic_Pole_EP1_DZ', 'Hedgehog_DZ', 'FuelPump_DZ', 'Fort_RazorWire', 'SandNest_DZ', 'ForestCamoNet_DZ', 'Fence_corrugated_DZ', 'CanvasHut_DZ', 'Generator_DZ')
AND FindVehicleKeysCount(Object_DATA.CharacterID) = 0



