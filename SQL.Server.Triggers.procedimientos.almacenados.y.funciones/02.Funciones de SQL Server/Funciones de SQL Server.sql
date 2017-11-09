			-- 2.1.Qué son las funciones de SQL Server

/**
* Permiten reutilizar código
* Parametros entrada
* Acción
* Retorno

	TIPOS
	* Escalares => valores unicos, devuelven un solo valor
	* De conjunto de tablas, (Tables-Values o TVF) 

	Deterministas		=> Bajo las mismas circunstancia, devuelve los mismos valores Ej: 1 + 2 = 3
	No Deterministas	=> una funcion que su valor de salida puede variar, EJ getDate()

	Funciones Integradas
		* Son parte de SQL-Server
		* Aggregate => Realizan Calculos pero retornan un solo dato
		* Analitica => Puden devolver varias filas para cada grupo
		* Rango		=> Devuelven un valor par cada fila en una particion
		* Escalares	=> Operan un solo valor y retornan un solo valor
		* de Filas	=> Puden ser tratados como una referencia de uan tabla, responden a sentencias de SQL
*/


/*******************************************************************************************************/
			--2.2.Funciones integradas en SQL Server
			--Solo algunas
USE Dev_SQLFunctionsStoredTriggers;
GO

SELECT * FROM Client;

--CONCAT

SELECT CONCAT(ClientName, ' ', ClientLastName) ClientFullName FROM Client;

--LOWER => Mayusculas a Minusculas

SELECT LOWER('UPPER');
SELECT LOWER(ClientName) FROM Client
SELECT * FROM Client WHERE LOWER(ClientName) = 'steven'

-- funcion matematica y no determinista

SELECT RAND();

--valor entre 20 y 50
SELECT RAND()*31+20;

--valor entre 25 y 30 solo enteros
SELECT FLOOR(RAND()*6+25);

SELECT FLOOR(.99999*5+25); -- no es 30

SELECT ClientID, ClientName, RAND()*100+1 AS RANDON FROM Client -- retorna el mismo valor
SELECT ClientID, ClientName, RAND(ClientID)*100+1 AS RANDON FROM Client -- levemente diferente

--GETDATE()

SELECT GETDATE();

--FUNTION fn_my_permissions => Funcion de sistema, devueve datos en forma de tabla

SELECT * FROM fn_my_permissions(NULL, 'SERVER');
SELECT * FROM fn_my_permissions(NULL, 'DATABASE');


--funcion de MEtadatos (Podemos obtener datos desde otrso datos)

SELECT DB_NAME();


/*******************************************************************************************************/
		--2.3.Funciones escalares personalizadas

--Crearemos nuetra propia función
/*
	CREATE FUNTION nombreFuncion
	([{@nombreParametro [AS] tipoDatoParametro
	[ = default]}
	[,....n]
	]
	)
	RETURN return_data_type
	BEGIN
		funtion_body
		RETURN scalar_expression
	END [;]


*/

--CREACIÓN
CREATE FUNCTION dbo.GetWeekDay
(@Date DATETIME)
	RETURNS INT
AS
BEGIN
	RETURN DATEPART (WEEKDAY, @Date);
END;

--LLAMADO

SELECT dbo.GetWeekDay(GETDATE());

SELECT *, dbo.GetWeekDay(ReservationDateIn) ENTRADA, dbo.GetWeekDay(ReservationDateOut) OUT  FROM Reservation;


--ELIMINAR FUNCION
DROP FUNCTION dbo.GetWeekDay;

/*******************************************************************************************************/
		--2.4.Funciones personalizadas ITVF (Table-Valued Function)
	--Funcion de valor de tabla inline 
	--el return puede ser tratado como una tabla

CREATE FUNCTION dbo.GetClientById
(@ClientID INT)
RETURNS TABLE
AS
	RETURN(
		SELECT *
		FROM Client
		WHERE ClientID = @ClientID
	);

	select system_user();

	--EJECUTAR
	SELECT * FROM DBO.GetClientById(1);
	SELECT CONCAT(ClientName, ' ', ClientLastName) FROM DBO.GetClientById(1);

/*******************************************************************************************************/
			--2.5.Funciones personalizadas MTVF (Table-Valued Function)

			--MTVF -- Funcion Multi Tabla
CREATE FUNCTION dbo.GetClientReservations
(@ClientID INT)
RETURNS @ClientReservation TABLE					--con s
(
	ClientID			INT			NOT NULL,
	ClientName			TEXT		NOT NULL,
	ReservationDateIn	DATETIME	NOT NULL,
	ReservationDateOut	DATETIME	NOT NULL
)
AS
BEGIN
	INSERT @ClientReservation
	SELECT a.ClientID, a.ClientName, b.ReservationDateIn, b.ReservationDateOut
	FROM Client a
		INNER JOIN Reservation b
			ON a.ClientID = b.ReservationClientID
	WHERE ClientID = @ClientID; 
	RETURN											--sin s
END

--Ejecutar
SELECT * FROM dbo.GetClientReservations(1);

CREATE FUNCTION dbo.GetClientReservations2
(@ClientID INT)
RETURNS @ClientReservation2 TABLE					--con s
(
	ClientID			INT			NOT NULL,
	ClientName			TEXT		NOT NULL,
	ReservationDateIn	DATETIME	NOT NULL,
	ReservationDateOut	DATETIME	NOT NULL
)
AS
BEGIN
	INSERT @ClientReservation2
	SELECT a.ClientID, a.ClientName, b.ReservationDateIn, b.ReservationDateOut
	FROM Client a,Reservation b
	WHERE a.ClientID = b.ReservationClientID
	AND ClientID = @ClientID;
	RETURN											--sin s
END

--Ejecutar
SELECT * FROM dbo.GetClientReservations2(1);

SELECT * FROM dbo.GetClientReservations(2);
SELECT * FROM dbo.GetClientReservations2(2);