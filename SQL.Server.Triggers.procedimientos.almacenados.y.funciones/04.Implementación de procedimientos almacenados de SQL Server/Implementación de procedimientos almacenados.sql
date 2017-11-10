-- 4.1.Qué son los procedimientos almacenados
/*
	* Sentencias predefinidas y preconpiladas en el servidor
	* Pueden alojar reglas de negocio
	* aceptar parametros de entrada
	* Tres tipos de salida:
		- Conjuntos o Set
		- Código
		- Parámetros para quien llama, ya sea el bloque, lote o procedimiento
	* Operaciones sobre Bases de Datos
	* Ejecutar Otros procedimientos
	* Devuelven valor de estado, si fue exitosa

	* Definidos por el Usuario
		- T-SQL
 		- CLR
		- De Sistema (prefijo sp_)
	* Atributos de Seguridad. mejoran la seguridad
	* Ejecución mas rápida y eficiente
	* Programación modular
	* Parametros I/O
	* Estado (Exito o fallo y su razón)
	* Manejo de errores
*/

/*************************************************************************************************/
				--4.2.Crear un procedimiento almacenado simple
CREATE PROCEDURE  dbo.usbGetClient --NO usar sp_
	AS
	SELECT * FROM Client;
	GO

EXEC DBO.usbGetClient;
EXECUTE DBO.usbGetClient;

USE ReportServer; --CAMBIO DE CONTENTO
EXEC DBO.usbGetClient; --No funciona, no existe en este contexto

DROP PROC dbo.usbGetClient;

USE Dev_SQLFunctionsStoredTriggers

--OTRO EJEMPLO
IF OBJECT_ID('dbo.uspGetClientByName') IS NOT NULL
	DROP PROC dbo.uspGetClientByName;
GO
CREATE PROCEDURE dbo.uspGetClientByName
	@LastName NVARCHAR(50),
	@Name NVARCHAR(50)
	AS
	SELECT ClientName, ClientLastName, ClientEmail, ClientCityAddress
		FROM Client
		WHERE ClientName = @Name
		AND ClientLastName = @LastName;
	GO

--EJECUTAR
EXEC dbo.uspGetClientByName @LastName = N'Lynch', @Name = N'Steven'

DROP PROCEDURE dbo.uspGetClientByName;
DROP PROC dbo.uspGetClientByName;

/*************************************************************************************************/
			--4.3.Parámetros por defecto en los procedimientos almacenados
IF OBJECT_ID('dbo.uspGetFullNameByEmail') IS NOT NULL
	DROP PROC dbo.uspGetFullNameByEmail;
GO
CREATE PROCEDURE dbo.uspGetFullNameByEmail
	@Email NVARCHAR(50)
	AS
	SELECT *
	FROM Client
	WHERE ClientEmail = @Email;
	GO 

EXEC dbo.uspGetFullNameByEmail @Email = N'john@domain.com'

--SOBREESCRIBIR
ALTER PROCEDURE dbo.uspGetFullNameByEmail
	@Email NVARCHAR(50) = 'domain'
	AS
	SELECT CONCAT(ClientName, ' ', ClientLastName, '  -  ', ClientEmail)
	FROM Client
	WHERE ClientEmail LIKE '%' + @Email + '%';
	GO 

EXEC dbo.uspGetFullNameByEmail ;
/*************************************************************************************************/
					--4.4.Parámetros de salida para un procedimiento almacenado

ALTER PROCEDURE dbo.uspGetReservationCount
	@ClientID int,
	@ReservationsCount INT OUTPUT
AS
SELECT @ReservationsCount = COUNT(*)
	FROM Reservation
	WHERE ReservationClientID = @ClientID;
GO

--La ejecución es diferente
DECLARE @ReservationsCount INT;
EXEC dbo.uspGetReservationCount @ClientID = 2, @ReservationsCount = @ReservationsCount OUTPUT;
SELECT @ReservationsCount;

--PODEMOS EJECUTAR SIN EL NOMBRE DEL PARAMETRO
DECLARE @ReservationsCount INT;
EXEC dbo.uspGetReservationCount 2, @ReservationsCount = @ReservationsCount OUTPUT;
SELECT @ReservationsCount;


/*************************************************************************************************/
					--4.5.Manejo de errores en T-SQL
CREATE PROC dbo.uspError
AS
SELECT 1/0;

EXEC dbo.uspError; --error no controlado

ALTER PROC dbo.uspError
AS
BEGIN TRY	
	SELECT 1/0;
END TRY
BEGIN CATCH
	--SELECT CONCAT('Error Controlado :', ERROR_NUMBER(), ' => Descripción: ', ERROR_MESSAGE());
	SELECT ERROR_LINE() ERROR_LINE, ERROR_NUMBER() ERROR_NUMBER, ERROR_SEVERITY() ERROR_SEVERITY, ERROR_MESSAGE() ERROR_MESSAGE, ERROR_STATE() ERROR_STATE, ERROR_PROCEDURE() ERROR_PROCEDURE;
END CATCH
GO
EXEC dbo.uspError; --error no controlado

/*************************************************************************************************/
				--4.6.Cursores y sus ventajas dentro de T-SQL

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE PrintClients_Cursor
AS
BEGIN
      SET NOCOUNT ON;

	  DECLARE @ClientID INT
				,@ClientName VARCHAR(100)
				,@ClientLastName VARCHAR(100)

		DECLARE @Counter INT
		SET @Counter=1

		DECLARE PrintClients CURSOR READ_ONLY
		FOR
		SELECT ClientID, ClientName, ClientLastName
		FROM Client

		OPEN PrintClients

		FETCH NEXT FROM PrintClients INTO
		@ClientID, @CLientName, @ClientLastName

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @Counter = 1
			BEGIN
				PRINT 'ClientID' + CHAR(9) + 'NAME' + CHAR(9) + 'Last Name'
				PRINT '-----------------------------------------------'
			END
			
			PRINT CAST( @ClientID as VARCHAR(10)  ) +  CHAR(9) +  CHAR(9) + CHAR(9) + CHAR(9) +@ClientName +  CHAR(9) + @ClientLastName
			SET @Counter = @Counter + 1

			FETCH NEXT FROM PrintClients INTO 
			@ClientID, @ClientName, @ClientLastName

		END
		CLOSE PrintClients
		DEALLOCATE PrintClients
END
GO

--EJECUTAR CURSOR
EXEC PrintClients_Cursor