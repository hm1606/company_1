-- MySQL Script generated by MySQL Workbench
-- Thu Feb  4 12:58:46 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Company` DEFAULT CHARACTER SET utf8 ;
USE `Company` ;

-- -----------------------------------------------------
-- Table `Company`.`Empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Empresas` (
  `idEmpresas` INT NOT NULL AUTO_INCREMENT,
  `razonSocial` VARCHAR(450) NULL,
  `rfc` VARCHAR(13) NULL,
  `direccionFiscal` VARCHAR(450) NULL,
  `direccionComercial` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idEmpresas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Personal` (
  `idPersonal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `apellidoPaterno` VARCHAR(450) NULL,
  `apellidoMaterno` VARCHAR(450) NULL,
  `direccion` VARCHAR(450) NULL,
  `curp` VARCHAR(254) NULL,
  `rfc` VARCHAR(13) NULL,
  `nss` VARCHAR(64) NULL,
  `tipoSangre` VARCHAR(10) NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  `idEmpresas` INT NULL,
  PRIMARY KEY (`idPersonal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(450) NULL,
  `fechaCreacion` DATETIME NULL,
  `fechaSugerida` DATETIME NULL,
  `fechaCita` DATETIME NULL,
  `idClientes` INT NULL,
  `idAgente` INT NULL,
  `idEstado` VARCHAR(45) NULL,
  PRIMARY KEY (`idCitas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`BitacoraCitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`BitacoraCitas` (
  `idBitacoraCitas` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(450) NULL,
  `fecha` DATETIME NULL,
  `idCitas` INT NULL,
  `status` TINYINT NULL,
  `idEstado` INT NULL,
  PRIMARY KEY (`idBitacoraCitas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `apellidoPaterno` VARCHAR(450) NULL,
  `apellidoMaterno` VARCHAR(450) NULL,
  `direccion` VARCHAR(450) NULL,
  `rfc` VARCHAR(13) NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  `idEmpresas` INT NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(450) NULL,
  `password` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  `idTipoUsuario` INT NULL,
  `idPersona` INT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoUsuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoUsuario` (
  `idTipoUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Puestos` (
  `idPuestos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `idEmpresas` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idPuestos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Agente` (
  `idAgente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `idPuestos` INT NULL,
  `idPersonal` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idAgente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Servicios` (
  `idServicios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `precio` DOUBLE NULL,
  `duracionEstimada` DOUBLE NULL,
  `status` TINYINT NULL,
  `idTipoServicio` INT NULL,
  PRIMARY KEY (`idServicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`NotaVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`NotaVenta` (
  `idNotaVenta` INT NOT NULL AUTO_INCREMENT,
  `fechaCreacion` DATETIME NULL,
  `fechaLiquidacion` DATETIME NULL,
  `descuento` DOUBLE NULL,
  `idEstado` INT NULL,
  `idPersonal` INT NULL,
  `idClientes` INT NULL,
  `idAgente` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idNotaVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`BitacoraVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`BitacoraVenta` (
  `idBitacoraVenta` INT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(450) NULL,
  `comentarios` VARCHAR(450) NULL,
  `fecha` VARCHAR(45) NULL,
  `idEstado` INT NULL,
  PRIMARY KEY (`idBitacoraVenta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  `idTipoEstado` INT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`DetallesNotaV`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`DetallesNotaV` (
  `idDetallesNotaV` INT NOT NULL AUTO_INCREMENT,
  `cargo` DOUBLE NULL,
  `impuestos` DOUBLE NULL,
  `idServicios` INT NULL,
  `idNotaVenta` INT NULL,
  PRIMARY KEY (`idDetallesNotaV`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`DetallesCita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`DetallesCita` (
  `idDetallesCita` INT NOT NULL AUTO_INCREMENT,
  `cargo` DOUBLE NULL,
  `impuestos` DOUBLE NULL,
  `idServicios` INT NULL,
  `idCitas` INT NULL,
  PRIMARY KEY (`idDetallesCita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Cobro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Cobro` (
  `idCobro` INT NOT NULL AUTO_INCREMENT,
  `index` DOUBLE NULL,
  `idTipoCobro` INT NULL,
  `idNotaVenta` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idCobro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoCobro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoCobro` (
  `idTipoCobro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(45) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoCobro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Pagos` (
  `idPagos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `comentarios` VARCHAR(450) NULL,
  `monto` DOUBLE NULL,
  `idCobro` INT NULL,
  `idTipoPago` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idPagos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoPago` (
  `idTipoPago` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`ImpuestosE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`ImpuestosE` (
  `idDatosEmpresa` INT NOT NULL AUTO_INCREMENT,
  `comentarios` VARCHAR(450) NULL,
  `idImpuestos` INT NULL,
  `status` VARCHAR(450) NULL,
  PRIMARY KEY (`idDatosEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Impuestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Impuestos` (
  `idImpuestos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `valor` DOUBLE NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idImpuestos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`DNVImpuetos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`DNVImpuetos` (
  `idDNVImpuetos` INT NOT NULL AUTO_INCREMENT,
  `valor` DOUBLE NULL,
  `cargo` DOUBLE NULL,
  `idImpuestosE` INT NULL,
  `idDetallesNotaV` INT NULL,
  PRIMARY KEY (`idDNVImpuetos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoEstado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoEstado` (
  `idTipoEstado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`Horario` (
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `horaEntrada` TIME NULL,
  `horaSalida` TIME NULL,
  `idPersonal` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`ExcepcionHorario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`ExcepcionHorario` (
  `idExcepcionHorario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `horaInicio` DATETIME NULL,
  `horaFin` DATETIME NULL,
  `idHorario` DATETIME NULL,
  `idTipoExcepcion` INT NULL,
  `idEstadoOcupacion` INT NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idExcepcionHorario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoExcepcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoExcepcion` (
  `idTipoExcepcion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoExcepcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`EstadoOcupacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`EstadoOcupacion` (
  `idEstadoOcupacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idEstadoOcupacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`.`TipoServicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Company`.`TipoServicio` (
  `idTipoServicio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(450) NULL,
  `descripcion` VARCHAR(450) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`idTipoServicio`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
