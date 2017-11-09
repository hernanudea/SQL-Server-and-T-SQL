USE [tutorial]
GO
/**** Object: Table [dbo].[usuarios]     Script Date: 12/16/2013 23:51:33 ****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuarios]
(
	[id_usuario] [int]           NOT NULL,
	[nombre]     [varchar](50)   NOT NULL,
	[edad]       [int]           NOT NULL,

   PRIMARY KEY CLUSTERED
   (
	[id_usuario] ASC
   ) WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY=OFF, 	ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON)
   
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (1,N'david',22)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (2,N'tatiana',22)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (3,N'miguel',21)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (4,N'karla',20)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (5,N'maria',19)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (6,N'nancy',23)
INSERT [dbo].[usuarios] ([id_usuario], [nombre], [edad]) VALUES (7,N'david',33)