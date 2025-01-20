-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: colegiodb
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `idAdministradores` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`idAdministradores`),
  KEY `fk_Administradores_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_Administradores_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'72162115','Ricardo','Panduro',33),(2,'23232323','Juan','ElMecanico',55);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `id_docente` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  `id_periodo` int DEFAULT NULL,
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_curso` (`id_curso`),
  KEY `id_periodo` (`id_periodo`),
  KEY `asignacion_ibfk_1` (`id_docente`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `asignacion_ibfk_3` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (28,1,1,25),(26,2,1,26),(27,3,1,27),(29,4,1,28),(25,5,1,29),(24,6,1,30),(24,7,1,31),(24,8,1,32),(24,9,1,33),(24,10,1,34),(26,1,3,54),(24,2,3,55),(27,3,3,56),(26,4,3,57),(28,5,3,58),(29,6,3,59),(24,2,2,60),(26,3,2,61),(29,4,2,62),(28,5,2,63),(29,6,2,64),(26,1,4,65);
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `curso_nombre` varchar(100) NOT NULL,
  `id_grado` int DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_grado` (`id_grado`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Matemáticas I',1,'Operaciones básicas, álgebra'),(2,'Matemáticas II',2,'Álgebra, geometría plana'),(3,'Matemáticas III',3,'Trigonometría, ecuaciones'),(4,'Matemáticas IV',4,'Geometría analítica, estadística'),(5,'Matemáticas V',5,'Cálculo básico, funciones'),(6,'Lenguaje',1,'Gramática, redacción narrativa'),(7,'Lenguaje',2,'Análisis literario, ensayos'),(8,'Lenguaje',3,'Literatura universal, argumentación'),(9,'Lenguaje',4,'Literatura contemporánea, expositivos'),(10,'Lenguaje',5,'Análisis crítico, ensayos académicos');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `idEspecialidad` int NOT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `id_usuario` (`id_usuario`),
  KEY `fk_docente_Especialidad1_idx` (`idEspecialidad`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `fk_docente_Especialidad1` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (24,'Pedro','Ruiz',30,1),(25,'Juan','Pantoja',31,2),(26,'Gabriel','Matos',32,1),(27,'Guillermo','Escalante',NULL,2),(28,'Ricardo','Perez',NULL,2),(29,'Alberto','Aguirre',NULL,1);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `idEspecialidad` int NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Matematica'),(2,'Comunicacion'),(3,'Ingles');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `estado` enum('Matriculado','No Matriculado') DEFAULT 'No Matriculado',
  PRIMARY KEY (`id_estudiante`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (6,'Luciana','Panduro','2019-01-25',34,'12345698','No Matriculado'),(7,'Luciana','Panduro Diaz','2019-01-25',35,'12345678','No Matriculado'),(8,'Manuel','Rodriguez','2025-01-14',37,'41521245','No Matriculado'),(9,'Ronaldo','DosSantos','2024-12-31',39,'85954545','No Matriculado'),(10,'Javier','Mar','2024-06-06',41,'45123214','No Matriculado'),(11,'Marleny','Diaz','1977-03-24',43,'12345678','Matriculado'),(12,'gonzalo','paredes','2017-12-31',45,'45478798','Matriculado'),(13,'Lionel','Flores','2025-01-20',47,'00112233','No Matriculado'),(14,'Fabricio','Fortunato','2025-01-29',49,'00221133','No Matriculado'),(15,'Juan','Fortunato','2025-01-20',51,'12123232','Matriculado'),(16,'Ricardo Abel','Matos','2025-01-08',53,'12111222','Matriculado'),(17,'Luis','Castro','2025-01-20',56,'15151515','Matriculado');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `id_grado` int NOT NULL AUTO_INCREMENT,
  `grado_nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'1er'),(2,'2do'),(3,'3ro'),(4,'4to'),(5,'5to');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_estudiante` int DEFAULT NULL,
  `id_usuario_matriculador` int DEFAULT NULL,
  `fecha_matricula` date NOT NULL,
  `id_asignatura` int DEFAULT NULL,
  `id_seccion` int DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_usuario_matriculador` (`id_usuario_matriculador`),
  KEY `matricula_ibfk_3_idx` (`id_asignatura`),
  KEY `matricula_ibfk_4_idx` (`id_seccion`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_usuario_matriculador`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`id_asignatura`) REFERENCES `periodo` (`id_periodo`),
  CONSTRAINT `matricula_ibfk_4` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,12,33,'2025-01-20',1,4),(2,11,33,'2025-01-20',3,8),(3,11,33,'2025-01-20',3,8),(4,16,33,'2025-01-20',4,5),(5,15,33,'2025-01-20',1,6),(6,17,33,'2025-01-20',1,4);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padre`
--

DROP TABLE IF EXISTS `padre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padre` (
  `id_padre` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_estudiante` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_padre`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `padre_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `padre_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padre`
--

LOCK TABLES `padre` WRITE;
/*!40000 ALTER TABLE `padre` DISABLE KEYS */;
INSERT INTO `padre` VALUES (4,'wiker','Panduro ','953227875','Jr. Los pinos Mz. 8 Lt. 1',7,36,'00221130'),(5,'Manuel','Rodriguez','996987785','A.H Esperanza',8,38,'78457841'),(6,'Cristiano','DosSantos','785458741','Portugal',9,40,'45741245'),(7,'Luis','Lopez','987654321','Peru',10,42,'45121236'),(8,'Victor','Diaz','9587854457','Las Palmas',11,44,'45741244'),(9,'Abel','Paredes','985654123','Jr. Juane',12,46,'01144512'),(10,'Agusto','Flores','985632147','AH Henrrique Segoviano',13,48,'10203020'),(11,'Rodolfo','Fortunato','987456321','Jr. Los pinos Mz. 8 Lt. 12',14,50,'12121212'),(12,'Ricardo Abel','Panduro Diaz','953227875','Jr. Los pinos Mz. 8 Lt. 1',15,52,'85878754'),(13,'Ricardo Abel','Panduro Diaz','953227875','Jr. Los pinos Mz. 8 Lt. 1',16,54,'12333211'),(14,'Manuel','Castro','963254125','Jr. Los pinos Mz. 8 Lt. 1',17,57,'00001111');
/*!40000 ALTER TABLE `padre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `id_periodo` int NOT NULL AUTO_INCREMENT,
  `periodo_nombre` varchar(20) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'PrimerPeriodo','2019-03-10','2019-12-01'),(2,'SegundoPeriodo','2025-01-01','2025-01-08'),(3,'TercerPeriodo','2025-01-31','2025-02-19'),(4,'CuartoPeriodo','2025-01-01','2025-01-31');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccion` (
  `id_seccion` int NOT NULL AUTO_INCREMENT,
  `seccion_nombre` varchar(10) NOT NULL,
  `id_grado` int DEFAULT NULL,
  `id_docente_tutor` int DEFAULT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `id_grado` (`id_grado`),
  KEY `id_docente_tutor` (`id_docente_tutor`),
  CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`),
  CONSTRAINT `seccion_ibfk_2` FOREIGN KEY (`id_docente_tutor`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (4,'A',1,24),(5,'A',2,25),(6,'A',3,26),(7,'A',4,27),(8,'A',5,28),(9,'B',1,24),(10,'B',2,25),(11,'B',3,26),(12,'B',4,27),(13,'B',5,28);
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('Estudiante','Padre','Docente','Administrativo') NOT NULL,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (23,'Hilario_vazquez','default_password','Docente','Hilario vazquez',NULL),(24,'Hilario_vazquez','default_password','Docente','Hilario vazquez',NULL),(25,'Hilario_vazquez','default_password','Docente','Hilario vazquez',NULL),(26,'Hilario_vazquez','default_password','Docente','Hilario vazquez',NULL),(27,'Juan_Rios','default_password','Docente','Juan Rios',NULL),(28,'Juan_Pantoja','default_password','Docente','Juan Pantoja',NULL),(29,'asda_sada','default_password','Docente','asda sada',NULL),(30,'Juan_Pantoja','default_password','Docente','Juan Pantoja',NULL),(31,'Juan_Pantoja','default_password','Docente','Juan Pantoja',NULL),(32,'Gabriel_Matos','default_password','Docente','Gabriel Matos',NULL),(33,'Ricardo_Panduro','123','Administrativo','Ricardo Panduro',NULL),(34,'Luciana_Panduro','default_password','Estudiante','Luciana Panduro',NULL),(35,'Luciana_Panduro Diaz','default_password','Estudiante','Luciana Panduro Diaz',NULL),(36,'wiker_Panduro ','default_password','Padre','wiker Panduro ',NULL),(37,'Manuel_Rodriguez','default_password','Estudiante','Manuel Rodriguez',NULL),(38,'Manuel_Rodriguez','default_password','Padre','Manuel Rodriguez',NULL),(39,'Ronaldo_DosSantos','default_password','Estudiante','Ronaldo DosSantos',NULL),(40,'Cristiano_DosSantos','default_password','Padre','Cristiano DosSantos',NULL),(41,'Javier_Mar','default_password','Estudiante','Javier Mar',NULL),(42,'Luis_Lopez','default_password','Padre','Luis Lopez',NULL),(43,'Marleny_Diaz','default_password','Estudiante','Marleny Diaz',NULL),(44,'Victor_Diaz','default_password','Padre','Victor Diaz',NULL),(45,'gonzalo_paredes','default_password','Estudiante','gonzalo paredes',NULL),(46,'Abel_Paredes','default_password','Padre','Abel Paredes',NULL),(47,'Lionel_Flores','default_password','Estudiante','Lionel Flores',NULL),(48,'Agusto_Flores','default_password','Padre','Agusto Flores',NULL),(49,'Fabricio_Fortunato','default_password','Estudiante','Fabricio Fortunato',NULL),(50,'Rodolfo_Fortunato','default_password','Padre','Rodolfo Fortunato',NULL),(51,'Juan_Fortunato','default_password','Estudiante','Juan Fortunato',NULL),(52,'Ricardo Abel_Panduro Diaz','default_password','Padre','Ricardo Abel Panduro Diaz',NULL),(53,'Ricardo Abel_Matos','default_password','Estudiante','Ricardo Abel Matos',NULL),(54,'Ricardo Abel_Panduro Diaz','default_password','Padre','Ricardo Abel Panduro Diaz',NULL),(55,'Juan_ElMecanico','default_password','Administrativo','Juan ElMecanico',NULL),(56,'Luis_Castro','default_password','Estudiante','Luis Castro',NULL),(57,'Manuel_Castro','default_password','Padre','Manuel Castro',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'colegiodb'
--

--
-- Dumping routines for database 'colegiodb'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAsignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAsignacion`(
    IN periodo_id INT,
    IN id_curso INT,
    IN id_docente INT
)
BEGIN
    -- Declarar una variable para almacenar el id_asignacion
    DECLARE asignacion_id INT;

    -- Buscar el id_asignacion para el período y curso dados
    SELECT id_asignacion INTO asignacion_id
    FROM asignacion
    WHERE id_periodo = periodo_id AND id_curso = id_curso
    LIMIT 1;

    -- Si se encontró una asignación, actualizar el id_docente
    IF asignacion_id IS NOT NULL THEN
        UPDATE asignacion
        SET id_docente = id_docente
        WHERE id_asignacion = asignacion_id;
    ELSE
        -- Si no se encontró una asignación, insertar una nueva
        INSERT INTO asignacion (id_periodo, id_curso, id_docente)
        VALUES (periodo_id, id_curso, id_docente);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPeriodo`(
    IN periodo_id INT,
    IN periodo_nombre VARCHAR(20),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    -- Actualizar los datos del período
    UPDATE periodo
    SET periodo_nombre = periodo_nombre,
        fecha_inicio = fecha_inicio,
        fecha_fin = fecha_fin
    WHERE id_periodo = periodo_id;
    
    DELETE FROM asignacion
	WHERE id_periodo = periodo_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConfirmarMatricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConfirmarMatricula`(
    IN p_id_estudiante INT,
    IN p_id_usuario_matriculador INT,
    IN p_fecha_matricula DATE,
    IN p_id_asignatura INT,
    IN p_id_seccion INT
)
BEGIN
    -- Iniciar una transacción para asegurar la atomicidad
    START TRANSACTION;

    -- 1. Insertar la nueva matrícula en la tabla `matricula`
    INSERT INTO matricula (id_estudiante, id_usuario_matriculador, fecha_matricula, id_asignatura, id_seccion)
    VALUES (p_id_estudiante, p_id_usuario_matriculador, p_fecha_matricula, p_id_asignatura, p_id_seccion);

    -- 2. Actualizar el estado del estudiante a "Matriculado" en la tabla `estudiante`
    UPDATE estudiante
    SET estado = 'Matriculado'
    WHERE id_estudiante = p_id_estudiante;

    -- Confirmar la transacción
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAdministrador`(
    IN nombre VARCHAR(45),
    IN apellido VARCHAR(45),
    IN dni VARCHAR(45)
)
BEGIN
    DECLARE new_usuario_id INT;

    -- Insertar el nuevo usuario
    INSERT INTO Usuario (nombre_usuario, contrasena, rol, nombre_completo, correo)
    VALUES (CONCAT(nombre, '_', apellido), 'default_password', 'Administrativo', CONCAT(nombre, ' ', apellido), NULL);

    -- Obtener el id del usuario recién creado
    SET new_usuario_id = LAST_INSERT_ID();

    -- Insertar el nuevo administrador
    INSERT INTO Administradores (nombre, apellido, dni, id_usuario)
    VALUES (nombre, apellido, dni, new_usuario_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarAsignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAsignacion`(
    IN id_docente INT,
    IN id_curso INT,
    IN id_periodo INT
)
BEGIN
    -- Insertar la asignación del docente al curso en el período
    INSERT INTO asignacion (id_docente, id_curso, id_periodo)
    VALUES (id_docente, id_curso, id_periodo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDocente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDocente`(
    IN nombre VARCHAR(100),
    IN apellido VARCHAR(100),
    IN especialidad INT -- Cambiar a INT para coincidir con el tipo de dato de idEspecialidad
)
BEGIN
    DECLARE new_usuario_id INT;

    -- Insertar el nuevo usuario
    INSERT INTO Usuario (nombre_usuario, contrasena, rol, nombre_completo, correo)
    VALUES (CONCAT(nombre, '_', apellido), 'default_password', 'Docente', CONCAT(nombre, ' ', apellido), NULL);

    -- Obtener el id del usuario recién creado
    SET new_usuario_id = LAST_INSERT_ID();

    -- Insertar el nuevo docente
    INSERT INTO Docente (nombre, apellido, idEspecialidad, id_usuario)
    VALUES (nombre, apellido, especialidad, new_usuario_id); -- Usar el parámetro especialidad
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEstudiante`(
    IN nombre VARCHAR(100),
    IN apellido VARCHAR(100),
    IN dni VARCHAR(8),
    IN fecha_nacimiento DATE
    
)
BEGIN
    DECLARE new_usuario_id INT;

    -- Insertar el nuevo usuario
    INSERT INTO Usuario (nombre_usuario, contrasena, rol, nombre_completo, correo)
    VALUES (CONCAT(nombre, '_', apellido), 'default_password', 'Estudiante', CONCAT(nombre, ' ', apellido), NULL);

    -- Obtener el id del usuario recién creado
    SET new_usuario_id = LAST_INSERT_ID();

    -- Insertar el nuevo estudiante
    INSERT INTO Estudiante (nombre, apellido, fecha_nacimiento, id_usuario, dni)
    VALUES (nombre, apellido, fecha_nacimiento, new_usuario_id, dni);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPadre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPadre`(
    IN nombre VARCHAR(100),
    IN apellido VARCHAR(100),
    IN telefono VARCHAR(15),
    IN direccion VARCHAR(255),
    IN dni VARCHAR(8),
    IN id_estudiante INT -- Nuevo parámetro: id_estudiante
)
BEGIN
    DECLARE new_usuario_id INT;

    -- Insertar el nuevo usuario
    INSERT INTO Usuario (nombre_usuario, contrasena, rol, nombre_completo, correo)
    VALUES (CONCAT(nombre, '_', apellido), 'default_password', 'Padre', CONCAT(nombre, ' ', apellido), NULL);

    -- Obtener el id del usuario recién creado
    SET new_usuario_id = LAST_INSERT_ID();

    -- Insertar el nuevo padre
    INSERT INTO Padre (nombre, apellido, telefono, direccion, id_estudiante, id_usuario, dni)
    VALUES (nombre, apellido, telefono, direccion, id_estudiante, new_usuario_id, dni);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPeriodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPeriodo`(
    IN periodo_nombre VARCHAR(20),
    IN fecha_inicio DATE,
    IN fecha_fin DATE,
    OUT periodo_id INT
)
BEGIN
    -- Insertar el nuevo período
    INSERT INTO periodo (periodo_nombre, fecha_inicio, fecha_fin)
    VALUES (periodo_nombre, fecha_inicio, fecha_fin);

    -- Obtener el ID del período recién insertado
    SET periodo_id = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerEstudiantesPorSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerEstudiantesPorSeccion`(IN seccion_id INT)
BEGIN
    SELECT 
        CONCAT(e.nombre, ' ', e.apellido) AS nombre_completo,
        e.dni,
        e.fecha_nacimiento AS fecha_nacimiento, m.id_seccion AS id_seccion
    FROM 
        matricula m
    INNER JOIN 
        estudiante e ON m.id_estudiante = e.id_estudiante;
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizarUsuario`(
    IN p_id_usuario INT,
    IN p_nombre_usuario VARCHAR(50),
    IN p_contrasena VARCHAR(50),
    IN p_rol VARCHAR(50),
    IN p_nombre_completo VARCHAR(100),
    IN p_correo VARCHAR(100)
)
BEGIN
    UPDATE usuarios
    SET nombre_usuario = p_nombre_usuario,
        contrasena = p_contrasena,
        rol = p_rol,
        nombre_completo = p_nombre_completo,
        correo = p_correo
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_agregarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_agregarUsuario`(
    IN p_nombre_usuario VARCHAR(50),
    IN p_contrasena VARCHAR(50),
    IN p_rol VARCHAR(50),
    IN p_nombre_completo VARCHAR(100),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO usuarios (nombre_usuario, contrasena, rol, nombre_completo, correo)
    VALUES (p_nombre_usuario, p_contrasena, p_rol, p_nombre_completo, p_correo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminarUsuario`(IN p_id_usuario INT)
BEGIN
    DELETE FROM usuarios
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarUsuario`()
BEGIN
    SELECT id_usuario, nombre_usuario, contrasena, rol, nombre_completo, correo
    FROM usuarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_validarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validarUsuario`(IN p_nombre_usuario VARCHAR(50), IN p_contrasena VARCHAR(50))
BEGIN
    SELECT id_usuario, nombre_usuario, contrasena, rol, nombre_completo, correo
    FROM usuario
    WHERE nombre_usuario = p_nombre_usuario AND contrasena = p_contrasena;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-20 13:13:00
