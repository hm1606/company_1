-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: company
-- ------------------------------------------------------
-- Server version	5.7.32-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `agente`
--

LOCK TABLES `agente` WRITE;
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` VALUES (1,'hema',1,1,1);
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bitacoracitas`
--

LOCK TABLES `bitacoracitas` WRITE;
/*!40000 ALTER TABLE `bitacoracitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacoracitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bitacoraventa`
--

LOCK TABLES `bitacoraventa` WRITE;
/*!40000 ALTER TABLE `bitacoraventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacoraventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `citas`
--

LOCK TABLES `citas` WRITE;
/*!40000 ALTER TABLE `citas` DISABLE KEYS */;
/*!40000 ALTER TABLE `citas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Edwyn','Muñoz',NULL,NULL,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cobro`
--

LOCK TABLES `cobro` WRITE;
/*!40000 ALTER TABLE `cobro` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detallescita`
--

LOCK TABLES `detallescita` WRITE;
/*!40000 ALTER TABLE `detallescita` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallescita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detallesnotav`
--

LOCK TABLES `detallesnotav` WRITE;
/*!40000 ALTER TABLE `detallesnotav` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesnotav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `dnvimpuetos`
--

LOCK TABLES `dnvimpuetos` WRITE;
/*!40000 ALTER TABLE `dnvimpuetos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dnvimpuetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'HM STUDIOS',NULL,NULL,'Nicolas Regules No. 302 Col. Mexico',NULL,1);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Creado','Cita creada',1,1),(2,'Confirmado','Cita confirmada',1,1),(3,'En proceso','Cita en curso',1,1),(4,'Finalizado','Cita finalizada',1,1),(5,'Modificado por usuario','Modificado por el usuario y en espera de confirmación de un agente',1,1),(6,'Modificado por agente','Modificado por un agente y en espera de confirmación del usuario',1,1),(7,'Cancelado','Cita cancelada por X motivo',1,1),(8,'Cancelado por ausencia','Cita cancelada por motivo de inasistencia (APLICAR CARGOS FUTUROS)',1,1),(9,'Finalizado por incumplimiento','Cita finalizada despues de confiramr que no se cumplio con la cita',1,1),(10,'Creado por cobrar','Nota de venta creada',1,2),(11,'Proceso de cobro/parcialidades','Cobrando en parcialidades',1,2),(12,'Finalizado','Nota de venta liquidada',1,2),(13,'Cancelado','Nota de venta cancelada',1,2);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estadoocupacion`
--

LOCK TABLES `estadoocupacion` WRITE;
/*!40000 ALTER TABLE `estadoocupacion` DISABLE KEYS */;
INSERT INTO `estadoocupacion` VALUES (1,'Creado esperando confirmacion','Excepcion por confirmar',1),(2,'Creado y confirmado','Excepcion confirmada en espera de proceder',1),(3,'En proceso','Excepcion en proceso',1),(4,'Finalizada','Ocupación finalizada',1),(5,'No aprobada','Ocupación de tiempo no aprobada',1),(6,'Cancelada','Por X motivo no pudo llevarse a cabo',1);
/*!40000 ALTER TABLE `estadoocupacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `excepcioncita`
--

LOCK TABLES `excepcioncita` WRITE;
/*!40000 ALTER TABLE `excepcioncita` DISABLE KEYS */;
/*!40000 ALTER TABLE `excepcioncita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `excepcionhorario`
--

LOCK TABLES `excepcionhorario` WRITE;
/*!40000 ALTER TABLE `excepcionhorario` DISABLE KEYS */;
/*!40000 ALTER TABLE `excepcionhorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `impuestos`
--

LOCK TABLES `impuestos` WRITE;
/*!40000 ALTER TABLE `impuestos` DISABLE KEYS */;
INSERT INTO `impuestos` VALUES (1,'IVA','IVA Centro de Mexico',16,1);
/*!40000 ALTER TABLE `impuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `impuestose`
--

LOCK TABLES `impuestose` WRITE;
/*!40000 ALTER TABLE `impuestose` DISABLE KEYS */;
INSERT INTO `impuestose` VALUES (1,'Necesario para facturas',1,'1');
/*!40000 ALTER TABLE `impuestose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notaventa`
--

LOCK TABLES `notaventa` WRITE;
/*!40000 ALTER TABLE `notaventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `notaventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Hugo','Mendez',NULL,'Melchor Ocampo 5',NULL,NULL,NULL,NULL,NULL,'mendezhugo160@gmail.com',1,1);
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Productor',NULL,1,1);
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `servicios`
--

LOCK TABLES `servicios` WRITE;
/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` VALUES (1,'Grabacion RAP','Servicio de grabar una cancion, mezclarla y masterizarla',350,2,1,1,NULL);
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipocobro`
--

LOCK TABLES `tipocobro` WRITE;
/*!40000 ALTER TABLE `tipocobro` DISABLE KEYS */;
INSERT INTO `tipocobro` VALUES (1,'Una sola excibicion','Pago inmediato',1),(2,'Parcialidades','Pago en parcialidades',1);
/*!40000 ALTER TABLE `tipocobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoestado`
--

LOCK TABLES `tipoestado` WRITE;
/*!40000 ALTER TABLE `tipoestado` DISABLE KEYS */;
INSERT INTO `tipoestado` VALUES (1,'Citas','Estados de citas',1),(2,'Nota de Venta','Estados de nota de venta',1);
/*!40000 ALTER TABLE `tipoestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipoexcepcion`
--

LOCK TABLES `tipoexcepcion` WRITE;
/*!40000 ALTER TABLE `tipoexcepcion` DISABLE KEYS */;
INSERT INTO `tipoexcepcion` VALUES (1,'Ocupacion','Agente que dedicara tiempo a realizar un servicio',1),(2,'Comida','Agente no disponible, en horario de comida',1),(3,'Personal','Agente no disponible por motivos personales',1);
/*!40000 ALTER TABLE `tipoexcepcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipopago`
--

LOCK TABLES `tipopago` WRITE;
/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
INSERT INTO `tipopago` VALUES (1,'Una sola excibicion','Pago en una sola excibicion',1),(2,'Parcialidad','Uno de varios pagos',1),(3,'Anticipo','Pago en parcialidades con anticipo por adelantado',1);
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tiposervicio`
--

LOCK TABLES `tiposervicio` WRITE;
/*!40000 ALTER TABLE `tiposervicio` DISABLE KEYS */;
INSERT INTO `tiposervicio` VALUES (1,'Publico','Agregable por el cliente, agente, administrador y todos los usuarios',1),(2,'Interno','Agregable unicamente por administradores, agentes y usuarios internos del sistema',1),(3,'Recargo','Agregable automaticamente o por un usuario administrador',1);
/*!40000 ALTER TABLE `tiposervicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'admin','ALL ACCESS',1),(2,'admin_company','ALL ACCESS OF SYSTEM',1),(3,'agent','AGENT ACCESS',1),(4,'user','USER ACCESS',1),(5,'free','FREE ACCESS',1);
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-04 17:50:33
