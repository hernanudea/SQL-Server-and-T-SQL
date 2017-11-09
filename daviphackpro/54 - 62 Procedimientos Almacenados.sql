-- 54 - Procedimientos Almacenados
/*
	Conjunto se sentencias almacenadas en el servidos

	Tareas repetitivas.
	Se peude tener todo, execto crear otros procedimientos, default, rule, view, trigger

	Tipos de Procedimientos
	-1. Del Sistema		=> Se almacenan el la DB master y llevan "sp_"
	-2. Locales			=> Creados por el usuario
	-3. Temporales		=> Pueden ser locales, sus nombre inicial con "#"
	-4. Extendidos		=> Se implementan como bibliotecas de vinculos dinamicos (DLL), Se ejcutan fuera de SQL Server

	Proceso:
		Cuando existen errores de sintaxis no se crea
		si no existen errores lo guarda en "sysobjects" y su contenido en la tabla se "syscomments" en la base de datos activa

	Ventajas
	- Compartir la logica de la aplicación con otras aplicaciones
	- Realizar las operaciones que los usuarios necesitan evitando que tengan acceso al modelo de datos
	- Reducir el trafico de red.
*/
--


-- 55 - Procedimientos Almacenados Creacion y Ejecucion

/*
	-Crear 
		CREATE PROCEDURE NOMBRE AS 
		SENTENCIAS
	-Ejecutar
		EXEC NOMBRE
*/

--Crear un procedimiento almacenadoq que retorne los lidros de las de 700 páginas.
SELECT * FROM LIBROS WHERE NUM_PAG > 700;

CREATE PROCEDURE LIBROS_MUY_LARGOS AS
	SELECT * FROM LIBROS WHERE NUM_PAG > 700;

EXEC LIBROS_MUY_LARGOS;

CREATE PROCEDURE LIBROS_INSERTAR AS
	DECLARE @valTitulo VARCHAR(100);
	DECLARE @numPaginas INT;
	DECLARE @numPrecio INT;

	SET @valTitulo = 'Los juegos de Programación';
	SET @numPaginas = 852;
	set @numPrecio = 650;

	INSERT INTO LIBROS VALUES (@valTitulo, @numPaginas, @numPrecio);
	--FIN PROCEDURE

	EXEC LIBROS_INSERTAR;
	
	-- 56 - Procedimientos Almacenados Eliminación

	/*
		DROP PROC NOMBRE
	*/
	DROP PROC LIBROS_INSERTAR;

	IF OBJECT_ID('LIBROS_INSERTAR') IS NOT NULL
		BEGIN
			DROP PROC LIBROS_INSERTAR;
			SELECT 'Procedimiento Eliminado';
		END
	ELSE
		SELECT 'No existe';

-- 57 - Procedimientos Almacenados Parametros Entrada

--Entre el nombre del PA y la palabra reserbada AS deben ir todos los parametros
/*
	CREATE PROCEDURE NOMBRE
	@PARAMETRO TIPO,
	@PARAMETRO TIPO,
	.
	.
	.
	AS
	SENTENCIAS

	-Ejecutar
	EXEC NOMBRE, VALOR1, VALOR2, ....
*/
CREATE PROCEDURE SALUDAR
@NOMBRE VARCHAR(100)
AS
SELECT 'Saludos ' + @NOMBRE + '. BIenvenido a este Procedure';

EXEC SALUDAR 'Hernán';

DROP PROC MASA_CORPORAL;
GO
CREATE PROCEDURE MASA_CORPORAL
	@TALLA INT,
	@PESO FLOAT
	AS
	SELECT CONCAT('Su indice de masa corporal es: ', (@PESO * @PESO / @TALLA), '.');
	
	EXEC MASA_CORPORAL 165, 75;

DROP PROC AREA_CIRCULO;
GO
CREATE PROCEDURE AREA_CIRCULO
@RADIO FLOAT
AS
SELECT CONCAT('El área del circulo de radio ', @RADIO, ' es: ', (3.141596 * @RADIO * @RADIO));

EXEC AREA_CIRCULO 5;

--PARAMETROS POR DEFECTO

DROP PROC AREA_CIRCULO_PARAM;
GO
CREATE PROCEDURE AREA_CIRCULO_PARAM
@RADIO FLOAT = 5
AS
SELECT CONCAT('El área del circulo de radio ', @RADIO, ' es: ', (3.141596 * @RADIO * @RADIO));

EXEC AREA_CIRCULO_PARAM 8;


-- 58 Procedimientos Almacenados Parametros Salida
--A los parametros de salida, despues del tipo agrego la palabra reservada OUTPUT

DROP PROC AREA_CIRCULO_SALIDA;
GO
CREATE PROCEDURE AREA_CIRCULO_SALIDA
@RADIO FLOAT = 5,
@CALCULO FLOAT OUTPUT
AS
SET @CALCULO = 3.141596 * @RADIO * @RADIO;

DECLARE @TOTAL FLOAT --declaramos la variable
EXEC AREA_CIRCULO_SALIDA 8, @TOTAL OUTPUT; -- ejecutamos PA, Si no pongo OUTPUT retorna NULL
SELECT CONCAT('El área es: ', @TOTAL);

