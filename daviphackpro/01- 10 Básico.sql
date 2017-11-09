--02 - Creaci�n de una base de datos
CREATE DATABASE TUTORIAL ;
--DROP DATABASE TUTORIAL;

--03 - Tipos de Datos
	--NCHAR =>Exactamente 10 caracteres
	--INTEGER
	--CHAR => Caracteres
	--DATE
	--FLOAT
	--IMAGE => Imagenes
	--MONEY => Dinero
	--CARCHAR => Cadenas

--04 - Creaci�n y eliminaci�n de tablas
CREATE TABLE USUARIOS(
	ID_USUARIO INT NOT NULL,
	NOMBRE VARCHAR(50)
);

DROP TABLE USUARIOS;


--05 - Inserci�n de datos (INSERT)
INSERT INTO USUARIOS(ID_USUARIO, NOMBRE) VALUES (1, 'HERNAN');
INSERT INTO USUARIOS(ID_USUARIO, NOMBRE) VALUES (2, 'MATIAS');
INSERT INTO USUARIOS(ID_USUARIO, NOMBRE) VALUES (3, 'SAMUEL');
INSERT INTO USUARIOS(ID_USUARIO, NOMBRE) VALUES (4, 'ELIANA');

--06 - Consultas
SELECT * FROM USUARIOS;

--07 - Where 
SELECT * FROM USUARIOS WHERE NOMBRE LIKE '%SA%';

--08 - Operadores realacionales

/*
	< menor que
	> mayor que
	<= menor igual
	<= mayor igual
	= igual
	<> diferente
*/

--09 - Elimininaci�n de registros (DELETE, DROP, TRUNCATE)

/*
DELETE		=> elimina registros
DROP		=> elimina estructuras
TRUNCATE	=> elimina registros(RESET) en una secuencia, la deja en cero
*/


--10 - Actualizar Registros UPDATE
--ejecutar script

SELECT * FROM USUARIOS;

UPDATE USUARIOS SET NOMBRE = 'Samuel', EDAD = 1 WHERE ID_USUARIO = 1;

--!!!SIEMPRE PONER EL WHERE, SI NO CAMBIA TODOS LOS REGISTROS