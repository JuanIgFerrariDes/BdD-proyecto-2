INSERT INTO ubicaciones VALUES ("Germany", "Brandeburgo", "Schönefeld", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "Buenos Aires", "Ezeiza", -3);
INSERT INTO ubicaciones VALUES ("France", "Île-de-France", "Roissy-en-France", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "Buenos Aires", "Bahia Blanca", +2);
INSERT INTO ubicaciones VALUES ("Argentina", "CABA", "Buenos Aires", +2);

INSERT INTO aeropuertos VALUES ("BHI", "Comandante Espora", "0291 486-0319", "Ex Ruta 3 Norte KM 675", "Argentina", "Buenos Aires", "Bahia Blanca");
INSERT INTO aeropuertos VALUES ("EZE", "Ministro Pistarini", "011 5480-6111", "AU Pablo Riccheri Km 33,5", "Argentina", "Buenos Aires", "Ezeiza");
INSERT INTO aeropuertos VALUES ("AEP", "Jorge Newbery", "011 5480-6111", "Av. Costanera Rafael Obligado", "Argentina", "CABA", "Buenos Aires");
INSERT INTO aeropuertos VALUES ("CDG", "Charles de Gaulle", "+33 170 363 950", "95700 Roissy-en-France", "France", "Île-de-France", "Roissy-en-France");
INSERT INTO aeropuertos VALUES ("BER", "Brandeburgo Willy Brandt", "+49 30609160910", "12529 Schönefeld", "Germany", "Brandeburgo", "Schönefeld");

INSERT INTO vuelos_programados VALUES ("AF 229", "EZE", "CDG");
INSERT INTO vuelos_programados VALUES ("AF 1734", "CDG", "BER");
INSERT INTO vuelos_programados VALUES ("AR 1622", "AEP", "BHI");

INSERT INTO modelos_avion VALUES ("Embraer 190", "Embraer", 2, 98);
INSERT INTO modelos_avion VALUES ("Boeing 787-9", "Boeing", 4, 216);
INSERT INTO modelos_avion VALUES ("Airbus A320-200", "Airbus", 3, 180);
INSERT INTO modelos_avion VALUES ("Airbus A380-800", "Airbus", 4, 469);

INSERT INTO salidas VALUES ("AF 229", "Vi", TIME '11:25:00', TIME '23:40:00', "Boeing 787-9");
INSERT INTO salidas VALUES ("AF 1734", "Sa", TIME '9:30:00', TIME '11:35:00', "Airbus A320-200");
INSERT INTO salidas VALUES ("AR 1622", "Lu", TIME '11:20:00', TIME '12:45:00', "Embraer 190");

INSERT INTO instancias_vuelo VALUES ("AF 229", DATE '2022-09-16', "Vi", "A tiempo");
INSERT INTO instancias_vuelo VALUES ("AF 1734", DATE '2022-09-17', "Sa", "A tiempo");
INSERT INTO instancias_vuelo VALUES ("AF 1734", DATE '2022-09-24', "Sa", "Cancelado");
INSERT INTO instancias_vuelo VALUES ("AR 1622", DATE '2022-08-15', "Lu", "A tiempo");
INSERT INTO instancias_vuelo VALUES ("AR 1622", DATE '2021-03-15', "Lu", "Demorado");

INSERT INTO clases VALUES ("Turista",0);
INSERT INTO clases VALUES ("Turista +",0.33);
INSERT INTO clases VALUES ("Ejecutiva",0.66);
INSERT INTO clases VALUES ("Primera",0.99);

INSERT INTO comodidades VALUES (112, "Apoyabrazos rebatibles");
INSERT INTO comodidades VALUES (9098, "USB (tomacorriente)");
INSERT INTO comodidades VALUES (754, "Pantalla 12´ en respaldar del asiento");
INSERT INTO comodidades VALUES (87, "Pantalla 9´ en respaldar del asiento");
INSERT INTO comodidades VALUES (141, "Internet");
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

