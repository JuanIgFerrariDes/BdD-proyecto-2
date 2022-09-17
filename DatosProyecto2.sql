INSERT INTO ubicaciones VALUES ("Germany", "Brandeburgo", "Schönefeld", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "Buenos Aires", "Ezeiza", -3);
INSERT INTO ubicaciones VALUES ("France", "Île-de-France", "Roissy-en-France", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "Buenos Aires", "Bahia Blanca", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "Ciudad Autonoma de Buenos Aires", "Buenos Aires", +2);

INSERT INTO aeropuerto VALUES ("BHI", "Comandante Espora", "0291 486-0319", "Ex Ruta 3 Norte KM 675", "Argentina", "Buenos Aires", "Bahia Blanca");
INSERT INTO aeropuerto VALUES ("EZE", "Aeropuerto Internacional Ministro Pistarini", "011 5480-6111", "AU Tte. Gral. Pablo Riccheri Km 33,5", "Argentina", "Buenos Aires", "Ezeiza");
INSERT INTO aeropuerto VALUES ("AEP", "Aeroparque Metropolitano Jorge Newbery", "011 5480-6111", "Av. Costanera Rafael Obligado", "Argentina", "Ciudad Autonoma de Buenos Aires", "Buenos Aires");
INSERT INTO aeropuerto VALUES ("CDG", "Aeropuerto Internacional de Paris-Charles de Gaulle", "+33 170 363 950", "95700 Roissy-en-France", "France", "Île-de-France", "Roissy-en-France");
INSERT INTO aeropuerto VALUES ("BER", "Aeropuerto de Berlín-Brandeburgo Willy Brandt", "+49 306 0916 0910", "12529 Schönefeld", "Germany", "Brandeburgo", "Schönefeld");

INSERT INTO vuelos_programados VALUES ("AF 229", "EZE", "CDG");
INSERT INTO vuelos_programados VALUES ("AF 1734", "CDG", "BER");
INSERT INTO vuelos_programados VALUES ("AR 1622", "AEP", "BHI");

INSERT INTO modelos_avion VALUES ("Embraer 190", "Embraer", 2, 98);
INSERT INTO modelos_avion VALUES ("Boeing 787-9", "Boeing", 4, 216);
INSERT INTO modelos_avion VALUES ("Airbus A320-200", "Airbus", 3, 180);
INSERT INTO modelos_avion VALUES ("Airbus A380-800", "Airbus", 4, 469);

INSERT INTO salidas VALUES ("AF 229", "Vi", 13:25:00, 07:40:00, "Boeing 787-9");
INSERT INTO salidas VALUES ("AF 1734", "Sa", 9:30:00, 11:35:00, "Airbus A320-200");
INSERT INTO salidas VALUES ("AR 1622", "Lu", 11:20:00, 12:45:00, "Embraer 190");

INSERT INTO instancias_vuelo VALUES ("AF 229", 2022-09-16, "Vi", "Finalizado");
INSERT INTO instancias_vuelo VALUES ("AF 1734", 2022-09-17, "Sa", "Finalizado");
INSERT INTO instancias_vuelo VALUES ("AF 1734", 2022-09-24, "Sa", "Programado");
INSERT INTO instancias_vuelo VALUES ("AR 1622", 2022-08-15, "Lu", "Finalizado");
INSERT INTO instancias_vuelo VALUES ("AR 1622", 2021-03-15, "Lu", "Finalizado");

INSERT INTO clases VALUES ("Economy",0);
INSERT INTO clases VALUES ("Premium Economy",0.33);
INSERT INTO clases VALUES ("Business",0.66);
INSERT INTO clases VALUES ("First",0.99);

INSERT INTO comodidades VALUES (112, "Apoyabrazos rebatibles");
INSERT INTO comodidades VALUES (9098, "USB (tomacorriente)");
INSERT INTO comodidades VALUES (754, "Pantalla 12´ en respaldar del asiento");
INSERT INTO comodidades VALUES (87, "Pantalla 9´ en respaldar del asiento");
INSERT INTO comodidades VALUES (141, "Asientos extra anchos");
INSERT INTO comodidades VALUES (568, "Catering Premium");
INSERT INTO comodidades VALUES (22, "Mantas");
INSERT INTO comodidades VALUES (40, "Kit de viaje");

INSERT INTO pasajeros VALUES ("DNI", 24746279, "Gomez", "Pedro", "Arroyo 23", "291 534-5250", "Argentina");
INSERT INTO pasajeros VALUES ("DNI", 34351951, "Jorge", "Patricia", "Roca 1203", "341 379-1365", "Argentina");
INSERT INTO pasajeros VALUES ("DNI", 41789216, "Fernandez", "Juan Mateo", "Florida 143", "341 331-6851", "Argentina");
INSERT INTO pasajeros VALUES ("DNI", 45231029, "Salamandra", "Agustín", "Avenida Libertadores 880", "341 329-5157", "Argentina");
INSERT INTO pasajeros VALUES ("Pasaporte Republica Checa", 9909054, "Hrůša", "Jakub", "Mußstraße 1", "+49 951 9647200", "Republica Checa");

