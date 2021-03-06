-- 39 - Subconsultas
SELECT * 
FROM CARRERAS C
WHERE C.ID_CARRERA = (SELECT ID_CARRERA FROM CARRERAS WHERE ID_CARRERA = 1);

-- 40 -  Subconsultas con in & not in
CREATE DATABASE LIBRERIA;
USE LIBRERIA;

CREATE TABLE LIBROS(
	ID_LIBRO INT IDENTITY(1, 1),
	TITULO VARCHAR(100) NOT NULL,
	NUM_PAG INT NOT NULL
	CONSTRAINT PK_LIBROS PRIMARY KEY (ID_LIBRO)	
);

SELECT * FROM LIBROS;

INSERT INTO LIBROS VALUES
	('100 A�os de Soledad', 789),
	('Saco de Huesos', 489),
	('Ana karenina', 3547),
	('Madame Bovary', 125),
	('Guerra y Paz', 998),
	('Lolita', 665);

	SELECT * FROM LIBROS WHERE ID_LIBRO IN (SELECT ID_LIBRO FROM LIBROS WHERE ID_LIBRO = 2 OR ID_LIBRO = 3);
	
	SELECT * FROM LIBROS WHERE ID_LIBRO IN (SELECT ID_LIBRO FROM LIBROS WHERE ID_LIBRO <= 4);
	SELECT * FROM LIBROS WHERE ID_LIBRO NOT IN (SELECT ID_LIBRO FROM LIBROS WHERE ID_LIBRO <= 4);

	SELECT * FROM LIBROS WHERE ID_LIBRO IN (SELECT ID_LIBRO FROM LIBROS WHERE NUM_PAG < 300);
	SELECT * FROM LIBROS WHERE ID_LIBRO NOT IN (SELECT ID_LIBRO FROM LIBROS WHERE NUM_PAG < 300);

	-- 41 - Subconsultas con any & all
	/*
		IN =>		=ANY
		NOT IN =>	<>ALL
	*/
	SELECT * FROM LIBROS WHERE ID_LIBRO = ANY (SELECT ID_LIBRO FROM LIBROS WHERE ID_LIBRO <= 4);
	SELECT * FROM LIBROS WHERE ID_LIBRO <> ALL (SELECT ID_LIBRO FROM LIBROS WHERE ID_LIBRO <= 4);

	SELECT * FROM LIBROS WHERE ID_LIBRO = ANY (SELECT ID_LIBRO FROM LIBROS WHERE NUM_PAG < 300);
	SELECT * FROM LIBROS WHERE ID_LIBRO <> ALL (SELECT ID_LIBRO FROM LIBROS WHERE NUM_PAG < 300);

	-- 42 - Subconsultas Update & Delate
	ALTER TABLE LIBROS
	ADD PRECIO INT;

	SELECT * FROM LIBROS;
	SELECT ID_LIBRO FROM LIBROS WHERE TITULO LIKE '%ad%' --subconsulta
	UPDATE LIBROS SET PRECIO = 100 WHERE ID_LIBRO = ANY (SELECT ID_LIBRO FROM LIBROS WHERE TITULO LIKE '%ad%');
	UPDATE LIBROS SET PRECIO = 200 WHERE ID_LIBRO <> ALL (SELECT ID_LIBRO FROM LIBROS WHERE TITULO LIKE '%ad%');

	INSERT INTO LIBROS VALUES ('Ara�a mona', 500, 250);
	SELECT ID_LIBRO FROM LIBROS WHERE TITULO LIKE '%Ara�a%' --subconsulta
	DELETE LIBROS WHERE ID_LIBRO = ANY (SELECT ID_LIBRO FROM LIBROS WHERE TITULO LIKE '%Ara�a%')

	-- 43 - Subconsultas con insert
	-- No lleva VALUES
	DROP TABLE LIBROS_TMP;
	
	CREATE TABLE LIBROS_TMP(
	ID_LIBRO INT,
	TITULO VARCHAR(100) NOT NULL,
	NUM_PAG INT NOT NULL
	CONSTRAINT PK_LIBROS_TMP PRIMARY KEY (ID_LIBRO));
	
	SELECT * FROM LIBROS_TMP;
	
	INSERT INTO LIBROS_TMP (ID_LIBRO, TITULO, NUM_PAG) SELECT ID_LIBRO, TITULO, NUM_PAG FROM LIBROS;
	
	SELECT * FROM LIBROS_TMP;