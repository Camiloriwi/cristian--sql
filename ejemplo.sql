-- Active: 1708955107455@@bpxmminzl0o46ycdgr4m-mysql.services.clever-cloud.com@3306@bpxmminzl0o46ycdgr4m


 /* El uso del INNER JOIN en MySQL te permite combinar datos de dos o más tablas en función de una columna común. Vamos a trabajar con una pequeña base de datos de un colegio para ilustrar cómo usar INNER JOIN. Imaginemos que tenemos tres tablas: */

/* Tabla “estudiantes”:
id (clave primaria)
nombre
sexo
telefono
Tabla “materias”:
id (clave primaria)
nombre
Tabla “notas”:
id (clave primaria)
estudiante_id (clave foránea que se relaciona con la tabla “estudiantes”)
materia_id (clave foránea que se relaciona con la tabla “materias”)
nota
Voy a insertar algunos datos en estas tablas y luego realizaré consultas utilizando INNER JOIN:

Insertar datos en la tabla “estudiantes”:
 */
 CREATE TABLE estudiantes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    sexo ENUM('Mujer', 'Hombre'),
    telefono VARCHAR(20)
);

CREATE TABLE materias(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
);

CREATE TABLE notas(
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    materia_id INT,
    nota DECIMAL(5, 2),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
    FOREIGN KEY (materia_id) REFERENCES materias(id)
);

INSERT INTO estudiantes (nombre, sexo, telefono) VALUES
    ('Laura', 'Mujer', '555-123-4567'),
    ('Pedro', 'Hombre', '999-888-7777'),
    -- Insertar otros estudiantes aquí...


INSERT INTO materias (nombre) VALUES
    ('Matemáticas'),
    ('Historia'),
    -- Insertar otras materias aquí...


INSERT INTO notas (estudiante_id, materia_id, nota) VALUES
    (1, 1, 4.5),
    (1, 2, 3.8),
    -- Insertar otras notas aquí...


/* Obtener el nombre del estudiante y la materia de todas las notas: */


SELECT e.nombre, m.nombre AS materia
FROM estudiantes e
INNER JOIN notas n ON e.id = n.estudiante_id
INNER JOIN materias m ON n.materia_id = m.id;

/* Usamos INNER JOIN para combinar las tablas “estudiantes” y “notas” según la clave primaria id.
Luego, usamos otro INNER JOIN para combinar la tabla resultante con la tabla “materias” según la clave primaria id.
Obtener el promedio de notas de cada estudiante: */


SELECT e.nombre, AVG(n.nota) AS promedio
FROM estudiantes e
INNER JOIN notas n ON e.id = n.estudiante_id
GROUP BY e.nombre;

/* Usamos INNER JOIN para combinar las tablas “estudiantes” y “notas”.
Luego, agrupamos los resultados por el nombre del estudiante y calculamos el promedio de las notas.
Obtener el nombre de las estudiantes mujeres y sus respectivas materias:
SQL */

SELECT e.nombre, m.nombre AS materia
FROM estudiantes e
INNER JOIN notas n ON e.id = n.estudiante_id
INNER JOIN materias m ON n.materia_id = m.id
WHERE e.sexo = 'Mujer';

/* Filtramos los resultados para incluir solo estudiantes mujeres.
Combinamos las tablas “estudiantes”, “notas” y “materias” utilizando INNER JOIN.
Recuerda que INNER JOIN combina filas de las tablas basándose en las claves primarias y foráneas. Si ti más ejem */



INSERT INTO estudiantes (nombre, sexo, telefono) VALUES
    ('Laura', 'Mujer', '555-123-4567'),
    ('Pedro', 'Hombre', '999-888-7777'),
    ('María', 'Mujer', '111-222-3333'),
    ('Juan', 'Hombre', '444-555-6666'),
    ('Luisa', 'Mujer', '777-888-9999'),
    ('Diego', 'Hombre', '333-444-5555'),
    ('Sofía', 'Mujer', '222-333-4444');



INSERT INTO materias (nombre) VALUES
    ('Física'),
    ('Literatura'),
    ('Química'),
    ('Biología'),
    ('Geografía'),
    ('Arte'),
    ('Educación Física');


INSERT INTO notas (estudiante_id, materia_id, nota) VALUES
    (1, 1, 4.5),
    (1, 2, 3.8),
    (2, 1, 3.2),
    (2, 3, 4.0),
    (3, 4, 4.7),
    (4, 5, 3.5),
    (5, 6, 4.2);
 



SELECT nombre FROM estudiantes;


SELECT MAX(nota) AS nota_maxima FROM notas
WHERE estudiante_id IN (SELECT id FROM estudiantes WHERE sexo = 'Mujer');


SELECT nombre, telefono FROM estudiantes
WHERE telefono IN ('NOKIA', 'BLACKBERRY', 'SONY');


SELECT COUNT(*) AS cantidad FROM estudiantes e
LEFT JOIN notas n ON e.id = n.estudiante_id
WHERE n.nota IS NULL;

/* Listar el “login” (asumiendo que se refiere a algún otro campo) de los estudiantes con nivel 1, 2 o 3: */


SELECT id FROM estudiantes WHERE nivel IN (1, 2, 3);