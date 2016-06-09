ALTER TABLE `csc_public_api`.`coin_info` 
ADD COLUMN `price_cad` DECIMAL(20,8) NULL DEFAULT NULL AFTER `price_rub`,
ADD COLUMN `price_gbp` DECIMAL(20,8) NULL DEFAULT NULL AFTER `price_cad`,
ADD COLUMN `price_aud` DECIMAL(20,8) NULL DEFAULT NULL AFTER `price_gbp`,
ADD COLUMN `price_nzd` DECIMAL(20,8) NULL DEFAULT NULL AFTER `price_aud`;
