-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PetBnB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PetBnB` ;

-- -----------------------------------------------------
-- Schema PetBnB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PetBnB` DEFAULT CHARACTER SET utf8 ;
USE `PetBnB` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(10) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address_id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_client_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_client_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `host`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `host` ;

CREATE TABLE IF NOT EXISTS `host` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `user_id` INT NOT NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_host_client1_idx` (`user_id` ASC),
  CONSTRAINT `fk_host_client1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_type` ;

CREATE TABLE IF NOT EXISTS `pet_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `type_id` INT NOT NULL,
  `breed` VARCHAR(45) NULL,
  `special_needs` TEXT NULL,
  `description` TEXT NULL,
  `image_url` TEXT NULL,
  `active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_client1_idx` (`user_id` ASC),
  INDEX `fk_pet_pettype_idx` (`type_id` ASC),
  CONSTRAINT `fk_pet_client1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_pettype`
    FOREIGN KEY (`type_id`)
    REFERENCES `pet_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reservation` ;

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `open_date` DATE NULL,
  `close_date` DATE NULL,
  `host_id` INT NOT NULL,
  `pet_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reservation_host1_idx` (`host_id` ASC),
  INDEX `fk_reservation_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_reservation_host1`
    FOREIGN KEY (`host_id`)
    REFERENCES `host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_of_host`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_of_host` ;

CREATE TABLE IF NOT EXISTS `review_of_host` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `review` TEXT NULL,
  `reservation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_of_host_reservation1_idx` (`reservation_id` ASC),
  CONSTRAINT `fk_review_of_host_reservation1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `reservation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_of_pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_of_pet` ;

CREATE TABLE IF NOT EXISTS `review_of_pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NOT NULL,
  `review` TEXT NULL,
  `reservation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_of_client_reservation1_idx` (`reservation_id` ASC),
  CONSTRAINT `fk_review_of_client_reservation1`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `reservation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `service` ;

CREATE TABLE IF NOT EXISTS `service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `rate` DOUBLE NULL,
  `active` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `host_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `host_service` ;