INSERT INTO reservas VALUES (1313, DATE '2022-09-01', DATE '2022-12-01', "Confirmada", "DNI", 45231029, 124621);
INSERT INTO reservas VALUES (991, DATE '2021-01-13', DATE '2021-04-11', "Confirmada", "DNI", 45231029, 124621);
INSERT INTO reservas VALUES (1341, DATE '2022-09-17', DATE '2023-12-17', "En espera", "Pasaporte Republica Checa", 9909054, 134142);
INSERT INTO reservas VALUES (1000, DATE '2021-02-01', DATE '2021-05-01', "Pagada", "DNI", 34351951, 136784);
INSERT INTO reservas VALUES (1498, DATE '2021-08-10', DATE '2021-11-10', "En espera", "DNI", 41789216, 136784);
INSERT INTO reservas VALUES (1499, DATE '2021-08-11', DATE '2021-11-11', "En espera", "DNI", 24746279, 136784);

INSERT INTO brinda VALUES ("AF 229", "Vi", "Turista", 25000.00,146);
INSERT INTO brinda VALUES ("AF 229", "Vi", "Turista +", 30000.00,40);
INSERT INTO brinda VALUES ("AF 229", "Vi", "Ejecutiva", 40000.00,16);
INSERT INTO brinda VALUES ("AF 229", "Vi", "Primera", 60000.00,14);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Turista", 20000.00,120);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Turista +", 28000.00,36);
INSERT INTO brinda VALUES ("AF 1734", "Sa", "Ejecutiva", 39000.00,24);
INSERT INTO brinda VALUES ("AR 1622", "Lu", "Turista", 10000.00, 80);
INSERT INTO brinda VALUES ("AR 1622", "Lu", "Turista +", 20000.50, 18);

INSERT INTO posee VALUES ("Turista", 87);
INSERT INTO posee VALUES ("Turista +", 87);
INSERT INTO posee VALUES ("Turista +", 112);
INSERT INTO posee VALUES ("Turista +", 9098);
INSERT INTO posee VALUES ("Ejecutiva", 754);
INSERT INTO posee VALUES ("Ejecutiva", 112);
INSERT INTO posee VALUES ("Ejecutiva", 141);
INSERT INTO posee VALUES ("Ejecutiva", 22);
INSERT INTO posee VALUES ("Ejecutiva", 40);
INSERT INTO posee VALUES ("Primera", 112);
INSERT INTO posee VALUES ("Primera", 9098);
INSERT INTO posee VALUES ("Primera", 754);
INSERT INTO posee VALUES ("Primera", 141);
INSERT INTO posee VALUES ("Primera", 568);
INSERT INTO posee VALUES ("Primera", 22);
INSERT INTO posee VALUES ("Primera", 40);

INSERT INTO reserva_vuelo_clase VALUES (1313, "AR 1622", DATE '2022-08-15', "Turista");
INSERT INTO reserva_vuelo_clase VALUES (991, "AR 1622", DATE '2021-03-15', "Primera");
INSERT INTO reserva_vuelo_clase VALUES (1341, "AF 1734", DATE '2022-09-24', "Ejecutiva");
INSERT INTO reserva_vuelo_clase VALUES (1000, "AF 229", DATE '2022-09-16', "Turista");
INSERT INTO reserva_vuelo_clase VALUES (1498, "AF 1734", DATE '2022-09-24', "Turista +");
INSERT INTO reserva_vuelo_clase VALUES (1499, "AF 1734", DATE '2022-09-24', "Ejecutiva");

INSERT INTO asientos_reservados VALUES ("AR 1622", DATE '2022-08-15',  "Turista", 76);
INSERT INTO asientos_reservados VALUES ("AR 1622", DATE '2022-08-15',  "Turista +", 6);
INSERT INTO asientos_reservados VALUES ("AR 1622", DATE '2021-03-15',  "Turista", 41);
INSERT INTO asientos_reservados VALUES ("AR 1622", DATE '2021-03-15',  "Turista +", 2);
INSERT INTO asientos_reservados VALUES ("AF 229", DATE '2022-09-16',  "Turista", 130);
INSERT INTO asientos_reservados VALUES ("AF 229", DATE '2022-09-16',  "Turista +", 30);
INSERT INTO asientos_reservados VALUES ("AF 229", DATE '2022-09-16',  "Ejecutiva", 8);
INSERT INTO asientos_reservados VALUES ("AF 229", DATE '2022-09-16',  "Primera", 6);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-17',  "Turista", 80);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-17',  "Turista +", 30);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-17',  "Ejecutiva", 14);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-24',  "Turista", 50);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-24',  "Turista +", 15);
INSERT INTO asientos_reservados VALUES ("AF 1734", DATE '2022-09-24',  "Ejecutiva", 4);
