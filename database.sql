-- Active: 1708969769680@@bitszobq8xpddfdysjud-mysql.services.clever-cloud.com@3306


-- creando la tabla empresas
CREATE TABLE empresas(
  ID INT PRIMARY KEY ,
  NIT VARCHAR(50) NOT NULL ,
  nombre VARCHAR(50) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  Direccion VARCHAR(60) NOT NULL
);

-- creando la tabla vehiculos
CREATE TABLE  vehicles(
  ID INT PRIMARY KEY ,
  placa VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  marca VARCHAR(50) NOT NULL,
  color VARCHAR(45),
  tipo_vehiculo VARCHAR(50) NOT NULL
);

-- creando la tabla usuarios
CREATE TABLE usuarios(
  ID INT PRIMARY KEY ,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  email VARCHAR(160),
  contraseña VARCHAR(50) NOT NULL,
  edad VARCHAR(20),
  genero VARCHAR(20) NOT NULL,
  altura VARCHAR(40) NOT NULL,
  peso VARCHAR(40)
);

-- creando la tabla paises
CREATE TABLE paises(
  ID INT PRIMARY KEY,
  nombre VARCHAR(45)
);

-- creando la tabla ciudad
CREATE TABLE ciudad(
  ID INT PRIMARY KEY,
  nombre VARCHAR(45)
);

-- insertando los datos en la tabla empresas

INSERT INTO empresas (ID, NIT, nombre, telefono, Direccion)
VALUES
    (1, '123456789', 'Empresa A', '555-1234', 'Calle Principal 123'),
    (2, '987654321', 'Empresa B', '555-5678', 'Avenida Central 456'),
    (3, '543210987', 'Empresa C', '555-9876', 'Plaza Comercial 789'),
    (4, '246813579', 'Empresa D', '555-4321', 'Boulevard Norte 321'),
    (5, '135792468', 'Empresa E', '555-8765', 'Carrera Sur 654');


-- insertando los datos en la tabla vehicles
INSERT INTO vehicles (ID, placa, modelo, marca, color, tipo_vehiculo)
VALUES
    (1, 'ABC123', 'Sedán', 'Toyota', 'Rojo', 'Automóvil'),
    (2, 'XYZ789', 'Camioneta', 'Ford', 'Azul', 'SUV'),
    (3, 'LMN456', 'Motocicleta', 'Honda', 'Negro', 'Moto'),
    (4, 'PQR987', 'Furgoneta', 'Chevrolet', 'Blanco', 'Comercial'),
    (5, 'DEF321', 'Convertible', 'BMW', 'Plateado', 'Deportivo');


-- insertando datos en la tabla  usuarios
INSERT INTO usuarios (ID, nombre, apellidos, email, contraseña, edad, genero, altura, peso)
VALUES
    (1, 'Juan', 'Pérez', 'juan@example.com', 'secreto123', '30', 'Masculino', '175 cm', '70 kg'),
    (2, 'María', 'González', 'maria@example.com', 'clave456', '28', 'Femenino', '160 cm', '55 kg'),
    (3, 'Carlos', 'Rodríguez', 'carlos@example.com', 'password789', '35', 'Masculino', '180 cm', '80 kg'),
    (4, 'Ana', 'López', 'ana@example.com', 'segura987', '22', 'Femenino', '165 cm', '60 kg'),
    (5, 'Pedro', 'Martínez', 'pedro@example.com', 'confidencial321', '40', 'Masculino', '170 cm', '75 kg');


-- insertando datos en la tabla paises
INSERT INTO paises (ID, nombre)
VALUES
    (1, 'Colombia'),
    (2, 'Estados Unidos'),
    (3, 'España'),
    (4, 'México'),
    (5, 'Argentina');

-- insertando datos en la ciudaddes
INSERT INTO ciudad (ID, nombre)
VALUES
    (1, 'Medellín'),
    (2, 'Bogotá'),
    (3, 'Barcelona'),
    (4, 'Ciudad de México'),
    (5, 'Buenos Aires');


-- selecionando todos los elementos  o datos de las tablas
SELECT * FROM empresas;

SELECT * FROM vehicles;

SELECT * FROM usuarios;

SELECT * FROM paises;

SELECT * FROM ciudad;


-- selecionando solo el ID de la tabla paises

SELECT ID FROM paises;
-- selecionando solo el nombre de la tabla paises
SELECT nombre FROM paises;

--selecionando el NIt y el nombre de la tabla empresas
SELECT NIT, nombre FROM empresas;
-- selecionando la direccion el telefono y el nombre de la tabla empresas
SELECT Direccion,telefono,nombre FROM empresas;

-- selecionando el nombre el ID  el email y el genero de la tabla usuarios
SELECT ID,nombre,email FROM usuarios;
SELECT nombre,genero FROM usuarios;

--selecionando el nombre el genero  de la tabla usuarios donde el id sea ='4' y = a '5'
SELECT nombre, genero FROM usuarios WHERE ID = '4' AND ID = '2';

