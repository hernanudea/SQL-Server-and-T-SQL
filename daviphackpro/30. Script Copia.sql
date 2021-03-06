/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [tutorial]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 04/11/2017 17:54:22 ******/
DROP TABLE [dbo].[USUARIOS]
GO
USE [master]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT SERVICE\Winmgmt]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT SERVICE\SQLWriter]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT SERVICE\SQLTELEMETRY$SQLDEV2016]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT SERVICE\SQLAgent$SQLDEV2016]
GO
/****** Object:  Login [NT Service\MSSQL$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT Service\MSSQL$SQLDEV2016]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Login [MATIX\herna]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [MATIX\herna]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 04/11/2017 17:54:22 ******/
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'Ikw7sJ7RJee9eIJDw3ThCZ6PJGZijJ+/6hKHrPzylxY=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'1uwCfO0pj4NXtAZ0EKqut5YKE+tI1NuIM1nnSKkdSJ8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [MATIX\herna]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [MATIX\herna] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT Service\MSSQL$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT Service\MSSQL$SQLDEV2016] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT SERVICE\SQLAgent$SQLDEV2016] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$SQLDEV2016]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY$SQLDEV2016] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 04/11/2017 17:54:22 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Español]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [MATIX\herna]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$SQLDEV2016]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLAgent$SQLDEV2016]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
USE [tutorial]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 04/11/2017 17:54:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[APELLIDO] [varchar](50) COLLATE Latin1_General_CI_AS NULL,
	[EDAD] [int] NULL
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[USUARIOS] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (1, N'Samuel', N'Velasquez', 1)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (2, N'Matias', N'Velasquez', 4)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (3, N'Eliana', N'Cuadros', 25)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (4, N'Hernan', N'Velasquez', 38)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (5, N'Hernan', N'Velasquez', NULL)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [NOMBRE], [APELLIDO], [EDAD]) VALUES (6, N'Matias', N'Velasquez', 10)
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
