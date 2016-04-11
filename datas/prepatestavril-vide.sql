-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema prepatestavril
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prepatestavril
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prepatestavril` DEFAULT CHARACTER SET utf8 ;
USE `prepatestavril` ;

-- -----------------------------------------------------
-- Table `prepatestavril`.`perm`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prepatestavril`.`perm` ;

CREATE TABLE IF NOT EXISTS `prepatestavril`.`perm` (
  `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lintitule` VARCHAR(60) NULL,
  `ecriture` TINYINT(1) NULL DEFAULT 0,
  `modif` TINYINT(1) NULL DEFAULT 0,
  `modif_tous` TINYINT(1) NULL DEFAULT 0,
  `sup` TINYINT(1) NULL DEFAULT 0,
  `sup_tous` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `lintitule_UNIQUE` ON `prepatestavril`.`perm` (`lintitule` ASC);


-- -----------------------------------------------------
-- Table `prepatestavril`.`util`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prepatestavril`.`util` ;

CREATE TABLE IF NOT EXISTS `prepatestavril`.`util` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lelogin` VARCHAR(80) NULL,
  `lepass` VARCHAR(45) NULL,
  `perm_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_util_perm`
    FOREIGN KEY (`perm_id`)
    REFERENCES `prepatestavril`.`perm` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `lelogin_UNIQUE` ON `prepatestavril`.`util` (`lelogin` ASC);

CREATE INDEX `fk_util_perm_idx` ON `prepatestavril`.`util` (`perm_id` ASC);


-- -----------------------------------------------------
-- Table `prepatestavril`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prepatestavril`.`article` ;

CREATE TABLE IF NOT EXISTS `prepatestavril`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `letitre` VARCHAR(160) NULL,
  `lemessage` TEXT NULL,
  `ladate` TIMESTAMP NULL DEFAULT NOW(),
  `util_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_util1`
    FOREIGN KEY (`util_id`)
    REFERENCES `prepatestavril`.`util` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_util1_idx` ON `prepatestavril`.`article` (`util_id` ASC);


-- -----------------------------------------------------
-- Table `prepatestavril`.`rubrique`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prepatestavril`.`rubrique` ;

CREATE TABLE IF NOT EXISTS `prepatestavril`.`rubrique` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lintitule` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `lintitule_UNIQUE` ON `prepatestavril`.`rubrique` (`lintitule` ASC);


-- -----------------------------------------------------
-- Table `prepatestavril`.`article_has_rubrique`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `prepatestavril`.`article_has_rubrique` ;

CREATE TABLE IF NOT EXISTS `prepatestavril`.`article_has_rubrique` (
  `article_id` INT UNSIGNED NOT NULL,
  `rubrique_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`article_id`, `rubrique_id`),
  CONSTRAINT `fk_article_has_rubrique_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `prepatestavril`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_rubrique_rubrique1`
    FOREIGN KEY (`rubrique_id`)
    REFERENCES `prepatestavril`.`rubrique` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_has_rubrique_rubrique1_idx` ON `prepatestavril`.`article_has_rubrique` (`rubrique_id` ASC);

CREATE INDEX `fk_article_has_rubrique_article1_idx` ON `prepatestavril`.`article_has_rubrique` (`article_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `prepatestavril`.`perm`
-- -----------------------------------------------------
START TRANSACTION;
USE `prepatestavril`;
INSERT INTO `prepatestavril`.`perm` (`id`, `lintitule`, `ecriture`, `modif`, `modif_tous`, `sup`, `sup_tous`) VALUES (DEFAULT, 'Administrateur', 1, 1, 1, 1, 1);
INSERT INTO `prepatestavril`.`perm` (`id`, `lintitule`, `ecriture`, `modif`, `modif_tous`, `sup`, `sup_tous`) VALUES (DEFAULT, 'Modérateur', 1, 1, 1, 1, 0);
INSERT INTO `prepatestavril`.`perm` (`id`, `lintitule`, `ecriture`, `modif`, `modif_tous`, `sup`, `sup_tous`) VALUES (DEFAULT, 'Correcteur', 0, 0, 1, 0, 0);
INSERT INTO `prepatestavril`.`perm` (`id`, `lintitule`, `ecriture`, `modif`, `modif_tous`, `sup`, `sup_tous`) VALUES (DEFAULT, 'Contributeur', 1, 1, 0, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `prepatestavril`.`rubrique`
-- -----------------------------------------------------
START TRANSACTION;
USE `prepatestavril`;
INSERT INTO `prepatestavril`.`rubrique` (`id`, `lintitule`) VALUES (DEFAULT, 'Une');
INSERT INTO `prepatestavril`.`rubrique` (`id`, `lintitule`) VALUES (DEFAULT, 'Deux');
INSERT INTO `prepatestavril`.`rubrique` (`id`, `lintitule`) VALUES (DEFAULT, 'Trois');

COMMIT;

