USE [master]
GO
/****** Object:  Database [reservas]    Script Date: 24/11/2022 9:46:57 p. m. ******/
CREATE DATABASE [reservas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reservas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\reservas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'reservas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\reservas_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [reservas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reservas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reservas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reservas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reservas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reservas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reservas] SET ARITHABORT OFF 
GO
ALTER DATABASE [reservas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reservas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reservas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reservas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reservas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reservas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reservas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reservas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reservas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reservas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reservas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reservas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reservas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reservas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reservas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reservas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reservas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reservas] SET RECOVERY FULL 
GO
ALTER DATABASE [reservas] SET  MULTI_USER 
GO
ALTER DATABASE [reservas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reservas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reservas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reservas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [reservas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'reservas', N'ON'
GO
ALTER DATABASE [reservas] SET QUERY_STORE = OFF
GO
USE [reservas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](10) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
	[FechaNacimento] [datetime] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[fechaEvento] [datetime] NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
	[IdMotivo] [int] NOT NULL,
	[Observaciones] [varchar](max) NULL,
	[IdEstado] [int] NOT NULL,
 CONSTRAINT [PK_Eventos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motivos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motivos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Motivos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
	[idDepartamento] [int] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Id], [Identificacion], [Nombre], [Apellido], [Telefono], [Correo], [idDepartamento], [idCiudad], [FechaNacimento]) VALUES (1, N'72285908', N'JESUS', N'MORA', N'3148849796', N'jmora061483@gmail.com', 8, 88, CAST(N'1993-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Clientes] ([Id], [Identificacion], [Nombre], [Apellido], [Telefono], [Correo], [idDepartamento], [idCiudad], [FechaNacimento]) VALUES (2, N'32675171', N'martha ', N'narvez', N'3017816510', N'martan1962@hotmail.com', 8, 88, CAST(N'1962-03-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Clientes] OFF
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (5, N'ANTIOQUIA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (8, N'ATLÁNTICO')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (11, N'BOGOTÁ, D.C.')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (13, N'BOLÍVAR')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (15, N'BOYACÁ')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (17, N'CALDAS')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (18, N'CAQUETÁ')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (19, N'CAUCA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (20, N'CESAR')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (23, N'CÓRDOBA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (25, N'CUNDINAMARCA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (27, N'CHOCÓ')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (41, N'HUILA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (44, N'LA GUAJIRA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (47, N'MAGDALENA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (50, N'META')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (52, N'NARIÑO')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (54, N'NORTE DE SANTANDER')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (63, N'QUINDIO')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (66, N'RISARALDA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (68, N'SANTANDER')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (70, N'SUCRE')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (73, N'TOLIMA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (76, N'VALLE DEL CAUCA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (81, N'ARAUCA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (85, N'CASANARE')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (86, N'PUTUMAYO')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (91, N'AMAZONAS')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (94, N'GUAINÍA')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (95, N'GUAVIARE')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (97, N'VAUPÉS')
INSERT [dbo].[Departamentos] ([id], [nombre]) VALUES (99, N'VICHADA')
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id], [nombre]) VALUES (1, N'Confirmado')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (2, N'No confirmado')
SET IDENTITY_INSERT [dbo].[Estados] OFF
SET IDENTITY_INSERT [dbo].[Eventos] ON 

INSERT [dbo].[Eventos] ([id], [IdCliente], [fechaEvento], [CantidadPersonas], [IdMotivo], [Observaciones], [IdEstado]) VALUES (1, 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime), 4, 1, N'con todo', 1)
INSERT [dbo].[Eventos] ([id], [IdCliente], [fechaEvento], [CantidadPersonas], [IdMotivo], [Observaciones], [IdEstado]) VALUES (2, 1, CAST(N'2022-11-26T00:00:00.000' AS DateTime), 12, 2, N'pan con mantequilla', 1)
INSERT [dbo].[Eventos] ([id], [IdCliente], [fechaEvento], [CantidadPersonas], [IdMotivo], [Observaciones], [IdEstado]) VALUES (3, 2, CAST(N'2022-11-26T00:00:00.000' AS DateTime), 4, 1, N'con desayuno', 1)
SET IDENTITY_INSERT [dbo].[Eventos] OFF
SET IDENTITY_INSERT [dbo].[Motivos] ON 

INSERT [dbo].[Motivos] ([id], [nombre]) VALUES (1, N'Evento empresarial')
INSERT [dbo].[Motivos] ([id], [nombre]) VALUES (2, N' Despedida
empresa ')
INSERT [dbo].[Motivos] ([id], [nombre]) VALUES (3, N'Desayuno comercial ')
INSERT [dbo].[Motivos] ([id], [nombre]) VALUES (4, N'Almuerzo')
SET IDENTITY_INSERT [dbo].[Motivos] OFF
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1, N'Abriaquí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (2, N'Acacías', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (3, N'Acandí', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (4, N'Acevedo', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (5, N'Achí', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (6, N'Agrado', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (7, N'Agua de Dios', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (8, N'Aguachica', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (9, N'Aguada', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (10, N'Aguadas', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (11, N'Aguazul', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (12, N'Agustín Codazzi', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (13, N'Aipe', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (14, N'Albania', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (15, N'Albania', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (16, N'Albania', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (17, N'Albán', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (18, N'Albán (San José)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (19, N'Alcalá', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (20, N'Alejandria', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (21, N'Algarrobo', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (22, N'Algeciras', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (23, N'Almaguer', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (24, N'Almeida', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (25, N'Alpujarra', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (26, N'Altamira', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (27, N'Alto Baudó (Pie de Pato)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (28, N'Altos del Rosario', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (29, N'Alvarado', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (30, N'Amagá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (31, N'Amalfi', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (32, N'Ambalema', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (33, N'Anapoima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (34, N'Ancuya', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (35, N'Andalucía', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (36, N'Andes', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (37, N'Angelópolis', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (38, N'Angostura', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (39, N'Anolaima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (40, N'Anorí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (41, N'Anserma', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (42, N'Ansermanuevo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (43, N'Anzoátegui', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (44, N'Anzá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (45, N'Apartadó', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (46, N'Apulo', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (47, N'Apía', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (48, N'Aquitania', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (49, N'Aracataca', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (50, N'Aranzazu', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (51, N'Aratoca', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (52, N'Arauca', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (53, N'Arauquita', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (54, N'Arbeláez', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (55, N'Arboleda (Berruecos)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (56, N'Arboledas', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (57, N'Arboletes', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (58, N'Arcabuco', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (59, N'Arenal', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (60, N'Argelia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (61, N'Argelia', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (62, N'Argelia', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (63, N'Ariguaní (El Difícil)', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (64, N'Arjona', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (65, N'Armenia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (66, N'Armenia', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (67, N'Armero (Guayabal)', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (68, N'Arroyohondo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (69, N'Astrea', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (70, N'Ataco', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (71, N'Atrato (Yuto)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (72, N'Ayapel', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (73, N'Bagadó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (74, N'Bahía Solano (Mútis)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (75, N'Bajo Baudó (Pizarro)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (76, N'Balboa', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (77, N'Balboa', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (78, N'Baranoa', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (79, N'Baraya', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (80, N'Barbacoas', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (81, N'Barbosa', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (82, N'Barbosa', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (83, N'Barichara', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (84, N'Barranca de Upía', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (85, N'Barrancabermeja', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (86, N'Barrancas', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (87, N'Barranco de Loba', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (88, N'Barranquilla', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (89, N'Becerríl', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (90, N'Belalcázar', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (91, N'Bello', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (92, N'Belmira', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (93, N'Beltrán', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (94, N'Belén', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (95, N'Belén', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (96, N'Belén de Bajirá', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (97, N'Belén de Umbría', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (98, N'Belén de los Andaquíes', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (99, N'Berbeo', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (100, N'Betania', 1, 5)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (101, N'Beteitiva', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (102, N'Betulia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (103, N'Betulia', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (104, N'Bituima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (105, N'Boavita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (106, N'Bochalema', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (107, N'Bogotá D.C.', 1, 11)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (108, N'Bojacá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (109, N'Bojayá (Bellavista)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (110, N'Bolívar', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (111, N'Bolívar', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (112, N'Bolívar', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (113, N'Bolívar', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (114, N'Bosconia', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (115, N'Boyacá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (116, N'Briceño', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (117, N'Briceño', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (118, N'Bucaramanga', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (119, N'Bucarasica', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (120, N'Buenaventura', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (121, N'Buenavista', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (122, N'Buenavista', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (123, N'Buenavista', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (124, N'Buenavista', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (125, N'Buenos Aires', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (126, N'Buesaco', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (127, N'Buga', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (128, N'Bugalagrande', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (129, N'Burítica', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (130, N'Busbanza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (131, N'Cabrera', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (132, N'Cabrera', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (133, N'Cabuyaro', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (134, N'Cachipay', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (135, N'Caicedo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (136, N'Caicedonia', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (137, N'Caimito', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (138, N'Cajamarca', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (139, N'Cajibío', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (140, N'Cajicá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (141, N'Calamar', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (142, N'Calamar', 1, 95)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (143, N'Calarcá', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (144, N'Caldas', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (145, N'Caldas', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (146, N'Caldono', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (147, N'California', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (148, N'Calima (Darién)', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (149, N'Caloto', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (150, N'Calí', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (151, N'Campamento', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (152, N'Campo de la Cruz', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (153, N'Campoalegre', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (154, N'Campohermoso', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (155, N'Canalete', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (156, N'Candelaria', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (157, N'Candelaria', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (158, N'Cantagallo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (159, N'Cantón de San Pablo', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (160, N'Caparrapí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (161, N'Capitanejo', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (162, N'Caracolí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (163, N'Caramanta', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (164, N'Carcasí', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (165, N'Carepa', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (166, N'Carmen de Apicalá', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (167, N'Carmen de Carupa', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (168, N'Carmen de Viboral', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (169, N'Carmen del Darién (CURBARADÓ)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (170, N'Carolina', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (171, N'Cartagena', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (172, N'Cartagena del Chairá', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (173, N'Cartago', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (174, N'Carurú', 1, 97)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (175, N'Casabianca', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (176, N'Castilla la Nueva', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (177, N'Caucasia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (178, N'Cañasgordas', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (179, N'Cepita', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (180, N'Cereté', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (181, N'Cerinza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (182, N'Cerrito', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (183, N'Cerro San Antonio', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (184, N'Chachaguí', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (185, N'Chaguaní', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (186, N'Chalán', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (187, N'Chaparral', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (188, N'Charalá', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (189, N'Charta', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (190, N'Chigorodó', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (191, N'Chima', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (192, N'Chimichagua', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (193, N'Chimá', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (194, N'Chinavita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (195, N'Chinchiná', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (196, N'Chinácota', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (197, N'Chinú', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (198, N'Chipaque', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (199, N'Chipatá', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (200, N'Chiquinquirá', 1, 15)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (201, N'Chiriguaná', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (202, N'Chiscas', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (203, N'Chita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (204, N'Chitagá', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (205, N'Chitaraque', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (206, N'Chivatá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (207, N'Chivolo', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (208, N'Choachí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (209, N'Chocontá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (210, N'Chámeza', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (211, N'Chía', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (212, N'Chíquiza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (213, N'Chívor', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (214, N'Cicuco', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (215, N'Cimitarra', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (216, N'Circasia', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (217, N'Cisneros', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (218, N'Ciénaga', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (219, N'Ciénaga', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (220, N'Ciénaga de Oro', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (221, N'Clemencia', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (222, N'Cocorná', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (223, N'Coello', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (224, N'Cogua', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (225, N'Colombia', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (226, N'Colosó (Ricaurte)', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (227, N'Colón', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (228, N'Colón (Génova)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (229, N'Concepción', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (230, N'Concepción', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (231, N'Concordia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (232, N'Concordia', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (233, N'Condoto', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (234, N'Confines', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (235, N'Consaca', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (236, N'Contadero', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (237, N'Contratación', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (238, N'Convención', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (239, N'Copacabana', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (240, N'Coper', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (241, N'Cordobá', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (242, N'Corinto', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (243, N'Coromoro', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (244, N'Corozal', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (245, N'Corrales', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (246, N'Cota', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (247, N'Cotorra', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (248, N'Covarachía', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (249, N'Coveñas', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (250, N'Coyaima', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (251, N'Cravo Norte', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (252, N'Cuaspud (Carlosama)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (253, N'Cubarral', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (254, N'Cubará', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (255, N'Cucaita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (256, N'Cucunubá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (257, N'Cucutilla', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (258, N'Cuitiva', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (259, N'Cumaral', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (260, N'Cumaribo', 1, 99)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (261, N'Cumbal', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (262, N'Cumbitara', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (263, N'Cunday', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (264, N'Curillo', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (265, N'Curití', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (266, N'Curumaní', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (267, N'Cáceres', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (268, N'Cáchira', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (269, N'Cácota', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (270, N'Cáqueza', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (271, N'Cértegui', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (272, N'Cómbita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (273, N'Córdoba', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (274, N'Córdoba', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (275, N'Cúcuta', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (276, N'Dabeiba', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (277, N'Dagua', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (278, N'Dibulla', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (279, N'Distracción', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (280, N'Dolores', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (281, N'Don Matías', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (282, N'Dos Quebradas', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (283, N'Duitama', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (284, N'Durania', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (285, N'Ebéjico', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (286, N'El Bagre', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (287, N'El Banco', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (288, N'El Cairo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (289, N'El Calvario', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (290, N'El Carmen', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (291, N'El Carmen', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (292, N'El Carmen de Atrato', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (293, N'El Carmen de Bolívar', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (294, N'El Castillo', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (295, N'El Cerrito', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (296, N'El Charco', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (297, N'El Cocuy', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (298, N'El Colegio', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (299, N'El Copey', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (300, N'El Doncello', 1, 18)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (301, N'El Dorado', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (302, N'El Dovio', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (303, N'El Espino', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (304, N'El Guacamayo', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (305, N'El Guamo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (306, N'El Molino', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (307, N'El Paso', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (308, N'El Paujil', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (309, N'El Peñol', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (310, N'El Peñon', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (311, N'El Peñon', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (312, N'El Peñón', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (313, N'El Piñon', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (314, N'El Playón', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (315, N'El Retorno', 1, 95)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (316, N'El Retén', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (317, N'El Roble', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (318, N'El Rosal', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (319, N'El Rosario', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (320, N'El Tablón de Gómez', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (321, N'El Tambo', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (322, N'El Tambo', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (323, N'El Tarra', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (324, N'El Zulia', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (325, N'El Águila', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (326, N'Elías', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (327, N'Encino', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (328, N'Enciso', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (329, N'Entrerríos', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (330, N'Envigado', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (331, N'Espinal', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (332, N'Facatativá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (333, N'Falan', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (334, N'Filadelfia', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (335, N'Filandia', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (336, N'Firavitoba', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (337, N'Flandes', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (338, N'Florencia', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (339, N'Florencia', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (340, N'Floresta', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (341, N'Florida', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (342, N'Floridablanca', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (343, N'Florián', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (344, N'Fonseca', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (345, N'Fortúl', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (346, N'Fosca', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (347, N'Francisco Pizarro', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (348, N'Fredonia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (349, N'Fresno', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (350, N'Frontino', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (351, N'Fuente de Oro', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (352, N'Fundación', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (353, N'Funes', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (354, N'Funza', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (355, N'Fusagasugá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (356, N'Fómeque', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (357, N'Fúquene', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (358, N'Gachalá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (359, N'Gachancipá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (360, N'Gachantivá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (361, N'Gachetá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (362, N'Galapa', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (363, N'Galeras (Nueva Granada)', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (364, N'Galán', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (365, N'Gama', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (366, N'Gamarra', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (367, N'Garagoa', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (368, N'Garzón', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (369, N'Gigante', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (370, N'Ginebra', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (371, N'Giraldo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (372, N'Girardot', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (373, N'Girardota', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (374, N'Girón', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (375, N'Gonzalez', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (376, N'Gramalote', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (377, N'Granada', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (378, N'Granada', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (379, N'Granada', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (380, N'Guaca', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (381, N'Guacamayas', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (382, N'Guacarí', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (383, N'Guachavés', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (384, N'Guachené', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (385, N'Guachetá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (386, N'Guachucal', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (387, N'Guadalupe', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (388, N'Guadalupe', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (389, N'Guadalupe', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (390, N'Guaduas', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (391, N'Guaitarilla', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (392, N'Gualmatán', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (393, N'Guamal', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (394, N'Guamal', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (395, N'Guamo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (396, N'Guapota', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (397, N'Guapí', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (398, N'Guaranda', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (399, N'Guarne', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (400, N'Guasca', 1, 25)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (401, N'Guatapé', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (402, N'Guataquí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (403, N'Guatavita', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (404, N'Guateque', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (405, N'Guavatá', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (406, N'Guayabal de Siquima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (407, N'Guayabetal', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (408, N'Guayatá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (409, N'Guepsa', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (410, N'Guicán', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (411, N'Gutiérrez', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (412, N'Guática', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (413, N'Gámbita', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (414, N'Gámeza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (415, N'Génova', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (416, N'Gómez Plata', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (417, N'Hacarí', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (418, N'Hatillo de Loba', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (419, N'Hato', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (420, N'Hato Corozal', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (421, N'Hatonuevo', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (422, N'Heliconia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (423, N'Herrán', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (424, N'Herveo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (425, N'Hispania', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (426, N'Hobo', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (427, N'Honda', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (428, N'Ibagué', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (429, N'Icononzo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (430, N'Iles', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (431, N'Imúes', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (432, N'Inzá', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (433, N'Inírida', 1, 94)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (434, N'Ipiales', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (435, N'Isnos', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (436, N'Istmina', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (437, N'Itagüí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (438, N'Ituango', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (439, N'Izá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (440, N'Jambaló', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (441, N'Jamundí', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (442, N'Jardín', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (443, N'Jenesano', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (444, N'Jericó', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (445, N'Jericó', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (446, N'Jerusalén', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (447, N'Jesús María', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (448, N'Jordán', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (449, N'Juan de Acosta', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (450, N'Junín', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (451, N'Juradó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (452, N'La Apartada y La Frontera', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (453, N'La Argentina', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (454, N'La Belleza', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (455, N'La Calera', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (456, N'La Capilla', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (457, N'La Ceja', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (458, N'La Celia', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (459, N'La Cruz', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (460, N'La Cumbre', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (461, N'La Dorada', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (462, N'La Esperanza', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (463, N'La Estrella', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (464, N'La Florida', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (465, N'La Gloria', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (466, N'La Jagua de Ibirico', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (467, N'La Jagua del Pilar', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (468, N'La Llanada', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (469, N'La Macarena', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (470, N'La Merced', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (471, N'La Mesa', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (472, N'La Montañita', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (473, N'La Palma', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (474, N'La Paz', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (475, N'La Paz (Robles)', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (476, N'La Peña', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (477, N'La Pintada', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (478, N'La Plata', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (479, N'La Playa', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (480, N'La Primavera', 1, 99)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (481, N'La Salina', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (482, N'La Sierra', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (483, N'La Tebaida', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (484, N'La Tola', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (485, N'La Unión', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (486, N'La Unión', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (487, N'La Unión', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (488, N'La Unión', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (489, N'La Uvita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (490, N'La Vega', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (491, N'La Vega', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (492, N'La Victoria', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (493, N'La Victoria', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (494, N'La Victoria', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (495, N'La Virginia', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (496, N'Labateca', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (497, N'Labranzagrande', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (498, N'Landázuri', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (499, N'Lebrija', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (500, N'Leiva', 1, 52)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (501, N'Lejanías', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (502, N'Lenguazaque', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (503, N'Leticia', 1, 91)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (504, N'Liborina', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (505, N'Linares', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (506, N'Lloró', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (507, N'Lorica', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (508, N'Los Córdobas', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (509, N'Los Palmitos', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (510, N'Los Patios', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (511, N'Los Santos', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (512, N'Lourdes', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (513, N'Luruaco', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (514, N'Lérida', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (515, N'Líbano', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (516, N'López (Micay)', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (517, N'Macanal', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (518, N'Macaravita', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (519, N'Maceo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (520, N'Machetá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (521, N'Madrid', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (522, N'Magangué', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (523, N'Magüi (Payán)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (524, N'Mahates', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (525, N'Maicao', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (526, N'Majagual', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (527, N'Malambo', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (528, N'Mallama (Piedrancha)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (529, N'Manatí', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (530, N'Manaure', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (531, N'Manaure Balcón del Cesar', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (532, N'Manizales', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (533, N'Manta', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (534, N'Manzanares', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (535, N'Maní', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (536, N'Mapiripan', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (537, N'Margarita', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (538, N'Marinilla', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (539, N'Maripí', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (540, N'Mariquita', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (541, N'Marmato', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (542, N'Marquetalia', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (543, N'Marsella', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (544, N'Marulanda', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (545, N'María la Baja', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (546, N'Matanza', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (547, N'Medellín', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (548, N'Medina', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (549, N'Medio Atrato', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (550, N'Medio Baudó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (551, N'Medio San Juan (ANDAGOYA)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (552, N'Melgar', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (553, N'Mercaderes', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (554, N'Mesetas', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (555, N'Milán', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (556, N'Miraflores', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (557, N'Miraflores', 1, 95)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (558, N'Miranda', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (559, N'Mistrató', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (560, N'Mitú', 1, 97)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (561, N'Mocoa', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (562, N'Mogotes', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (563, N'Molagavita', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (564, N'Momil', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (565, N'Mompós', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (566, N'Mongua', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (567, N'Monguí', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (568, N'Moniquirá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (569, N'Montebello', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (570, N'Montecristo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (571, N'Montelíbano', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (572, N'Montenegro', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (573, N'Monteria', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (574, N'Monterrey', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (575, N'Morales', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (576, N'Morales', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (577, N'Morelia', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (578, N'Morroa', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (579, N'Mosquera', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (580, N'Mosquera', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (581, N'Motavita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (582, N'Moñitos', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (583, N'Murillo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (584, N'Murindó', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (585, N'Mutatá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (586, N'Mutiscua', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (587, N'Muzo', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (588, N'Málaga', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (589, N'Nariño', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (590, N'Nariño', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (591, N'Nariño', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (592, N'Natagaima', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (593, N'Nechí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (594, N'Necoclí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (595, N'Neira', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (596, N'Neiva', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (597, N'Nemocón', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (598, N'Nilo', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (599, N'Nimaima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (600, N'Nobsa', 1, 15)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (601, N'Nocaima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (602, N'Norcasia', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (603, N'Norosí', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (604, N'Novita', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (605, N'Nueva Granada', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (606, N'Nuevo Colón', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (607, N'Nunchía', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (608, N'Nuquí', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (609, N'Nátaga', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (610, N'Obando', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (611, N'Ocamonte', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (612, N'Ocaña', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (613, N'Oiba', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (614, N'Oicatá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (615, N'Olaya', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (616, N'Olaya Herrera', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (617, N'Onzaga', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (618, N'Oporapa', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (619, N'Orito', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (620, N'Orocué', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (621, N'Ortega', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (622, N'Ospina', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (623, N'Otanche', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (624, N'Ovejas', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (625, N'Pachavita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (626, N'Pacho', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (627, N'Padilla', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (628, N'Paicol', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (629, N'Pailitas', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (630, N'Paime', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (631, N'Paipa', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (632, N'Pajarito', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (633, N'Palermo', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (634, N'Palestina', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (635, N'Palestina', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (636, N'Palmar', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (637, N'Palmar de Varela', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (638, N'Palmas del Socorro', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (639, N'Palmira', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (640, N'Palmito', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (641, N'Palocabildo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (642, N'Pamplona', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (643, N'Pamplonita', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (644, N'Pandi', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (645, N'Panqueba', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (646, N'Paratebueno', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (647, N'Pasca', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (648, N'Patía (El Bordo)', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (649, N'Pauna', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (650, N'Paya', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (651, N'Paz de Ariporo', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (652, N'Paz de Río', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (653, N'Pedraza', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (654, N'Pelaya', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (655, N'Pensilvania', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (656, N'Peque', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (657, N'Pereira', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (658, N'Pesca', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (659, N'Peñol', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (660, N'Piamonte', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (661, N'Pie de Cuesta', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (662, N'Piedras', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (663, N'Piendamó', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (664, N'Pijao', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (665, N'Pijiño', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (666, N'Pinchote', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (667, N'Pinillos', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (668, N'Piojo', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (669, N'Pisva', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (670, N'Pital', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (671, N'Pitalito', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (672, N'Pivijay', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (673, N'Planadas', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (674, N'Planeta Rica', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (675, N'Plato', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (676, N'Policarpa', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (677, N'Polonuevo', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (678, N'Ponedera', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (679, N'Popayán', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (680, N'Pore', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (681, N'Potosí', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (682, N'Pradera', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (683, N'Prado', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (684, N'Providencia', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (686, N'Pueblo Bello', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (687, N'Pueblo Nuevo', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (688, N'Pueblo Rico', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (689, N'Pueblorrico', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (690, N'Puebloviejo', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (691, N'Puente Nacional', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (692, N'Puerres', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (693, N'Puerto Asís', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (694, N'Puerto Berrío', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (695, N'Puerto Boyacá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (696, N'Puerto Caicedo', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (697, N'Puerto Carreño', 1, 99)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (698, N'Puerto Colombia', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (699, N'Puerto Concordia', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (700, N'Puerto Escondido', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (701, N'Puerto Gaitán', 1, 50)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (702, N'Puerto Guzmán', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (703, N'Puerto Leguízamo', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (704, N'Puerto Libertador', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (705, N'Puerto Lleras', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (706, N'Puerto López', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (707, N'Puerto Nare', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (708, N'Puerto Nariño', 1, 91)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (709, N'Puerto Parra', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (710, N'Puerto Rico', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (711, N'Puerto Rico', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (712, N'Puerto Rondón', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (713, N'Puerto Salgar', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (714, N'Puerto Santander', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (715, N'Puerto Tejada', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (716, N'Puerto Triunfo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (717, N'Puerto Wilches', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (718, N'Pulí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (719, N'Pupiales', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (720, N'Puracé (Coconuco)', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (721, N'Purificación', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (722, N'Purísima', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (723, N'Pácora', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (724, N'Páez', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (725, N'Páez (Belalcazar)', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (726, N'Páramo', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (727, N'Quebradanegra', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (728, N'Quetame', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (729, N'Quibdó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (730, N'Quimbaya', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (731, N'Quinchía', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (732, N'Quipama', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (733, N'Quipile', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (734, N'Ragonvalia', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (735, N'Ramiriquí', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (736, N'Recetor', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (737, N'Regidor', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (738, N'Remedios', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (739, N'Remolino', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (740, N'Repelón', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (741, N'Restrepo', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (742, N'Restrepo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (743, N'Retiro', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (744, N'Ricaurte', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (745, N'Ricaurte', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (746, N'Rio Negro', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (747, N'Rioblanco', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (748, N'Riofrío', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (749, N'Riohacha', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (750, N'Risaralda', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (751, N'Rivera', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (752, N'Roberto Payán (San José)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (753, N'Roldanillo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (754, N'Roncesvalles', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (755, N'Rondón', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (756, N'Rosas', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (757, N'Rovira', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (758, N'Ráquira', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (759, N'Río Iró', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (760, N'Río Quito', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (761, N'Río Sucio', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (762, N'Río Viejo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (763, N'Río de oro', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (764, N'Ríonegro', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (765, N'Ríosucio', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (766, N'Sabana de Torres', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (767, N'Sabanagrande', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (768, N'Sabanalarga', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (769, N'Sabanalarga', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (770, N'Sabanalarga', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (771, N'Sabanas de San Angel (SAN ANGEL)', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (772, N'Sabaneta', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (773, N'Saboyá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (774, N'Sahagún', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (775, N'Saladoblanco', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (776, N'Salamina', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (777, N'Salamina', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (778, N'Salazar', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (779, N'Saldaña', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (780, N'Salento', 1, 63)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (781, N'Salgar', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (782, N'Samacá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (783, N'Samaniego', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (784, N'Samaná', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (785, N'Sampués', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (786, N'San Agustín', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (787, N'San Alberto', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (788, N'San Andrés', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (789, N'San Andrés Sotavento', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (790, N'San Andrés de Cuerquía', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (791, N'San Antero', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (792, N'San Antonio', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (793, N'San Antonio de Tequendama', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (794, N'San Benito', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (795, N'San Benito Abad', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (796, N'San Bernardo', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (797, N'San Bernardo', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (798, N'San Bernardo del Viento', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (799, N'San Calixto', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (800, N'San Carlos', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (801, N'San Carlos', 1, 23)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (802, N'San Carlos de Guaroa', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (803, N'San Cayetano', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (804, N'San Cayetano', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (805, N'San Cristobal', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (806, N'San Diego', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (807, N'San Eduardo', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (808, N'San Estanislao', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (809, N'San Fernando', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (810, N'San Francisco', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (811, N'San Francisco', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (812, N'San Francisco', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (813, N'San Gíl', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (814, N'San Jacinto', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (815, N'San Jacinto del Cauca', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (816, N'San Jerónimo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (817, N'San Joaquín', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (818, N'San José', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (819, N'San José de Miranda', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (820, N'San José de Montaña', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (821, N'San José de Pare', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (822, N'San José de Uré', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (823, N'San José del Fragua', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (824, N'San José del Guaviare', 1, 95)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (825, N'San José del Palmar', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (826, N'San Juan de Arama', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (827, N'San Juan de Betulia', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (828, N'San Juan de Nepomuceno', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (829, N'San Juan de Pasto', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (830, N'San Juan de Río Seco', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (831, N'San Juan de Urabá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (832, N'San Juan del Cesar', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (833, N'San Juanito', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (834, N'San Lorenzo', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (835, N'San Luis', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (836, N'San Luís', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (837, N'San Luís de Gaceno', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (838, N'San Luís de Palenque', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (839, N'San Marcos', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (840, N'San Martín', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (841, N'San Martín', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (842, N'San Martín de Loba', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (843, N'San Mateo', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (844, N'San Miguel', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (845, N'San Miguel', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (846, N'San Miguel de Sema', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (847, N'San Onofre', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (848, N'San Pablo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (849, N'San Pablo', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (850, N'San Pablo de Borbur', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (851, N'San Pedro', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (852, N'San Pedro', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (853, N'San Pedro', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (854, N'San Pedro de Cartago', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (855, N'San Pedro de Urabá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (856, N'San Pelayo', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (857, N'San Rafael', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (858, N'San Roque', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (859, N'San Sebastián', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (860, N'San Sebastián de Buenavista', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (861, N'San Vicente', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (862, N'San Vicente del Caguán', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (863, N'San Vicente del Chucurí', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (864, N'San Zenón', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (865, N'Sandoná', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (866, N'Santa Ana', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (867, N'Santa Bárbara', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (868, N'Santa Bárbara', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (869, N'Santa Bárbara (Iscuandé)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (870, N'Santa Bárbara de Pinto', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (871, N'Santa Catalina', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (872, N'Santa Fé de Antioquia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (873, N'Santa Genoveva de Docorodó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (874, N'Santa Helena del Opón', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (875, N'Santa Isabel', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (876, N'Santa Lucía', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (877, N'Santa Marta', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (878, N'Santa María', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (879, N'Santa María', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (880, N'Santa Rosa', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (881, N'Santa Rosa', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (882, N'Santa Rosa de Cabal', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (883, N'Santa Rosa de Osos', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (884, N'Santa Rosa de Viterbo', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (885, N'Santa Rosa del Sur', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (886, N'Santa Rosalía', 1, 99)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (887, N'Santa Sofía', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (888, N'Santana', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (889, N'Santander de Quilichao', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (890, N'Santiago', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (891, N'Santiago', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (892, N'Santo Domingo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (893, N'Santo Tomás', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (894, N'Santuario', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (895, N'Santuario', 1, 66)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (896, N'Sapuyes', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (897, N'Saravena', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (898, N'Sardinata', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (899, N'Sasaima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (900, N'Sativanorte', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (901, N'Sativasur', 1, 15)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (902, N'Segovia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (903, N'Sesquilé', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (904, N'Sevilla', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (905, N'Siachoque', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (906, N'Sibaté', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (907, N'Sibundoy', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (908, N'Silos', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (909, N'Silvania', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (910, N'Silvia', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (911, N'Simacota', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (912, N'Simijaca', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (913, N'Simití', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (914, N'Sincelejo', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (915, N'Sincé', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (916, N'Sipí', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (917, N'Sitionuevo', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (918, N'Soacha', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (919, N'Soatá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (920, N'Socha', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (921, N'Socorro', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (922, N'Socotá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (923, N'Sogamoso', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (924, N'Solano', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (925, N'Soledad', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (926, N'Solita', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (927, N'Somondoco', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (928, N'Sonsón', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (929, N'Sopetrán', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (930, N'Soplaviento', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (931, N'Sopó', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (932, N'Sora', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (933, N'Soracá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (934, N'Sotaquirá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (935, N'Sotara (Paispamba)', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (936, N'Sotomayor (Los Andes)', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (937, N'Suaita', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (938, N'Suan', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (939, N'Suaza', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (940, N'Subachoque', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (941, N'Sucre', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (942, N'Sucre', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (943, N'Sucre', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (944, N'Suesca', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (945, N'Supatá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (946, N'Supía', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (947, N'Suratá', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (948, N'Susa', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (949, N'Susacón', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (950, N'Sutamarchán', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (951, N'Sutatausa', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (952, N'Sutatenza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (953, N'Suárez', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (954, N'Suárez', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (955, N'Sácama', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (956, N'Sáchica', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (957, N'Tabio', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (958, N'Tadó', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (959, N'Talaigua Nuevo', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (960, N'Tamalameque', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (961, N'Tame', 1, 81)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (962, N'Taminango', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (963, N'Tangua', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (964, N'Taraira', 1, 97)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (965, N'Tarazá', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (966, N'Tarqui', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (967, N'Tarso', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (968, N'Tasco', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (969, N'Tauramena', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (970, N'Tausa', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (971, N'Tello', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (972, N'Tena', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (973, N'Tenerife', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (974, N'Tenjo', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (975, N'Tenza', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (976, N'Teorama', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (977, N'Teruel', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (978, N'Tesalia', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (979, N'Tibacuy', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (980, N'Tibaná', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (981, N'Tibasosa', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (982, N'Tibirita', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (983, N'Tibú', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (984, N'Tierralta', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (985, N'Timaná', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (986, N'Timbiquí', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (987, N'Timbío', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (988, N'Tinjacá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (989, N'Tipacoque', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (990, N'Tiquisio (Puerto Rico)', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (991, N'Titiribí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (992, N'Toca', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (993, N'Tocaima', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (994, N'Tocancipá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (995, N'Toguí', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (996, N'Toledo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (997, N'Toledo', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (998, N'Tolú', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (999, N'Tolú Viejo', 1, 70)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1000, N'Tona', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1001, N'Topagá', 1, 15)
GO
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1002, N'Topaipí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1003, N'Toribío', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1004, N'Toro', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1005, N'Tota', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1006, N'Totoró', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1007, N'Trinidad', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1008, N'Trujillo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1009, N'Tubará', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1010, N'Tuchín', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1011, N'Tulúa', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1012, N'Tumaco', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1013, N'Tunja', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1014, N'Tunungua', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1015, N'Turbaco', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1016, N'Turbaná', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1017, N'Turbo', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1018, N'Turmequé', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1019, N'Tuta', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1020, N'Tutasá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1021, N'Támara', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1022, N'Támesis', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1023, N'Túquerres', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1024, N'Ubalá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1025, N'Ubaque', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1026, N'Ubaté', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1027, N'Ulloa', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1028, N'Une', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1029, N'Unguía', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1030, N'Unión Panamericana (ÁNIMAS)', 1, 27)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1031, N'Uramita', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1032, N'Uribe', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1033, N'Uribia', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1034, N'Urrao', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1035, N'Urumita', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1036, N'Usiacuri', 1, 8)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1037, N'Valdivia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1038, N'Valencia', 1, 23)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1039, N'Valle de San José', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1040, N'Valle de San Juan', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1041, N'Valle del Guamuez', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1042, N'Valledupar', 1, 20)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1043, N'Valparaiso', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1044, N'Valparaiso', 1, 18)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1045, N'Vegachí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1046, N'Venadillo', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1047, N'Venecia', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1048, N'Venecia (Ospina Pérez)', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1049, N'Ventaquemada', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1050, N'Vergara', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1051, N'Versalles', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1052, N'Vetas', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1053, N'Viani', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1054, N'Vigía del Fuerte', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1055, N'Vijes', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1056, N'Villa Caro', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1057, N'Villa Rica', 1, 19)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1058, N'Villa de Leiva', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1059, N'Villa del Rosario', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1060, N'Villagarzón', 1, 86)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1061, N'Villagómez', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1062, N'Villahermosa', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1063, N'Villamaría', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1064, N'Villanueva', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1065, N'Villanueva', 1, 44)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1066, N'Villanueva', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1067, N'Villanueva', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1068, N'Villapinzón', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1069, N'Villarrica', 1, 73)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1070, N'Villavicencio', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1071, N'Villavieja', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1072, N'Villeta', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1073, N'Viotá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1074, N'Viracachá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1075, N'Vista Hermosa', 1, 50)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1076, N'Viterbo', 1, 17)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1077, N'Vélez', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1078, N'Yacopí', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1079, N'Yacuanquer', 1, 52)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1080, N'Yaguará', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1081, N'Yalí', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1082, N'Yarumal', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1083, N'Yolombó', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1084, N'Yondó (Casabe)', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1085, N'Yopal', 1, 85)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1086, N'Yotoco', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1087, N'Yumbo', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1088, N'Zambrano', 1, 13)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1089, N'Zapatoca', 1, 68)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1090, N'Zapayán (PUNTA DE PIEDRAS)', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1091, N'Zaragoza', 1, 5)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1092, N'Zarzal', 1, 76)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1093, N'Zetaquirá', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1094, N'Zipacón', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1095, N'Zipaquirá', 1, 25)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1096, N'Zona Bananera (PRADO - SEVILLA)', 1, 47)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1097, N'Ábrego', 1, 54)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1098, N'Íquira', 1, 41)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1099, N'Úmbita', 1, 15)
INSERT [dbo].[Municipios] ([id], [nombre], [estado], [idDepartamento]) VALUES (1100, N'Útica', 1, 25)
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Departamentos]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Municipios] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Municipios] ([id])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Municipios]
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estados] ([id])
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD FOREIGN KEY([IdMotivo])
REFERENCES [dbo].[Motivos] ([id])
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([id])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClientes]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarClientes]
@id int,
  @Identificacion varchar(10),
      @Nombre varchar(50),
      @Apellido varchar (50),
      @Telefono varchar (20),
     @Correo varchar(100),
     @idDepartamento int,
      @idCiudad int,
      @FechaNacimento datetime
AS
BEGIN
	update  Clientes set  
		[Identificacion]=@Identificacion ,
		[Nombre]=@Nombre ,
		[Apellido]=@Apellido ,
		[Telefono]=@Telefono ,
		[Correo]=@Correo ,
		[idDepartamento]=@idDepartamento ,
		[idCiudad]=@idCiudad ,
		[FechaNacimento]=@FechaNacimento
	where id=@id
  END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEventos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarEventos] 
	@id int,
	@fechaEvento datetime,
    @CantidadPersonas int,
    @IdMotivo int,
    @Observaciones varchar(max),
    @IdEstado int
AS
BEGIN
	update  Eventos	set	[fechaEvento]=@fechaEvento,[CantidadPersonas]=@CantidadPersonas ,[IdMotivo]=@IdMotivo,[Observaciones]=@Observaciones 
	,[IdEstado]=@IdEstado where id=@id
 END
GO
/****** Object:  StoredProcedure [dbo].[EliminarClientes]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EliminarClientes]
@id int
AS
BEGIN
	delete from Clientes where id=@id
  END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEventos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EliminarEventos] 	
      @Id int      
AS
BEGIN
	delete from Eventos where id=@id
  END
GO
/****** Object:  StoredProcedure [dbo].[InsertarClientes]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarClientes]
  @Identificacion varchar(10),
      @Nombre varchar(50),
      @Apellido varchar (50),
      @Telefono varchar (20),
     @Correo varchar(100),
     @idDepartamento int,
      @idCiudad int,
      @FechaNacimento datetime
AS
BEGIN
	insert into Clientes ([Identificacion],[Nombre],[Apellido],[Telefono],[Correo],[idDepartamento],[idCiudad],
	[FechaNacimento])values(@Identificacion,@Nombre ,@Apellido,@Telefono,@Correo,@idDepartamento,@idCiudad,
	@FechaNacimento)
  END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEventos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarEventos] 	
      @IdCliente int,
      @fechaEvento datetime,
      @CantidadPersonas int,
      @IdMotivo int,
      @Observaciones varchar(max),
      @IdEstado int
AS
BEGIN
	insert into Eventos	
	([IdCliente],[fechaEvento],[CantidadPersonas],[IdMotivo],[Observaciones],[IdEstado])
	values  
	(@IdCliente ,@fechaEvento ,@CantidadPersonas ,@IdMotivo ,@Observaciones ,@IdEstado )
  END
GO
/****** Object:  StoredProcedure [dbo].[ListarClientes]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarClientes]
AS
BEGIN
	SELECT
	[Id],
	[Identificacion],
	[Nombre],
	[Apellido],
	[Telefono],
	[Correo],
	[idDepartamento],
	(select nombre from Departamentos where id=idDepartamento )deepartamento ,
	[idCiudad],
	(select nombre from Municipios where id=idCiudad )ciudad,
	FechaNacimento,
	DATEDIFF(year,FechaNacimento, getdate()  )  edad,
	(select count(*) from Eventos where IdCliente= cli.id ) cantidadEventos
  FROM [reservas].[dbo].[Clientes] cli
  END
GO
/****** Object:  StoredProcedure [dbo].[Listardepartamentos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listardepartamentos]	
AS
BEGIN
	select id ,nombre from Departamentos order by nombre asc
END
GO
/****** Object:  StoredProcedure [dbo].[Listarestados]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Listarestados]
AS
BEGIN
	select id ,nombre  from Estados  
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEventos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarEventos]
AS
BEGIN
	select Eventos . [id],
	IdCliente,
	clientes.Identificacion
	
	,[IdMotivo]
	,(select nombre from Motivos where id=IdMotivo ) motivo
      ,[fechaEvento]
      ,[CantidadPersonas]
      
      ,[Observaciones]
      ,[IdEstado] 
	  ,(select nombre from Estados where id =IdEstado ) estado
	  from clientes inner join  Eventos  on clientes.id=Eventos .IdCliente 
  END
GO
/****** Object:  StoredProcedure [dbo].[ListarMotivos]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarMotivos]
AS
BEGIN
	select id ,nombre  from Motivos 
END
GO
/****** Object:  StoredProcedure [dbo].[ListarMunicipiosPorDepartamento]    Script Date: 24/11/2022 9:46:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ListarMunicipiosPorDepartamento]
@id int
AS
BEGIN
	select id ,nombre ,idDepartamento from Municipios where idDepartamento =@id  order by nombre asc
END
GO
USE [master]
GO
ALTER DATABASE [reservas] SET  READ_WRITE 
GO