-- 59 Procedimientos Almacenados-Return
-- usamos al palabra reserada RETURN
IF OBJECT_ID('MASA_CORPORAL_RETURN') IS NOT NULL
	DROP PROC MASA_CORPORAL_RETURN;
GO
CREATE PROCEDURE MASA_CORPORAL_RETURN
	@TALLA FLOAT,
	@PESO FLOAT
	AS
	IF (@TALLA IS NULL) OR (@PESO IS NULL)
		RETURN -999;
	ELSE
	RETURN @PESO * @PESO / @TALLA;

DECLARE @MASA FLOAT --declaramos la variable
EXEC @MASA = MASA_CORPORAL_RETURN null, null; -- ejecutamos PA, Si no pongo OUTPUT retorna NULL
SELECT CONCAT('El indice de mas corporal es: ', @MASA);

DECLARE @MASA FLOAT --declaramos la variable
EXEC @MASA = MASA_CORPORAL_RETURN 165, 76.32; -- ejecutamos PA, Si no pongo OUTPUT retorna NULL
SELECT CONCAT('El indice de mas corporal es: ', @MASA);


-- 60 - Procedimientos Almacenados Info

/*
	SP_HELP NOMBREOBJETO -- texto que define al objeto
	SP_HELPTEXT NOMBREOBJETO -- texto que define al objeto
	SP_STOREDPROCEDURE -- Muestra todos los procedimientos almacenados
	SP_DEPENDS NOMBREOBJETO -- Muestra las relaciones entre tablas, en las vistas mostraria de que tabla viene cada campo
	SYSOBJECTS --Muestra nombre y varios objetos
*/

SP_HELP MASA_CORPORAL_RETURN --  a un procedure
SP_HELP; -- a la base de datows actual
SP_HELP LIBROS; -- a la tabla especificada

SP_HELPTEXT MASA_CORPORAL_RETURN --  a un procedure
SP_HELPTEXT LIBROS; -- a la tabla especificada

SP_STORED_PROCEDURES

SP_DEPENDS MASA_CORPORAL_RETURN;
SP_DEPENDS LIBROS_COSTOSOS;

SELECT * FROM SYSOBJECTS;

-- 61 - Procedimientos Almacenados Encrypt
--Entre los parametros y AS ponemos WITH ENCRYPTION

IF OBJECT_ID('MASA_CORPORAL_ENCRYP') IS NOT NULL
	DROP PROC MASA_CORPORAL_ENCRYP;
GO
CREATE PROCEDURE MASA_CORPORAL_ENCRYP
	@TALLA FLOAT,
	@PESO FLOAT
	WITH ENCRYPTION
	AS
	IF (@TALLA IS NULL) OR (@PESO IS NULL)
		RETURN -999;
	ELSE
	RETURN @PESO * @PESO / @TALLA;

DECLARE @MASA FLOAT --declaramos la variable
EXEC @MASA = MASA_CORPORAL_ENCRYP 165, 75; -- ejecutamos PA, Si no pongo OUTPUT retorna NULL
SELECT CONCAT('El indice de mas corporal es: ', @MASA);

SP_HELPTEXT MASA_CORPORAL_ENCRYP;

-- 62 - Procedimientos Almacenados Anidación

--Creamos un PA
IF OBJECT_ID('AVG_PRECIO')IS NOT NULL
	DROP PROC AVG_PRECIO;
GO
CREATE PROCEDURE AVG_PRECIO
	@AVG FLOAT OUTPUT
	WITH ENCRYPTION
	AS
	SELECT AVG(PRECIO) FROM LIBROS;
	
	-- retorna el promedio del precio de los libros

IF OBJECT_ID('LLAMA_AVG_PRECIO') IS NOT NULL
	DROP PROC LLAMA_AVG_PRECIO;
GO
CREATE PROCEDURE LLAMA_AVG_PRECIO
	@RESPUESTA FLOAT OUTPUT
	AS
		BEGIN
			DECLARE @VALOR FLOAT;
			EXEC AVG_PRECIO @VALOR OUTPUT			
			SET @RESPUESTA = @VALOR;
		END

--Mostrar los resultados
DECLARE @NUM FLOAT;
EXEC LLAMA_AVG_PRECIO @NUM OUTPUT
SELECT @NUM;

	-- Cuantos libros cuestan mas que el promedio
	-- Usando el mismo PA que calcula el promedio

IF OBJECT_ID('CUANTOS_MAYORES_AVG_PRECIO') IS NOT NULL
	DROP PROC CUANTOS_MAYORES_AVG_PRECIO;
GO
CREATE PROCEDURE CUANTOS_MAYORES_AVG_PRECIO
	@RESPUESTA INT OUTPUT
	AS
		BEGIN
			DECLARE @VALOR INT;
			EXEC AVG_PRECIO @VALOR OUTPUT			
			PRINT @VALOR;
			SET @RESPUESTA = (SELECT COUNT(*) FROM LIBROS WHERE PRECIO > @VALOR);
			PRINT @RESPUESTA;
		END
		--ToDo Como imprimir el contenido de una variable?
		--ToDo corregir para que no retorne 0

--Muestra resultado
DECLARE @CANTIDAD INT;
EXEC CUANTOS_MAYORES_AVG_PRECIO @CANTIDAD OUTPUT;
SELECT CONCAT('La cantidad de libros que cuestan mas que el promedio es: ', @CANTIDAD);