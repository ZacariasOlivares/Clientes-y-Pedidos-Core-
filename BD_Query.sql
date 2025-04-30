-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BD_Clientes_Pedidos_Core
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BD_Clientes_Pedidos_Core
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BD_Clientes_Pedidos_Core` DEFAULT CHARACTER SET utf8 ;
USE `BD_Clientes_Pedidos_Core` ;

-- -----------------------------------------------------
-- Table `BD_Clientes_Pedidos_Core`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Clientes_Pedidos_Core`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BD_Clientes_Pedidos_Core`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BD_Clientes_Pedidos_Core`.`pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` FLOAT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_pedidos_clientes_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `BD_Clientes_Pedidos_Core`.`clientes` (`id_cliente`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
