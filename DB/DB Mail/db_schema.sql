create database Audd;

use Audd;

CREATE TABLE `virtual_domains` (
        `id`  INT NOT NULL AUTO_INCREMENT,
        `name` VARCHAR(50) NOT NULL,
        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_users` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `domain_id` INT NOT NULL,
        `nom` VARCHAR(50) NOT NULL,
        `prenom` VARCHAR(120),
        `fonction` VARCHAR (100) NOT NULL DEFAULT 'Formation',
        `password` VARCHAR(106) NOT NULL,
        `email` VARCHAR(120) NOT NULL,
        PRIMARY KEY (`id`),
        UNIQUE KEY `email` (`email`),
        FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtual_aliases` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `domain_id` INT NOT NULL,
        `source` varchar(100) NOT NULL,
        `destination` varchar(100) NOT NULL,
        PRIMARY KEY (`id`),
        FOREIGN KEY (domain_id) REFERENCES virtual_domains(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

flush privileges;


INSERT INTO `Audd`.`virtual_domains`
(`id` ,`name`)
VALUES
('1', 'funndeh.com');


INSERT INTO `Audd`.`virtual_users`
(`id`, `domain_id`,`nom`, `prenom`, `fonction`, `password` , `email`)
VALUES
('1', '1', 'compta', NULL, 'Service Comptabilte', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'compta@funndeh.com'),
('2', '1', 'marketing', NULL, 'Service Marketing', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'marketing@funndeh.com'),
('3', '1', 'ventes', NULL, 'Service Ventes', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))),   'ventes@funndeh.com'),
('4', '1', 'admin', NULL, 'Service Informatique', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'admin@funndeh.com'),
('5', '1', 'formation', NULL, 'Formation', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'formation@funndeh.com'),
('6', '1', 'secretaire', NULL, 'Secretariat', ENCRYPT('password', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'secretaire@funndeh.com');

INSERT INTO `Audd`.`virtual_aliases`
(`id`, `domain_id`, `source`, `destination`)
VALUES
('1', '1', 'noreply@funndeh.com', 'secretaire@funndeh.com');


-- Comptes utilisateurs

/*create user 'admin'@'%' identified by 'password';
grant all privileges on *.* to 'admin'@'%';*/

GRANT ALL ON Audd.* TO 'admin'@'192.168.60.253' IDENTIFIED BY '123456789Ephec' WITH GRANT OPTION;
-- FLUSH

flush privileges;