CREATE TABLE IF NOT EXISTS `host_service` (
  `service_id` INT NOT NULL,
  `host_id` INT NOT NULL,
  INDEX `fk_host_service_service1_idx` (`service_id` ASC),
  INDEX `fk_host_service_host1_idx` (`host_id` ASC),
  PRIMARY KEY (`service_id`, `host_id`),
  CONSTRAINT `fk_host_service_service1`
    FOREIGN KEY (`service_id`)
    REFERENCES `service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_host_service_host1`
    FOREIGN KEY (`host_id`)
    REFERENCES `host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `host_pets_serviced`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `host_pets_serviced` ;

CREATE TABLE IF NOT EXISTS `host_pets_serviced` (
  `host_id` INT NOT NULL,
  `pet_type_id` INT NOT NULL,
  PRIMARY KEY (`host_id`, `pet_type_id`),
  INDEX `fk_host_pettype_idx` (`pet_type_id` ASC),
  CONSTRAINT `fk_pettype_host`
    FOREIGN KEY (`host_id`)
    REFERENCES `host` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_host_pettype`
    FOREIGN KEY (`pet_type_id`)
    REFERENCES `pet_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS petadmin@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'petadmin'@'localhost' IDENTIFIED BY 'petadmin';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'petadmin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (1, '2120 6th Ave', 'Denver', 'CO', '80211', '614-312-5678');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (2, '151 S Brooklyn St', 'Denver', 'CO', '80167', '671-214-8856');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (3, '786 Grover Ln', 'Denver', 'CO', '80345', '613-221-1376');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (4, '212 Broad St', 'Denver', 'CO', '80878', '214-142-1241');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (5, '421 Grover', 'Denver', 'CO', '80210', '111-123-1567');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (6, '137 Terrace', 'Denver', 'CO', '80145', '345-124-3245');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (7, '657 Pollock', 'Denver', 'CO', '81456', '231-452-1984');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (8, '785 Truce', 'Denver', 'CO', '82456', '124-645-9082');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (9, '789 Spruce', 'Denver', 'CO', '89755', '127-345-8716');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (10, '285 1st', 'Denver', 'CO', '87643', '173-901-8675');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (11, '703 2nd', 'Denver', 'CO', '86431', '134-645-2315');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (12, '623 3rd', 'Denver', 'CO', '34567', '903-245-5678');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (13, '812 4th', 'Boulder', 'CO', '54543', '214-890-3456');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (14, '901 Midway', 'Colorado Springs', 'CO', '23456', '628-746-8712');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (15, '486 Road', 'Colarado Springs', 'CO', '87665', '154-876-2367');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (16, '624 Center', 'Colorado Springs', 'CO', '56457', '908-765-1276');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (17, '872 Parker', 'Colorado Springs', 'CO', '23456', '121-436-3468');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (18, '552 Poplar', 'Boulder', 'CO', '21345', '176-904-2357');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (19, '662 Centennial', 'Boulder', 'CO', '67453', '345-567-1234');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (20, '337 Cherry', 'Boulder', 'CO', '78432', '123-567-8967');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`, `phone`) VALUES (21, '442 Maple', 'Boulder', 'CO', '34567', '125-679-3478');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (1, 'Jonny', 'Client', 1, 'jclient', 'jclient', 1, 'jclient@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (2, 'Freddy', 'Kitchens', 2, 'fkitchens', 'fkitchens', 1, 'fkitchens@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (3, 'Francis', 'Noname', 3, 'fnoname', 'fnoname', 1, 'fnoname@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (4, 'Brad', 'Forsberg', 4, 'bforsberg', 'bforsberg', 1, 'bforsberg@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (5, 'Nick', 'Fury', 5, 'nfury', 'nfury', 1, 'nfury@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (6, 'Sally', 'Field', 6, 'sfield', 'sfield', 1, 'sfield@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (7, 'Brea', 'Larson', 7, 'blarson', 'blarson', 1, 'blarson@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (8, 'Samantha', 'Honeycutt', 8, 'shoneycutt', 'shoneycutt', 1, 'shoneycutt@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (9, 'Scarlet', 'Baritz', 9, 'sbaritz', 'sbaritz', 1, 'sbaritz@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (10, 'Lindsey', 'Groma', 10, 'lgroma', 'lgroma', 1, 'lgorma@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (11, 'Tammy', 'Mason', 11, 'tmason', 'tmason', 1, 'tmason@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (12, 'Debbie', 'Parson', 12, 'dparson', 'dparson', 1, 'dparson@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (13, 'Sherry', 'Rambo', 13, 'srambo', 'srambo', 1, 'srambo@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (14, 'Nicole', 'Clark', 14, 'nclark', 'nclark', 1, 'nclark@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (15, 'Paige', 'Widower', 15, 'pwidower', 'pwidower', 1, 'pwidower@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (16, 'Jared', 'Fudd', 16, 'jfudd', 'jfudd', 1, 'jfudd2email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (17, 'Steve', 'Rubble', 17, 'srubble', 'srubble', 1, 'srubble@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (18, 'Amelia', 'Perry', 18, 'aperry', 'aperry', 1, 'aperry@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (19, 'Rhonda', 'Jagger', 19, 'rjagger', 'rjagger', 1, 'rjagger@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (20, 'Sharice', 'Thomas', 20, 'sthomas', 'sthomas', 1, 'sthomas@email.com');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `address_id`, `username`, `password`, `active`, `email`) VALUES (21, 'Carmen', 'Jones', 21, 'cjones', 'cjones', 1, 'cjones@email.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `host`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (1, 'Fenced yard', 3, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (2, 'Open fields', 5, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (3, 'A place for a pet', 7, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (4, 'Fenced', 9, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (5, 'Big Yard', 11, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (6, 'Dogs at the home', 13, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (7, 'awesome place', 15, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (8, 'a dogs oasis', 17, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (9, 'a romantic dogs getaway', 19, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (10, 'a bed n breakfast n grooming', 21, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `pet_type` (`id`, `type`) VALUES (1, 'Dog');
INSERT INTO `pet_type` (`id`, `type`) VALUES (2, 'Cat');
INSERT INTO `pet_type` (`id`, `type`) VALUES (3, 'Bird');
INSERT INTO `pet_type` (`id`, `type`) VALUES (4, 'Fish');
INSERT INTO `pet_type` (`id`, `type`) VALUES (5, 'Iguana');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (1, 1, 'Judy', 2, 'Kitten', '', 'A great cat with no claws and no cares', NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (2, 1, 'Greg', 1, 'Hound', 'No stairs, No cats', 'A great dog that hates cats', NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (3, 2, 'Terry', 3, 'Eagle', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (4, 4, 'Jack', 1, 'Beagle', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (5, 6, 'Groman', 2, 'Tiger', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (6, 8, 'Roman', 1, 'Terrier', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (7, 10, 'Conan', 3, 'Tucan', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (8, 12, 'Elmer', 2, 'Black', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (9, 14, 'Daisy', 1, 'Shepard', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (10, 16, 'Homer', 2, 'Calico', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (11, 18, 'Bart', 2, 'Sphynx', NULL, NULL, NULL, 1);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `image_url`, `active`) VALUES (12, 20, 'Marge', 4, 'Catfish', NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `reservation`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (1, '2019-11-10', '2019-11-11', 1, 12);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (2, '2019-11-12', '2019-11-13', 2, 11);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (3, '2019-11-14', '2019-11-15', 3, 10);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (4, '2019-11-16', '2019-11-17', 4, 9);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (5, '2019-09-09', '2019-09-11', 5, 8);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (6, '2019-08-07', '2019-08-08', 6, 7);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (7, '2019-08-12', '2019-08-13', 7, 6);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (8, '2019-07-24', '2019-07-25', 8, 5);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (9, '2019-06-29', '2019-06-30', 9, 4);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (10, '2019-06-21', '2019-06-22', 10, 3);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (11, '2019-05-15', '2019-05-18', 10, 2);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (12, '2019-04-14', '2019-04-15', 9, 1);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (13, '2019-03-25', '2019-03-26', 8, 1);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (14, '2019-03-27', '2019-03-29', 7, 2);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (15, '2019-02-13', '2019-02-14', 6, 2);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (16, '2019-02-15', '2019-02-16', 5, 3);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (17, '2019-01-20', '2019-01-21', 4, 3);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (18, '2019-06-15', '2019-06-16', 3, 4);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (19, '2019-05-15', '2019-05-17', 2, 4);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (20, '2019-08-15', '2019-08-16', 1, 5);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (21, '2019-07-10', '2019-07-11', 2, 5);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (22, '2019-06-09', '2019-06-11', 3, 6);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (23, '2019-05-03', '2019-05-04', 4, 6);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (24, '2019-02-04', '2019-02-05', 5, 7);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (25, '2019-01-04', '2019-01-05', 6, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_of_host`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (1, 5, 'My little foo foo had so much fun', 1);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (2, 1, 'Their cat ate my bird and they refused to buy me a new bird.', 2);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (3, 5, 'great hosts', 3);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (4, 4, 'good host', 4);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (5, 3, 'they were good', 5);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (6, 4, 'they did good', 6);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (7, 5, 'they are good hosts', 7);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (8, 4, 'my pet was very happy', 8);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (9, 3, 'treated my pet ok', 9);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (10, 4, 'treated my pet good', 10);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (11, 4, 'my pet says they had fun', 11);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (12, 4, 'my pet says they love it there', 12);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (13, 5, 'my pet didnt want to leave', 13);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (14, 5, 'my pet wont stop tallking about this host', 14);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (15, 5, 'the host made best friends with my pet', 15);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (16, 4, 'they had other pets to play with', 16);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (17, 3, 'i would recommend, cheap rates', 17);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (18, 4, 'would def recommend', 18);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (19, 4, 'would really recommend', 19);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (20, 3, 'they were ok', 20);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (21, 5, 'cant wait to reserve with this host again', 21);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (22, 5, 'will definitely be back to this host', 22);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (23, 4, 'very clean house and yard', 23);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (24, 3, 'house was a little dirty', 24);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (25, 4, 'house was clean and lots of room to play', 25);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_of_pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (1, 5, 'Great Dog', 1);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (2, 1, 'Bad Dog', 2);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (3, 4, 'Good', 3);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (4, 3, 'great', 4);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (5, 4, 'awesome', 5);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (6, 5, 'terrific', 6);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (7, 4, 'good', 7);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (8, 2, 'bad', 8);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (9, 3, 'ok', 9);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (10, 1, 'bad', 10);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (11, 5, 'great pet', 11);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (12, 3, 'pet was a pooper', 12);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (13, 2, 'poop was a petter', 13);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (14, 4, 'pet is great', 14);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (15, 4, 'what a great pet', 15);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (16, 5, 'awesome pet they have', 16);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (17, 5, 'terrific pet they have', 17);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (18, 4, 'really well behaved', 18);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (19, 5, 'big eater and great cuddler', 19);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (20, 3, 'kind of bad', 20);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (21, 2, 'pretty bad, lots of pooping', 21);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (22, 4, 'not much pooping, great overall', 22);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (23, 3, 'not a bad pet, moderate pooping', 23);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (24, 4, 'very little poop, great experience', 24);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (25, 5, 'no poop at all, what a wonderful pet', 25);

COMMIT;


-- -----------------------------------------------------
-- Data for table `service`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (1, 'Grooming', 12, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (2, 'Custom Meal Making', 6, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (3, 'Walking', 5, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (4, 'Petting', 1.99, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (5, 'Overnight Stays', 59.99, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (6, 'Nail Trim', 10, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (7, 'Day Sitting', 29.99, 0);
INSERT INTO `service` (`id`, `name`, `rate`, `active`) VALUES (8, 'Hourly', 10, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `host_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 5);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 7);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 3);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 4);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 6);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 8);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 9);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 10);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 7);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (4, 10);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (4, 9);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (4, 8);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (5, 10);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (5, 4);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (5, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (6, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (6, 5);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (6, 6);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (7, 7);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (7, 8);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (8, 9);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (8, 10);

COMMIT;

