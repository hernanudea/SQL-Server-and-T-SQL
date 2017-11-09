--02 - Creación de una base de datos
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

--04 - Creación y eliminación de tablas
CREATE TABLE USUARIOS(
	ID_USUARIO INT NOT NULL,
	NOMBRE VARCHAR(50)
);

DROP TABLE USUARIOS;


--05 - Inserción de datos (INSERT)
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

--09 - Elimininación de registros (DELETE, DROP, TRUNCATE)

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

-- 11 - Identity

/*
Atributo extra que podemos poner a los campos, parece al autoincremento
*por defecto el identity inicia en 1 y s incremento es de 1
* no permite valores null
* no permitimos la introduccion del campo
* no permite identificación
* solo un campo por tabla puede tener esta propedad
* Toma el valor del ultimo registro para incrementar
* Se puede activar y desactivar la opcion de insersion, el dato insertado puede ser duplicado
* Delete no resetea los indentity

*Si ya tengo registros en ese tabla? permite que se repitan los numeros
*/
CREATE TABLE USUARIOS2(
	ID_USUARIO INT IDENTITY,
	NOMBRE VARCHAR(50) NOT NULL
);

--En clic contrario tabla, Diseño, se pueden ver las propiedades, incluida el identity

-- 12 - Identity (parte 2)
INSERT INTO USUARIOS2 VALUES ('Samuel Velasquez')
INSERT INTO USUARIOS2 VALUES ('Matias Velasquez')
INSERT INTO USUARIOS2 VALUES ('Eliana Cuadros')
INSERT INTO USUARIOS2 VALUES ('Hernan Velasquez')

SELECT * FROM USUARIOS2;

--CONSULTAR EL VALOR DE INICIO
SELECT IDENT_SEED('USUARIOS2')  VALOR_INICIO;

--CONSULTAR EL VALOR DEL INCREMENTO
SELECT IDENT_INCR('USUARIOS2') INCREMENTO;

--CONSULTAR EL VALOR ACTUAL
SELECT IDENT_CURRENT('USUARIOS2') VALOR_ACTUAL;

-- INCREMTENO DE 10 EN 10 Y CALOR INICIAL DE 1000 
CREATE TABLE USUARIOS3(
	ID_USUARIO INT IDENTITY(1000, 10),
	NOMBRE VARCHAR(50) NOT NULL
);
INSERT INTO USUARIOS3 VALUES ('Samuel Velasquez')
INSERT INTO USUARIOS3 VALUES ('Matias Velasquez')
INSERT INTO USUARIOS3 VALUES ('Eliana Cuadros')
INSERT INTO USUARIOS3 VALUES ('Hernan Velasquez')

SELECT * FROM USUARIOS3;

SELECT IDENT_SEED('USUARIOS3')  VALOR_INICIO;
SELECT IDENT_INCR('USUARIOS3') INCREMENTO;
SELECT IDENT_CURRENT('USUARIOS3') VALOR_ACTUAL;


--ToDo Como averigüo el valor actual???

--para cambiar la propiedad por defecto yq ue permita ingresar el valor de idnetity
SET IDENTITY_INSERT USUARIOS3 ON;
--SET IDENTITY_INSERT USUARIOS3 OFF;

--Obliga a poner los nombre de los campos
INSERT INTO USUARIOS3 (ID_USUARIO, NOMBRE) VALUES (1055, 'Hernan Velasquez');
INSERT INTO USUARIOS3 (ID_USUARIO, NOMBRE) VALUES (1000, 'Hernan Velasquez');
SELECT * FROM USUARIOS3;


-- 13 Operadores Aritmeticos
/*
ToDo
	descargar script
*/

--los mismos de otras 
-- en un script, no puedo crear base de datos y usarla en la misma ejecución


-- 14 - Concatenacion & Alias
--ToDo Descargar Script
-- Operador de Concatenación +
-- La cunción cancat recibe n parametros

SELECT CONCAT('Hernan', ' ', 'Velasquez') mi_nombre;
SELECT ('Hernan' + ' ' + 'Velasquez') as "Mi Nombre";