-- 51 - Lenguaje de Control de Flujo [CASE]
--CASE Por defecto retorna un valor null
-- SE PUEDEN USAR RANGOS
SELECT TITULO, PRECIO FROM LIBROS;

SELECT TITULO, CASE PRECIO
				WHEN 100 THEN 'Vale 100'
				WHEN 150 THEN 'Vale 150'
				WHEN 200 THEN 'Vale 200'
				WHEN 250 THEN 'Vale 250'
				WHEN 300 THEN 'Vale 300'
				WHEN 400 THEN 'Vale 400'
				WHEN > 500 THEN 'Vale MAS DE 500'
			END
FROM LIBROS;

--OTRA SINTAXIS

SELECT TITULO, PRECIO = CASE PRECIO
				WHEN 100 THEN 'Vale 100'
				WHEN 150 THEN 'Vale 150'
				WHEN 200 THEN 'Vale 200'
				WHEN 250 THEN 'Vale 250'
				WHEN 300 THEN 'Vale 300'
				WHEN 400 THEN 'Vale 400'
				WHEN 500 THEN 'Vale 500'
			END
FROM LIBROS;

-- 52 - Lenguaje de Control de Flujo

--Si deseo ejecutar varias sentencias, debo usar BEGIN y END en el TRUE o FALSE del IF

/*
IF (CONDICION)
	SENTENCIAS
ELSE
	SENTENCIAS
*/

-- Si la condicion retorna almenos un registro, ejecuta el TRUE

IF EXISTS (SELECT * FROM LIBROS WHERE NUM_PAG > 1500)
	SELECT * FROM LIBROS WHERE NUM_PAG > 500
ELSE
	SELECT 'No existen mayores de 500 paginas'

IF EXISTS (SELECT * FROM LIBROS WHERE NUM_PAG > 5000)
	SELECT * FROM LIBROS WHERE NUM_PAG > 500
ELSE
	SELECT 'No existen mayores de 500 paginas'

-- 53 - Variables
/*
	DECLARE @nombreVariable tipoDato
	SET @nombreVariable = valor
*/

--Se deben declarar, settear y consultar en el mismo Ejecutar
--No son glabales

DECLARE @VAL_PRECIO INT;
DECLARE @VAL_PAGINAS INT;
SET @VAL_PRECIO = 350;
SET @VAL_PAGINAS = 1000;

SELECT * FROM LIBROS WHERE PRECIO = @VAL_PRECIO;
SELECT * FROM LIBROS WHERE NUM_PAG < @VAL_PAGINAS;

-- Consultar la lista de libros que valen mas del promedio de precio
-- Puedo usar una consulta para asiganle a una variable
DECLARE @PROMEDIO_PRECIO INT ;
SET @PROMEDIO_PRECIO = (SELECT AVG(PRECIO) FROM LIBROS);

SELECT * FROM LIBROS WHERE PRECIO > @PROMEDIO_PRECIO;

