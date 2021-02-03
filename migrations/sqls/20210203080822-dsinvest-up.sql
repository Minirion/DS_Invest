/* Replace with your SQL commands */

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dsinvest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dsinvest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dsinvest` ;
USE `dsinvest` ;

-- -----------------------------------------------------
-- Table `dsinvest`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsinvest`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsinvest`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsinvest`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_comment_idx` (`comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_comment`
    FOREIGN KEY (`comment_id`)
    REFERENCES `dsinvest`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsinvest`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsinvest`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `name_event` VARCHAR(45) NULL,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dsinvest`.`event_has_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dsinvest`.`event_has_user` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `user_id`),
  INDEX `fk_event_has_user_event1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_has_user_event1`
    FOREIGN KEY (`user_id`)
    REFERENCES `dsinvest`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_user_user1`
    FOREIGN KEY (`event_id`)
    REFERENCES `dsinvest`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;