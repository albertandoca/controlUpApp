CREATE TABLE IF NOT EXISTS personas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPersona INTEGER,
    cedula VARCHAR(10),
    apellidos VARCHAR(50),
    nombres VARCHAR(50),
    correo VARCHAR(60),
    idLugar INTEGER,
    seguro VARCHAR(50),
    frase TEXT
);

CREATE TABLE IF NOT EXISTS lugares(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo VARCHAR(15),
    detalle VARCHAR(255),
    idLugar INTEGER
);

CREATE TABLE IF NOT EXISTS mesas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa INTEGER,
    idLugar INTEGER,
    sexo VARCHAR(2),
    numero INTEGER,
    idPersona INTEGER,
    electores INTEGER,
    ctrl BOOLEAN,
    presidente INTEGER,
    nacional INTEGER,
    provincial INTEGER,
    parlamento INTEGER

);

CREATE TABLE IF NOT EXISTS partidos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    detalle VARCHAR(80),
    lista VARCHAR(10),
    urlLogo VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS candidatos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPartido INTEGER,
    idLugar INTEGER
);

CREATE TABLE IF NOT EXISTS presidentes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPartido INTEGER,
    idMesa BIGINT,
    voto INTEGER,
    idIngreso INTEGER,
    idModifica INTEGER
);

CREATE TABLE IF NOT EXISTS eleccion(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipoEleccion VARCHAR(50),
    idMesa BIGINT,
    idPersona INTEGER,
    takeImg BOOLEAN,
    sendData INTEGER,
    sendImg BOOLEAN
);

CREATE TABLE IF NOT EXISTS nacionales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPartido INTEGER,
    idMesa BIGINT,
    voto INTEGER,
    idIngreso INTEGER,
    idModifica INTEGER
);

CREATE TABLE IF NOT EXISTS provinciales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPartido INTEGER,
    idMesa BIGINT,
    voto INTEGER,
    idIngreso INTEGER,
    idModifica INTEGER
);

CREATE TABLE IF NOT EXISTS parlamentos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPartido INTEGER,
    idMesa BIGINT,
    voto INTEGER,
    idIngreso INTEGER,
    idModifica INTEGER
);

