-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_regestred` DATETIME NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`instructor` (
  `instructor_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `prices` DECIMAL(5,2) NOT NULL,
  `instructor_id` TINYINT NOT NULL,
  PRIMARY KEY (`course_id`, `instructor_id`),
  INDEX `fk_course_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `school`.`instructor` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`enrolments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`enrolments` (
  `student_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `enrolment_id` DECIMAL(5,2) NOT NULL,
  INDEX `fk_enrolments_course1_idx` (`course_id` ASC) VISIBLE,
  PRIMARY KEY (`student_id`, `course_id`),
  CONSTRAINT `fk_enrolments_students`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrolments_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`tags` (
  `tag_id` TINYINT NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_tags` (
  `course_id` INT NOT NULL,
  `tag_id` TINYINT NOT NULL,
  PRIMARY KEY (`course_id`, `tag_id`),
  INDEX `fk_course_tags_tags1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_tags_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `school`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
