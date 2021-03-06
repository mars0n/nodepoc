USE [master]
GO
/****** Object:  Database [UAI]    Script Date: 29/11/2016 10:19:26 ******/
CREATE DATABASE [UAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UAI', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UAI.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UAI_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UAI_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UAI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [UAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UAI] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UAI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UAI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UAI] SET  MULTI_USER 
GO
ALTER DATABASE [UAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UAI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UAI]
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_ALUMNO]    Script Date: 29/11/2016 10:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================

-- =============================================
CREATE PROCEDURE [dbo].[ELIMINAR_ALUMNO]
	@id int
AS
BEGIN

	DELETE FROM Alumno
	WHERE id_alumno = @id
    
END


GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_ALUMNO]    Script Date: 29/11/2016 10:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|7|0|C:\Users\Fede\AppData\Local\Temp\~vsEFF9.sql
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERTAR_ALUMNO]
	
	
	@legajo int,
	@nombre nvarchar(50),
	@apellido nvarchar(50),
	@documento int,
	@fechaNacimiento datetime
		

AS
Insert into Alumno(
					legajo_alumno,
					nombre_alumno,
					apellido_alumno,
					documento_alumno,
					fechaNacimiento_alumno
					) 		
Values
(@legajo,
 @nombre,
 @apellido,
 @documento,
 @fechaNacimiento)


GO
/****** Object:  StoredProcedure [dbo].[MODIFICAR_ALUMNO]    Script Date: 29/11/2016 10:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MODIFICAR_ALUMNO]
	
	@legajo int,
	@nombre nvarchar(50),
	@apellido nvarchar(50),
	@documento int,
	@fechaNacimiento datetime,
	@id int
	

AS
UPDATE Alumno 
Set legajo_alumno = @legajo,
	nombre_alumno = @nombre ,
	apellido_alumno = @apellido,
	documento_alumno = @documento,
	fechaNacimiento_alumno = @fechaNacimiento
	
WHERE id_alumno = @id
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 29/11/2016 10:19:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[id_alumno] [int] IDENTITY(1,1) NOT NULL,
	[legajo_alumno] [int] NOT NULL,
	[nombre_alumno] [nvarchar](50) NOT NULL,
	[apellido_alumno] [nvarchar](50) NOT NULL,
	[documento_alumno] [int] NOT NULL,
	[fechaNacimiento_alumno] [date] NOT NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([id_alumno], [legajo_alumno], [nombre_alumno], [apellido_alumno], [documento_alumno], [fechaNacimiento_alumno]) VALUES (1, 1234, N'Federico', N'Retta', 35380578, CAST(N'2016-11-27' AS Date))
SET IDENTITY_INSERT [dbo].[Alumno] OFF
USE [master]
GO
ALTER DATABASE [UAI] SET  READ_WRITE 
GO
