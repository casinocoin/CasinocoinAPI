ALTER TABLE `csc_public_api`.`coin_info` 
ADD COLUMN `price_btc_buy` DECIMAL(20,8) NULL DEFAULT NULL AFTER `block_tx_count`,
ADD COLUMN `price_btc_sell` DECIMAL(20,8) NULL DEFAULT NULL AFTER `price_btc_buy`;
