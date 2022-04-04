-- MySQL Script generated by MySQL Workbench
-- Wed Jul  7 18:32:14 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql11418837
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql11418837
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql11418837` DEFAULT CHARACTER SET latin1 ;
USE `sql11418837` ;

-- -----------------------------------------------------
-- Table `sql11418837`.`administratorzy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`administratorzy` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`administratorzy` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `imie` VARCHAR(45) NOT NULL,
  `drugieImie` VARCHAR(45) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `nrKontaktowy` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sql11418837`.`godzinyLekcji`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`godzinyLekcji` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`godzinyLekcji` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `poczatek` TIME NOT NULL,
  `koniec` TIME NOT NULL,
  `numer` INT(11) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sql11418837`.`nauczyciele`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`nauczyciele` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`nauczyciele` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `drugieImie` VARCHAR(45) NULL DEFAULT NULL,
  `Nazwisko` VARCHAR(45) NOT NULL,
  `nrKontaktowy` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3403
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`uczniowie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`uczniowie` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`uczniowie` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `idKlasy` INT(11) NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `drugieImie` VARCHAR(45) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `adres` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Uczniowie_Klasy1_idx` (`idKlasy` ASC) VISIBLE,
  CONSTRAINT `fk_Uczniowie_Klasy1`
    FOREIGN KEY (`idKlasy`)
    REFERENCES `sql11418837`.`klasy` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4102
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`klasy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`klasy` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`klasy` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `numer` VARCHAR(45) NOT NULL,
  `idWychowawcy` INT(11) NULL DEFAULT NULL,
  `idPrzewodniczacego` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Klasy_Nauczyciele1_idx` (`idWychowawcy` ASC) VISIBLE,
  INDEX `fk_Klasy_Uczniowie1_idx` (`idPrzewodniczacego` ASC) VISIBLE,
  CONSTRAINT `fk_Klasy_Nauczyciele1`
    FOREIGN KEY (`idWychowawcy`)
    REFERENCES `sql11418837`.`nauczyciele` (`ID`),
  CONSTRAINT `fk_Klasy_Uczniowie1`
    FOREIGN KEY (`idPrzewodniczacego`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`kodyweryfikacyjne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`kodyweryfikacyjne` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`kodyweryfikacyjne` (
  `login` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `kod` VARCHAR(6) NULL DEFAULT NULL,
  PRIMARY KEY (`login`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`kolanaukowe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`kolanaukowe` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`kolanaukowe` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `idNauczyciela` INT(11) NOT NULL,
  `opis` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_KolaNaukowe_Nauczyciele1_idx` (`idNauczyciela` ASC) VISIBLE,
  CONSTRAINT `fk_KolaNaukowe_Nauczyciele1`
    FOREIGN KEY (`idNauczyciela`)
    REFERENCES `sql11418837`.`nauczyciele` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4402
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`konkursy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`konkursy` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`konkursy` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `opis` VARCHAR(200) NULL DEFAULT NULL,
  `dataOdbyciaSie` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`przedmioty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`przedmioty` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`przedmioty` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3902
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`nieobecnosci`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`nieobecnosci` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`nieobecnosci` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `idPrzedmiotu` INT(11) NOT NULL,
  `idUcznia` INT(11) NOT NULL,
  `data` DATE NOT NULL,
  `godzina` INT(11) NOT NULL,
  `czyUsprawiedliwiona` TINYINT(4) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Uczniowie_has_Przedmioty_Przedmioty2_idx` (`idPrzedmiotu` ASC) VISIBLE,
  INDEX `fk_Uczniowie_has_Przedmioty_Uczniowie2_idx` (`idUcznia` ASC) VISIBLE,
  INDEX `fk_Uczniowie_GodzinyLekcji_idx` (`godzina` ASC) VISIBLE,
  CONSTRAINT `fk_Uczniowie_GodzinyLekcji`
    FOREIGN KEY (`godzina`)
    REFERENCES `sql11418837`.`godzinyLekcji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Uczniowie_has_Przedmioty_Przedmioty2`
    FOREIGN KEY (`idPrzedmiotu`)
    REFERENCES `sql11418837`.`przedmioty` (`ID`),
  CONSTRAINT `fk_Uczniowie_has_Przedmioty_Uczniowie2`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4357
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`oceny`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`oceny` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`oceny` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `idUcznia` INT(11) NOT NULL,
  `idPrzedmiotu` INT(11) NOT NULL,
  `ocena` FLOAT NOT NULL,
  `waga` FLOAT NOT NULL,
  `data` DATE NOT NULL,
  `opis` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Uczniowie_has_Przedmioty_Przedmioty1_idx` (`idPrzedmiotu` ASC) VISIBLE,
  INDEX `fk_Uczniowie_has_Przedmioty_Uczniowie1_idx` (`idUcznia` ASC) VISIBLE,
  CONSTRAINT `fk_Uczniowie_has_Przedmioty_Przedmioty1`
    FOREIGN KEY (`idPrzedmiotu`)
    REFERENCES `sql11418837`.`przedmioty` (`ID`),
  CONSTRAINT `fk_Uczniowie_has_Przedmioty_Uczniowie1`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4355
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`rodzice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`rodzice` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`rodzice` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `drugieImie` VARCHAR(45) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `nrKontaktowy` VARCHAR(20) NULL DEFAULT NULL,
  `adres` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4152
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`rodzicielstwo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`rodzicielstwo` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`rodzicielstwo` (
  `idUcznia` INT(11) NOT NULL,
  `idRodzica` INT(11) NOT NULL,
  PRIMARY KEY (`idUcznia`, `idRodzica`),
  INDEX `fk_Uczniowie_has_Rodzice_Rodzice1_idx` (`idRodzica` ASC) VISIBLE,
  INDEX `fk_Uczniowie_has_Rodzice_Uczniowie1_idx` (`idUcznia` ASC) VISIBLE,
  CONSTRAINT `fk_Uczniowie_has_Rodzice_Rodzice1`
    FOREIGN KEY (`idRodzica`)
    REFERENCES `sql11418837`.`rodzice` (`ID`),
  CONSTRAINT `fk_Uczniowie_has_Rodzice_Uczniowie1`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`sale`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`sale` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`sale` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NULL DEFAULT NULL,
  `liczbaMiejsc` INT(11) NULL DEFAULT NULL,
  `czyJestRzutnik` TINYINT(4) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3304
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`rozklady`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`rozklady` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`rozklady` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `idSali` INT(11) NULL DEFAULT NULL,
  `idPrzedmiotu` INT(11) NOT NULL,
  `idNauczyciela` INT(11) NULL DEFAULT NULL,
  `idKlasy` INT(11) NOT NULL,
  `dzien` ENUM('pon', 'wto', 'sro', 'czw', 'pia') NOT NULL,
  `godzina` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Rozklady_Nauczyciele1_idx` (`idNauczyciela` ASC) VISIBLE,
  INDEX `fk_Rozklady_Przedmioty1_idx` (`idPrzedmiotu` ASC) VISIBLE,
  INDEX `fk_Rozklady_Sale1_idx` (`idSali` ASC) VISIBLE,
  INDEX `fk_Rozklady_Klasy1_idx` (`idKlasy` ASC) VISIBLE,
  INDEX `fk_Rozklady_GodzinyLekcji_idx` (`godzina` ASC) VISIBLE,
  CONSTRAINT `fk_Rozklady_GodzinyLekcji`
    FOREIGN KEY (`godzina`)
    REFERENCES `sql11418837`.`godzinyLekcji` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rozklady_Klasy1`
    FOREIGN KEY (`idKlasy`)
    REFERENCES `sql11418837`.`klasy` (`ID`),
  CONSTRAINT `fk_Rozklady_Nauczyciele1`
    FOREIGN KEY (`idNauczyciela`)
    REFERENCES `sql11418837`.`nauczyciele` (`ID`),
  CONSTRAINT `fk_Rozklady_Przedmioty1`
    FOREIGN KEY (`idPrzedmiotu`)
    REFERENCES `sql11418837`.`przedmioty` (`ID`),
  CONSTRAINT `fk_Rozklady_Sale1`
    FOREIGN KEY (`idSali`)
    REFERENCES `sql11418837`.`sale` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4002
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`udzialwkole`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`udzialwkole` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`udzialwkole` (
  `idUcznia` INT(11) NOT NULL,
  `idKola` INT(11) NOT NULL,
  `dataDolaczenia` DATE NOT NULL,
  PRIMARY KEY (`idUcznia`, `idKola`),
  INDEX `fk_KolaNaukowe_has_Uczniowie_Uczniowie1_idx` (`idUcznia` ASC) VISIBLE,
  INDEX `fk_KolaNaukowe_has_Uczniowie_KolaNaukowe1_idx` (`idKola` ASC) VISIBLE,
  CONSTRAINT `fk_KolaNaukowe_has_Uczniowie_KolaNaukowe1`
    FOREIGN KEY (`idKola`)
    REFERENCES `sql11418837`.`kolanaukowe` (`ID`),
  CONSTRAINT `fk_KolaNaukowe_has_Uczniowie_Uczniowie1`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`udzialwkonkursie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`udzialwkonkursie` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`udzialwkonkursie` (
  `idKonkursu` INT(11) NOT NULL,
  `idNauczyciela` INT(11) NOT NULL,
  `idUcznia` INT(11) NOT NULL,
  `osiagniecie` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idKonkursu`, `idNauczyciela`, `idUcznia`),
  INDEX `fk_UdzialwKonkursie_Nauczyciele1_idx` (`idNauczyciela` ASC) VISIBLE,
  INDEX `fk_UdzialwKonkursie_Uczniowie1_idx` (`idUcznia` ASC) VISIBLE,
  CONSTRAINT `fk_UdzialwKonkursie_Konkursy`
    FOREIGN KEY (`idKonkursu`)
    REFERENCES `sql11418837`.`konkursy` (`ID`),
  CONSTRAINT `fk_UdzialwKonkursie_Nauczyciele1`
    FOREIGN KEY (`idNauczyciela`)
    REFERENCES `sql11418837`.`nauczyciele` (`ID`),
  CONSTRAINT `fk_UdzialwKonkursie_Uczniowie1`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`uwagi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`uwagi` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`uwagi` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `idUcznia` INT(11) NOT NULL,
  `idNauczyciela` INT(11) NOT NULL,
  `tresc` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Uczniowie_has_Nauczyciele_Nauczyciele1_idx` (`idNauczyciela` ASC) VISIBLE,
  INDEX `fk_Uczniowie_has_Nauczyciele_Uczniowie1_idx` (`idUcznia` ASC) VISIBLE,
  CONSTRAINT `fk_Uczniowie_has_Nauczyciele_Nauczyciele1`
    FOREIGN KEY (`idNauczyciela`)
    REFERENCES `sql11418837`.`nauczyciele` (`ID`),
  CONSTRAINT `fk_Uczniowie_has_Nauczyciele_Uczniowie1`
    FOREIGN KEY (`idUcznia`)
    REFERENCES `sql11418837`.`uczniowie` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 3969
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`uzytkownicy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`uzytkownicy` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`uzytkownicy` (
  `ID` INT(11) NULL DEFAULT NULL,
  `login` VARCHAR(45) NOT NULL,
  `haslo` VARCHAR(45) NOT NULL,
  `dostep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`login`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `ck_id` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`wiadomosci`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`wiadomosci` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`wiadomosci` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `temat` VARCHAR(45) NOT NULL,
  `tresc` VARCHAR(600) NOT NULL,
  `data` TIMESTAMP NULL DEFAULT NULL,
  `odbiorca` VARCHAR(45) NOT NULL,
  `nadawca` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sql11418837`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sql11418837`.`user` ;

CREATE TABLE IF NOT EXISTS `sql11418837`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sql11418837`.`administratorzy`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql11418837`;
INSERT INTO `sql11418837`.`administratorzy` (`ID`, `imie`, `drugieImie`, `nazwisko`, `nrKontaktowy`, `email`) VALUES (1, 'Default', NULL, 'Default', NULL, 'Default');

COMMIT;


-- -----------------------------------------------------
-- Data for table `sql11418837`.`uzytkownicy`
-- -----------------------------------------------------
START TRANSACTION;
USE `sql11418837`;
INSERT INTO `sql11418837`.`uzytkownicy` (`ID`, `login`, `haslo`, `dostep`) VALUES (1, 'a', 'a', 'admin');
INSERT INTO `sql11418837`.`uzytkownicy` (`ID`, `login`, `haslo`, `dostep`) VALUES (1, 'd', 'd', 'dyrektor');

COMMIT;
