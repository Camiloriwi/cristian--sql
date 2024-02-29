-- Active: 1709141221323@@befuootzqnwbngbcmns7-mysql.services.clever-cloud.com@3306@befuootzqnwbngbcmns7


create table marcas(
	ID int primary key,
    marca varchar(50)
);

create table tipo_vehiculos(
	ID int primary key,
    tipo_vehiculo varchar(50),
    Foreign Key (ID) REFERENCES marcas(ID)
);

create table colores(
	ID int primary key,
    color varchar(50)
);

create table vehiculos(
	ID int primary key,
    modelo varchar(50),
    placa varchar(50),
    Foreign Key (ID) REFERENCES tipo_vehiculos(ID),
    Foreign Key (ID) REFERENCES colores(ID)
);

insert into marcas(ID,marca) values(1,'nissa'),(2,'maclaren'),(3,'BMW'),(4,'ford');

insert into tipo_vehiculos(ID,tipo_vehiculo) values(1,'deportivo'),(2,'todoterreno'),(3,'ofroad'),(4,'convertible');

insert into colores(ID,color) values(1,'negro'),(2,'azul'),(3,'rojo'),(4,'blanco');

/* insert into vehiculos(ID,modelo,placa) values(1,'2018','zc17f4'),(2,'2022','zsd7f4'),(3,'2024','zh17f4'),(4,'2023','jm17f4'); */


SELECT * FROM vehiculos INNER JOIN colores WHERE color='azul';

SELECT * FROM vehiculos INNER JOIN colores INNER JOIN marcas INNER JOIN tipo_vehiculos WHERE color='blanco' AND marca='ford' AND tipo_vehiculo='deportivo';
SELECT * FROM vehiculos  INNER JOIN  tipo_vehiculos INNER JOIN colores INNER JOIN marcas;

SELECT modelo,placa, color,marca,tipo_vehiculo FROM vehiculos INNER JOIN colores INNER JOIN marcas INNER JOIN tipo_vehiculos WHERE marcas.marca='BMW' AND colores.color='azul' OR colores.color='negro';

 SELECT DISTINCT tipo_vehiculo,color,modelo,placa,marca FROM vehiculos  INNER JOIN  tipo_vehiculos INNER JOIN colores   INNER JOIN marcas WHERE vehiculos.ID=1  AND tipo_vehiculos.ID=1 AND colores.ID=3 AND marcas.ID=3;


SELECT DISTINCT * FROM vehiculos INNER JOIN  tipo_vehiculos  INNER JOIN colores  INNER JOIN marcas WHERE vehiculos.ID=1  AND tipo_vehiculos.ID=1 AND colores.ID=1 AND marcas.ID=1;
SELECT DISTINCT modelo,placa,color,marca,tipo_vehiculo FROM vehiculos INNER JOIN  tipo_vehiculos  INNER JOIN colores  INNER JOIN marcas WHERE vehiculos.ID=1  AND tipo_vehiculos.ID=1 AND colores.ID=1 AND marcas.ID=1;

SELECT DISTINCT modelo,placa,color,marca,tipo_vehiculo FROM vehiculos INNER JOIN  tipo_vehiculos  INNER JOIN colores  INNER JOIN marcas WHERE vehiculos.ID=2  AND tipo_vehiculos.ID=1 AND colores.ID=4 AND marcas.ID=1;


SELECT COUNT(*) AS marcas FROM vehiculos v
LEFT JOIN tipo_vehiculos t ON v.ID = t.ID
WHERE t.tipo_vehiculo IS NOT NULL;


SELECT COUNT(*) AS colores  FROM vehiculos v
LEFT JOIN tipo_vehiculos t ON v.ID = t.ID
WHERE t.tipo_vehiculo IS NOT NULL;

-- git ADD






