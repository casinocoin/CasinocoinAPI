USE csc_coinswap_api;

CREATE TABLE csc_coinswap_api.coin_swap
(
  id int(255) NOT NULL AUTO_INCREMENT,
  swap_uuid varchar(36) NOT NULL DEFAULT '',
  swap_src_coin varchar(10) NOT NULL,
  src_deposit_address varchar(255) NOT NULL,
  src_return_address varchar(255) NOT NULL,
  src_sat bigint NOT NULL,
  src_amount decimal(20,8) NOT NULL DEFAULT 0,
  swap_dst_coin varchar(10) NOT NULL,
  dst_address varchar(255) NOT NULL,
  dst_sat bigint NOT NULL,
  dst_amount decimal(20,8) NOT NULL DEFAULT 0,
  aggreed_terms_time timestamp NULL,
  aggreed_terms_ip varchar(255) NULL,
  swap_started_time timestamp NULL,
  swap_finished_time timestamp NULL,
  swap_canceled_time timestamp NULL,
  swap_refunded_time timestamp NULL,
  refund_tx_id varchar(256) NULL,
  src_tx_id varchar(256) NULL,
  confirmations int(255) NULL,
  actual_deposit_sat bigint NULL,
  actual_swapped_sat bigint NULL,
  dst_tx_id varchar(256) NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  valid_from timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  valid_to timestamp NOT NULL,
  CONSTRAINT CSP_PK PRIMARY KEY (id),
  UNIQUE INDEX CSP_UK_1 (swap_uuid ASC),
  UNIQUE INDEX CSP_UK_2 (src_deposit_address ASC)
)
COMMENT = 'Coin Swap table';

DELIMITER |
CREATE TRIGGER csc_coinswap_api.before_insert_coin_swap
  BEFORE INSERT ON csc_coinswap_api.coin_swap 
  FOR EACH ROW
    BEGIN
	  SET new.swap_uuid = UUID();
      SET new.valid_to = CURRENT_TIMESTAMP() + INTERVAL 15 MINUTE;
    END |
	
CREATE TRIGGER csc_coinswap_api.before_update_coin_swap
  BEFORE UPDATE ON csc_coinswap_api.coin_swap 
  FOR EACH ROW
    BEGIN
	  SET new.update_time = CURRENT_TIMESTAMP();
    END |
DELIMITER ;

CREATE TABLE csc_coinswap_api.transactions
(
  id int(255) NOT NULL AUTO_INCREMENT,
  csp_id int(255) NOT NULL DEFAULT 0,
  tx_id varchar(256) NOT NULL,
  tx_coin varchar(10) NOT NULL,
  tx_type varchar(10) NOT NULL,
  tx_sat bigint NOT NULL,
  tx_time timestamp NOT NULL,
  coin_address varchar(255) NOT NULL,
  blockhash char(65) NOT NULL,
  blockheight bigint NOT NULL,
  confirmations int(255) NOT NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT TTS_PK PRIMARY KEY (id)
)
COMMENT = 'Transaction table';

CREATE TABLE csc_coinswap_api.deposits
(
  id int(255) NOT NULL AUTO_INCREMENT,
  coin_address varchar(255) NOT NULL,
  tts_id int(255) NOT NULL,
  wallet_tx_id varchar(256) NOT NULL,
  wallet_tx_coin varchar(10) NOT NULL,
  wallet_tx_sat bigint NOT NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT DSS_PK PRIMARY KEY (id)
)
COMMENT = 'Deposits table';

CREATE TABLE csc_coinswap_api.settings
(
  id int(255) NOT NULL AUTO_INCREMENT,
  setting_name varchar(255) NOT NULL,
  description varchar(2000) NOT NULL,
  setting_value text NOT NULL,
  creation_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT STG_PK PRIMARY KEY (id)
)
COMMENT = 'Settings table';