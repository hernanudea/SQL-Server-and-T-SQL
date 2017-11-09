-- 15 - Funciones de Agregado
-- ToDo Descargar Script

/*
	COUNT() 
	SUM()
	MAX()
	MIN()
	AVG()
*/

-- 16 - funciones de manejo de cadenas parte 1

--SUBSTRING(cadena, inicio, longitud)
--el indice de la cadena inicia en 1

SELECT SUBSTRING('Hola a todos!!!', 8, 5);

--STR(NUMERO) Convienrte un numero a cadena
SELECT STR(123)
SELECT STR(123) + STR(456) CADENA;

--STUFF(cadena, inicio, longitud) Reemplazar un substring en un String 
SELECT STUFF('Bienvenido a Tivelasquez. Fabrica de Software', 14, 11, 'TIV');

--LEN(CADENA)  reotna la longitud de una cadena
SELECT LEN('Esta es una cadena muy cadeneta');

--CHAR(NUMERO) NUMERO ASCII
SELECT CHAR('64');
SELECT CONCAT(CHAR('91'),CHAR('72'),CHAR('93'));


-- 17 - funciones de manejo de cadenas parte 2

-- LOWER(cadena) mayusculas a minusculas
SELECT LOWER('TIV, Software con SOLIDEZ');

-- UPPER(cadena) minusculas a mayusculas
SELECT UPPER('TIV, Software con SOLIDEZ');

--LTRIM(cadena) quita espacios iniciales
SELECT LTRIM('TIV, Software con Solidez');
SELECT LTRIM('                TIV, Software con Solidez     ');

--RTRIM(cadena) quita espacios finales
SELECT RTRIM('TIV, Software con Solidez                ');
SELECT RTRIM('    TIV, Software con Solidez                ');

--REPLACE(cadena, cadenaAReemplaza, cadenaQueReemplaza) Reemplaza TODAS las apariciones de la cadenas a reemplazar
SELECT REPLACE('TiVelasquez, Software con Solidez.', 'TiVelasquez', 'TIV');

--REVERSE(CADENA) invierte una cadena
SELECT REVERSE('MATIAS') Mati, REVERSE('SAMUEL') Samu;

--PATINDEX('%CadenaBuscada%', 'CadenaDondeSeBusca') Reotna el inicio de la coincidencia
--Mayusculas y minusculas son igual
SELECT PATINDEX('%Sol%', 'TiVelasquez, Software con Solidez.');

--REPLICATE(CADENA, CANTIDAD) retipe una cadena la cantidad de veces indicada
SELECT REPLICATE('Mati - Samu - ', 100) "Mati y Samu por 100";

--SPACE(cantidad)
SELECT 'Tiv' + SPACE(1) + 'Software con Solidez';
SELECT 'Tiv' + SPACE(5) + 'Software con Solidez';
SELECT 'Tiv' + SPACE(10) + 'Software con Solidez';
