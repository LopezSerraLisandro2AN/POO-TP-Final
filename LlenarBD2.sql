USE [POO-TP-Final]
GO
/****** Object:  Table [dbo].[FormularioPermiso]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormularioPermiso](
	[Formularios_Id] [int] NOT NULL,
	[Permisos_Id] [int] NOT NULL,
 CONSTRAINT [PK_FormularioPermiso] PRIMARY KEY CLUSTERED 
(
	[Formularios_Id] ASC,
	[Permisos_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Formularios]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formularios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[NombreSistema] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Formularios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Perfiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilFormulario]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilFormulario](
	[Perfiles_Id] [int] NOT NULL,
	[Formularios_Id] [int] NOT NULL,
 CONSTRAINT [PK_PerfilFormulario] PRIMARY KEY CLUSTERED 
(
	[Perfiles_Id] ASC,
	[Formularios_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[NombreSistema] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductosSet]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductosSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/07/2022 12:28:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Dni] [nvarchar](max) NOT NULL,
	[Contraseña] [nvarchar](max) NOT NULL,
	[Perfil_Id] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[FormularioPermiso] ([Formularios_Id], [Permisos_Id]) VALUES (1, 1)
INSERT [dbo].[FormularioPermiso] ([Formularios_Id], [Permisos_Id]) VALUES (1, 2)
INSERT [dbo].[FormularioPermiso] ([Formularios_Id], [Permisos_Id]) VALUES (1, 3)
INSERT [dbo].[FormularioPermiso] ([Formularios_Id], [Permisos_Id]) VALUES (2, 4)
INSERT [dbo].[FormularioPermiso] ([Formularios_Id], [Permisos_Id]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[Formularios] ON 

INSERT [dbo].[Formularios] ([Id], [Nombre], [NombreSistema]) VALUES (1, N'Gestionar Usuarios', N'formGestionarUsuarios')
INSERT [dbo].[Formularios] ([Id], [Nombre], [NombreSistema]) VALUES (2, N'Usuario', N'formUsuario')
SET IDENTITY_INSERT [dbo].[Formularios] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfiles] ON 

INSERT [dbo].[Perfiles] ([Id], [Nombre]) VALUES (1, N'Cliente')
INSERT [dbo].[Perfiles] ([Id], [Nombre]) VALUES (2, N'Super Admin')
INSERT [dbo].[Perfiles] ([Id], [Nombre]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Perfiles] OFF
GO
INSERT [dbo].[PerfilFormulario] ([Perfiles_Id], [Formularios_Id]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Permisos] ON 

INSERT [dbo].[Permisos] ([Id], [Nombre], [NombreSistema]) VALUES (1, N'Agregar', N'btnAgregar')
INSERT [dbo].[Permisos] ([Id], [Nombre], [NombreSistema]) VALUES (2, N'Eliminar', N'btnEliminar')
INSERT [dbo].[Permisos] ([Id], [Nombre], [NombreSistema]) VALUES (3, N'Modificar', N'btnModificar')
INSERT [dbo].[Permisos] ([Id], [Nombre], [NombreSistema]) VALUES (4, N'Cancelar', N'btnCancelar')
INSERT [dbo].[Permisos] ([Id], [Nombre], [NombreSistema]) VALUES (5, N'Guardar', N'btnGuardar')
SET IDENTITY_INSERT [dbo].[Permisos] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductosSet] ON 

INSERT [dbo].[ProductosSet] ([Id], [Nombre]) VALUES (2, N'Producto 1 MODIFICADO')
SET IDENTITY_INSERT [dbo].[ProductosSet] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([Id], [Nombre], [Email], [Dni], [Contraseña], [Perfil_Id]) VALUES (1, N'SuperAdmin', N'sistemas@test.com', N'000000', N'Banana1234', 2)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[FormularioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_FormularioPermiso_Formulario] FOREIGN KEY([Formularios_Id])
REFERENCES [dbo].[Formularios] ([Id])
GO
ALTER TABLE [dbo].[FormularioPermiso] CHECK CONSTRAINT [FK_FormularioPermiso_Formulario]
GO
ALTER TABLE [dbo].[FormularioPermiso]  WITH CHECK ADD  CONSTRAINT [FK_FormularioPermiso_Permiso] FOREIGN KEY([Permisos_Id])
REFERENCES [dbo].[Permisos] ([Id])
GO
ALTER TABLE [dbo].[FormularioPermiso] CHECK CONSTRAINT [FK_FormularioPermiso_Permiso]
GO
ALTER TABLE [dbo].[PerfilFormulario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilFormulario_Formulario] FOREIGN KEY([Formularios_Id])
REFERENCES [dbo].[Formularios] ([Id])
GO
ALTER TABLE [dbo].[PerfilFormulario] CHECK CONSTRAINT [FK_PerfilFormulario_Formulario]
GO
ALTER TABLE [dbo].[PerfilFormulario]  WITH CHECK ADD  CONSTRAINT [FK_PerfilFormulario_Perfil] FOREIGN KEY([Perfiles_Id])
REFERENCES [dbo].[Perfiles] ([Id])
GO
ALTER TABLE [dbo].[PerfilFormulario] CHECK CONSTRAINT [FK_PerfilFormulario_Perfil]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioPerfil] FOREIGN KEY([Perfil_Id])
REFERENCES [dbo].[Perfiles] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_UsuarioPerfil]
GO
