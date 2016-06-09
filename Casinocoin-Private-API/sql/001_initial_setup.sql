USE csc_private_api;

CREATE TABLE csc_private_api.coin_swap
(
  id int(255) NOT NULL AUTO_INCREMENT,
  swap_uuid varchar(36) NOT NULL,
  swap_src_coin varchar(10) NOT NULL,
  src_deposit_address varchar(255) NOT NULL,
  src_return_address varchar(255) NOT NULL,
  src_sat bigint NOT NULL,
  swap_dst_coin varchar(10) NOT NULL,
  dst_address varchar(255) NOT NULL,
  dst_sat bigint NOT NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  execution_time timestamp NULL,
  valid_from timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  valid_to timestamp NOT NULL,
  CONSTRAINT NWS_PK PRIMARY KEY (id)
)
COMMENT = 'Coin Swap table';

DELIMITER |
CREATE TRIGGER before_insert_coin_swap
  BEFORE INSERT ON csc_private_api.coin_swap 
  FOR EACH ROW
    BEGIN
	  SET new.swap_uuid = UUID();
      SET new.valid_to = CURRENT_TIMESTAMP() + INTERVAL 10 MINUTE;
    END |
DELIMITER ;

CREATE TABLE csc_private_api.transactions
(
  id int(255) NOT NULL AUTO_INCREMENT,
  csp_id int(255) NOT NULL,
  tx_id varchar(256) NOT NULL,
  tx_coin varchar(10) NOT NULL,
  tx_type varchar(10) NOT NULL,
  tx_sat bigint NOT NULL,
  tx_time timestamp NOT NULL,
  blockheight int(20) NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT NWS_PK PRIMARY KEY (id)
)
COMMENT = 'Transaction table';