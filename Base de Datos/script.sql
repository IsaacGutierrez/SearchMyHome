USE [master]
GO
/****** Object:  Database [SearchMyHomeDB]    Script Date: 9/12/2016 12:52:15 a.m. ******/
CREATE DATABASE [SearchMyHomeDB]

USE [SearchMyHomeDB]
/****** Object:  Table [dbo].[AgentesInmobiliarios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[AnuncioPublicitario]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Componentes]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Direcciones]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[EstadoAnuncioPublicitario]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[EstadoInmuebles]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[EstadoSuscripcion]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Inmobiliarias]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[InmuebleComponente]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Inmuebles]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[InmuebleServicios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Multimedia]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Municipios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Periodos]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Provincias]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[provinciaId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[geoLongitud] [varchar](50) NULL,
	[geoLatitud] [varchar](50) NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[provinciaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reunion]    Script Date: 9/12/2016 12:52:15 a.m. ******/
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
/****** Object:  Table [dbo].[Servicios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ServiciosInmobiliarios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Sucursales]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Suscriptor]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TipoInmuebleComponentes]    Script Date: 9/12/2016 12:52:15 a.m. ******/
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
/****** Object:  Table [dbo].[TipoInmuebles]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TipoMultimedia]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TipoServicios]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TipoSuscripcion]    Script Date: 9/12/2016 12:52:15 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[TipoSuscripcionSuscriptor]    Script Date: 9/12/2016 12:52:15 a.m. ******/
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
