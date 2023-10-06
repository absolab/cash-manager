-- USE mysql;
-- CREATE USER 'server'@'%' IDENTIFIED BY 'qwerty123';
-- GRANT ALL PRIVILEGES ON cash.* TO 'server'@'%';

DROP DATABASE IF EXISTS cash;

CREATE DATABASE cash
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE cash;

CREATE TABLE `USER` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `id`        VARCHAR(255)    UNIQUE KEY,
    `pw`        VARCHAR(255)    NOT NULL
);

CREATE TABLE `FINANCE_GROUP` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`uid`) REFERENCES `USER` (`seq`) 
);

CREATE TABLE `FINANCE_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL,
    `mount`     INT             NOT NULL DEFAULT 0,
    FOREIGN KEY (`parent`) REFERENCES `FINANCE_GROUP` (`seq`)
);

CREATE TABLE `INCOME_GROUP` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    `category`  VARCHAR(255)    NOT NULL,
    FOREIGN KEY (`uid`) REFERENCES `USER` (`seq`),
    FOREIGN KEY (`category`) REFERENCES `CODE_DETAIL` (`code`)
);

CREATE TABLE `INCOME_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL DEFAULT (current_date),
    `mount`     INT             NOT NULL DEFAULT 0,
    `comment`   VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`parent`) REFERENCES `INCOME_GROUP` (`seq`)
);

CREATE TABLE `EXPENSE_GROUP` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    `category`  VARCHAR(255)    NOT NULL,
    FOREIGN KEY (`uid`) REFERENCES `USER` (`seq`),
    FOREIGN KEY (`category`) REFERENCES `CODE_DETAIL` (`code`)
);

CREATE TABLE `EXPENSE_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL DEFAULT (current_date),
    `mount`     INT             NOT NULL DEFAULT 0,
    `comment`   VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`parent`) REFERENCES `EXPENSE_GROUP` (`seq`)
);

CREATE TABLE `CODE_GROUP` (
    `seq`   INT             AUTO_INCREMENT PRIMARY KEY,
    `code`  VARCHAR(255)    NOT NULL UNIQUE KEY,
    `name`  VARCHAR(255)    NOT NULL DEFAULT ''
);

CREATE TABLE `CODE_DETAIL` (
    `seq`   INT             AUTO_INCREMENT PRIMARY KEY,
    `group` VARCHAR(255)    NOT NULL,
    `code`  VARCHAR(255)    NOT NULL UNIQUE KEY,
    `name`  VARCHAR(255)    NOT NULL,
    FOREIGN KEY (`group`) REFERENCES `CODE_GROUP` (`code`)
);

INSERT INTO `TB_USER`(`id`, `pw`)
VALUES ('admin', SHA2('admin', 512));