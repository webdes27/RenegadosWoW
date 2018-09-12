/*
SQL FSocietyWoW				  
Desarrollado por:
Fecha: 8/5/118
### Scripts Privados / Derechos Reservados FSocietyWoW Dev Team ########
### Datos SQL --------------------------------------------->*/
SET @CREATURE  	:= 'Officer Jaxon';
SET @ENTRY 		:= '14423';
/*SET @MAP   		:= 530;       *//*(Outland)*/
/*SET @ZONE  		:= 6455;      *//*(Sunstrider Isle)*/
/*SET @AREA  		:= 3431;      *//*(Sunstrider Isle)*/
/*--------------------------------------------------------->*/


/* Step 1.1 Table  `creature_template` */
DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `HealthScalingExpansion`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `HealthModifierExtra`, `ManaModifier`, `ManaModifierExtra`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(@ENTRY,  '0',  '0',  '0',  '0',  '0',  '14472',  '0',  '0',  '0',   @CREATURE,  '',  '',  '',  '',  '0',  '0',  '0',  '-1',  '0',  '0',  '11',  '0',  '1',  '1.14286',  '1',  '1',  '0',  '2000',  '2000',  '1',  '1',  '1',  '32768',  '2048',  '0',  '0',  '0',  '0',  '0',  '0',  '7',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  '0',  'SmartAI',  '0',  '3',  '1',  '4',  '1',  '1',  '1',  '1',  '4.6',  '1',  '0',  '0',  '1',  '0',  '0',  '',  '25549');

/* Step 1.3 Table  creature_template_addon */
DELETE FROM creature_template_addon WHERE  `entry` = @ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`auras`) VALUES 
(@ENTRY, '0', '0', '0', '257', '0', '0', '0', '0', '18950'); 


/* Step 1.6 Table  `creature_text */
DELETE FROM  `creature_text` WHERE `CreatureID`= @ENTRY;
/* Step 1.6 Table  `smart_scripts` */
DELETE FROM smart_scripts WHERE `entryorguid` = 14423 AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('14423', '0', '0', '0', '25', '0', '100', '1', '0', '0', '0', '0', '', '11', '41634', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', 'Officer Jaxon - On Respawn - Cast \'Invisibility and Stealth Detection\''); 


/* Step 1.7 Table  `creature */
DELETE FROM creature WHERE  `id` = @ENTRY;
INSERT INTO `creature` ( `guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`,`VerifiedBuild`) VALUES 
(984455, @ENTRY, '0', '1519', '5148', '1', '0', '0', '0', '-1', '0', '1', '-8857.74', '642.102', '96.3633', '0.888517', '120', '0', '0', '1', '0', '2', '0', '0', '0', '0', '0', '', '0'); 

