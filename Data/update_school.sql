-- MySQL Workbench Synchronization
-- Generated: 2021-03-08 19:17
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: navee

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `school`.`enrolments` 
DROP FOREIGN KEY `fk_enrolments_course`;

ALTER TABLE `school`.`course` 
DROP FOREIGN KEY `fk_course_instructor1`;

ALTER TABLE `school`.`course_tags` 
DROP FOREIGN KEY `fk_course_tags_course1`,
DROP FOREIGN KEY `fk_course_tags_tags1`;

ALTER TABLE `school`.`enrolments` 
ADD COLUMN `cupons` VARCHAR(50) NULL DEFAULT NULL AFTER `enrolment_id`;

ALTER TABLE `school`.`enrolments` 
DROP FOREIGN KEY `fk_enrolments_students`;

ALTER TABLE `school`.`enrolments` ADD CONSTRAINT `fk_enrolments_students`
  FOREIGN KEY (`student_id`)
  REFERENCES `school`.`students` (`student_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_enrolments_course`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`course` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`course` 
ADD CONSTRAINT `fk_course_instructor1`
  FOREIGN KEY (`instructor_id`)
  REFERENCES `school`.`instructor` (`instructor_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`course_tags` 
ADD CONSTRAINT `fk_course_tags_course1`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`course` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_course_tags_tags1`
  FOREIGN KEY (`tag_id`)
  REFERENCES `school`.`tags` (`tag_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
