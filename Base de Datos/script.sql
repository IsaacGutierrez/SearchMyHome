USE [master]
GO
/****** Object:  Database [SearchMyHomeDB]    Script Date: 12/02/2017 15:27:21 ******/
CREATE DATABASE [SearchMyHomeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SearchMyHomeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SearchMyHomeDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SearchMyHomeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SearchMyHomeDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SearchMyHomeDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SearchMyHomeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SearchMyHomeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SearchMyHomeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SearchMyHomeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SearchMyHomeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SearchMyHomeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [SearchMyHomeDB] SET  MULTI_USER 
GO
ALTER DATABASE [SearchMyHomeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SearchMyHomeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SearchMyHomeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SearchMyHomeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SearchMyHomeDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SearchMyHomeDB', N'ON'
GO
USE [SearchMyHomeDB]
GO
/****** Object:  Table [dbo].[AgentesInmobiliarios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgentesInmobiliarios](
	[agenteInmobiliarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[sucursalId] [int] NOT NULL,
 CONSTRAINT [PK_AgentesInmobiliarios] PRIMARY KEY CLUSTERED 
(
	[agenteInmobiliarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AnuncioPublicitario]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AnuncioPublicitario](
	[anuncioPublicitarioId] [int] IDENTITY(1,1) NOT NULL,
	[tituloAnuncio] [varchar](200) NOT NULL,
	[servicioInmobiliarioId] [int] NOT NULL,
	[suscriptorId] [int] NOT NULL,
	[fechaPublicacion] [datetime] NOT NULL,
	[fechaExpiracion] [datetime] NOT NULL,
	[inmuebleId] [int] NOT NULL,
	[descripcion] [varchar](300) NOT NULL,
	[estadoAnuncioId] [int] NOT NULL,
	[numeroVisitantes] [int] NULL,
 CONSTRAINT [PK_AnuncioPublicitario] PRIMARY KEY CLUSTERED 
(
	[anuncioPublicitarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[clienteId] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[inmobiliariaId] [int] NULL,
	[documentoIdentidad] [varchar](30) NOT NULL,
	[numeroTelefonico] [varchar](20) NULL,
	[numeroMovil] [varchar](20) NULL,
	[direccionId] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[clienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Componentes]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componentes](
	[componenteId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Componentes] PRIMARY KEY CLUSTERED 
(
	[componenteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direcciones]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Direcciones](
	[direccionId] [int] IDENTITY(1,1) NOT NULL,
	[calle] [varchar](100) NULL,
	[numeroPropiedad] [varchar](10) NULL,
	[geoLatitud] [varchar](50) NULL,
	[geoLongitud] [varchar](50) NULL,
	[localidadId] [int] NULL,
 CONSTRAINT [PK_Direcciones] PRIMARY KEY CLUSTERED 
(
	[direccionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoAnuncioPublicitario]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoAnuncioPublicitario](
	[estadoAnuncioPublicitarioId] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoAnuncioPublicitarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoInmuebles]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoInmuebles](
	[estadoInmuebleId] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoInmuebles] PRIMARY KEY CLUSTERED 
(
	[estadoInmuebleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstadoSuscripcion]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstadoSuscripcion](
	[estadoSuscripcionId] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoSuscripcion] PRIMARY KEY CLUSTERED 
(
	[estadoSuscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inmobiliarias]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inmobiliarias](
	[inmobiliariaId] [int] IDENTITY(1,1) NOT NULL,
	[suscriptorId] [int] NULL,
	[correoElectronico] [varchar](100) NULL,
	[numeroTelefonico] [varchar](20) NULL,
	[descripcion] [varchar](300) NULL,
 CONSTRAINT [PK_Inmobiliarias] PRIMARY KEY CLUSTERED 
(
	[inmobiliariaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InmuebleComponente]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InmuebleComponente](
	[inmuebleComponenteId] [int] IDENTITY(1,1) NOT NULL,
	[componenteId] [int] NOT NULL,
	[inmuebleId] [int] NULL,
	[cantidad] [float] NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_InmuebleComponente] PRIMARY KEY CLUSTERED 
(
	[inmuebleComponenteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inmuebles]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inmuebles](
	[inmuebleId] [int] NOT NULL,
	[codigoNFC] [varchar](50) NULL,
	[codigoQR] [varchar](50) NULL,
	[descripcion] [varchar](300) NOT NULL,
	[suscriptorId] [int] NULL,
	[tipoInmuebleId] [int] NULL,
	[estadoInmuebleId] [int] NULL,
	[precio] [numeric](18, 2) NOT NULL,
	[direccionId] [int] NULL,
 CONSTRAINT [PK_Inmueble] PRIMARY KEY CLUSTERED 
(
	[inmuebleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InmuebleServicios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InmuebleServicios](
	[inmuebleServicioId] [int] IDENTITY(1,1) NOT NULL,
	[inmuebleId] [int] NULL,
	[servicioId] [int] NULL,
 CONSTRAINT [PK_InmuebleServicios] PRIMARY KEY CLUSTERED 
(
	[inmuebleServicioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidad](
	[localidadId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[geoLongitud] [varchar](50) NULL,
	[geoLatitud] [varchar](50) NULL,
	[municipioId] [int] NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[localidadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Multimedia]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Multimedia](
	[multimediaId] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](200) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[tipoMultimediaId] [int] NULL,
	[inmuebleId] [int] NULL,
 CONSTRAINT [PK_Multimedia] PRIMARY KEY CLUSTERED 
(
	[multimediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Municipios](
	[municipioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[geoLongitud] [varchar](50) NULL,
	[geoLatitud] [varchar](50) NULL,
	[provinciaId] [int] NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[municipioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Periodos](
	[periodoId] [int] IDENTITY(1,1) NOT NULL,
	[periodo] [varchar](50) NULL,
 CONSTRAINT [PK_Periodos] PRIMARY KEY CLUSTERED 
(
	[periodoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincias](
	[provinciaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[geoLatitud] [varchar](50) NULL,
	[geoLongitud] [varchar](50) NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[provinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reunion]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reunion](
	[reunionId] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NULL,
	[fechaTermino] [datetime] NULL,
	[duracion] [time](7) NULL,
	[suscriptorSolicitanteId] [int] NOT NULL,
	[suscriptorEncargadoId] [int] NOT NULL,
	[estadoReunionId] [int] NULL,
 CONSTRAINT [PK_Reunion] PRIMARY KEY CLUSTERED 
(
	[reunionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servicios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicios](
	[servicioId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
	[nombre] [varchar](50) NULL,
	[nombreProveedor] [varchar](50) NULL,
	[tipoServicioId] [int] NULL,
 CONSTRAINT [PK_Servicios] PRIMARY KEY CLUSTERED 
(
	[servicioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiciosInmobiliarios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiciosInmobiliarios](
	[servicoInmobiliarioId] [int] IDENTITY(1,1) NOT NULL,
	[servicioInmobiliario] [varchar](50) NULL,
 CONSTRAINT [PK_ServiciosInmobiliarios] PRIMARY KEY CLUSTERED 
(
	[servicoInmobiliarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursales](
	[sucursalId] [int] IDENTITY(1,1) NOT NULL,
	[direccionId] [int] NULL,
	[numeroTelefonico] [varchar](20) NULL,
	[inmobiliarioId] [int] NULL,
 CONSTRAINT [PK_Sucursales] PRIMARY KEY CLUSTERED 
(
	[sucursalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suscriptor]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suscriptor](
	[suscriptorId] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[password] [varchar](70) NOT NULL,
	[salt] [varchar](70) NOT NULL,
	[direccionId] [int] NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[numeroTelefonico] [varchar](20) NULL,
	[correoElectronico] [varchar](50) NOT NULL,
	[tipoSuscripcionId] [int] NULL,
 CONSTRAINT [PK_Suscriptor] PRIMARY KEY CLUSTERED 
(
	[suscriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoInmuebleComponentes]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoInmuebleComponentes](
	[tipoInmuebleComponenteId] [int] IDENTITY(1,1) NOT NULL,
	[tipoInmuebleId] [int] NULL,
	[componenteId] [int] NULL,
 CONSTRAINT [PK_TipoInmuebleComponentes] PRIMARY KEY CLUSTERED 
(
	[tipoInmuebleComponenteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoInmuebles]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoInmuebles](
	[tipoInmuebleId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TipoInmuebles] PRIMARY KEY CLUSTERED 
(
	[tipoInmuebleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoMultimedia]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoMultimedia](
	[tipoMultimediaId] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TipoMultimedia] PRIMARY KEY CLUSTERED 
(
	[tipoMultimediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoServicios]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoServicios](
	[tipoServicioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[tipoServicioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoSuscripcion]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoSuscripcion](
	[tipoSuscripcionId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](300) NULL,
	[precio] [numeric](5, 2) NULL,
	[periodoId] [int] NULL,
 CONSTRAINT [PK_TipoSuscripcion] PRIMARY KEY CLUSTERED 
(
	[tipoSuscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoSuscripcionSuscriptor]    Script Date: 12/02/2017 15:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSuscripcionSuscriptor](
	[tipoSuscripcionSuscriptorId] [int] IDENTITY(1,1) NOT NULL,
	[suscriptorId] [int] NULL,
	[tipoSuscripcionId] [int] NULL,
	[fechaCompra] [datetime] NULL,
	[fechaExperacion] [datetime] NULL,
	[estadoSuscripcionId] [int] NULL,
 CONSTRAINT [PK_TipoSuscripcionSuscriptor] PRIMARY KEY CLUSTERED 
(
	[tipoSuscripcionSuscriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (1, N'Azua', N'18.4531742', N'-70.73468869999999')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (2, N'Bahoruco', N'18.4879898', N'-71.41822489999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (3, N'Barahona', N'18.2139066', N'-71.10437589999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (4, N'Dajabon', N'19.4196997', N'-71.6144554')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (5, N'Distrito Nacional', N'18.4860575', N'-69.9312117')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (6, N'Duarte', N'19.2090823', N'-70.02700040000002')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (7, N'Elias Piña', N'19.0524685', N'-71.61986860000002')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (8, N'El Seibo', N'18.7658496', N'-69.04066799999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (9, N'Espaillat', N'19.6277658', N'-70.27867750000001')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (10, N'Hato Mayor', N'18.7635799', N'-69.25576369999999')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (11, N'Hermanas Mirabal ', N'19.3747559', N'-70.35132349999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (12, N'Independencia', N'18.3785651', N'-71.52328740000002')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (13, N'La Altagracia', N'18.5850236', N'-68.6201072')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (14, N'La Romana', N'18.4338645', N'-68.96588170000001')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (15, N'La Vega', N'19.2211554', N'-70.52887529999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (16, N'María Trinidad Sánchez', N'19.3734597', N'-69.85144389999999')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (17, N'Monseñor Nouel', N'18.9215234', N'-70.38368149999997')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (18, N'Monte Cristi', N'19.7396899', N'-71.44339839999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (19, N'Monte Plata', N'18.8080878', N'-69.78691459999999')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (20, N'Pedernales', N'18.0395854', N'-71.74148830000001')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (21, N'Peravia', N'18.2786594', N'-70.3335887')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (22, N'Puerto Plata', N'19.7807686', N'-70.68710909999999')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (23, N'Samaná', N'19.2058371', N'-69.33629489999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (24, N'San Crsitóbal', N'18.4180414', N'-70.10658490000003')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (25, N'San José de Ocoa', N'18.543858', N'-70.50418159999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (26, N'San Juan de la Maguana', N'18.8096268', N'-71.23099350000001')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (27, N'San Pedro de Macorís', N'18.4720698', N'-69.29967320000003')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (28, N'Sánchez Ramírez', N'19.052706', N'-70.14922639999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (29, N'Santiago De Los Caballeros', N'19.4791963', N'-70.69305680000002')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (30, N'Santiago Rodríguez', N'19.4786174', N'-71.33982709999998')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (31, N'Santo Domingo', N'18.4860575', N'-69.9312117')
INSERT [dbo].[Provincias] ([provinciaId], [nombre], [geoLatitud], [geoLongitud]) VALUES (32, N'Valverde', N'19.5881221', N'-70.98033099999998')
SET IDENTITY_INSERT [dbo].[Provincias] OFF
SET IDENTITY_INSERT [dbo].[TipoInmuebles] ON 

INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (1, N'Edificio', NULL)
INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (2, N'Casa', NULL)
INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (3, N'Apartamento', NULL)
INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (4, N'Local Negocio', NULL)
INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (5, N'Hotel', NULL)
INSERT [dbo].[TipoInmuebles] ([tipoInmuebleId], [nombre], [descripcion]) VALUES (6, N'Finca', NULL)
SET IDENTITY_INSERT [dbo].[TipoInmuebles] OFF
SET IDENTITY_INSERT [dbo].[TipoMultimedia] ON 

INSERT [dbo].[TipoMultimedia] ([tipoMultimediaId], [descripcion]) VALUES (1, N'Imagen')
INSERT [dbo].[TipoMultimedia] ([tipoMultimediaId], [descripcion]) VALUES (2, N'Video')
SET IDENTITY_INSERT [dbo].[TipoMultimedia] OFF
ALTER TABLE [dbo].[AgentesInmobiliarios]  WITH CHECK ADD  CONSTRAINT [FK_AgentesInmobiliarios_Sucursales] FOREIGN KEY([sucursalId])
REFERENCES [dbo].[Sucursales] ([sucursalId])
GO
ALTER TABLE [dbo].[AgentesInmobiliarios] CHECK CONSTRAINT [FK_AgentesInmobiliarios_Sucursales]
GO
ALTER TABLE [dbo].[AnuncioPublicitario]  WITH CHECK ADD  CONSTRAINT [FK_AnuncioPublicitario_EstadoAnuncioPublicitario] FOREIGN KEY([estadoAnuncioId])
REFERENCES [dbo].[EstadoAnuncioPublicitario] ([estadoAnuncioPublicitarioId])
GO
ALTER TABLE [dbo].[AnuncioPublicitario] CHECK CONSTRAINT [FK_AnuncioPublicitario_EstadoAnuncioPublicitario]
GO
ALTER TABLE [dbo].[AnuncioPublicitario]  WITH CHECK ADD  CONSTRAINT [FK_AnuncioPublicitario_Inmuebles] FOREIGN KEY([inmuebleId])
REFERENCES [dbo].[Inmuebles] ([inmuebleId])
GO
ALTER TABLE [dbo].[AnuncioPublicitario] CHECK CONSTRAINT [FK_AnuncioPublicitario_Inmuebles]
GO
ALTER TABLE [dbo].[AnuncioPublicitario]  WITH CHECK ADD  CONSTRAINT [FK_AnuncioPublicitario_ServiciosInmobiliarios] FOREIGN KEY([servicioInmobiliarioId])
REFERENCES [dbo].[ServiciosInmobiliarios] ([servicoInmobiliarioId])
GO
ALTER TABLE [dbo].[AnuncioPublicitario] CHECK CONSTRAINT [FK_AnuncioPublicitario_ServiciosInmobiliarios]
GO
ALTER TABLE [dbo].[AnuncioPublicitario]  WITH CHECK ADD  CONSTRAINT [FK_AnuncioPublicitario_Suscriptor] FOREIGN KEY([suscriptorId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[AnuncioPublicitario] CHECK CONSTRAINT [FK_AnuncioPublicitario_Suscriptor]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[Direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Direcciones]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Inmobiliarias] FOREIGN KEY([inmobiliariaId])
REFERENCES [dbo].[Inmobiliarias] ([inmobiliariaId])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Inmobiliarias]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Localidad] FOREIGN KEY([localidadId])
REFERENCES [dbo].[Localidad] ([localidadId])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Localidad]
GO
ALTER TABLE [dbo].[Inmobiliarias]  WITH CHECK ADD  CONSTRAINT [FK_Inmobiliarias_Suscriptor] FOREIGN KEY([suscriptorId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[Inmobiliarias] CHECK CONSTRAINT [FK_Inmobiliarias_Suscriptor]
GO
ALTER TABLE [dbo].[InmuebleComponente]  WITH CHECK ADD  CONSTRAINT [FK_InmuebleComponente_Componentes] FOREIGN KEY([componenteId])
REFERENCES [dbo].[Componentes] ([componenteId])
GO
ALTER TABLE [dbo].[InmuebleComponente] CHECK CONSTRAINT [FK_InmuebleComponente_Componentes]
GO
ALTER TABLE [dbo].[InmuebleComponente]  WITH CHECK ADD  CONSTRAINT [FK_InmuebleComponente_Inmuebles] FOREIGN KEY([inmuebleId])
REFERENCES [dbo].[Inmuebles] ([inmuebleId])
GO
ALTER TABLE [dbo].[InmuebleComponente] CHECK CONSTRAINT [FK_InmuebleComponente_Inmuebles]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[Direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Direcciones]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_EstadoInmuebles] FOREIGN KEY([estadoInmuebleId])
REFERENCES [dbo].[EstadoInmuebles] ([estadoInmuebleId])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_EstadoInmuebles]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_Suscriptor] FOREIGN KEY([suscriptorId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_Suscriptor]
GO
ALTER TABLE [dbo].[Inmuebles]  WITH CHECK ADD  CONSTRAINT [FK_Inmuebles_TipoInmuebles] FOREIGN KEY([tipoInmuebleId])
REFERENCES [dbo].[TipoInmuebles] ([tipoInmuebleId])
GO
ALTER TABLE [dbo].[Inmuebles] CHECK CONSTRAINT [FK_Inmuebles_TipoInmuebles]
GO
ALTER TABLE [dbo].[InmuebleServicios]  WITH CHECK ADD  CONSTRAINT [FK_InmuebleServicios_Inmuebles] FOREIGN KEY([inmuebleId])
REFERENCES [dbo].[Inmuebles] ([inmuebleId])
GO
ALTER TABLE [dbo].[InmuebleServicios] CHECK CONSTRAINT [FK_InmuebleServicios_Inmuebles]
GO
ALTER TABLE [dbo].[InmuebleServicios]  WITH CHECK ADD  CONSTRAINT [FK_InmuebleServicios_Servicios] FOREIGN KEY([servicioId])
REFERENCES [dbo].[Servicios] ([servicioId])
GO
ALTER TABLE [dbo].[InmuebleServicios] CHECK CONSTRAINT [FK_InmuebleServicios_Servicios]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Municipios] FOREIGN KEY([municipioId])
REFERENCES [dbo].[Municipios] ([municipioId])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Municipios]
GO
ALTER TABLE [dbo].[Multimedia]  WITH CHECK ADD  CONSTRAINT [FK_Multimedia_Inmuebles] FOREIGN KEY([inmuebleId])
REFERENCES [dbo].[Inmuebles] ([inmuebleId])
GO
ALTER TABLE [dbo].[Multimedia] CHECK CONSTRAINT [FK_Multimedia_Inmuebles]
GO
ALTER TABLE [dbo].[Multimedia]  WITH CHECK ADD  CONSTRAINT [FK_Multimedia_TipoMultimedia] FOREIGN KEY([tipoMultimediaId])
REFERENCES [dbo].[TipoMultimedia] ([tipoMultimediaId])
GO
ALTER TABLE [dbo].[Multimedia] CHECK CONSTRAINT [FK_Multimedia_TipoMultimedia]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Municipios_Provincias] FOREIGN KEY([provinciaId])
REFERENCES [dbo].[Provincias] ([provinciaId])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_Municipios_Provincias]
GO
ALTER TABLE [dbo].[Reunion]  WITH CHECK ADD  CONSTRAINT [FK_Reunion_Suscriptor] FOREIGN KEY([suscriptorEncargadoId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[Reunion] CHECK CONSTRAINT [FK_Reunion_Suscriptor]
GO
ALTER TABLE [dbo].[Reunion]  WITH CHECK ADD  CONSTRAINT [FK_Reunion_SuscriptorSolicitante] FOREIGN KEY([suscriptorSolicitanteId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[Reunion] CHECK CONSTRAINT [FK_Reunion_SuscriptorSolicitante]
GO
ALTER TABLE [dbo].[Servicios]  WITH CHECK ADD  CONSTRAINT [FK_Servicios_TipoServicios] FOREIGN KEY([tipoServicioId])
REFERENCES [dbo].[TipoServicios] ([tipoServicioId])
GO
ALTER TABLE [dbo].[Servicios] CHECK CONSTRAINT [FK_Servicios_TipoServicios]
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[Direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[Sucursales] CHECK CONSTRAINT [FK_Sucursales_Direcciones]
GO
ALTER TABLE [dbo].[Sucursales]  WITH CHECK ADD  CONSTRAINT [FK_Sucursales_Inmobiliarias] FOREIGN KEY([inmobiliarioId])
REFERENCES [dbo].[Inmobiliarias] ([inmobiliariaId])
GO
ALTER TABLE [dbo].[Sucursales] CHECK CONSTRAINT [FK_Sucursales_Inmobiliarias]
GO
ALTER TABLE [dbo].[Suscriptor]  WITH CHECK ADD  CONSTRAINT [FK_Suscriptor_Direcciones] FOREIGN KEY([direccionId])
REFERENCES [dbo].[Direcciones] ([direccionId])
GO
ALTER TABLE [dbo].[Suscriptor] CHECK CONSTRAINT [FK_Suscriptor_Direcciones]
GO
ALTER TABLE [dbo].[Suscriptor]  WITH CHECK ADD  CONSTRAINT [FK_Suscriptor_TipoSuscripcion] FOREIGN KEY([tipoSuscripcionId])
REFERENCES [dbo].[TipoSuscripcion] ([tipoSuscripcionId])
GO
ALTER TABLE [dbo].[Suscriptor] CHECK CONSTRAINT [FK_Suscriptor_TipoSuscripcion]
GO
ALTER TABLE [dbo].[TipoInmuebleComponentes]  WITH CHECK ADD  CONSTRAINT [FK_TipoInmuebleComponentes_Componentes] FOREIGN KEY([tipoInmuebleId])
REFERENCES [dbo].[Componentes] ([componenteId])
GO
ALTER TABLE [dbo].[TipoInmuebleComponentes] CHECK CONSTRAINT [FK_TipoInmuebleComponentes_Componentes]
GO
ALTER TABLE [dbo].[TipoInmuebleComponentes]  WITH CHECK ADD  CONSTRAINT [FK_TipoInmuebleComponentes_TipoInmuebles] FOREIGN KEY([tipoInmuebleId])
REFERENCES [dbo].[TipoInmuebles] ([tipoInmuebleId])
GO
ALTER TABLE [dbo].[TipoInmuebleComponentes] CHECK CONSTRAINT [FK_TipoInmuebleComponentes_TipoInmuebles]
GO
ALTER TABLE [dbo].[TipoSuscripcion]  WITH CHECK ADD  CONSTRAINT [FK_TipoSuscripcion_Periodos] FOREIGN KEY([periodoId])
REFERENCES [dbo].[Periodos] ([periodoId])
GO
ALTER TABLE [dbo].[TipoSuscripcion] CHECK CONSTRAINT [FK_TipoSuscripcion_Periodos]
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor]  WITH CHECK ADD  CONSTRAINT [FK_TipoSuscripcionSuscriptor_EstadoSuscripcion] FOREIGN KEY([estadoSuscripcionId])
REFERENCES [dbo].[EstadoSuscripcion] ([estadoSuscripcionId])
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor] CHECK CONSTRAINT [FK_TipoSuscripcionSuscriptor_EstadoSuscripcion]
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor]  WITH CHECK ADD  CONSTRAINT [FK_TipoSuscripcionSuscriptor_Suscriptor] FOREIGN KEY([suscriptorId])
REFERENCES [dbo].[Suscriptor] ([suscriptorId])
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor] CHECK CONSTRAINT [FK_TipoSuscripcionSuscriptor_Suscriptor]
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor]  WITH CHECK ADD  CONSTRAINT [FK_TipoSuscripcionSuscriptor_TipoSuscripcion] FOREIGN KEY([tipoSuscripcionId])
REFERENCES [dbo].[TipoSuscripcion] ([tipoSuscripcionId])
GO
ALTER TABLE [dbo].[TipoSuscripcionSuscriptor] CHECK CONSTRAINT [FK_TipoSuscripcionSuscriptor_TipoSuscripcion]
GO
USE [master]
GO
ALTER DATABASE [SearchMyHomeDB] SET  READ_WRITE 
GO
