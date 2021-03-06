USE [master]
GO
/****** Object:  Database [TestCrud]    Script Date: 13/04/2022 12:19:34 p. m. ******/
CREATE DATABASE [TestCrud]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestCrud', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestCrud.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestCrud_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TestCrud_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestCrud] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestCrud].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestCrud] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestCrud] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestCrud] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestCrud] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestCrud] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestCrud] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestCrud] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestCrud] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestCrud] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestCrud] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestCrud] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestCrud] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestCrud] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestCrud] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestCrud] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestCrud] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestCrud] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestCrud] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestCrud] SET RECOVERY FULL 
GO
ALTER DATABASE [TestCrud] SET  MULTI_USER 
GO
ALTER DATABASE [TestCrud] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestCrud] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestCrud] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestCrud] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestCrud] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestCrud] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestCrud', N'ON'
GO
ALTER DATABASE [TestCrud] SET QUERY_STORE = OFF
GO
USE [TestCrud]
GO
/****** Object:  Table [dbo].[tAlquiler]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tAlquiler](
	[cod_alquiler] [int] IDENTITY(1,1) NOT NULL,
	[cod_pelicula] [int] NULL,
	[cod_usuario] [int] NULL,
	[precio_alquiler] [decimal](18, 0) NULL,
	[fecha_hora] [datetime] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_tAlquiler] PRIMARY KEY CLUSTERED 
(
	[cod_alquiler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCompra]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCompra](
	[cod_compras] [int] IDENTITY(1,1) NOT NULL,
	[cod_pelicula] [int] NULL,
	[cod_usuario] [int] NULL,
	[precio] [decimal](18, 0) NULL,
	[fecha_hora] [datetime] NULL,
	[estado] [int] NULL,
 CONSTRAINT [PK_tCompra] PRIMARY KEY CLUSTERED 
(
	[cod_compras] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tGenero]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tGenero](
	[cod_genero] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPelicula]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPelicula](
	[cod_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[cant_disponibles_alquiler] [int] NULL,
	[cant_disponibles_venta] [int] NULL,
	[precio_alquiler] [numeric](18, 2) NULL,
	[precio_venta] [numeric](18, 2) NULL,
	[cod_genero] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRol](
	[cod_rol] [int] IDENTITY(1,1) NOT NULL,
	[txt_desc] [varchar](500) NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUsers]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUsers](
	[cod_usuario] [int] IDENTITY(1,1) NOT NULL,
	[txt_user] [varchar](50) NULL,
	[txt_password] [varchar](50) NULL,
	[txt_nombre] [varchar](200) NULL,
	[txt_apellido] [varchar](200) NULL,
	[nro_doc] [varchar](50) NULL,
	[cod_rol] [int] NULL,
	[sn_activo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tGenero] ON 

INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (1, N'Acción')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (2, N'Comedia')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (3, N'Drama')
INSERT [dbo].[tGenero] ([cod_genero], [txt_desc]) VALUES (4, N'Terror')
SET IDENTITY_INSERT [dbo].[tGenero] OFF
GO
SET IDENTITY_INSERT [dbo].[tPelicula] ON 

INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta], [cod_genero]) VALUES (1, N'Duro de matar III', 3, 0, CAST(1.50 AS Numeric(18, 2)), CAST(5.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta], [cod_genero]) VALUES (2, N'Todo Poderoso', 2, 1, CAST(1.50 AS Numeric(18, 2)), CAST(7.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta], [cod_genero]) VALUES (3, N'Stranger than fiction', 1, 1, CAST(1.50 AS Numeric(18, 2)), CAST(8.00 AS Numeric(18, 2)), NULL)
INSERT [dbo].[tPelicula] ([cod_pelicula], [txt_desc], [cant_disponibles_alquiler], [cant_disponibles_venta], [precio_alquiler], [precio_venta], [cod_genero]) VALUES (4, N'OUIJA', 0, 2, CAST(2.00 AS Numeric(18, 2)), CAST(20.50 AS Numeric(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[tPelicula] OFF
GO
SET IDENTITY_INSERT [dbo].[tRol] ON 

INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (1, N'Administrador', -1)
INSERT [dbo].[tRol] ([cod_rol], [txt_desc], [sn_activo]) VALUES (2, N'Cliente', -1)
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsers] ON 

INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (2, N'userTest', N'Test1', N'Ariel', N'ApellidoConA', N'12312321', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (3, N'userTest2', N'Test2', N'Bernardo', N'ApellidoConB', N'12312322', 1, -1)
INSERT [dbo].[tUsers] ([cod_usuario], [txt_user], [txt_password], [txt_nombre], [txt_apellido], [nro_doc], [cod_rol], [sn_activo]) VALUES (4, N'userTest3', N'Test3', N'Carlos', N'ApellidoConC', N'12312323', 1, -1)
SET IDENTITY_INSERT [dbo].[tUsers] OFF
GO
ALTER TABLE [dbo].[tAlquiler]  WITH CHECK ADD  CONSTRAINT [FK_tAlquiler_tPelicula] FOREIGN KEY([cod_pelicula])
REFERENCES [dbo].[tPelicula] ([cod_pelicula])
GO
ALTER TABLE [dbo].[tAlquiler] CHECK CONSTRAINT [FK_tAlquiler_tPelicula]
GO
ALTER TABLE [dbo].[tAlquiler]  WITH CHECK ADD  CONSTRAINT [FK_tAlquiler_tUsers] FOREIGN KEY([cod_usuario])
REFERENCES [dbo].[tUsers] ([cod_usuario])
GO
ALTER TABLE [dbo].[tAlquiler] CHECK CONSTRAINT [FK_tAlquiler_tUsers]
GO
ALTER TABLE [dbo].[tCompra]  WITH CHECK ADD  CONSTRAINT [FK_tCompra_tPelicula] FOREIGN KEY([cod_pelicula])
REFERENCES [dbo].[tPelicula] ([cod_pelicula])
GO
ALTER TABLE [dbo].[tCompra] CHECK CONSTRAINT [FK_tCompra_tPelicula]
GO
ALTER TABLE [dbo].[tCompra]  WITH CHECK ADD  CONSTRAINT [FK_tCompra_tUsers] FOREIGN KEY([cod_usuario])
REFERENCES [dbo].[tUsers] ([cod_usuario])
GO
ALTER TABLE [dbo].[tCompra] CHECK CONSTRAINT [FK_tCompra_tUsers]
GO
ALTER TABLE [dbo].[tUsers]  WITH CHECK ADD  CONSTRAINT [fk_user_rol] FOREIGN KEY([cod_rol])
REFERENCES [dbo].[tRol] ([cod_rol])
GO
ALTER TABLE [dbo].[tUsers] CHECK CONSTRAINT [fk_user_rol]
GO
/****** Object:  StoredProcedure [dbo].[SP_ALQUILER]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ALQUILER]
	@pcod_pelicula INT,
	@pcod_usuario INT,
	@pprecio_alquiler DECIMAL (18,0),
	@pcantidad INT,
	@pfecha_hora DATETIME,
	@pestado INT
AS
BEGIN
	
	DECLARE @existenciaStock INT 

	SET @existenciaStock = (SELECT cant_disponibles_alquiler 
		FROM tPelicula
		WHERE cod_pelicula = @pcod_pelicula);

	IF (@existenciaStock >= @pcantidad)
		DECLARE @restaExist INT

		SET @restaExist = @existenciaStock - @pcantidad;

		UPDATE tPelicula SET cant_disponibles_alquiler = @restaExist 
		WHERE cod_pelicula = @pcod_pelicula;

		INSERT INTO tAlquiler (cod_pelicula,
		cod_usuario,
		precio_alquiler,
		fecha_hora,
		estado) 
		VALUES (
		@pcod_pelicula,
		@pcod_usuario,
		@pprecio_alquiler,
		@pfecha_hora,
		@pestado);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_COMPRA]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_COMPRA]
	@pcod_pelicula INT,
	@pcod_usuario INT,
	@pprecio DECIMAL (18,0),
	@pcantidad INT,
	@pfecha_hora DATETIME,
	@pestado INT
AS
BEGIN
	
	DECLARE @existenciaStock INT 

	SET @existenciaStock = (SELECT cant_disponibles_venta 
		FROM tPelicula
		WHERE cod_pelicula = @pcod_pelicula);

	IF (@existenciaStock >= @pcantidad)
		DECLARE @precioVenta NUMERIC(18,2)
		DECLARE @precioTotal NUMERIC (18,2)
		DECLARE @restaExist INT

		SET @precioVenta = (SELECT precio_venta FROM tPeliculas WHERE cod_pelicula = @pcod_pelicula);

		SET @restaExist = (@existenciaStock - @pcantidad);
		SET @precioTotal = (@precioVenta * @pcantidad);

		UPDATE tPelicula 
		SET cant_disponibles_venta = @restaExist		
		WHERE cod_pelicula = @pcod_pelicula;

		INSERT INTO tCompra (cod_pelicula,
		cod_usuario,
		precio,
		fecha_hora,
		estado) 
		VALUES (
		@pcod_pelicula,
		@pcod_usuario,
		@precioTotal,
		@pfecha_hora,
		@pestado);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GENERO]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GENERO]
	@pOpcionAccion CHAR(1),
	@pcod_pelicula INT,
	@pcod_genero INT,
	@ptxt_desc INT
AS
BEGIN
	-- crear genero
	IF (@pOpcionAccion = 'C')
		INSERT INTO tGenero (txt_desc) 
		VALUES (@ptxt_desc)
	-- asignar Genero
	ELSE IF(@pOpcionAccion = 'A')
		DECLARE @existGeneroPelicula INT;

		SET @existGeneroPelicula = (SELECT COUNT(*) 

		FROM tPelicula
		INNER JOIN tGenero ON tPelicula.cod_genero = tGenero.cod_genero
		WHERE cod_pelicula = @pcod_pelicula);

		IF (@existGeneroPelicula > 1)
			RETURN 'La pelicula ya tiene genero';
		ELSE
			UPDATE tPelicula
			SET cod_genero = @pcod_genero
			WHERE cod_pelicula = @pcod_pelicula;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_USUARIOS]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_INSERT_USUARIOS] 
	-- Add the parameters for the stored procedure here
	@ptxt_user VARCHAR(50),
	@ptxt_password VARCHAR(50),
	@ptxt_nombre VARCHAR(200), 
	@ptxt_apellido VARCHAR(200), 
	@pnro_doc VARCHAR(50),
	@pcod_rol INT, 
	@psn_activo INT
AS
BEGIN
	Declare @existUser int;
	SET @existUser = (SELECT COUNT(*) as cantUsers FROM tUsers WHERE nro_doc = @pnro_doc);
	IF (@existUser > 1)
		RETURN 'El usuario ya existe'
	ELSE
		INSERT INTO tUsers(txt_user,txt_password,txt_nombre,txt_apellido,nro_doc,cod_rol,sn_activo) VALUES(@ptxt_user,@ptxt_password,@ptxt_nombre,@ptxt_apellido,@pnro_doc,@pcod_rol,@psn_activo);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PELICULAS]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PELICULAS]
	@pOpcionAccion CHAR(1),
	@pcod_pelicula INT,
	@ptxt_desc VARCHAR(50),
	@pcant_disponibles_alquiler int,
	@pcant_disponibles_venta int, 
	@pprecio_alquiler numeric(18,2), 
	@pprecio_venta numeric(18,2)
AS
BEGIN
	-- crear
	IF (@pOpcionAccion = 'C')
		INSERT INTO tPelicula (txt_desc,cant_disponibles_alquiler,cant_disponibles_venta, precio_alquiler, precio_venta) 
		VALUES (@ptxt_desc,@pcant_disponibles_alquiler,@pcant_disponibles_venta, @pprecio_alquiler, @pprecio_venta)
	-- borrar
	ELSE IF(@pOpcionAccion = 'B')
		UPDATE tPelicula 
		SET cant_disponibles_alquiler = 0, cant_disponibles_venta = 0 
		WHERE cod_pelicula = @pcod_pelicula
	-- modificar
	ELSE IF(@pOpcionAccion = 'M')
		UPDATE tPelicula 
		SET txt_desc = @ptxt_desc, cant_disponibles_alquiler = @pcant_disponibles_alquiler,cant_disponibles_venta = @pcant_disponibles_venta, precio_alquiler = @pprecio_alquiler, precio_venta = @pprecio_venta
		WHERE cod_pelicula = @pcod_pelicula
	ELSE
		RETURN 'no existe esa accion en el procedimiento';
END
GO
/****** Object:  StoredProcedure [dbo].[SP_STOCK_ALQUILER]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_STOCK_ALQUILER]
AS
BEGIN
	SELECT * FROM tPelicula WHERE cant_disponibles_alquiler >0;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_STOCK_VENTA]    Script Date: 13/04/2022 12:19:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_STOCK_VENTA]
AS
BEGIN
	SELECT * FROM tPelicula WHERE cant_disponibles_venta > 0;
END
GO
USE [master]
GO
ALTER DATABASE [TestCrud] SET  READ_WRITE 
GO