/* Step 2.8 Table  `creature_addon` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '-8857.74' AND `position_y` REGEXP '642.102' AND `position_z` REGEXP '96.3633' AND `PhaseId` = '0' AND `map` = '0');
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`aiAnimKit`,`movementAnimKit`,`meleeAnimKit`,`auras`) VALUES 
(@GUID, @GUID, '0', '0', '257', '0', '0', '0', '0', ''); 

/* Step 3.4 Table  `waypoint_data` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '-8857.74' AND `position_y` REGEXP '642.102' AND `position_z` REGEXP '96.3633' AND `PhaseId` = '0' AND `map` = '0');
DELETE FROM  `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES 
(@GUID, '1', '-8857.74', '642.102', '96.3633', '0', '0', '0', '0', '100', '0'), 
(@GUID, '2', '-8850.46', '643.066', '96.5945', '0', '0', '0', '0', '100', '0'), 
(@GUID, '3', '-8845.32', '637.816', '95.7954', '0', '0', '0', '0', '100', '0'), 
(@GUID, '4', '-8840.18', '625.976', '94.155', '0', '0', '0', '0', '100', '0'), 
(@GUID, '5', '-8839.32', '619.351', '93.204', '0', '0', '0', '0', '100', '0'), 
(@GUID, '6', '-8842.4', '614.681', '92.9753', '0', '0', '0', '0', '100', '0'), 
(@GUID, '7', '-8857.47', '605.059', '92.7253', '0', '0', '0', '0', '100', '0'), 
(@GUID, '8', '-8872.44', '596.267', '93.0625', '0', '0', '0', '0', '100', '0'), 
(@GUID, '9', '-8885.76', '587.531', '93.6288', '0', '0', '0', '0', '100', '0'), 
(@GUID, '10', '-8889.2', '579.241', '93.2959', '0', '0', '0', '0', '100', '0'), 
(@GUID, '11', '-8884.41', '571.583', '93.1875', '0', '0', '0', '0', '100', '0'), 
(@GUID, '12', '-8875.75', '572.806', '93.6106', '0', '0', '0', '0', '100', '0'), 
(@GUID, '13', '-8863.61', '584.851', '93.4166', '0', '0', '0', '0', '100', '0'), 
(@GUID, '14', '-8851.72', '597.983', '92.857', '0', '0', '0', '0', '100', '0'), 
(@GUID, '15', '-8838.03', '612.28', '93.4743', '0', '0', '0', '0', '100', '0'), 
(@GUID, '16', '-8833.01', '617.422', '93.8045', '0', '0', '0', '0', '100', '0'), 
(@GUID, '17', '-8828.31', '619.413', '94.3685', '0', '0', '0', '0', '100', '0'), 
(@GUID, '18', '-8823.67', '616.932', '94.8589', '0', '0', '0', '0', '100', '0'), 
(@GUID, '19', '-8810.59', '605.248', '96.3282', '0', '0', '0', '0', '100', '0'), 
(@GUID, '20', '-8808.12', '599.115', '96.8957', '0', '0', '0', '0', '100', '0'), 
(@GUID, '21', '-8811.34', '588.977', '96.8049', '0', '0', '0', '0', '100', '0'), 
(@GUID, '22', '-8817.06', '578.738', '95.2164', '0', '0', '0', '0', '100', '0'), 
(@GUID, '23', '-8827.94', '562.146', '94.9027', '0', '0', '0', '0', '100', '0'), 
(@GUID, '24', '-8836.99', '545.214', '96.9167', '0', '0', '0', '0', '100', '0'), 
(@GUID, '25', '-8842.81', '536.384', '102.547', '0', '0', '0', '0', '100', '0'), 
(@GUID, '26', '-8847.85', '530.868', '105.974', '0', '0', '0', '0', '100', '0'), 
(@GUID, '27', '-8850.82', '532.003', '105.946', '0', '0', '0', '0', '100', '0'), 
(@GUID, '28', '-8852.95', '536.531', '105.935', '0', '0', '0', '0', '100', '0'), 
(@GUID, '29', '-8858.02', '538.415', '106.318', '0', '0', '0', '0', '100', '0'), 
(@GUID, '30', '-8866.39', '535.99', '106.492', '0', '0', '0', '0', '100', '0'), 
(@GUID, '31', '-8868.88', '529.99', '106.87', '0', '0', '0', '0', '100', '0'), 
(@GUID, '32', '-8858.85', '513.043', '109.168', '0', '0', '0', '0', '100', '0'), 
(@GUID, '33', '-8853.74', '506.424', '109.606', '0', '0', '0', '0', '100', '0'), 
(@GUID, '34', '-8845.31', '494.193', '109.606', '0', '0', '0', '0', '100', '0'), 
(@GUID, '35', '-8840.22', '484.472', '109.603', '0', '0', '0', '0', '100', '0'), 
(@GUID, '36', '-8837.66', '480.599', '109.607', '0', '0', '0', '0', '100', '0'), 
(@GUID, '37', '-8834.77', '479.448', '109.614', '0', '0', '0', '0', '100', '0'), 
(@GUID, '38', '-8836.95', '487.299', '109.61', '0', '0', '0', '0', '100', '0'), 
(@GUID, '39', '-8844.02', '495.927', '109.61', '0', '0', '0', '0', '100', '0'), 
(@GUID, '40', '-8852.18', '507.552', '109.61', '0', '0', '0', '0', '100', '0'), 
(@GUID, '41', '-8863.7', '524.826', '107.495', '0', '0', '0', '0', '100', '0'), 
(@GUID, '42', '-8866.53', '530.658', '106.843', '0', '0', '0', '0', '100', '0'), 
(@GUID, '43', '-8864.9', '534.064', '106.565', '0', '0', '0', '0', '100', '0'), 
(@GUID, '44', '-8858.02', '537.08', '106.358', '0', '0', '0', '0', '100', '0'), 
(@GUID, '45', '-8853.71', '535.738', '105.929', '0', '0', '0', '0', '100', '0'), 
(@GUID, '46', '-8851.66', '530.99', '105.946', '0', '0', '0', '0', '100', '0'), 
(@GUID, '47', '-8849.01', '529.589', '105.964', '0', '0', '0', '0', '100', '0'), 
(@GUID, '48', '-8845.79', '529.882', '105.979', '0', '0', '0', '0', '100', '0'), 
(@GUID, '49', '-8840.07', '536.111', '101.601', '0', '0', '0', '0', '100', '0'), 
(@GUID, '50', '-8835.37', '542.875', '97.0724', '0', '0', '0', '0', '100', '0'), 
(@GUID, '51', '-8829.26', '547.92', '96.3733', '0', '0', '0', '0', '100', '0'), 
(@GUID, '52', '-8821.48', '557.46', '95.0026', '0', '0', '0', '0', '100', '0'), 
(@GUID, '53', '-8815.7', '563.615', '94.3624', '0', '0', '0', '0', '100', '0'), 
(@GUID, '54', '-8811.12', '572.536', '94.9569', '0', '0', '0', '0', '100', '0'), 
(@GUID, '55', '-8803.3', '582.158', '96.9082', '0', '0', '0', '0', '100', '0'), 
(@GUID, '56', '-8793.97', '588.352', '97.6842', '0', '0', '0', '0', '100', '0'), 
(@GUID, '57', '-8784.64', '595.061', '97.6842', '0', '0', '0', '0', '100', '0'), 
(@GUID, '58', '-8777.35', '601.026', '97.4001', '0', '0', '0', '0', '100', '0'), 
(@GUID, '59', '-8772.46', '605.719', '97.2751', '0', '0', '0', '0', '100', '0'), 
(@GUID, '60', '-8769.39', '606.299', '97.1501', '0', '0', '0', '0', '100', '0'), 
(@GUID, '61', '-8752.92', '589.005', '97.5213', '0', '0', '0', '0', '100', '0'), 
(@GUID, '62', '-8742.93', '578.293', '97.6463', '0', '0', '0', '0', '100', '0'), 
(@GUID, '63', '-8738.69', '574.87', '97.6463', '0', '0', '0', '0', '100', '0'), 
(@GUID, '64', '-8733.19', '575.979', '97.4886', '0', '0', '0', '0', '100', '0'), 
(@GUID, '65', '-8724.83', '580.993', '97.9623', '0', '0', '0', '0', '100', '0'), 
(@GUID, '66', '-8716.41', '589.102', '98.3885', '0', '0', '0', '0', '100', '0'), 
(@GUID, '67', '-8710.38', '593.505', '98.7635', '0', '0', '0', '0', '100', '0'), 
(@GUID, '68', '-8704.85', '601.403', '99.1305', '0', '0', '0', '0', '100', '0'), 
(@GUID, '69', '-8699.9', '614.069', '99.8086', '0', '0', '0', '0', '100', '0'), 
(@GUID, '70', '-8698.96', '624.563', '100.092', '0', '0', '0', '0', '100', '0'), 
(@GUID, '71', '-8700.71', '639.292', '100.138', '0', '0', '0', '0', '100', '0'), 
(@GUID, '72', '-8699.64', '630.247', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '73', '-8700.71', '639.292', '100.138', '0', '0', '0', '0', '100', '0'), 
(@GUID, '74', '-8705.8', '653.686', '100.005', '0', '0', '0', '0', '100', '0'), 
(@GUID, '75', '-8711.88', '667.766', '99.2362', '0', '0', '0', '0', '100', '0'), 
(@GUID, '76', '-8720.92', '680.866', '99.1632', '0', '0', '0', '0', '100', '0'), 
(@GUID, '77', '-8726.96', '691.559', '98.9088', '0', '0', '0', '0', '100', '0'), 
(@GUID, '78', '-8734.89', '701.233', '98.9288', '0', '0', '0', '0', '100', '0'), 
(@GUID, '79', '-8740.42', '706.792', '98.6359', '0', '0', '0', '0', '100', '0'), 
(@GUID, '80', '-8742.2', '709.689', '98.6633', '0', '0', '0', '0', '100', '0'), 
(@GUID, '81', '-8741.33', '712.342', '98.4647', '0', '0', '0', '0', '100', '0'), 
(@GUID, '82', '-8730.27', '720.285', '101.736', '0', '0', '0', '0', '100', '0'), 
(@GUID, '83', '-8717.45', '730.873', '98.1975', '0', '0', '0', '0', '100', '0'), 
(@GUID, '84', '-8713.91', '731.267', '98.0036', '0', '0', '0', '0', '100', '0'), 
(@GUID, '85', '-8705.63', '722.241', '97.2075', '0', '0', '0', '0', '100', '0'), 
(@GUID, '86', '-8700.26', '716.984', '97.0513', '0', '0', '0', '0', '100', '0'), 
(@GUID, '87', '-8695.75', '716.097', '97.0825', '0', '0', '0', '0', '100', '0'), 
(@GUID, '88', '-8691.37', '718.396', '97.0825', '0', '0', '0', '0', '100', '0'), 
(@GUID, '89', '-8679.17', '727.839', '97.0825', '0', '0', '0', '0', '100', '0'), 
(@GUID, '90', '-8662.59', '742.356', '96.9712', '0', '0', '0', '0', '100', '0'), 
(@GUID, '91', '-8662.14', '749.418', '96.9905', '0', '0', '0', '0', '100', '0'), 
(@GUID, '92', '-8665.03', '755.208', '96.9712', '0', '0', '0', '0', '100', '0'), 
(@GUID, '93', '-8664.47', '764.215', '96.9712', '0', '0', '0', '0', '100', '0'), 
(@GUID, '94', '-8658.04', '772.052', '96.8033', '0', '0', '0', '0', '100', '0'), 
(@GUID, '95', '-8647.35', '780.346', '96.9283', '0', '0', '0', '0', '100', '0'), 
(@GUID, '96', '-8638.88', '784.104', '97.2', '0', '0', '0', '0', '100', '0'), 
(@GUID, '97', '-8631.61', '784.267', '97.0142', '0', '0', '0', '0', '100', '0'), 
(@GUID, '98', '-8623.73', '774.911', '97.0493', '0', '0', '0', '0', '100', '0'), 
(@GUID, '99', '-8608.34', '764.438', '96.9691', '0', '0', '0', '0', '100', '0'), 
(@GUID, '100', '-8594.14', '757.089', '97.0298', '0', '0', '0', '0', '100', '0'), 
(@GUID, '101', '-8586.76', '747.63', '97.0298', '0', '0', '0', '0', '100', '0'), 
(@GUID, '102', '-8581.17', '740.319', '96.9048', '0', '0', '0', '0', '100', '0'), 
(@GUID, '103', '-8581.21', '735.167', '96.9048', '0', '0', '0', '0', '100', '0'), 
(@GUID, '104', '-8590.6', '725.693', '96.9024', '0', '0', '0', '0', '100', '0'), 
(@GUID, '105', '-8602.58', '716.686', '96.929', '0', '0', '0', '0', '100', '0'), 
(@GUID, '106', '-8611.27', '710.189', '96.804', '0', '0', '0', '0', '100', '0'), 
(@GUID, '107', '-8616.58', '711.592', '96.804', '0', '0', '0', '0', '100', '0'), 
(@GUID, '108', '-8623.62', '719.964', '96.804', '0', '0', '0', '0', '100', '0'), 
(@GUID, '109', '-8630.83', '728.186', '96.929', '0', '0', '0', '0', '100', '0'), 
(@GUID, '110', '-8637.43', '736.036', '96.9712', '0', '0', '0', '0', '100', '0'), 
(@GUID, '111', '-8647.25', '743.396', '96.8462', '0', '0', '0', '0', '100', '0'), 
(@GUID, '112', '-8656.38', '746.253', '96.8462', '0', '0', '0', '0', '100', '0'), 
(@GUID, '113', '-8664.9', '744.734', '96.9712', '0', '0', '0', '0', '100', '0'), 
(@GUID, '114', '-8676.78', '735.203', '97.1023', '0', '0', '0', '0', '100', '0'), 
(@GUID, '115', '-8696.46', '718.752', '97.1453', '0', '0', '0', '0', '100', '0'), 
(@GUID, '116', '-8699.75', '718.58', '97.0825', '0', '0', '0', '0', '100', '0'), 
(@GUID, '117', '-8706.77', '725.339', '97.4575', '0', '0', '0', '0', '100', '0'), 
(@GUID, '118', '-8714.8', '734.858', '97.8885', '0', '0', '0', '0', '100', '0'), 
(@GUID, '119', '-8719.96', '734.077', '98.1846', '0', '0', '0', '0', '100', '0'), 
(@GUID, '120', '-8733.23', '723.507', '101.586', '0', '0', '0', '0', '100', '0'), 
(@GUID, '121', '-8742.77', '715.142', '98.5283', '0', '0', '0', '0', '100', '0'), 
(@GUID, '122', '-8744.09', '708.717', '98.6385', '0', '0', '0', '0', '100', '0'), 
(@GUID, '123', '-8739.32', '702.594', '98.8897', '0', '0', '0', '0', '100', '0'), 
(@GUID, '124', '-8741', '698.439', '99.1405', '0', '0', '0', '0', '100', '0'), 
(@GUID, '125', '-8752.09', '690.316', '100.365', '0', '0', '0', '0', '100', '0'), 
(@GUID, '126', '-8764.67', '680.457', '102.173', '0', '0', '0', '0', '100', '0'), 
(@GUID, '127', '-8774.49', '671.972', '103.371', '0', '0', '0', '0', '100', '0'), 
(@GUID, '128', '-8777.84', '672.604', '103.316', '0', '0', '0', '0', '100', '0'), 
(@GUID, '129', '-8783.61', '679.543', '102.886', '0', '0', '0', '0', '100', '0'), 
(@GUID, '130', '-8792.09', '684.712', '101.984', '0', '0', '0', '0', '100', '0'), 
(@GUID, '131', '-8807.31', '685.378', '100.629', '0', '0', '0', '0', '100', '0'), 
(@GUID, '132', '-8800.77', '685.094', '101.446', '0', '0', '0', '0', '100', '0'), 
(@GUID, '133', '-8807.31', '685.378', '100.629', '0', '0', '0', '0', '100', '0'), 
(@GUID, '134', '-8819.33', '681.41', '97.9456', '0', '0', '0', '0', '100', '0'), 
(@GUID, '135', '-8831.76', '676.392', '98.3469', '0', '0', '0', '0', '100', '0'), 
(@GUID, '136', '-8844.51', '667.564', '97.8927', '0', '0', '0', '0', '100', '0'), 
(@GUID, '137', '-8852.06', '660.326', '97.0347', '0', '0', '0', '0', '100', '0'), 
(@GUID, '138', '-8851.87', '652.611', '96.6826', '0', '0', '0', '0', '100', '0'), 
(@GUID, '139', '-8845.6', '648.816', '96.7195', '0', '0', '0', '0', '100', '0'), 
(@GUID, '140', '-8839.1', '650.533', '98.0263', '0', '0', '0', '0', '100', '0'), 
(@GUID, '141', '-8832.81', '653.003', '98.0263', '0', '0', '0', '0', '100', '0'), 
(@GUID, '142', '-8827.6', '656.851', '98.022', '0', '0', '0', '0', '100', '0'), 
(@GUID, '143', '-8826.19', '661.481', '98.019', '0', '0', '0', '0', '100', '0'), 
(@GUID, '144', '-8821.85', '663.884', '98.0175', '0', '0', '0', '0', '100', '0'), 
(@GUID, '145', '-8816.84', '659.65', '98.0143', '0', '0', '0', '0', '100', '0'), 
(@GUID, '146', '-8816.73', '652.264', '98.0236', '0', '0', '0', '0', '100', '0'), 
(@GUID, '147', '-8820.92', '650.835', '98.025', '0', '0', '0', '0', '100', '0'), 
(@GUID, '148', '-8826.27', '653.736', '98.025', '0', '0', '0', '0', '100', '0'), 
(@GUID, '149', '-8832.38', '652.297', '98.0246', '0', '0', '0', '0', '100', '0'), 
(@GUID, '150', '-8838.72', '649.597', '98.0268', '0', '0', '0', '0', '100', '0'), 
(@GUID, '151', '-8845.31', '648.438', '96.7195', '0', '0', '0', '0', '100', '0'), 
(@GUID, '152', '-8851.65', '652.625', '96.709', '0', '0', '0', '0', '100', '0'), 
(@GUID, '153', '-8856.26', '655.328', '96.5464', '0', '0', '0', '0', '100', '0'), 
(@GUID, '154', '-8862.27', '654.976', '96.2542', '0', '0', '0', '0', '100', '0'), 
(@GUID, '155', '-8876.29', '645.333', '96.0456', '0', '0', '0', '0', '100', '0'), 
(@GUID, '156', '-8884.94', '640.417', '99.5224', '0', '0', '0', '0', '100', '0'), 
(@GUID, '157', '-8890.46', '637.335', '99.5227', '0', '0', '0', '0', '100', '0'), 
(@GUID, '158', '-8902.03', '632.385', '99.5519', '0', '0', '0', '0', '100', '0'), 
(@GUID, '159', '-8909.55', '627.785', '99.5394', '0', '0', '0', '0', '100', '0'), 
(@GUID, '160', '-8914.16', '625.096', '99.5231', '0', '0', '0', '0', '100', '0'), 
(@GUID, '161', '-8917.11', '623.535', '100.332', '0', '0', '0', '0', '100', '0'), 
(@GUID, '162', '-8924.71', '620.003', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '163', '-8927.15', '621.536', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '164', '-8931.01', '628.069', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '165', '-8933.66', '627.786', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '166', '-8929.13', '616.642', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '167', '-8922.17', '608.233', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '168', '-8919.88', '609.726', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '169', '-8924.02', '617.778', '100.226', '0', '0', '0', '0', '100', '0'), 
(@GUID, '170', '-8916.64', '623.002', '100.335', '0', '0', '0', '0', '100', '0'), 
(@GUID, '171', '-8914.31', '624.147', '99.7826', '0', '0', '0', '0', '100', '0'), 
(@GUID, '172', '-8908.82', '627.194', '99.5356', '0', '0', '0', '0', '100', '0'), 
(@GUID, '173', '-8900.6', '630.205', '99.5267', '0', '0', '0', '0', '100', '0'), 
(@GUID, '174', '-8890.5', '636.693', '99.5228', '0', '0', '0', '0', '100', '0'), 
(@GUID, '175', '-8884.19', '639.575', '99.5224', '0', '0', '0', '0', '100', '0'), 
(@GUID, '176', '-8876.33', '643.938', '96.0525', '0', '0', '0', '0', '100', '0'), 
(@GUID, '177', '-8866.18', '641.372', '96.2195', '0', '0', '0', '0', '100', '0'); 




/* Step 3.1 Table  `creature_formations` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '-8857.74' AND `position_y` REGEXP '642.102' AND `position_z` REGEXP '96.3633' AND `PhaseId` = '0' AND `map` = '0');
DELETE FROM  `creature_formations` WHERE `leaderGUID` = @GUID;


/* Step 2.1 Table  `creature_onkill_reputation */
DELETE FROM creature_onkill_reputation WHERE `creature_id` = @ENTRY;
/* Step 2.4 Table  `pickpocketing_loot_template */
DELETE FROM pickpocketing_loot_template WHERE  `entry` = @ENTRY;
/* Step 2.4 Table  `skinning_loot_template */
DELETE FROM skinning_loot_template WHERE  `entry` = @ENTRY;
/*
/*
*/
/*Skinning Loot Template Items Data: Id - Quality - SellPrice - ItemLevel - RequiredLevel - Name */
/*


/* Step 3.3 Table  `creature_summon_groups` */
DELETE FROM  `creature_summon_groups` WHERE `summonerId` = @ENTRY AND `summonerType` = 0;
/* Step 1.2 Table `creature_equip_template */
DELETE FROM `creature_equip_template` WHERE `CreatureID`= 14423;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES 
('14423', '1', '2178', '0', '5284', '0', '0', '62285', '0', '0', '18019');

DELETE FROM npc_trainer WHERE `ID` = @ENTRY;
DELETE FROM npc_vendor WHERE  `entry` = @ENTRY;
/* Step 2.2 Table  `creature_queststarter */
DELETE FROM  `creature_queststarter` WHERE `id`= @ENTRY;
/* Step 2.2 Table  `creature_questender */
DELETE FROM  `creature_questender` WHERE `id`= @ENTRY;
/* Step 1.8 Table  `waypoints */
DELETE FROM waypoints WHERE  `entry` = @ENTRY;
/* Step 2.5 Table  `npc_spellclick_spells */
DELETE FROM npc_spellclick_spells WHERE  `npc_entry` = @ENTRY;
/* Step 1.7 Table  `creature_default_trainer */
DELETE FROM creature_default_trainer WHERE  `CreatureId` = @ENTRY;
