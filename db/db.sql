-- USE mysql;
-- CREATE USER 'server'@'%' IDENTIFIED BY 'qwerty123';
-- GRANT ALL PRIVILEGES ON cash.* TO 'server'@'%';

DROP DATABASE IF EXISTS cash;

CREATE DATABASE cash
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE cash;

CREATE TABLE `TB_USER` (
    `seq` INT AUTO_INCREMENT    PRIMARY KEY,
    `id`  VARCHAR(255)          UNIQUE KEY,
    `pw`  VARCHAR(255)          NOT NULL
);

INSERT INTO `TB_USER`(`id`, `pw`)
VALUES ('admin', SHA2('admin', 512));