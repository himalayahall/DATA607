-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Project3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project3` DEFAULT CHARACTER SET utf8 ;
USE `Project3` ;

-- -----------------------------------------------------
-- Table `Project3`.`SOURCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project3`.`SOURCE` (
  `SOURCE_NAME` VARCHAR(45) NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `TS_UPDATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SOURCE_NAME`),
  UNIQUE INDEX `NAME_UNIQUE` (`SOURCE_NAME` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project3`.`SKILL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project3`.`SKILL` (
  `SKILL_KEYWORD` VARCHAR(45) NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `CATEGORY` ENUM('SOFTWARE', 'GENERAL') NOT NULL,
  `TS_UPDATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SKILL_KEYWORD`),
  UNIQUE INDEX `KEYWORD_UNIQUE` (`SKILL_KEYWORD` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project3`.`SKILL_IN_DEMAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project3`.`SKILL_IN_DEMAND` (
  `SOURCE_NAME` VARCHAR(45) NOT NULL,
  `SKILL_KEYWORD` VARCHAR(45) NOT NULL,
  `DT_SURVEY` DATE NOT NULL,
  `COUNT` INT NOT NULL DEFAULT 0,
  `TS_UPDATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `SKILL_idx` (`SKILL_KEYWORD` ASC) VISIBLE,
  INDEX `SOURCE_idx` (`SOURCE_NAME` ASC) VISIBLE,
  PRIMARY KEY (`SOURCE_NAME`, `SKILL_KEYWORD`, `DT_SURVEY`),
  CONSTRAINT `FK_SKILL_IN_DEMAND_SOURCE_NAME`
    FOREIGN KEY (`SOURCE_NAME`)
    REFERENCES `Project3`.`SOURCE` (`SOURCE_NAME`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SKILL_IN_DEMAND_SKILL_KEYWORD`
    FOREIGN KEY (`SKILL_KEYWORD`)
    REFERENCES `Project3`.`SKILL` (`SKILL_KEYWORD`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project3`.`EDUCATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project3`.`EDUCATION` (
  `EDUCATION_KEYWORD` VARCHAR(45) NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `TS_UPDATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EDUCATION_KEYWORD`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project3`.`EDUCATION_IN_DEMAND`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project3`.`EDUCATION_IN_DEMAND` (
  `SOURCE_NAME` VARCHAR(45) NOT NULL,
  `EDUCATION_KEYWORD` VARCHAR(45) NOT NULL,
  `DT_SURVEY` DATE NOT NULL,
  `TS_UPDATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TS_CREATED` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`SOURCE_NAME`, `EDUCATION_KEYWORD`, `DT_SURVEY`),
  INDEX `FK_EDUCATION_IN_DEMAND_EDUCATION_KEYRORD_idx` (`EDUCATION_KEYWORD` ASC) VISIBLE,
  CONSTRAINT `FK_EDUCATION_IN_DEMAND_SOURCE`
    FOREIGN KEY (`SOURCE_NAME`)
    REFERENCES `Project3`.`SOURCE` (`SOURCE_NAME`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EDUCATION_IN_DEMAND_EDUCATION_KEYWORD`
    FOREIGN KEY (`EDUCATION_KEYWORD`)
    REFERENCES `Project3`.`EDUCATION` (`EDUCATION_KEYWORD`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;