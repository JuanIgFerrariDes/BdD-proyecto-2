#Crear las tablas y bases de datos
\. vuelosP1.sql

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
	hora_sale, hora_llega, SUBTIME(hora_llega, hora_sale) AS tiempo_estimado, 
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



