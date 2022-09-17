CREATE TABLE pasajeros (
	doc_tipo VARCHAR(64) NOT NULL,
	doc_nro INT UNSIGNED NOT NULL,
	apellido VARCHAR(64) NOT NULL,
	nombre VARCHAR(64) NOT NULL,
	direccion VARCHAR(64) NOT NULL,
	telefono VARCHAR(64) NOT NULL,
	nacionalidad VARCHAR(64) NOT NULL,
	KEY (doc_nro, doc_tipo)
) ENGINE=InnoDB;

CREATE TABLE empleados(
	legajo INT UNSIGNED NOT NULL,
	password VARCHAR(32) NOT NULL,
	doc_tipo VARCHAR(64) NOT NULL,	
	doc_nro INT UNSIGNED NOT NULL,
	apellido VARCHAR(64) NOT NULL,
	nombre VARCHAR(64) NOT NULL,
	direccion VARCHAR(64) NOT NULL,
	telefono VARCHAR(64) NOT NULL,
	KEY (legajo)
) ENGINE=InnoDB;

CREATE TABLE reservas(
	numero INT UNSIGNED NOT NULL,
	fecha DATE NOT NULL,
	vencimiento DATE NOT NULL,
	estado VARCHAR(64) NOT NULL,
	doc_tipo VARCHAR(64) NOT NULL,	
	doc_nro INT UNSIGNED NOT NULL,
	legajo INT UNSIGNED NOT NULL,

	CONSTRAINT FK_pasajeros_docNro_reservas
	FOREIGN KEY (doc_nro) REFERENCES pasajeros(doc_nro)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_empleados_reserva_reservas
	FOREIGN KEY (legajo) REFERENCES pasajeros(legajo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	KEY (numero)
) ENGINE=InnoDB;

CREATE TABLE brinda (
	vuelo VARCHAR(45) NOT NULL,
	dia ENUM('Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa') NOT NULL,
	clase VARCHAR(45) NOT NULL,
	precio INT UNSIGNED NOT NULL,
	cant_asientos INT UNSIGNED NOT NULL

	CONSTRAINT FK_salida_vuelo_brinda
	FOREIGN KEY (vuelo) REFERENCES salidas(vuelo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_salida_dia_brinda
	FOREIGN KEY (dia) REFERENCES salidas(dia)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_clase_nombre_brinda
	FOREIGN KEY (clase) REFERENCES clases(nombre)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	KEY (vuelo, dia, clase)
) ENGINE=InnoDB;

CREATE TABLE posee(
	clase VARCHAR(45) NOT NULL,
	comodidad INT UNSIGNED NOT NULL,

	CONSTRAINT FK_clase_nombre_brinda
	FOREIGN KEY (clase) REFERENCES clases(nombre)
		ON DELETE RESTRICT ON UPDATE CASCADE,


	CONSTRAINT FK_clase_nombre_brinda
	FOREIGN KEY (comodidad) REFERENCES comodidades(codigo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	KEY(clase,comodidad)
) ENGINE=InnoDB;

CREATE TABLE reserva_vuelo_clase(
	numero INT UNSIGNED NOT NULL,
	vuelo VARCHAR(45) NOT NULL,
	fecha_vuelo DATE NOT NULL,
	clase nombre VARCHAR(45) NOT NULL,

	CONSTRAINT FK_numero_rvc_reserva
	FOREIGN KEY (numero) REFERENCES reservas(numero)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_vuelo_rvc_vuelo
	FOREIGN KEY (vuelo) REFERENCES instancias_vuelo(vuelo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_fecha_rvc_vuelo
	FOREIGN KEY (fecha_vuelo) REFERENCES instancias_vuelo(fecha)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	KEY(numero, vuelo, fecha_vuelo)
) ENGINE=InnoDB;

CREATE TABLE asientos_reservados(
	vuelo VARCHAR(45) NOT NULL,
	fecha DATE NOT NULL,
	clase VARCHAR(45) NOT NULL,
	cantidad INT UNSIGNED NOT NULL,

	CONSTRAINT FK_vuelo_rvc_vuelo
	FOREIGN KEY (vuelo) REFERENCES instancias_vuelo(vuelo)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_vuelo_rvc_fecha
	FOREIGN KEY (fecha) REFERENCES instancias_vuelo(fecha)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	CONSTRAINT FK_clase_nombre_brinda
	FOREIGN KEY (clase) REFERENCES clases(nombre)
		ON DELETE RESTRICT ON UPDATE CASCADE,

	KEY(vuelo, fecha, clase)
) ENGINE=InnoDB;
