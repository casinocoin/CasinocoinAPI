CREATE DATABASE csc_private_api;
CREATE USER 'csc_private'@'%' IDENTIFIED BY 'password';
GRANT ALL ON csc_private_api.* to 'csc_private'@'%';