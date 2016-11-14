USE DATABASE csc_public_api;

CREATE TABLE csc_public_api.exchange_history
(
  id int(255) NOT NULL AUTO_INCREMENT,
  short_name varchar(20) NOT NULL,
  bid_price_btc DECIMAL(20,8) NULL,
  ask_price_btc DECIMAL(20,8) NULL,
  price_btc DECIMAL(20,8) NULL,
  volume24h DECIMAL(20,8) NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ECS_PK PRIMARY KEY (id)
)
COMMENT = 'Casinocoin Exchange History table';

ALTER TABLE `csc_public_api`.`exchange_history` 
ADD INDEX `NAME_IDX` (`short_name` ASC);