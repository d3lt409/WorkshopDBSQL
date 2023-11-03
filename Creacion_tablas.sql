-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Workshop6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Workshop6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Workshop6` DEFAULT CHARACTER SET utf8 ;
USE `Workshop6` ;

-- -----------------------------------------------------
-- Table `Workshop6`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `NombreUsuario` VARCHAR(100) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Publicacion` (
  `idPublicacion` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(500) NOT NULL,
  `FechaPublicacion` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPublicacion`, `idUsuario`),
  INDEX `fk_Publicacion_Usuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Publicacion_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `Comentario` VARCHAR(500) NOT NULL,
  `FechaPublicacion` DATETIME NOT NULL,
  `idPublicacion` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idComentario`, `idPublicacion`, `idUsuario`),
  INDEX `fk_Comentario_Publicacion1_idx` (`idPublicacion` ASC) VISIBLE,
  INDEX `fk_Comentario_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Publicacion1`
    FOREIGN KEY (`idPublicacion`)
    REFERENCES `Workshop6`.`Publicacion` (`idPublicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Amistad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Amistad` (
  `idAmistad` INT NOT NULL AUTO_INCREMENT,
  `Estado` ENUM('aceptada', 'pendiente', 'rechazada') NOT NULL,
  `FechaSolicitud` DATETIME NOT NULL,
  `FechaAmistad` DATETIME NULL,
  `idUsuario` INT NOT NULL,
  `idUsuario_solicitud` INT NOT NULL,
  PRIMARY KEY (`idAmistad`, `idUsuario`, `idUsuario_solicitud`),
  INDEX `fk_Amistad_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Amistad_Usuario2_idx` (`idUsuario_solicitud` ASC) VISIBLE,
  CONSTRAINT `fk_Amistad_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Amistad_Usuario2`
    FOREIGN KEY (`idUsuario_solicitud`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Workshop6`.`Mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Workshop6`.`Mensaje` (
  `idMensaje` INT NOT NULL AUTO_INCREMENT,
  `Texto` VARCHAR(100) NOT NULL,
  `FechaEnviado` DATETIME NOT NULL,
  `idAmistad` INT NOT NULL,
  `idUsuario_envio` INT NOT NULL,
  `idUsuario_recibio` INT NOT NULL,
  PRIMARY KEY (`idMensaje`, `idAmistad`),
  INDEX `fk_Mensaje_Amistad1_idx` (`idAmistad` ASC) VISIBLE,
  INDEX `fk_Mensaje_Usuario1_idx` (`idUsuario_envio` ASC) VISIBLE,
  INDEX `fk_Mensaje_Usuario2_idx` (`idUsuario_recibio` ASC) VISIBLE,
  CONSTRAINT `fk_Mensaje_Amistad1`
    FOREIGN KEY (`idAmistad`)
    REFERENCES `Workshop6`.`Amistad` (`idAmistad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Usuario1`
    FOREIGN KEY (`idUsuario_envio`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mensaje_Usuario2`
    FOREIGN KEY (`idUsuario_recibio`)
    REFERENCES `Workshop6`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