-- selecionando el nombre de la tabla usuarios donde el nombre sea  = 'juan'
SELECT nombre FROM usuarios WHERE nombre = 'Juan';

-- selecionando el nombre de la tabla vehicles donde la marca sea  = 'BMW'
SELECT marca FROM vehicles WHERE marca = 'BMW';

-- selecionando el color de la tabla vehicles donde el color sea  = 'Azul'
SELECT color FROM vehicles WHERE color = 'Azul';


-- actualizando el dato edad a 31  de la tabla usuarios donde el nombre sea = 'juan
UPDATE usuarios SET edad = '31' WHERE nombre = 'Juan';

-- actualizando el dato modelo de la tabla vehicles donde la marca sea  ='Chevrolet'
UPDATE vehicles SET modelo = 'corvete' WHERE marca = 'Chevrolet';



-- eliminando datos de la tabla usuarios por id  o por email

DELETE FROM usuarios WHERE id = '2';

DELETE FROM usuarios WHERE email = 'pedro@example.com';

-- eliminando de la tabla vehicles
DELETE FROM vehicles WHERE marca = 'Honda';
-- eliminando de la tabla paises

DELETE FROM paises WHERE nombre = 'bogota';

-- creando nuevas columnas en la tabla usuarios y vehicles con alter table

ALTER TABLE usuarios ADD COLUMN  telefono VARCHAR(20);
SELECT * FROM usuarios;

ALTER TABLE vehicles ADD COLUMN  año DATA;

ALTER TABLE usuarios ADD COLUMN  direccion VARCHAR(160);





-- base de datos compartida por el profesor




SELECT * FROM users;

-- 1. Listado de todos los usuarios con solo los nombres, apellidos y edad, que tengan 20 años de edad.
SELECT nombres, apellidos FROM users WHERE edad= 20;

-- 2. Listado de todas las mujeres en la base de datos que tengan entre 20 y 30 años de edad.
SELECT * FROM users WHERE genero='M' AND edad >= 20 AND edad <=30;


/* SELECT COUNT() FROM users; */

-- 3. Quién es la persona con menos edad de la base de datos.
SELECT MIN(edad) FROM users;

-- 4. Cuantos usuarios hay registrados en la base de datos.
SELECT COUNT(edad) FROM users;



-- 5.Traer los 5 primeros usuarios de la base de datos
SELECT * FROM users  ORDER BY id  LIMIT 5;

-- 6. Traer los 10 últimos usuarios de la base de datos
SELECT * FROM users ORDER BY id DESC LIMIT 10;




-- 7. Listar usuarios que su correo finalice en .net
SELECT * FROM users WHERE correo LIKE '%.net';
SELECT * FROM users WHERE correo LIKE '_.net%';

-- 8. Listar usuarios no vivan en  colombia.
SELECT* FROM users WHERE pais !='colombia';

-- 9. Listar usuarios que no vivan en ecuador y panamá.
SELECT * FROM users WHERE pais != 'ecuador' AND pais != 'panama';


-- 10. Cuantos(numero) usuarios son de colombia y les gusta el rock.
SELECT * FROM users WHERE pais= 'colombia' AND musica= 'rock';

-- 11. Actualizar el género musical de todos los usuarios de la base de datos de "metal" a "carranga".
UPDATE users SET musica = 'carranga' WHERE musica = 'metal';

SELECT * FROM users WHERE musica = 'carranga';

-- 12. Listado de hombres que les guste la "carranga" sean de colombia y tengan entre 10 y 20 años de edad.

SELECT * FROM users WHERE genero='H' AND musica= 'carranga'
AND pais = 'colombia' AND edad >= 10 AND edad <= 20;


-- 13. Actualizar a todos los usuarios que tengan 99 años, su nuevo género musical favorito será la "carranga"
UPDATE users SET musica = 'carranga' WHERE edad = 99;
SELECT * FROM users WHERE edad = 99;


-- 14. Listar todos los usuarios que su nombre inicie con "a","A"

SELECT * FROM users WHERE nombres LIKE 'A%' OR nombres LIKE 'a%';

-- 15. Listar todos los usuarios que su apellido finalice en "z","Z"
SELECT * FROM users WHERE apellidos LIKE '%z' OR apellidos LIKE '%Z';

-- 16. Actualizar los usuarios que tengan 50 años de edad su nuevo género musical será NULL

UPDATE users SET musica = 'NULL' WHERE edad = 50;

-- 17. Listar todos los usuarios que su género musical sea igual a NULL
SELECT * FROM users WHERE musica = 'NULL';

SELECT * FROM users;


-- 18. Cual es el resultado de la suma de todas las edades de la base de datos.
SELECT SUM(edad) FROM users;

-- 19. Cuantos usuarios tenemos registrados de "ecuador"
SELECT count(id) FROM users WHERE pais = 'ecuador';

-- 20. Cuántos usuarios son de Colombia y les gusta el vallenato.
SELECT * FROM users WHERE pais = 'colombia' AND musica = 'vallenato';


