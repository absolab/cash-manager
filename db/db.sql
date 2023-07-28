CREATE DATABASE cash
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE mysql;

CREATE USER 'server'@'%' IDENTIFIED BY 'qwerty123';
GRANT ALL PRIVILEGES ON cash.* TO 'server'@'%';

USE cash;

CREATE TABLE `TB_USER` (
    `seq` INT AUTO_INCREMENT    PRIMARY KEY,
    `id`  VARCHAR(255)          NOT NULL,
    `pw`  VARCHAR(255)          NOT NULL
);

INSERT INTO `TB_USER`(`id`, `pw`)
VALUES ('admin', SHA2('admin', 512));