CREATE TABLE IF NOT EXISTS imgPresidentes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa BIGINT,
    urlImg1 VARCHAR(80),
    urlImg2 VARCHAR(80),
    urlImg3 VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS imgNacionales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa BIGINT,
    urlImg1 VARCHAR(80),
    urlImg2 VARCHAR(80),
    urlImg3 VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS imgProvinciales(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa BIGINT,
    urlImg1 VARCHAR(80),
    urlImg2 VARCHAR(80),
    urlImg3 VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS imgParlamentos(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa BIGINT,
    urlImg1 VARCHAR(80),
    urlImg2 VARCHAR(80),
    urlImg3 VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS usuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPersona INTEGER,
    cedula VARCHAR(10),
    apellidos VARCHAR(50),
    nombres VARCHAR(50),
    correo VARCHAR(60),
    idLugar INTEGER,
    seguro VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS mesasUsuarios(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idMesa INTEGER,
    idLugar INTEGER,
    sexo VARCHAR(2),
    numero INTEGER,
    idPersona INTEGER,
    electores INTEGER,
    ctrl BOOLEAN
);

/* INSERT or IGNORE INTO personas(id, cedula, apellidoPaterno, apellidoMaterno, primerNombre, segundoNombre, idLugar, seguro ) VALUES (1, '1713121810', 'ANDOCILLA', 'ANDRADE', 'CARLOS', 'ALBERTO', 17, '12345678'); */

INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (3,606060606,"GUEVARA LÓPEZ","ROSA LINDA","chimborazo@up.com",33,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (4,606060606,"GUEVARA LÓPEZ","ROSA LINDA","azuay@up.com",28,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (5,606060606,"GUEVARA LÓPEZ","ROSA LINDA","bolivarr@up.com",29,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (6,606060606,"GUEVARA LÓPEZ","ROSA LINDA","cañar@up.com",30,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (7,606060606,"GUEVARA LÓPEZ","ROSA LINDA","carchi@up.com",31,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (8,606060606,"GUEVARA LÓPEZ","ROSA LINDA","cotopaxi@up.com",32,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (9,606060606,"GUEVARA LÓPEZ","ROSA LINDA","eloro@up.com",34,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (10,606060606,"GUEVARA LÓPEZ","ROSA LINDA","esmeraldas@up.com",35,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (11,606060606,"GUEVARA LÓPEZ","ROSA LINDA","guayas1@up.com",36,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (12,606060606,"GUEVARA LÓPEZ","ROSA LINDA","guayas2@up.com",37,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (13,606060606,"GUEVARA LÓPEZ","ROSA LINDA","guayas3@up.com",38,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (14,606060606,"GUEVARA LÓPEZ","ROSA LINDA","guayas4@up.com",39,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (15,606060606,"GUEVARA LÓPEZ","ROSA LINDA","imbabura@up.com",40,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (16,606060606,"GUEVARA LÓPEZ","ROSA LINDA","loja@up.com",41,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (17,606060606,"GUEVARA LÓPEZ","ROSA LINDA","losrios@up.com",42,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (18,606060606,"GUEVARA LÓPEZ","ROSA LINDA","manabi1@up.com",43,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (19,606060606,"GUEVARA LÓPEZ","ROSA LINDA","manabi2@up.com",44,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (20,606060606,"GUEVARA LÓPEZ","ROSA LINDA","morona@up.com",45,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (21,606060606,"GUEVARA LÓPEZ","ROSA LINDA","napo@up.com",46,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (22,606060606,"GUEVARA LÓPEZ","ROSA LINDA","pastaza@up.com",47,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (23,606060606,"GUEVARA LÓPEZ","ROSA LINDA","pichincha1@up.com",48,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (24,606060606,"GUEVARA LÓPEZ","ROSA LINDA","pichincha2@up.com",49,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (25,606060606,"GUEVARA LÓPEZ","ROSA LINDA","pichincha3@up.com",50,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (26,606060606,"GUEVARA LÓPEZ","ROSA LINDA","pichincha4@up.com",51,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (27,606060606,"GUEVARA LÓPEZ","ROSA LINDA","tungurahua@up.com",52,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (28,606060606,"GUEVARA LÓPEZ","ROSA LINDA","zamora@up.com",53,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (29,606060606,"GUEVARA LÓPEZ","ROSA LINDA","galapagos@up.com",54,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (30,606060606,"GUEVARA LÓPEZ","ROSA LINDA","sucumbios@up.com",55,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (31,606060606,"GUEVARA LÓPEZ","ROSA LINDA","orellana@up.com",56,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (32,606060606,"GUEVARA LÓPEZ","ROSA LINDA","santodomingo@up.com",57,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (33,606060606,"GUEVARA LÓPEZ","ROSA LINDA","santaelena@up.com",58,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (34,606060606,"GUEVARA LÓPEZ","ROSA LINDA","europa@up.com",59,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (35,606060606,"GUEVARA LÓPEZ","ROSA LINDA","eeuu@up.com",60,12345678);
INSERT or IGNORE INTO usuarios(id, cedula, apellidos, nombres, correo, idLugar, seguro ) VALUES (36,606060606,"GUEVARA LÓPEZ","ROSA LINDA","america@up.com",61,12345678);


INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (1,1,4494,'F',1,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (2,2,4494,'F',2,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (3,3,4494,'F',3,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (4,4,4494,'F',4,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (5,5,4494,'F',5,4,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (6,6,4494,'F',6,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (7,7,4494,'F',7,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (8,8,4494,'M',1,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (9,9,4494,'M',2,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (10,10,4494,'M',3,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (11,11,4494,'M',4,4,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (12,12,4494,'M',5,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (13,13,4494,'M',6,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (14,14,4494,'M',7,4,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (15,1938,4764,'F',1,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (16,1939,4764,'F',2,5,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (17,1940,4764,'F',3,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (18,1941,4764,'F',4,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (19,1942,4764,'F',5,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (20,1943,4764,'F',6,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (21,1944,4764,'M',1,5,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (22,1945,4764,'M',2,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (23,1946,4764,'M',3,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (24,1947,4764,'M',4,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (25,1948,4764,'M',5,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (26,1949,4764,'M',6,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (27,1950,4764,'M',7,5,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (28,2508,4857,'F',1,6,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (29,2509,4857,'F',2,6,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (30,2510,4857,'F',3,6,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (31,2511,4857,'M',1,6,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (32,2512,4857,'M',2,6,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (33,2513,4857,'M',3,6,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (34,3131,4978,'F',1,7,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (35,3132,4978,'F',2,7,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (36,3133,4978,'F',3,7,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (37,3134,4978,'M',1,7,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (38,3135,4978,'M',2,7,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (39,3136,4978,'M',3,7,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (40,3137,4978,'M',4,7,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (41,3607,5056,'F',1,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (42,3608,5056,'F',2,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (43,3609,5056,'F',3,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (44,3610,5056,'F',4,8,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (45,3611,5056,'F',5,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (46,3612,5056,'M',1,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (47,3613,5056,'M',2,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (48,3614,5056,'M',3,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (49,3615,5056,'M',4,8,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (50,3616,5056,'M',5,8,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (51,4741,5221,'F',1,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (52,4742,5221,'F',2,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (53,4743,5221,'F',3,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (54,4744,5221,'F',4,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (55,4745,5221,'F',5,3,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (56,4746,5221,'F',6,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (57,4747,5221,'M',1,3,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (58,4748,5221,'M',2,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (59,4749,5221,'M',3,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (60,4750,5221,'M',4,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (61,4751,5221,'M',5,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (62,4964,5259,'F',1,3,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (63,4965,5259,'F',2,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (64,4966,5259,'F',3,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (65,4967,5259,'F',4,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (66,4968,5259,'F',5,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (67,4969,5259,'F',6,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (68,4971,5259,'M',2,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (69,4972,5259,'M',3,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (70,4970,5259,'M',3,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (71,4973,5259,'M',4,3,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (72,4974,5259,'M',5,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (73,4975,5259,'M',6,3,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (74,5995,5380,'F',1,9,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (75,5996,5380,'F',2,9,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (76,5997,5380,'F',3,9,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (77,5998,5380,'M',1,9,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (78,5999,5380,'M',2,9,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (79,6000,5380,'M',3,9,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (80,7650,5623,'F',1,10,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (81,7651,5623,'M',1,10,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (82,7652,5623,'M',2,10,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (83,15589,5862,'F',1,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (84,15590,5862,'F',2,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (85,15591,5862,'F',3,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (86,15592,5862,'F',4,11,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (87,15593,5862,'F',5,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (88,15594,5862,'F',6,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (89,15595,5862,'F',7,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (90,15596,5862,'F',8,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (91,15597,5862,'F',9,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (92,15598,5862,'M',1,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (93,15599,5862,'M',2,11,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (94,15600,5862,'M',3,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (95,15601,5862,'M',4,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (96,15602,5862,'M',5,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (97,15603,5862,'M',6,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (98,15604,5862,'M',7,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (99,15605,5862,'M',8,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (100,15606,5862,'M',9,11,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (101,14820,5873,'F',1,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (102,14821,5873,'F',2,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (103,14822,5873,'F',3,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (104,14823,5873,'F',4,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (105,14824,5873,'F',5,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (106,14825,5873,'F',6,12,285,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (107,14826,5873,'M',1,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (108,14827,5873,'M',2,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (109,14828,5873,'M',3,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (110,14829,5873,'M',4,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (111,14830,5873,'M',5,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (112,14831,5873,'M',6,12,204,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (113,13315,5885,'F',1,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (114,13316,5885,'F',2,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (115,13317,5885,'F',3,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (116,13318,5885,'F',4,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (117,13319,5885,'M',1,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (118,13320,5885,'M',2,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (119,13321,5885,'M',3,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (120,13322,5885,'M',4,13,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (121,11189,6015,'F',1,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (122,11190,6015,'F',2,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (123,11191,6015,'F',3,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (124,11192,6015,'F',4,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (125,11193,6015,'F',5,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (126,11194,6015,'F',6,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (127,11195,6015,'M',1,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (128,11196,6015,'M',2,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (129,11197,6015,'M',3,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (130,11198,6015,'M',4,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (131,11199,6015,'M',5,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (132,11200,6015,'M',6,14,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (133,18032,6396,'F',1,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (134,18033,6396,'F',2,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (135,18034,6396,'F',3,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (136,18035,6396,'F',4,15,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (137,18036,6396,'F',5,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (138,18037,6396,'M',1,15,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (139,18038,6396,'M',2,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (140,18039,6396,'M',3,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (141,18040,6396,'M',4,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (142,18041,6396,'M',5,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (143,18042,6396,'M',6,15,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (144,19174,6534,'F',1,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (145,19175,6534,'F',2,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (146,19176,6534,'F',3,16,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (147,19177,6534,'F',4,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (148,19178,6534,'M',1,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (149,19179,6534,'M',2,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (150,19180,6534,'M',3,16,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (151,19181,6534,'M',4,16,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (152,20444,6750,'F',1,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (153,20445,6750,'F',2,17,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (154,20446,6750,'F',3,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (155,20447,6750,'F',4,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (156,20448,6750,'M',1,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (157,20449,6750,'M',2,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (158,20450,6750,'M',3,17,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (159,20451,6750,'M',4,17,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (160,22425,6918,'F',1,18,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (161,22426,6918,'F',2,18,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (162,22427,6918,'M',1,18,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (163,22428,6918,'M',2,18,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (164,24013,6934,'F',1,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (165,24014,6934,'F',2,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (166,24015,6934,'F',3,19,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (167,24016,6934,'F',4,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (168,24017,6934,'F',5,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (169,24018,6934,'F',6,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (170,24019,6934,'F',7,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (171,24020,6934,'F',8,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (172,24021,6934,'F',9,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (173,24022,6934,'F',10,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (174,24023,6934,'M',1,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (175,24024,6934,'M',2,19,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (176,24025,6934,'M',3,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (177,24026,6934,'M',4,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (178,24027,6934,'M',5,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (179,24028,6934,'M',6,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (180,24029,6934,'M',7,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (181,24030,6934,'M',8,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (182,24031,6934,'M',9,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (183,24032,6934,'M',10,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (184,24033,6934,'M',11,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (185,24034,6934,'M',12,19,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (186,26148,7262,'F',1,20,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (187,26149,7262,'F',2,20,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (188,26150,7262,'F',3,20,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (189,26151,7262,'M',1,20,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (190,26152,7262,'M',2,20,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (191,26153,7262,'M',3,20,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (192,26760,7456,'M',1,21,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (193,26761,7456,'M',2,21,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (194,26762,7456,'M',3,21,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (195,26763,7456,'M',4,21,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (196,27072,7545,'F',1,22,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (197,27073,7545,'F',2,22,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (198,27074,7545,'M',1,22,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (199,27075,7545,'M',2,22,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (200,27076,7545,'M',3,22,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (201,31645,7632,'F',1,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (202,31646,7632,'F',2,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (203,31647,7632,'F',3,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (204,31648,7632,'F',4,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (205,31649,7632,'F',5,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (206,31650,7632,'F',6,23,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (207,31651,7632,'F',7,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (208,31652,7632,'F',8,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (209,31653,7632,'F',9,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (210,31654,7632,'F',10,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (211,31655,7632,'F',11,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (212,31656,7632,'F',12,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (213,31657,7632,'M',1,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (214,31658,7632,'M',2,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (215,31659,7632,'M',3,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (216,31660,7632,'M',4,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (217,31661,7632,'M',5,23,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (218,31662,7632,'M',6,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (219,31663,7632,'M',7,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (220,31664,7632,'M',8,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (221,31665,7632,'M',9,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (222,31666,7632,'M',10,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (223,31667,7632,'M',11,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (224,31668,7632,'M',12,23,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (225,29405,7728,'F',1,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (226,29406,7728,'F',2,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (227,29407,7728,'F',3,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (228,29408,7728,'F',4,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (229,29409,7728,'F',5,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (230,29410,7728,'F',6,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (231,29411,7728,'F',7,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (232,29412,7728,'F',8,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (233,29413,7728,'F',9,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (234,29414,7728,'F',10,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (235,29415,7728,'F',11,24,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (236,29416,7728,'F',12,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (237,29417,7728,'F',13,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (238,29418,7728,'F',14,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (239,29419,7728,'F',15,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (240,29420,7728,'F',16,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (241,29421,7728,'F',17,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (242,29422,7728,'F',18,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (243,29423,7728,'F',19,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (244,29424,7728,'F',20,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (245,29425,7728,'F',21,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (246,29426,7728,'F',22,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (247,29427,7728,'F',23,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (248,29428,7728,'F',24,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (249,29429,7728,'F',25,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (250,29430,7728,'F',26,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (251,29431,7728,'F',27,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (252,29432,7728,'F',28,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (253,29433,7728,'M',1,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (254,29434,7728,'M',2,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (255,29435,7728,'M',3,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (256,29436,7728,'M',4,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (257,29437,7728,'M',5,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (258,29438,7728,'M',6,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (259,29439,7728,'M',7,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (260,29440,7728,'M',8,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (261,29441,7728,'M',9,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (262,29442,7728,'M',10,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (263,29443,7728,'M',11,24,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (264,29444,7728,'M',12,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (265,29445,7728,'M',13,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (266,29446,7728,'M',14,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (267,29447,7728,'M',15,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (268,29448,7728,'M',16,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (269,29449,7728,'M',17,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (270,29450,7728,'M',18,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (271,29451,7728,'M',19,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (272,29452,7728,'M',20,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (273,29453,7728,'M',21,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (274,29454,7728,'M',22,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (275,29455,7728,'M',23,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (276,29456,7728,'M',24,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (277,29457,7728,'M',25,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (278,29458,7728,'M',26,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (279,29459,7728,'M',27,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (280,29460,7728,'M',28,24,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (281,27392,7738,'F',1,25,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (282,27393,7738,'F',2,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (283,27394,7738,'F',3,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (284,27395,7738,'F',4,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (285,27396,7738,'F',5,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (286,27397,7738,'F',6,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (287,27398,7738,'F',7,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (288,27399,7738,'F',8,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (289,27400,7738,'F',9,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (290,27401,7738,'F',10,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (291,27402,7738,'F',11,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (292,27403,7738,'F',12,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (293,27404,7738,'F',13,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (294,27405,7738,'F',14,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (295,27406,7738,'F',15,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (296,27407,7738,'F',16,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (297,27408,7738,'F',17,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (298,27409,7738,'F',18,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (299,27410,7738,'M',1,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (300,27411,7738,'M',2,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (301,27412,7738,'M',3,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (302,27413,7738,'M',4,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (303,27414,7738,'M',5,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (304,27415,7738,'M',6,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (305,27416,7738,'M',7,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (306,27417,7738,'M',8,25,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (307,27418,7738,'M',9,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (308,27419,7738,'M',10,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (309,27420,7738,'M',11,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (310,27421,7738,'M',12,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (311,27422,7738,'M',13,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (312,27423,7738,'M',14,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (313,27424,7738,'M',15,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (314,27425,7738,'M',16,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (315,27426,7738,'M',17,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (316,27427,7738,'M',18,25,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (317,33216,7981,'F',1,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (318,33217,7981,'F',2,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (319,33218,7981,'F',3,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (320,33219,7981,'F',4,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (321,33220,7981,'F',5,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (322,33221,7981,'F',6,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (323,33222,7981,'M',1,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (324,33223,7981,'M',2,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (325,33224,7981,'M',3,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (326,33225,7981,'M',4,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (327,33226,7981,'M',5,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (328,33227,7981,'M',6,26,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (329,34125,8046,'F',1,27,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (330,34126,8046,'F',2,27,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (331,34127,8046,'M',1,27,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (332,35480,8210,'F',1,28,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (333,35481,8210,'F',2,28,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (334,35482,8210,'M',1,28,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (335,35483,8210,'M',2,28,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (336,35846,8335,'F',1,29,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (337,35847,8335,'F',2,29,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (338,35848,8335,'F',3,29,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (339,35901,8352,'F',1,30,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (340,35902,8352,'F',2,30,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (341,35903,8352,'M',1,30,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (342,35904,8352,'M',2,30,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (343,36436,8471,'F',1,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (344,36437,8471,'F',2,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (345,36438,8471,'F',3,31,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (346,36439,8471,'F',4,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (347,36440,8471,'F',5,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (348,36441,8471,'F',6,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (349,36442,8471,'F',7,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (350,36443,8471,'M',1,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (351,36444,8471,'M',2,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (352,36445,8471,'M',3,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (353,36446,8471,'M',4,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (354,36447,8471,'M',5,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (355,36448,8471,'M',6,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (356,36449,8471,'M',7,31,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (357,36450,8471,'M',8,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (358,36451,8471,'M',9,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (359,36452,8471,'M',10,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (360,36453,8471,'M',11,31,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (361,36862,8554,'F',1,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (362,36863,8554,'F',2,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (363,36864,8554,'F',3,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (364,36865,8554,'F',4,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (365,36866,8554,'F',5,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (366,36867,8554,'F',6,32,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (367,36868,8554,'F',7,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (368,36869,8554,'F',8,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (369,36870,8554,'F',9,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (370,36871,8554,'F',10,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (371,36872,8554,'M',1,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (372,36873,8554,'M',2,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (373,36874,8554,'M',3,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (374,36875,8554,'M',4,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (375,36876,8554,'M',5,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (376,36877,8554,'M',6,32,350,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (377,36878,8554,'M',7,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (378,36879,8554,'M',8,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (379,36880,8554,'M',9,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (380,36881,8554,'M',10,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (381,36882,8554,'M',11,32,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (382,38037,8688,'M',1,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (383,38038,8688,'M',2,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (384,38039,8688,'M',3,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (385,38040,8688,'M',4,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (386,38041,8688,'M',5,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (387,38042,8688,'M',6,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (388,38043,8688,'M',7,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (389,38044,8688,'M',8,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (390,38045,8688,'M',9,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (391,38047,8688,'M',11,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (392,38048,8688,'M',12,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (393,38049,8688,'M',13,33,350,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (394,38822,8770,'F',1,34,500,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (395,38823,8770,'F',2,34,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (396,38824,8770,'F',3,34,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (397,38825,8770,'M',1,34,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (398,38826,8770,'M',2,34,500,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (399,39381,8818,'F',1,35,500,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (400,39382,8818,'F',2,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (401,39383,8818,'F',3,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (402,39384,8818,'F',4,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (403,39385,8818,'F',5,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (404,39386,8818,'F',6,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (405,39387,8818,'M',1,35,500,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (406,39388,8818,'M',2,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (407,39389,8818,'M',3,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (408,39390,8818,'M',4,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (409,39391,8818,'M',5,35,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (410,39659,8842,'F',1,36,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (411,39660,8842,'F',2,36,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (412,39661,8842,'F',3,36,500,True);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (413,39662,8842,'M',1,36,500,False);
INSERT or IGNORE INTO mesasUsuarios(id, idMesa, idLugar, sexo, numero, idPersona, electores, ctrl ) VALUES (414,39663,8842,'M',2,36,500,True);

