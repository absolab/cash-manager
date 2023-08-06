-- USE mysql;
-- CREATE USER 'server'@'%' IDENTIFIED BY 'qwerty123';
-- GRANT ALL PRIVILEGES ON cash.* TO 'server'@'%';

DROP DATABASE IF EXISTS cash;

CREATE DATABASE cash
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE cash;

CREATE TABLE `TB_USER` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `id`        VARCHAR(255)    UNIQUE KEY,
    `pw`        VARCHAR(255)    NOT NULL
);

CREATE TABLE `TB_FINANCE` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`uid`) REFERENCES `TB_USER` (`seq`) 
);

CREATE TABLE `TB_FINANCE_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL,
    `mount`     INT             NOT NULL DEFAULT 0,
    FOREIGN KEY (`parent`) REFERENCES `TB_FINANCE` (`seq`)
);

CREATE TABLE `TB_SPND` (
    `seq`       INT              AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT              NOT NULL,
    `name`      VARCHAR(255)     NOT NULL DEFAULT '',
    `date`      DATE             NOT NULL DEFAULT (current_date),
    `mount`     INT              NOT NULL DEFAULT 0,
    FOREIGN KEY (`uid`) REFERENCES `TB_USER` (`seq`)
);

CREATE TABLE `TB_FIXD_SPND` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`uid`) REFERENCES `TB_USER` (`seq`)
);

CREATE TABLE `TB_FIXD_SPND_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL DEFAULT (current_date),
    `mount`     INT             NOT NULL DEFAULT 0,
    FOREIGN KEY (`parent`) REFERENCES `TB_FIXD_SPND` (`seq`)
);

CREATE TABLE `TB_INCM` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    `date`      DATE            NOT NULL DEFAULT (current_date),
    `mount`     INT             NOT NULL DEFAULT 0,
    FOREIGN KEY (`uid`) REFERENCES `TB_USER` (`seq`)
);

CREATE TABLE `TB_FIXD_INCM` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `uid`       INT             NOT NULL,
    `name`      VARCHAR(255)    NOT NULL DEFAULT '',
    FOREIGN KEY (`uid`) REFERENCES `TB_USER` (`seq`)
);

CREATE TABLE `TB_FIXD_INCM_DETAIL` (
    `seq`       INT             AUTO_INCREMENT PRIMARY KEY,
    `parent`    INT             NOT NULL,
    `date`      DATE            NOT NULL DEFAULT (current_date),
    `mount`     INT             NOT NULL DEFAULT 0,
    FOREIGN KEY (`parent`) REFERENCES `TB_FIXD_INCM` (`seq`)
);

INSERT INTO `TB_USER`(`id`, `pw`)
VALUES ('admin', SHA2('admin', 512));