INSERT INTO empleados VALUES (134142, "admin", "DNI", 39891823, "Uriel", "Ivan", "Caballito 6000", "291 454-0129");
INSERT INTO empleados VALUES (136784, "12345678", "DNI", 37106893, "Galinga", "Juana", "Yapeyu 424", "291 411-7777");
INSERT INTO empleados VALUES (124621, "TRjTHx&4V4cvH61p&aChx2%a", "DNI", 41205938, "de Metz", "Laura", "Los Olmos 19", "291 526-3241");

INSERT INTO reservas VALUES (1313, 2022-09-01, 2022-12-01, "Usada", "DNI", 45231029, 124621);
INSERT INTO reservas VALUES (991, 2021-01-13, 2021-04-11, "Vencida", "DNI", 45231029, 124621);
INSERT INTO reservas VALUES (1341, 2022-09-17, 2023-12-17, "En espera", "Pasaporte Republica Checa", 9909054, 134142);
INSERT INTO reservas VALUES (1000, 2021-02-01, 2021-05-01, "Usada", "DNI", 34351951, 136784);
INSERT INTO reservas VALUES (1498, 2021-08-10, 2021-11-10, "En espera", "DNI", 41789216, 136784);
INSERT INTO reservas VALUES (1499, 2021-08-11, 2021-11-11, "En espera", "DNI", 24746279, 136784);

INSERT INTO brinda VALUES ("AF 229", "Vi", "Economy", 250000.00,146);
INSERT INTO brinda VALUES ("AF 229", "Vi", "Premium Economy", 300000.00,40);
INSERT INTO brinda VALUES ("AF 229", "Vi", "Business", 400000.00,16);
INSERT INTO brinda VALUES ("AF 229", "Vi", "First", 600000.00,14);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Economy", 200000.00,120);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Premium Economy", 280000.00,36);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Business", 390000.00,24);
INSERT INTO brinda VALUES ("AR 1622", "Lu", "Economy", 100000.00, 80);
INSERT INTO brinda VALUES ("AR 1622", "Lu", "Economy Premium", 200000, 18);

INSERT INTO posee VALUES ("Economy", 87);
INSERT INTO posee VALUES ("Economy Premium", 87);
INSERT INTO posee VALUES ("Economy Premium", 112);
INSERT INTO posee VALUES ("Economy Premium", 9098);
INSERT INTO posee VALUES ("Business", 754);
INSERT INTO posee VALUES ("Business", 112);
INSERT INTO posee VALUES ("Business", 141);
INSERT INTO posee VALUES ("Business", 22);
INSERT INTO posee VALUES ("Business", 40);
INSERT INTO posee VALUES ("First", 112);
INSERT INTO posee VALUES ("First", 9098);
INSERT INTO posee VALUES ("First", 754);
INSERT INTO posee VALUES ("First", 141);
INSERT INTO posee VALUES ("First", 568);
INSERT INTO posee VALUES ("First", 22);
INSERT INTO posee VALUES ("First", 40);

INSERT INTO reserva_vuelo_clase VALUES (1313, "AR 1622", 2022-08-15, "Economy");
INSERT INTO reserva_vuelo_clase VALUES (991, "AR 1622", 2021-03-15, "First");
INSERT INTO reserva_vuelo_clase VALUES (1341, "AF 1734", 2022-09-24, "Business");
INSERT INTO reserva_vuelo_clase VALUES (1000, "AF 229", 2022-09-16, "Economy");
INSERT INTO reserva_vuelo_clase VALUES (1498, "AF 1734", 2022-09-24, "Economy Premium");
INSERT INTO reserva_vuelo_clase VALUES (1499, "AF 1734", 2022-09-24, "Business");

INSERT INTO asientos_reservados VALUES ("AR 1622", 2022-08-15, "Economy", 76);
INSERT INTO asientos_reservados VALUES ("AR 1622", 2022-08-15, "Economy Premium", 6);
INSERT INTO asientos_reservados VALUES ("AR 1622", 2021-03-15, "Economy", 41);
INSERT INTO asientos_reservados VALUES ("AR 1622", 2021-03-15, "Economy Premium", 2);
INSERT INTO asientos_reservados VALUES ("AF 229", 2022-09-16, "Economy", 130);
INSERT INTO asientos_reservados VALUES ("AF 229", 2022-09-16, "Economy Premium", 30);
INSERT INTO asientos_reservados VALUES ("AF 229", 2022-09-16, "Business", 8);
INSERT INTO asientos_reservados VALUES ("AF 229", 2022-09-16, "First", 6);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-17, "Economy", 80);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-17, "Economy Premium", 30);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-17, "Business", 14);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-14, "Economy", 50);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-24, "Economy Premium", 15);
INSERT INTO asientos_reservados VALUES ("AF 1734", 2022-09-24, "Business", 4);