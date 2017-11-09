					-- 1.4.Variables y SET en T-SQL

DECLARE @ClientId INT;
DECLARE @ClientName VARCHAR(50);

SET @ClientName = 'Hernán Velásquez';
SET @ClientId = 15;

PRINT concat(@ClientName,  '. Su ID es: ', @ClientID);

SET @ClientName = 'Eliana Cuadros';
SET @ClientId = 10;
PRINT concat(@ClientName,  '. Su ID es: ', @ClientID);

--Si quiero crear varias a la vez las separo por comas

DECLARE @ClientStrieetAddres VARCHAR(50),
		@ClientAge INT;

--Declarar y asignar valor inicial al tiempo

DECLARE @Name VARCHAR(50) = 'Matias Velasquez'

PRINT(@Name);

/***************************************************************************************/
						-- 1.5.Estructuras de control en T-SQL

DECLARE @ClientIsMarrid INT = 0;

IF ( @ClientIsMarrid = 1 )
	BEGIN
		PRINT('He is Marrid');
	END
	ELSE
	BEGIN
		PRINT('He is Single');
	END

	--Ciclos WHILE

	DECLARE @Counter INT = 1;

	WHILE (@Counter < 5)
	BEGIN
		PRINT CONCAT('Contador vale: ', @Counter);
		SET @Counter = @Counter + 1; 
	END

	--CASE

	DECLARE @Counter2 INT = 3;

	SELECT 
		CASE @Counter2
			WHEN 1 THEN 'One'
			WHEN 2 THEN 'Two'
			WHEN 3 THEN 'Three'
			WHEN 4 THEN 'Four'
			WHEN 5 THEN 'Five'
		END AS Counter;

/***************************************************************************************/
				-- 1.6.Valores verdadero, falso y nulo en SQL Server

-- Null <> Null

DECLARE @Simple1 INT = NULL;
DECLARE @Simple2 INT = NULL;
DECLARE @Simple3 INT = 1;

IF(@Simple1 = @Simple2)
	PRINT('The Same value') -- no se imprime

--forma correcta
IF(@Simple1 IS NULL)
	PRINT('It is null') -- no se imprime

IF(@Simple3 IS NOT NULL)
	PRINT('It is not  null') -- no se imprime
