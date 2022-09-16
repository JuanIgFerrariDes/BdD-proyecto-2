
#CREACION DE LA BASE DE DATOS VUELOS#
CREATE DATABASE vuelos;
USE vuelos;



#CREACION TABLAS#

#--Tabla Ubicaciones--
CREATE TABLE ubicaciones (
	pais VARCHAR(45) NOT NULL,
	estado VARCHAR(45) NOT NULL,
	ciudad VARCHAR(45) NOT NULL,
	huso TINYINT NOT NULL,

	CONSTRAINT ubicaciones_huso_intervalo
	CHECK (-12 <= huso and huso <= 12),

	CONSTRAINT pk_ubicaciones
	PRIMARY KEY (pais, estado, ciudad)

) ENGINE=InnoDB;


#--Tabla aeropuertos--
CREATE TABLE aeropuertos (
	codigo VARCHAR(45) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	telefono VARCHAR(45) NOT NULL,
	direccion VARCHAR(45) NOT NULL,
	pais VARCHAR(45) NOT NULL,
	estado VARCHAR(45) NOT NULL,
	ciudad VARCHAR(45) NOT NULL,

	CONSTRAINT pk_aeropuertos
	PRIMARY KEY (codigo),

	CONSTRAINT fk_aeropuertos_ubicacion
	FOREIGN KEY (pais, estado, ciudad) REFERENCES ubicaciones (pais, estado, ciudad)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla vuelos_programados
CREATE TABLE vuelos_programados(
	numero VARCHAR(45) NOT NULL,
	aeropuerto_salida VARCHAR(45) NOT NULL,
	aeropuerto_llegada VARCHAR(45) NOT NULL,

	CONSTRAINT pk_vuelos_programados
	PRIMARY KEY (numero),

	CONSTRAINT fk_vuelos_programados_aeropuertos_salida
	FOREIGN KEY (aeropuerto_salida) REFERENCES aeropuertos (codigo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_vuelos_programados_aeropuerto_llegada
	FOREIGN KEY (aeropuerto_salida) REFERENCES aeropuertos (codigo)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla modelos_avion--
CREATE TABLE modelos_avion (
	modelo VARCHAR(45) NOT NULL,
	fabricante VARCHAR(45) NOT NULL,
	cabinas INT UNSIGNED NOT NULL,
	cant_asientos INT UNSIGNED NOT NULL,

	CONSTRAINT pk_modelos_avion
	PRIMARY KEY (modelo)

) ENGINE=InnoDB;


#--Tabla salidas--
CREATE TABLE salidas (
	vuelo VARCHAR(45) NOT NULL,
	dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
	hora_sale TIME NOT NULL,
	hora_llega TIME NOT NULL,
	modelo_avion VARCHAR(45) NOT NULL,

	CONSTRAINT pk_salidas_vuelo
	PRIMARY KEY (vuelo, dia),

	CONSTRAINT fk_salidas_vuelos_programados
	FOREIGN KEY (vuelo) REFERENCES vuelos_programados (numero)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_salidas_modelos_avion
	FOREIGN KEY (modelo_avion) REFERENCES modelos_avion (modelo)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla instancias_vuelo--
CREATE TABLE instancias_vuelo (
	vuelo VARCHAR(45) NOT NULL,
	fecha DATE NOT NULL,
	dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
	estado VARCHAR(45) NOT NULL,

	CONSTRAINT pk_instancias_vuelo_vuelo
	PRIMARY KEY (vuelo, fecha),

	CONSTRAINT fk_instancias_vuelo_salidas
	FOREIGN KEY (vuelo, dia) REFERENCES salidas (vuelo, dia)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla clases--
CREATE TABLE clases (
	nombre VARCHAR(45) NOT NULL,
	porcentaje DECIMAL(2,2) NOT NULL,

	CONSTRAINT pk_clases
	PRIMARY KEY (nombre)

) ENGINE=InnoDB;

#--Tabla Comodidades--
CREATE TABLE comodidades (
	codigo INT UNSIGNED NOT NULL,
	descripcion VARCHAR(45) NOT NULL,

	CONSTRAINT pk_comodidades
	PRIMARY KEY (codigo)

) ENGINE=InnoDB;


