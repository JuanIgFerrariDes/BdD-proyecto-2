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

#TABLAS NECESARIAS:
#salidas, instancias_vuelo, vuelos_programados, aeropuertos (x2), brinda, clase, asientos reservados
# 
#
/*
Subconsulta 1: 
Numero de vuelo (nro vuelo), modelo de avion (modelo), fecha (fecha), dıa de salida
(dia sale), hora de salida (hora sale), hora de llegada (hora llega) y tiempo estimado
de vuelo (tiempo estimado). Puede asumir que no hay vuelos que duren m´as de 24 hs.
para calcular el tiempo estimado de vuelo.

SELECT vuelo AS nro_vuelo, modelo_avion AS modelo, fecha, dia AS dia_sale, 
	hora_sale, hora_llega, subtime(hora_llega, hora_sale) AS tiempo_estimado
FROM (salidas NATURAL JOIN instancias_vuelo) 

esquema: (vuelo, dia, hora_sale, hora_llega, modelo_avion, fecha, estado)


Subconsulta 2: 
Codigo, nombre, ciudad, estado y paıs del aeropuerto tanto de salida (codigo aero sale,
nombre aero sale, ciudad sale, estado sale, pais sale) como de llegada
(codigo aero llega, nombre aero llega, ciudad llega, estado llega, pais llega).

SELECT numero, vs.aeropuerto_salida AS codigo_aero_sale, vs.nombre AS nombre_aero_sale,
	   vs.ciudad AS ciudad_sale, vs.estado AS estado_sale, vs.pais AS pais_sale,
	   alle.codigo AS codigo_aero_llega, alle.nombre AS nombre_aero_llega,
	   alle.ciudad AS ciudad_llega, alle.estado AS estado_llega, alle.pais AS pais_llega
FROM (vuelos_programados vp JOIN aeropuertos asal ON vp.aeropuerto_salida=asal.codigo) vs
	 JOIN aeropuertos alle ON vs.aeropuerto_llegada=alle.codigo

esquema: (numero, aeropuerto_salida, aeropuerto_llegada, asal.nombre, asal.telefono. asal.direccion, 
          asal.pais, asal.estado, asal.ciudad, alle.nombre. alle.telefono, alle.direccion,
          alle.pais, alle.estado, alle.ciudad)

Subconsulta1 JOIN Subconsulta2 ON nro_vuelo


Sunconsulta 3:
Precio del pasaje (precio) y cantidad de asientos disponibles (asientos disponibles) en
cada clase (clase) brindada por la salida asociada a la instancia de vuelo.

SELECT vuelo, dia, bar.precio AS precio, bar.clase AS clase, 
	   ((1+c.porcentaje)*bar.cant_asientos)-bar.cantidad AS asientos_disponibles
FROM (brinda NATURAL JOIN asientos_reservados) bar
	  JOIN
	  clases c ON bar.clase=c.nombre 

esquema: (vuelo, dia, clase, precio, cant_asientos, fecha, cantidad, porcentaje)

*/

CREATE VIEW vuelos_disponibles AS
SELECT sc13.nro_vuelo AS nro_vuelo, sc13.modelo AS modelo, sc13.fecha AS fecha,
       sc13.dia_sale AS dia_sale, sc13.hora_sale AS hora_sale, sc13.hora_llega AS hora_llega,
       sc13.tiempo_estimado AS tiempo_estimado,
       sc2.codigo_aero_sale AS codigo_aero_sale, sc2.nombre_aero_sale AS nombre_aero_sale,
       sc2.ciudad_sale AS ciudad_sale, sc2.estado_sale AS estado_sale, sc2.pais_sale AS pais_sale,
       sc2.codigo_aero_llega AS codigo_aero_llega, sc2.nombre_aero_llega AS nombre_aero_llega,
       sc2.ciudad_sale AS ciudad_llega, sc2.estado_sale AS estado_llega, sc2.pais_llega AS pais_llega,
       sc13.precio AS precio, sc13.clase AS clase, sc13.asientos_disponibles AS asientos_disponibles

FROM ((SELECT vuelo AS nro_vuelo, modelo_avion AS modelo, fecha, dia AS dia_sale, 
			 hora_sale, hora_llega, subtime(hora_llega, hora_sale) AS tiempo_estimado
	  FROM (salidas NATURAL JOIN instancias_vuelo)) subCon1
	  JOIN 
	  (SELECT vuelo, bar.precio AS precio, bar.clase AS clase, 
	   		  ((1+c.porcentaje)*bar.cant_asientos)-bar.cantidad AS asientos_disponibles
	   FROM (brinda NATURAL JOIN asientos_reservados) bar
	         JOIN
	  		 clases c ON bar.clase=c.nombre ) subCon3 ON subCon1.nro_vuelo=subCon3.vuelo and 
	  													 subCon1.dia_sale=subCon3.dia) sc13
	  JOIN
	  (SELECT numero, vs.aeropuerto_salida AS codigo_aero_sale, vs.nombre AS nombre_aero_sale,
	   		  vs.ciudad AS ciudad_sale, vs.estado AS estado_sale, vs.pais AS pais_sale,
	          alle.codigo AS codigo_aero_llega, alle.nombre AS nombre_aero_llega,
	   		  alle.ciudad AS ciudad_llega, alle.estado AS estado_llega, alle.pais AS pais_llega
	   FROM (vuelos_programados vp JOIN aeropuertos asal ON vp.aeropuerto_salida=asal.codigo) vs
	 		 JOIN aeropuertos alle ON vs.aeropuerto_llegada=alle.codigo) sc2 ON sc13.nro_vuelo=sc2.numero



#Creacion del usuario cliente
#El usuario cliente solo tendra privilegio de lectura sobre la vista vuelos_disponibles, debera poder
#conectarse desde cualquier dominio y su password debera ser cliente

CREATE USER 'cliente'@'%' IDENTIFIED BY 'cliente';
GRANT SELECT ON vuelos_disponibles TO 'cliente'@'%';
