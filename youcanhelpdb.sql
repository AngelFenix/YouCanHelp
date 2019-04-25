-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema heroestemp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema heroestemp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heroestemp` DEFAULT CHARACTER SET utf8 ;
USE `heroestemp` ;

-- -----------------------------------------------------
-- Table `heroestemp`.`Voluntario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Voluntario` (
  `idVoluntario` INT NOT NULL,
  `Nombre` VARCHAR(150) NULL,
  `Usuario` VARCHAR(50) NULL,
  `FbId` INT(10) NULL,
  `Puntos` INT(3) NULL,
  PRIMARY KEY (`idVoluntario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Asociacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Asociacion` (
  `idAsociacion` INT NOT NULL,
  `Nombre` VARCHAR(100) NULL,
  `Descripcion` VARCHAR(300) NULL,
  `Categoria_idCategoria` INT NOT NULL,
  PRIMARY KEY (`idAsociacion`),
  INDEX `fk_Asociacion_Categoria1_idx` (`Categoria_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Asociacion_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria`)
    REFERENCES `heroestemp`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Sponsors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Sponsors` (
  `idSponsors` INT NOT NULL,
  `Nombre` VARCHAR(300) NULL,
  PRIMARY KEY (`idSponsors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Convocatorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Convocatorias` (
  `idConvocatorias` INT NOT NULL,
  `idAsociacion` INT NOT NULL,
  `idSponsors` INT NOT NULL,
  `idCategoria` INT NOT NULL,
  `Titulo` VARCHAR(100) NULL,
  `Descripcion` TEXT NULL,
  `Latitud` DECIMAL(11,8) NULL,
  `Longitud` DECIMAL(11,8) NULL,
  `PuntosReward` INT(3) NULL,
  PRIMARY KEY (`idConvocatorias`),
  INDEX `fk_Convocatorias_Asociacion_idx` (`idAsociacion` ASC) VISIBLE,
  INDEX `fk_Convocatorias_Sponsors1_idx` (`idSponsors` ASC) VISIBLE,
  INDEX `fk_Convocatorias_Categoria1_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Convocatorias_Asociacion`
    FOREIGN KEY (`idAsociacion`)
    REFERENCES `heroestemp`.`Asociacion` (`idAsociacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convocatorias_Sponsors1`
    FOREIGN KEY (`idSponsors`)
    REFERENCES `heroestemp`.`Sponsors` (`idSponsors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convocatorias_Categoria1`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `heroestemp`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Convocatorias_has_Voluntario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Convocatorias_has_Voluntario` (
  `idConvocatorias` INT NOT NULL,
  `idVoluntario` INT NOT NULL,
  PRIMARY KEY (`idConvocatorias`, `idVoluntario`),
  INDEX `fk_Convocatorias_has_Voluntario_Voluntario1_idx` (`idVoluntario` ASC) VISIBLE,
  INDEX `fk_Convocatorias_has_Voluntario_Convocatorias1_idx` (`idConvocatorias` ASC) VISIBLE,
  CONSTRAINT `fk_Convocatorias_has_Voluntario_Convocatorias1`
    FOREIGN KEY (`idConvocatorias`)
    REFERENCES `heroestemp`.`Convocatorias` (`idConvocatorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convocatorias_has_Voluntario_Voluntario1`
    FOREIGN KEY (`idVoluntario`)
    REFERENCES `heroestemp`.`Voluntario` (`idVoluntario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Link` (
  `idLink` INT NOT NULL,
  `Direccion` TEXT NULL,
  `isImage` TINYINT NULL,
  PRIMARY KEY (`idLink`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `heroestemp`.`Convocatorias_has_Link`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `heroestemp`.`Convocatorias_has_Link` (
  `Convocatorias_idConvocatorias` INT NOT NULL,
  `Link_idLink` INT NOT NULL,
  `Asistio` TINYINT NULL,
  PRIMARY KEY (`Convocatorias_idConvocatorias`, `Link_idLink`),
  INDEX `fk_Convocatorias_has_Link_Link1_idx` (`Link_idLink` ASC) VISIBLE,
  INDEX `fk_Convocatorias_has_Link_Convocatorias1_idx` (`Convocatorias_idConvocatorias` ASC) VISIBLE,
  CONSTRAINT `fk_Convocatorias_has_Link_Convocatorias1`
    FOREIGN KEY (`Convocatorias_idConvocatorias`)
    REFERENCES `heroestemp`.`Convocatorias` (`idConvocatorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Convocatorias_has_Link_Link1`
    FOREIGN KEY (`Link_idLink`)
    REFERENCES `heroestemp`.`Link` (`idLink`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
