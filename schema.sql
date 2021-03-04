-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clienti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clienti` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cognome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trattamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trattamento` (
  `idTrattamento` INT NOT NULL AUTO_INCREMENT,
  `durata` TIME NOT NULL,
  `prezzo` SMALLINT NOT NULL,
  `descrizione` VARCHAR(45) NULL,
  PRIMARY KEY (`idTrattamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clienti_has_trattamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clienti_has_trattamento` (
  `clienti_idCliente` INT NOT NULL,
  `trattamento_idTrattamento` INT NOT NULL,
  PRIMARY KEY (`clienti_idCliente`, `trattamento_idTrattamento`),
  INDEX `fk_clienti_has_trattamento_trattamento1_idx` (`trattamento_idTrattamento` ASC) VISIBLE,
  INDEX `fk_clienti_has_trattamento_clienti_idx` (`clienti_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_clienti_has_trattamento_clienti`
    FOREIGN KEY (`clienti_idCliente`)
    REFERENCES `mydb`.`clienti` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienti_has_trattamento_trattamento1`
    FOREIGN KEY (`trattamento_idTrattamento`)
    REFERENCES `mydb`.`trattamento` (`idTrattamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prodotti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prodotti` (
  `idProdotto` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProdotto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`clienti_has_prodotti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clienti_has_prodotti` (
  `clienti_idCliente` INT NOT NULL,
  `prodotti_idProdotto` INT NOT NULL,
  PRIMARY KEY (`clienti_idCliente`, `prodotti_idProdotto`),
  INDEX `fk_clienti_has_prodotti_prodotti1_idx` (`prodotti_idProdotto` ASC) VISIBLE,
  INDEX `fk_clienti_has_prodotti_clienti1_idx` (`clienti_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_clienti_has_prodotti_clienti1`
    FOREIGN KEY (`clienti_idCliente`)
    REFERENCES `mydb`.`clienti` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienti_has_prodotti_prodotti1`
    FOREIGN KEY (`prodotti_idProdotto`)
    REFERENCES `mydb`.`prodotti` (`idProdotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`negozio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`negozio` (
  `idNegozio` INT NOT NULL AUTO_INCREMENT,
  `orari` TIME NOT NULL,
  `localita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNegozio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prodotti_has_negozio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prodotti_has_negozio` (
  `prodotti_idProdotto` INT NOT NULL,
  `negozio_idNegozio` INT NOT NULL,
  PRIMARY KEY (`prodotti_idProdotto`, `negozio_idNegozio`),
  INDEX `fk_prodotti_has_negozio_negozio1_idx` (`negozio_idNegozio` ASC) VISIBLE,
  INDEX `fk_prodotti_has_negozio_prodotti1_idx` (`prodotti_idProdotto` ASC) VISIBLE,
  CONSTRAINT `fk_prodotti_has_negozio_prodotti1`
    FOREIGN KEY (`prodotti_idProdotto`)
    REFERENCES `mydb`.`prodotti` (`idProdotto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prodotti_has_negozio_negozio1`
    FOREIGN KEY (`negozio_idNegozio`)
    REFERENCES `mydb`.`negozio` (`idNegozio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`negozio_has_trattamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`negozio_has_trattamento` (
  `negozio_idNegozio` INT NOT NULL,
  `trattamento_idTrattamento` INT NOT NULL,
  PRIMARY KEY (`negozio_idNegozio`, `trattamento_idTrattamento`),
  INDEX `fk_negozio_has_trattamento_trattamento1_idx` (`trattamento_idTrattamento` ASC) VISIBLE,
  INDEX `fk_negozio_has_trattamento_negozio1_idx` (`negozio_idNegozio` ASC) VISIBLE,
  CONSTRAINT `fk_negozio_has_trattamento_negozio1`
    FOREIGN KEY (`negozio_idNegozio`)
    REFERENCES `mydb`.`negozio` (`idNegozio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_negozio_has_trattamento_trattamento1`
    FOREIGN KEY (`trattamento_idTrattamento`)
    REFERENCES `mydb`.`trattamento` (`idTrattamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`corsi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`corsi` (
  `idCorso` INT NOT NULL AUTO_INCREMENT,
  `titolo` VARCHAR(45) NULL,
  `negozio_idNegozio` INT NOT NULL,
  PRIMARY KEY (`idCorso`),
  INDEX `fk_corsi_negozio1_idx` (`negozio_idNegozio` ASC) VISIBLE,
  CONSTRAINT `fk_corsi_negozio1`
    FOREIGN KEY (`negozio_idNegozio`)
    REFERENCES `mydb`.`negozio` (`idNegozio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lezione`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lezione` (
  `orario` TIME NOT NULL,
  `giorno` DATE NOT NULL,
  `luogo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`orario`, `giorno`, `luogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lezione_has_corsi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lezione_has_corsi` (
  `lezione_orario` TIME NOT NULL,
  `lezione_giorno` DATE NOT NULL,
  `lezione_luogo` VARCHAR(45) NOT NULL,
  `corsi_idCorso` INT NOT NULL,
  PRIMARY KEY (`lezione_orario`, `lezione_giorno`, `lezione_luogo`, `corsi_idCorso`),
  INDEX `fk_lezione_has_corsi_corsi1_idx` (`corsi_idCorso` ASC) VISIBLE,
  INDEX `fk_lezione_has_corsi_lezione1_idx` (`lezione_orario` ASC, `lezione_giorno` ASC, `lezione_luogo` ASC) VISIBLE,
  CONSTRAINT `fk_lezione_has_corsi_lezione1`
    FOREIGN KEY (`lezione_orario` , `lezione_giorno` , `lezione_luogo`)
    REFERENCES `mydb`.`lezione` (`orario` , `giorno` , `luogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lezione_has_corsi_corsi1`
    FOREIGN KEY (`corsi_idCorso`)
    REFERENCES `mydb`.`corsi` (`idCorso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`corsi_has_negozio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`corsi_has_negozio` (
  `corsi_idCorso` INT NOT NULL,
  `negozio_idNegozio` INT NOT NULL,
  PRIMARY KEY (`corsi_idCorso`, `negozio_idNegozio`),
  INDEX `fk_corsi_has_negozio_negozio1_idx` (`negozio_idNegozio` ASC) VISIBLE,
  INDEX `fk_corsi_has_negozio_corsi1_idx` (`corsi_idCorso` ASC) VISIBLE,
  CONSTRAINT `fk_corsi_has_negozio_corsi1`
    FOREIGN KEY (`corsi_idCorso`)
    REFERENCES `mydb`.`corsi` (`idCorso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_corsi_has_negozio_negozio1`
    FOREIGN KEY (`negozio_idNegozio`)
    REFERENCES `mydb`.`negozio` (`idNegozio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
