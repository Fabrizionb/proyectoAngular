-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Dbfinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Dbfinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Dbfinal` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Dbfinal` ;

-- -----------------------------------------------------
-- Table `Dbfinal`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`usuario` (
  `email` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`email`, `contraseña`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`login` (
  `id_usuario` INT NOT NULL,
  `usuario_email` VARCHAR(50) NOT NULL,
  `usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_usuario`, `usuario_email`, `usuario_contraseña`),
  INDEX `fk_login_usuario_idx` (`usuario_email` ASC, `usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_login_usuario`
    FOREIGN KEY (`usuario_email` , `usuario_contraseña`)
    REFERENCES `Dbfinal`.`usuario` (`email` , `contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`educacion` (
  `ideducacion` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(500) NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ideducacion`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_educacion_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`experiencia` (
  `idexperiencia` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(500) NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  `es_actual` TINYINT NULL,
  PRIMARY KEY (`idexperiencia`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_experiencia_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`aptitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`aptitudes` (
  `idaptitudes` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idaptitudes`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_aptitudes_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_aptitudes_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`proyecto` (
  `idproyecto` INT NOT NULL,
  `nombreproyecto` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  `url_imagen` VARCHAR(500) NOT NULL,
  `url_src` VARCHAR(500) NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idproyecto`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_proyecto_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`perfil` (
  `idperfil` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `ocupacion` VARCHAR(100) NULL,
  `ubicacion` VARCHAR(100) NULL,
  `url_perfil` VARCHAR(500) NOT NULL,
  `url_banner` VARCHAR(500) NOT NULL,
  `url_institucion` VARCHAR(500) NULL,
  `institucion` VARCHAR(100) NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idperfil`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_perfil_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_perfil_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Dbfinal`.`intruduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Dbfinal`.`intruduccion` (
  `idintruduccion` INT NOT NULL,
  `intruduccion` VARCHAR(1000) NULL,
  `login_id_usuario` INT NOT NULL,
  `login_usuario_email` VARCHAR(50) NOT NULL,
  `login_usuario_contraseña` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idintruduccion`, `login_id_usuario`, `login_usuario_email`, `login_usuario_contraseña`),
  INDEX `fk_intruduccion_login1_idx` (`login_id_usuario` ASC, `login_usuario_email` ASC, `login_usuario_contraseña` ASC) VISIBLE,
  CONSTRAINT `fk_intruduccion_login1`
    FOREIGN KEY (`login_id_usuario` , `login_usuario_email` , `login_usuario_contraseña`)
    REFERENCES `Dbfinal`.`login` (`id_usuario` , `usuario_email` , `usuario_contraseña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
