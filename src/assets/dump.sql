CREATE TABLE IF NOT EXISTS personas(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idPersona INTEGER,
    cedula VARCHAR(10),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    primerNombre VARCHAR(50),
    segundoNombre VARCHAR(50),
    idLugar INTEGER,
    seguro VARCHAR(50)
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
    ctrl BOOLEAN
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
    sendData BOOLEAN,
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


/* INSERT or IGNORE INTO personas(id, cedula, apellidoPaterno, apellidoMaterno, primerNombre, segundoNombre, idLugar, seguro ) VALUES (1, '1713121810', 'ANDOCILLA', 'ANDRADE', 'CARLOS', 'ALBERTO', 17, '12345678'); */
