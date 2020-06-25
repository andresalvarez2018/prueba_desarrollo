CREATE database prueba ;

CREATE TABLE `appx_educationlevel1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

CREATE TABLE `appx_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) DEFAULT NULL,
  `department_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 

CREATE TABLE `appx_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `educationlevel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_department_idx` (`department_id`),
  KEY `employee_educationlevel_idx` (`educationlevel_id`),
  CONSTRAINT `employee_department` FOREIGN KEY (`department_id`) REFERENCES `appx_department` (`id`),
  CONSTRAINT `employee_educationlevel` FOREIGN KEY (`educationlevel_id`) REFERENCES `appx_educationlevel` (`id`)
) 

INSERT INTO appx_department (department_name, department_city) VALUES ('cundinamarca', 'bogota');
INSERT INTO appx_department (department_name, department_city) VALUES ('cundinamarca', 'chia');
INSERT INTO appx_department (department_name, department_city) VALUES ('cundinamarca', 'mosquera');

INSERT INTO appx_educationlevel (description) VALUES ('profesional');
INSERT INTO appx_educationlevel (description) VALUES ('tecnico');
INSERT INTO appx_educationlevel (description) VALUES ('bachiller');
INSERT INTO appx_educationlevel (description) VALUES ('especializacion');

INSERT INTO appx_employee (firstname, lastname, department_id, salary, educationlevel_id) VALUES ('andres', 'alvarez', '1', '1300000', '1');
INSERT INTO appx_employee (firstname, lastname, department_id, salary, educationlevel_id) VALUES ('carlos', 'sierra', '2', '2500000', '2');
INSERT INTO appx_employee (firstname, lastname, department_id, salary, educationlevel_id) VALUES ('diana patricia', 'perea', '3', '1800000', '3');
