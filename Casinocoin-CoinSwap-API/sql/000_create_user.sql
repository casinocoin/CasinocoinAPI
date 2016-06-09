CREATE DATABASE csc_coinswap_api;
CREATE USER 'csc_coinswap'@'%' IDENTIFIED BY 'password';
GRANT ALL ON csc_coinswap_api.* to 'csc_coinswap'@'%';