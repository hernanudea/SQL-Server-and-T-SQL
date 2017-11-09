-- 19 - Order by
--ORDER BY
SELECT * FROM USUARIOS3 ORDER BY 2;
-- LO MISMO DE OTROS MANEJADORES DE BBDD


--20 - Operadores lógicos NOT, AND y OR
--IGUAL QUE OTROS MANEJADORES DE BBDD

-- 21 - Is null - between
--IGUAL QUE OTROS MANEJADORES DE BBDD

create database tutorial;
use tutorial;

CREATE TABLE USUARIOS(
	ID_USUARIO INT IDENTITY,
	NOMBRE VARCHAR(50) NULL,
	APELLIDO VARCHAR(50) NULL,
	EDAD INT
);

INSERT INTO USUARIOS VALUES('Samuel', 'Velasquez', 1);
INSERT INTO USUARIOS VALUES('Matias', 'Velasquez', 10);
INSERT INTO USUARIOS VALUES('Eliana', 'Cuadros', 25);
INSERT INTO USUARIOS VALUES('Hernan', 'Velasquez', 38);
INSERT INTO USUARIOS (NOMBRE, APELLIDO) VALUES('Hernan', 'Velasquez');

SELECT * FROM USUARIOS

SELECT * FROM USUARIOS WHERE EDAD IS NULL;
SELECT * FROM USUARIOS WHERE EDAD IS NOT NULL;

SELECT * FROM USUARIOS WHERE EDAD BETWEEN 20 AND 30;


-- 22 -Like not like
-- Espefico para cadenas

--comodines * y _

-- 23 - Count
--no cuenta las nulas

-- 24 - Sum - avg

SELECT AVG(EDAD) FROM USUARIOS;
SELECT AVG(EDAD) FROM USUARIOS WHERE EDAD <10;
SELECT SUM(EDAD) FROM USUARIOS;

--25 - Min - max
SELECT MAX(EDAD) EDAD FROM USUARIOS;
SELECT MIN(EDAD) EDAD FROM USUARIOS;
SELECT NOMBRE, MAX(EDAD) EDAD FROM USUARIOS GROUP BY NOMBRE;
--ToDo, verificar porque esta consulta no retorna solo un registro

-- 26 - Having
/*
	* solo cuando uso funciones de agrupación
	* filtro para las funciones de agrupacion. avg, sum, count, etc
*/
SELECT NOMBRE, SUM(EDAD) EDAD FROM USUARIOS GROUP BY NOMBRE HAVING  MIN(EDAD) <10;
SELECT NOMBRE, AVG(EDAD) EDAD FROM USUARIOS GROUP BY NOMBRE HAVING  AVG(EDAD) < 5;
SELECT APELLIDO, AVG(EDAD) EDAD FROM USUARIOS GROUP BY APELLIDO HAVING AVG(EDAD) >1;
SELECT APELLIDO, SUM(EDAD) EDAD FROM USUARIOS GROUP BY APELLIDO HAVING SUM(EDAD) >1;
SELECT APELLIDO, COUNT(EDAD) CANTIDAD FROM USUARIOS GROUP BY APELLIDO HAVING COUNT(EDAD) >1;

-- 27 - Compute 
--es ena clausura
SELECT NOMBRE, EDAD FROM USUARIOS WHERE EDAD < 10
COMPUTE MIN(NOMBRE), SUM(EDAD);

--ToDo, averiguar como funcciona COMPUTE

-- 28 - Distinct

--IGUAL QUE OTROS MANEJADORES DE BBDD

-- 29 - Top
--es una clausura
--limitar la cantidad de resultados de una consulta

SELECT NOMBRE, EDAD FROM USUARIOS;

SELECT TOP 2 NOMBRE, EDAD FROM USUARIOS;
SELECT TOP 2 NOMBRE, EDAD FROM USUARIOS ORDER BY EDAD DESC;

-- 30 - Respaldo y Restauracion de Bases de Datos
/*
	* Se puede hacer un un archivo *.bak o con un Script
		base de datos Clic contratio => Tareas => Generar Script
	* Tener especial cuidado con seleccionar que duarde los datos y todo lo que necesito
	* por defecto no guarda los datos

	Con backup
	base de datos Clic contratio => Tareas => Backup
	Restaurar
	Bamos a Bases de Datos => Xlix contrario => Restaurar
*/