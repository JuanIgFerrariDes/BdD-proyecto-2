#CREACION DE LA BASE DE DATOS VUELOS#
CREATE DATABASE vuelos;
USE vuelos;



#CREACION TABLAS#

#--Tabla Ubicaciones--
CREATE TABLE ubicaciones (
	pais VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	ciudad VARCHAR(20) NOT NULL,
	huso TINYINT NOT NULL,

	CONSTRAINT ubicaciones_huso_intervalo
	CHECK (-12 <= huso and huso <= 12),

	CONSTRAINT pk_ubicaciones
	PRIMARY KEY (pais, estado, ciudad)

) ENGINE=InnoDB;


#--Tabla aeropuertos--
CREATE TABLE aeropuertos (
	codigo VARCHAR(45) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	telefono VARCHAR(15) NOT NULL,
	direccion VARCHAR(30) NOT NULL,
	pais VARCHAR(20) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	ciudad VARCHAR(20) NOT NULL,

	CONSTRAINT pk_aeropuertos
	PRIMARY KEY (codigo),

	CONSTRAINT fk_aeropuertos_ubicacion
	FOREIGN KEY (pais, estado, ciudad) REFERENCES ubicaciones (pais, estado, ciudad)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla vuelos_programados
CREATE TABLE vuelos_programados(
	numero VARCHAR(10) NOT NULL,
	aeropuerto_salida VARCHAR(45) NOT NULL,
	aeropuerto_llegada VARCHAR(45) NOT NULL,

	CONSTRAINT pk_vuelos_programados
	PRIMARY KEY (numero),

	CONSTRAINT fk_vuelos_programados_aeropuertos_salida
	FOREIGN KEY (aeropuerto_salida) REFERENCES aeropuertos (codigo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT fk_vuelos_programados_aeropuerto_llegada
	FOREIGN KEY (aeropuerto_llegada) REFERENCES aeropuertos (codigo)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla modelos_avion--
CREATE TABLE modelos_avion (
	modelo VARCHAR(20) NOT NULL,
	fabricante VARCHAR(20) NOT NULL,
	cabinas INT UNSIGNED NOT NULL,
	cant_asientos INT UNSIGNED NOT NULL,

	CONSTRAINT pk_modelos_avion
	PRIMARY KEY (modelo)

) ENGINE=InnoDB;


#--Tabla salidas--
CREATE TABLE salidas (
	vuelo VARCHAR(10) NOT NULL,
	dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
	hora_sale TIME NOT NULL,
	hora_llega TIME NOT NULL,
	modelo_avion VARCHAR(20) NOT NULL,

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
	vuelo VARCHAR(10) NOT NULL,
	fecha DATE NOT NULL,
	dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
	estado VARCHAR(15),

	CONSTRAINT pk_instancias_vuelo_vuelo
	PRIMARY KEY (vuelo, fecha),

	CONSTRAINT fk_instancias_vuelo_salidas
	FOREIGN KEY (vuelo, dia) REFERENCES salidas (vuelo, dia)
		ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB;


#--Tabla clases--
CREATE TABLE clases (
	nombre VARCHAR(20) NOT NULL,
	porcentaje DECIMAL(2,2) UNSIGNED NOT NULL,

	CONSTRAINT pk_clases
	PRIMARY KEY (nombre)

) ENGINE=InnoDB;

#--Tabla Comodidades--
CREATE TABLE comodidades (
	codigo INT UNSIGNED NOT NULL,
	descripcion TINYTEXT NOT NULL,

	CONSTRAINT pk_comodidades
	PRIMARY KEY (codigo)

) ENGINE=InnoDB;

#--Tabla Pasajeros--
CREATE TABLE pasajeros (
    doc_tipo VARCHAR(45) NOT NULL,
    doc_nro INT UNSIGNED NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    nacionalidad VARCHAR(20) NOT NULL,

    CONSTRAINT pk_pasajeros
    PRIMARY KEY (doc_tipo, doc_nro)

) ENGINE=InnoDB;

#--Tabla Empleados--
CREATE TABLE empleados(
    legajo INT UNSIGNED NOT NULL,
    password VARCHAR(32) NOT NULL,
    doc_tipo VARCHAR(45) NOT NULL,
    doc_nro INT UNSIGNED NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    telefono VARCHAR(15) NOT NULL,

    CONSTRAINT pk_empleados
    PRIMARY KEY (legajo)
) ENGINE=InnoDB;

#--Tabla Reservas--
CREATE TABLE reservas(
    numero INT UNSIGNED AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    vencimiento DATE NOT NULL,
    estado VARCHAR(15) NOT NULL,
    doc_tipo VARCHAR(45) NOT NULL,
    doc_nro INT UNSIGNED NOT NULL,
    legajo INT UNSIGNED NOT NULL,

    CONSTRAINT FK_pasajeros_docNro_reservas
    FOREIGN KEY (doc_tipo, doc_nro) REFERENCES pasajeros (doc_tipo, doc_nro)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_empleados_reserva_reservas
    FOREIGN KEY (legajo) REFERENCES empleados(legajo)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT pk_reservas
    PRIMARY KEY (numero)
) ENGINE=InnoDB;

#--Tabla Brinda--
CREATE TABLE brinda (
    vuelo VARCHAR(10) NOT NULL,
    dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
    clase VARCHAR(20) NOT NULL,
    precio DECIMAL(7,2) UNSIGNED NOT NULL,
    cant_asientos INT UNSIGNED NOT NULL,

    CONSTRAINT FK_salida_vuelo_brinda
    FOREIGN KEY (vuelo, dia) REFERENCES salidas(vuelo, dia)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_clase_nombre_brinda_brinda
    FOREIGN KEY (clase) REFERENCES clases(nombre)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT pk_brinda
    PRIMARY KEY (vuelo, dia, clase)

) ENGINE=InnoDB;

#--Tabla Posee--
CREATE TABLE posee(
    clase VARCHAR(20) NOT NULL,
    comodidad INT UNSIGNED NOT NULL,

    CONSTRAINT FK_clase_nombre_brinda_posee
    FOREIGN KEY (clase) REFERENCES clases(nombre)
        ON DELETE RESTRICT ON UPDATE CASCADE,


    CONSTRAINT FK_comodidad_nombre_brinda
    FOREIGN KEY (comodidad) REFERENCES comodidades(codigo)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT pk_posee
    PRIMARY KEY(clase,comodidad)
) ENGINE=InnoDB;

#--Tabla Reserva vuelo clase--
CREATE TABLE reserva_vuelo_clase(
    numero INT UNSIGNED NOT NULL,
    vuelo VARCHAR(10) NOT NULL,
    fecha_vuelo DATE NOT NULL,
    clase VARCHAR(20) NOT NULL,

    CONSTRAINT FK_numero_rvc_reserva
    FOREIGN KEY (numero) REFERENCES reservas(numero)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_vuelo_rvc_vuelo_reserva_vuelo_clase
    FOREIGN KEY (vuelo, fecha_vuelo) REFERENCES instancias_vuelo(vuelo, fecha)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_clase_nombre_brinda_reserva_vuelo_clase
    FOREIGN KEY (clase) REFERENCES clases(nombre)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT pk_reserva_vuelo_clase
    PRIMARY KEY(numero, vuelo, fecha_vuelo)
) ENGINE=InnoDB;

#--Tabla Asientos reservadose--
CREATE TABLE asientos_reservados(
    vuelo VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    clase VARCHAR(20) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,

    CONSTRAINT FK_vuelo_rvc_vuelo_asientos_reservados
    FOREIGN KEY (vuelo, fecha) REFERENCES instancias_vuelo(vuelo, fecha)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT FK_clase_nombre_brinda_asientos_reservados
    FOREIGN KEY (clase) REFERENCES clases(nombre)
        ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT pk_asientos_reservados
    PRIMARY KEY(vuelo, fecha, clase)
) ENGINE=InnoDB;

#Crear usuarios

#admin: 
#tiene acceso total sobre todas las tablas, con la opcion de crear usuarios y otorgar privilegios
#sobre las mismas. se restringira que el acceso de este usuario
#se realice solo desde la maquina local donde se encuentra el servidor MySQL. El password de
#este usuario debera ser admin.

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON vuelos.* TO 'admin'@'localhost' WITH GRANT OPTION;


#empleado:
#Para las consultas necesitara acceso de lectura sobre todas las tablas de la b.d. vuelos. Para las reservas necesitara
#ademas privilegios para ingresar, modificar y borrar datos sobre las tablas reservas, pasajeros y
#reserva_vuelo_clase
#Este usuario debera poder conectarse desde cualquier dominio.
#El password del empleado debera ser empleado

CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado';
GRANT SELECT ON vuelos.* TO	'empleado'@'%';
GRANT INSERT, UPDATE, DELETE ON vuelos.reservas TO 'empleado'@'%';
GRANT INSERT, UPDATE, DELETE ON vuelos.pasajeros TO 'empleado'@'%';
GRANT INSERT, UPDATE, DELETE ON vuelos.reserva_vuelo_clase TO 'empleado'@'%';


#cliente:

#Creacion vista
#Atributos a mostrar:
#(nro_vuelo, modelo, fecha, dia_sale, hora_sale, hora_llega, tiempo_estimado,
# codigo_aero_sale, nombre_aero_sale, ciudad_sale, estado_sale, pais_sale,
# codigo_aero_llega, nobre_aero_llega, ciudad_llega, estado_llega, pais_llega,
# precio, asientos_disponibles, clase)

#TABLAS NECESARIAS:
#salidas, instancias_vuelo, vuelos_programados, aeropuertos (x2), 
#brinda, clase, asientos reservados
# 
CREATE VIEW vuelos_disponibles AS
SELECT s.vuelo AS nro_vuelo, s.modelo_avion AS modelo, fecha, dia AS dia_sale,
	hora_sale, hora_llega, 
	IF(hora_llega<hora_sale, TIMEDIFF('24:00:00',TIMEDIFF(hora_sale, hora_llega)),TIMEDIFF(hora_llega, hora_sale)) AS tiempo_estimado, 
	ASal.codigo AS codigo_aero_sale, ASal.nombre AS nombre_aero_sale, 
	ASal.ciudad AS ciudad_sale, Asal.estado AS estado_sale, ASal.pais AS pais_sale,
	ALle.codigo AS codigo_aero_llega,  ALle.nombre AS nombre_aero_llega,
	ALle.ciudad AS ciudad_llega, ALle.estado AS estado_llega, ALle.pais AS pais_llega,
	precio, 
	ROUND(((1+C.porcentaje)*BR.cant_asientos-AR.cantidad),0) AS asientos_disponibles,
	C.nombre AS clase

FROM salidas S
     NATURAL JOIN instancias_vuelo IV
     JOIN vuelos_programados VP ON IV.vuelo=VP.numero
     JOIN aeropuertos ASal ON VP.aeropuerto_salida=ASal.codigo
     JOIN aeropuertos ALle ON VP.aeropuerto_llegada=ALle.codigo
     NATURAL JOIN brinda BR
     JOIN clases C ON BR.clase=C.nombre
     NATURAL JOIN asientos_reservados AR
;

#Creacion del usuario cliente
#El usuario cliente solo tendra privilegio de lectura sobre la vista vuelos_disponibles, debera poder
#conectarse desde cualquier dominio y su password debera ser cliente

CREATE USER 'cliente'@'%' IDENTIFIED BY 'cliente';
GRANT SELECT ON vuelos_disponibles TO 'cliente'@'%';
