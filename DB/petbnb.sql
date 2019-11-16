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
  `active` TINYINT NULL DEFAULT 1,
  `image_url` TEXT NULL,
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

COMMIT;


-- -----------------------------------------------------
-- Data for table `host`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (1, 'Fenced yard', 3, 1);
INSERT INTO `host` (`id`, `description`, `user_id`, `active`) VALUES (2, 'Open fields', 4, 1);

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

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `active`, `image_url`) VALUES (1, 1, 'Judy', 1, 'Kitten', '', 'A great cat with no claws and no cares', 1, NULL);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `active`, `image_url`) VALUES (2, 2, 'Greg', 2, 'Hound', 'No stairs, No cats', 'A great dog that hates cats', 1, NULL);
INSERT INTO `pet` (`id`, `user_id`, `name`, `type_id`, `breed`, `special_needs`, `description`, `active`, `image_url`) VALUES (3, 2, 'Terry', 3, NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `reservation`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (1, '2019-11-10', '2019-11-11', 2, 1);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (2, '2019-11-12', '2019-11-13', 1, 2);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (3, '2019-11-14', '2019-11-15', 1, 3);
INSERT INTO `reservation` (`id`, `open_date`, `close_date`, `host_id`, `pet_id`) VALUES (4, '2019-11-16', '2019-11-17', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_of_host`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (1, 5, 'My little foo foo had so much fun', 1);
INSERT INTO `review_of_host` (`id`, `rating`, `review`, `reservation_id`) VALUES (2, 1, 'Their cat ate my bird and they refused to buy me a new bird.', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_of_pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (1, 5, 'Great Dog', 1);
INSERT INTO `review_of_pet` (`id`, `rating`, `review`, `reservation_id`) VALUES (2, 1, 'Bad Dog', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `service`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `service` (`id`, `name`, `rate`) VALUES (1, 'Grooming', 12);
INSERT INTO `service` (`id`, `name`, `rate`) VALUES (2, 'Custom Meal Making', 6);
INSERT INTO `service` (`id`, `name`, `rate`) VALUES (3, 'Walking', 5);
INSERT INTO `service` (`id`, `name`, `rate`) VALUES (4, 'Petting', 1.99);
INSERT INTO `service` (`id`, `name`, `rate`) VALUES (5, 'Overnight Stays', 29.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `host_service`
-- -----------------------------------------------------
START TRANSACTION;
USE `PetBnB`;
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (1, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (2, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (3, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (4, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (4, 2);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (5, 1);
INSERT INTO `host_service` (`service_id`, `host_id`) VALUES (5, 2);

COMMIT;

