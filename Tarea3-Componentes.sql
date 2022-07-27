
CREATE TABLE componentes(
    id SERIAL NOT NULL,
    nombre TEXT NOT NULL CHECK (nombre <> ''),
    descripcion TEXT NOT NULL CHECK (descripcion <> ''),
    caracteristicas TEXT NOT NULL CHECK (caracteristicas <> ''),
    estado BOOLEAN NOT NULL,
    observaciones TEXT NOT NULL CHECK (observaciones <> ''),
    PRIMARY KEY (id)
);
 
CREATE TABLE responsables (
    CI NUMERIC NOT NULL,
    nombre TEXT NOT NULL CHECK (nombre <> ''),
    PRIMARY KEY (CI)
);

CREATE TABLE alumnos(
    CI NUMERIC NOT NULL,
    nombre TEXT NOT NULL CHECK (nombre <> ''),
    apellido TEXT NOT NULL CHECK (apellido <> ''),
    direccion TEXT NOT NULL CHECK (direccion <> ''),
    telefono TEXT NOT NULL CHECK (telefono <> ''),

    PRIMARY KEY (CI)
);


CREATE TABLE solvencia(
    id SERIAL PRIMARY KEY,
    emision DATE NOT NULL, 
    nombre_estudiante TEXT NOT NULL ,
    CI_estudiante NUMERIC NOT NULL , 
    nombre_responsable TEXT NOT NULL,
    CI_responsable NUMERIC NOT NULL,

    FOREIGN KEY (CI_estudiante) REFERENCES alumnos (CI),
    FOREIGN KEY (CI_responsable) REFERENCES responsables (CI)
);

CREATE TABLE prestamos(
    id INTEGER NOT NULL,
    cedula INTEGER NOT NULL,
    entrega DATE NOT NULL,
    devolucion DATE NOT NULL,
    

    FOREIGN KEY (id) REFERENCES componentes (id),
    FOREIGN KEY (cedula) REFERENCES alumnos (CI),
    PRIMARY KEY (id,cedula)
);

INSERT INTO alumnos (CI, nombre, apellido, direccion, telefono) VALUES ('29891702', 'Jesus', 'Ortega', 'AV12-CIRCUN2', '0424-6460016');


