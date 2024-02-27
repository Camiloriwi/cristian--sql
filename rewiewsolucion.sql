-- Active: 1709062324862@@bqac1wxlc2pxma7ixogf-mysql.services.clever-cloud.com@3306@bqac1wxlc2pxma7ixogf

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
    ('Ana', 'Mujer', '123-456-7890'),
    ('Carlos', 'Hombre', '987-654-3210'),
    ('Jazmyn Denesik DVM','M','123-456-7890'),
    ('Ursula Connelly', 'H', '123-8488'),
    ('Thora Schmidt MD','M','123-0698'),
    ('Kacie Gutmann','H', '9584635-00'),
    ('Beau King','M', '76487487'),
    ('Prof. Cornelius Langosh IV','1238547'),
    ('Mrs. Rachael Ortiz PhD', 'H','89423847'),
    ('Juana McLaughlin','M','289457194'),
    ('Darlene Mertz', 'M', '4529825'),
    ('Dr. Annetta Skiles PhD', '146784167'),


INSERT INTO materias (nombre) VALUES
    ('Matemáticas'),
    ('Historia'),
    ('desarrollo software'),
    ('ingles'),
    ('fisica'),
    ('Quimica');
    -- Inserta otras materias aquí...

INSERT INTO notas (estudiante_id, materia_id, nota) VALUES
    (1, 1, 4.5),
    (1, 2, 3.8);


-- Consultas Propuestas:
-- Listar los nombres de los estudiantes:


SELECT nombre FROM estudiantes;


SELECT MAX(nota) AS saldo_maximo FROM notas
WHERE estudiante_id IN (SELECT id FROM estudiantes WHERE sexo = 'Mujer');

-- Listar nombre y teléfono de los estudiantes con teléfono NOKIA, BLACKBERRY o SONY:


SELECT e.nombre, e.telefono FROM estudiantes e
WHERE e.telefono IN ('NOKIA', 'BLACKBERRY', 'SONY');

-- Contar los estudiantes sin saldo o inactivos:


SELECT COUNT(*) AS cantidad FROM estudiantes e
LEFT JOIN notas n ON e.id = n.estudiante_id
WHERE n.nota IS NULL;


SELECT login FROM estudiantes WHERE nivel IN (1, 2, 3);

SELECT id FROM estudiantes;