USE [master]
GO
/****** Object:  Database [PO_1]    Script Date: 15.11.2023 12:07:08 ******/
CREATE DATABASE [PO_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PO_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERV1215\MSSQL\DATA\PO_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'PO_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SERV1215\MSSQL\DATA\PO_1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PO_1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PO_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PO_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PO_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PO_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PO_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PO_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [PO_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PO_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PO_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PO_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PO_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PO_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PO_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PO_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PO_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PO_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PO_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PO_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PO_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PO_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PO_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PO_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PO_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PO_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PO_1] SET  MULTI_USER 
GO
ALTER DATABASE [PO_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PO_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PO_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PO_1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PO_1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PO_1', N'ON'
GO
ALTER DATABASE [PO_1] SET QUERY_STORE = OFF
GO
USE [PO_1]
GO
/****** Object:  User [user01]    Script Date: 15.11.2023 12:07:09 ******/
CREATE USER [user01] FOR LOGIN [user01] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[GreatestCommonDivisor]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GreatestCommonDivisor](@a INT, @b INT) RETURNS INT
AS
BEGIN
    WHILE @b != 0
    BEGIN
        DECLARE @temp INT
        SET @temp = @b
        SET @b = @a % @b
        SET @a = @temp
    END

    RETURN @a
END
GO
/****** Object:  UserDefinedFunction [dbo].[LeastCommonMultiple]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[LeastCommonMultiple](@a INT, @b INT) RETURNS INT
AS
BEGIN
    DECLARE @gcd INT
    SET @gcd = dbo.GreatestCommonDivisor(@a, @b)

    DECLARE @lcm INT
    SET @lcm = (@a * @b) / @gcd

    RETURN @lcm
END
GO
/****** Object:  UserDefinedFunction [dbo].[Zadanie1]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Zadanie1]
(
@Страна AS VARCHAR(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
DECLARE @S AS VARCHAR(50)
SELECT @S = c.Capital
FROM dbo.Country c
WHERE c.Names = @Страна
RETURN @S
END
GO
/****** Object:  Table [dbo].[Akademik]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Akademik](
	[Id_Akademik] [int] NOT NULL,
	[FIO] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Specialisation] [nvarchar](50) NULL,
	[Date_Zvanie] [int] NULL,
 CONSTRAINT [PK_Akademik] PRIMARY KEY CLUSTERED 
(
	[Id_Akademik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal_Faiz_Kog]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal_Faiz_Kog](
	[ID_AFK] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Detachment] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_AFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id_Countries] [int] NOT NULL,
	[Names] [nvarchar](50) NULL,
	[Capital] [nvarchar](50) NULL,
	[Continent] [nvarchar](50) NULL,
	[People] [int] NULL,
	[Rectangles] [int] NULL,
	[Id_Management] [int] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id_Countries] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries_Faiz_Kog]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries_Faiz_Kog](
	[ID_MFK] [int] NOT NULL,
	[Vid] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id_Country] [int] NOT NULL,
	[Names] [nvarchar](50) NULL,
	[Capital] [nvarchar](50) NULL,
	[Rectangles] [int] NULL,
	[Peoples] [int] NULL,
	[Continent] [nvarchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id_Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Code_Discipline] [int] NOT NULL,
	[Obiem] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Shifr_Kafedra] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[Code_Discipline] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Tab_Number] [int] NOT NULL,
	[Shifr_Kafedra] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Dolgnost] [nvarchar](50) NULL,
	[Zarplata] [decimal](18, 2) NULL,
	[Chief] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Tab_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineer]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineer](
	[ID_Engineer] [int] NOT NULL,
	[Tab_Number] [int] NOT NULL,
	[Specialization_Engineer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Engineer] PRIMARY KEY CLUSTERED 
(
	[ID_Engineer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID_Exam] [int] NOT NULL,
	[Data] [date] NULL,
	[Code_Discipline] [int] NOT NULL,
	[Reg_Number] [int] NOT NULL,
	[Tab_Number] [int] NOT NULL,
	[Auditoriya] [nvarchar](50) NULL,
	[Ocenka] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID_Exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Abreviatura_Faculty] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[Abreviatura_Faculty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flower_Faiz_Kog]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flower_Faiz_Kog](
	[ID_FFK] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Class] [nvarchar](50) NULL,
	[Colour] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_FFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gimnazisty]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gimnazisty](
	[Id_Students] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Subjecs] [nvarchar](50) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[Scores] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kafedra]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kafedra](
	[Shifr_Kafedra] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Abreviatura_Faculty] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kafedra] PRIMARY KEY CLUSTERED 
(
	[Shifr_Kafedra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managament_Faiz_Kog]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managament_Faiz_Kog](
	[ID_MFK] [int] IDENTITY(1,1) NOT NULL,
	[Vid] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MFK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Management]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Management](
	[Id_Management] [int] NOT NULL,
	[Names] [nvarchar](50) NULL,
 CONSTRAINT [PK_Management] PRIMARY KEY CLUSTERED 
(
	[Id_Management] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prepodavatel]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prepodavatel](
	[ID_Prepodavatel] [int] NOT NULL,
	[Tab_Number] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Stepen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Prepodavatel] PRIMARY KEY CLUSTERED 
(
	[ID_Prepodavatel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Number_Specialization] [nvarchar](50) NOT NULL,
	[Napravlenie] [nvarchar](100) NULL,
	[Shifr_Kafedra] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Number_Specialization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Reg_Number] [int] NOT NULL,
	[Number_Specialization] [nvarchar](50) NOT NULL,
	[FIO] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Reg_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id_Students] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Subjecs] [nvarchar](50) NOT NULL,
	[School] [nvarchar](50) NOT NULL,
	[Scores] [float] NULL,
 CONSTRAINT [PK__Students__0218433253983BE0] PRIMARY KEY CLUSTERED 
(
	[Id_Students] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zav_Kafedroi]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zav_Kafedroi](
	[ID_Zav_Kafedroi] [int] NOT NULL,
	[Tab_Number] [int] NOT NULL,
	[Experience] [int] NULL,
 CONSTRAINT [PK_Zav_Kafedroi] PRIMARY KEY CLUSTERED 
(
	[ID_Zav_Kafedroi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zayavka]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zayavka](
	[ID_Zayavka] [int] NOT NULL,
	[Number_Specialization] [nvarchar](50) NOT NULL,
	[Code_Discipline] [int] NOT NULL,
 CONSTRAINT [PK_Zayavka] PRIMARY KEY CLUSTERED 
(
	[ID_Zayavka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (1, N'Аничков Николай Николаевич', CAST(N'1885-11-03' AS Date), N'медицина', 1939)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (2, N'Бартольд Василий Владимирович', CAST(N'1869-11-15' AS Date), N'историк', 1913)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (3, N'Белопольский Аристарх Аполлонович', CAST(N'1854-07-13' AS Date), N'астрофизик', 1903)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (4, N'Бородин Иван Парфеньевич', CAST(N'1847-01-30' AS Date), N'ботаник', 1902)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (5, N'Вальден Павел Иванович', CAST(N'1863-07-26' AS Date), N'химик-технолог', 1910)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (6, N'Вернадский Владимир Иванович', CAST(N'1863-03-12' AS Date), N'геохимик', 1908)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (7, N'Виноградов Павел Гаврилович', CAST(N'1854-11-30' AS Date), N'историк', 1914)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (8, N'Ипатьев Владимир Николаевич', CAST(N'1867-11-21' AS Date), N'химик', 1916)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (9, N'Истрин Василий Михайлович', CAST(N'1865-02-22' AS Date), N'филолог', 1907)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (10, N'Карпинский Александр Петрович', CAST(N'1847-01-07' AS Date), N'геолог', 1889)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (11, N'Коковцов Павел Константинович', CAST(N'1861-07-01' AS Date), N'историк', 1906)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (12, N'Курнаков Николай Семёнович', CAST(N'1860-12-06' AS Date), N'химик', 1913)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (13, N'Марр Николай Яковлевич', CAST(N'1865-01-06' AS Date), N'лингвист', 1912)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (14, N'Насонов Николай Викторович', CAST(N'1855-02-26' AS Date), N'зоолог', 1906)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (15, N'Ольденбург Сергей Фёдорович', CAST(N'1863-09-26' AS Date), N'историк', 1903)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (16, N'Павлов Иван Петрович', CAST(N'1849-09-26' AS Date), N'физиолог', 1907)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (17, N'Перетц Владимир Николаевич', CAST(N'1870-01-31' AS Date), N'филолог', 1914)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (18, N'Соболевский Алексей Иванович', CAST(N'1857-01-07' AS Date), N'лингвист', 1900)
INSERT [dbo].[Akademik] ([Id_Akademik], [FIO], [Birthday], [Specialisation], [Date_Zvanie]) VALUES (19, N'Стеклов Владимир Андреевич', CAST(N'1864-01-09' AS Date), N'математик', 1912)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (1, N'Австрия', N'Вена', N'Европа', 7513000, 84000, 4)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (2, N'Великобритания', N'Лондон', N'Европа', 55928000, 24400, 1)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (3, N'Греция', N'Афины', N'Европа', 9280000, 132000, 4)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (4, N'Афганистан', N'Кабул', N'Азия', 20340000, 647000, 3)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (5, N'Монголия', N'Улан-Батор', N'Азия', 1555000, 1565000, 4)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (6, N'Япония', N'Токио', N'Азия', 114276000, 372000, 1)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (7, N'Франция', N'Париж', N'Европа', 53183000, 551000, 3)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (8, N'Швеция', N'Стокгольм', N'Европа', 8268000, 450000, 1)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (9, N'Египет', N'Каир', N'Африка', 38740000, 1001000, 3)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (10, N'Сомали', N'Могадишо', N'Африка', 3350000, 638000, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (11, N'США', N'Вашингтон', N'Америка', 217700000, 9363000, 3)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (12, N'Мексика', N'Мехико', N'Америка', 62500000, 1973000, 4)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (13, N'Мальта', N'Валлетта', N'Европа', 330000, 300, 4)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (14, N'Монако', N'Монако', N'Европа', 25000, 200, 1)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (15, N'Австрия', N'Вена', N'Европа', 8741753, 83858, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (16, N'Азербайджан', N'Баку', N'Азия', 9705600, 86600, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (17, N'Албания', N'Тирана', N'Европа', 2866026, 28748, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (18, N'Алжир', N'Алжир', N'Африка', 39813722, 2381740, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (19, N'Ангола', N'Луанда', N'Африка', 25831000, 1246700, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (20, N'Аргентина', N'Буэнос-Айрес', N'Южная Америка', 43847000, 2766890, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (21, N'Афганистан', N'Кабул', N'Азия', 29822848, 647500, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (22, N'Бангладеш', N'Дакка', N'Азия', 160221000, 144000, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (23, N'Бахрейн', N'Манама', N'Азия', 1397000, 701, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (24, N'Белиз', N'Бельмопан', N'Северная Америка', 377968, 22966, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (25, N'Белоруссия', N'Минск', N'Европа', 9498400, 207595, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (26, N'Бельгия', N'Брюссель', N'Европа', 11250585, 30528, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (27, N'Бенин', N'Порто-Ново', N'Африка', 11167000, 112620, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (28, N'Болгария', N'София', N'Европа', 7153784, 110910, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (29, N'Боливия', N'Сукре', N'Южная Америка', 10985059, 1098580, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (30, N'Ботсвана', N'Габороне', N'Африка', 2209208, 600370, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (31, N'Бразилия', N'Бразилиа', N'Южная Америка', 206081432, 8511965, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (32, N'Буркина-Фасо', N'Уагадугу', N'Африка', 19034397, 274200, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (33, N'Бутан', N'Тхимпху', N'Азия', 784000, 47000, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (34, N'Великобритания', N'Лондон', N'Европа', 65341183, 244820, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (35, N'Венгрия', N'Будапешт', N'Европа', 9830485, 93030, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (36, N'Венесуэла', N'Каракас', N'Южная Америка', 31028637, 912050, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (37, N'Восточный Тимор', N'Дили', N'Азия', 1167242, 14874, NULL)
INSERT [dbo].[Countries] ([Id_Countries], [Names], [Capital], [Continent], [People], [Rectangles], [Id_Management]) VALUES (38, N'Вьетнам', N'Ханой', N'Азия', 91713300, 329560, NULL)
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (1, N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (2, N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (3, N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (4, N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (5, N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (6, N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (7, N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (8, N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (9, N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (10, N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (11, N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (12, N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (13, N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (14, N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (15, N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (16, N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (17, N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (18, N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (19, N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (20, N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (21, N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (22, N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (23, N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Country] ([Id_Country], [Names], [Capital], [Rectangles], [Peoples], [Continent]) VALUES (24, N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (101, 320, N'Математика', N'вм')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (102, 160, N'Информатика', N'пи')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (103, 160, N'Физика', N'оф')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (202, 120, N'Базы данных', N'ис')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (204, 160, N'Электроника', N'эф')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (205, 80, N'Программирование', N'пи')
INSERT [dbo].[Discipline] ([Code_Discipline], [Obiem], [Name], [Shifr_Kafedra]) VALUES (209, 80, N'Моделирование', N'мм')
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 101)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 101)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 101)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', CAST(15000.00 AS Decimal(18, 2)), 102)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 201)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 201)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', CAST(20000.00 AS Decimal(18, 2)), 201)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', CAST(15000.00 AS Decimal(18, 2)), 202)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 301)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 301)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 401)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 401)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', CAST(15000.00 AS Decimal(18, 2)), 401)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', CAST(20000.00 AS Decimal(18, 2)), 402)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 501)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 501)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 501)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', CAST(35000.00 AS Decimal(18, 2)), 601)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', CAST(25000.00 AS Decimal(18, 2)), 601)
INSERT [dbo].[Employee] ([Tab_Number], [Shifr_Kafedra], [Surname], [Dolgnost], [Zarplata], [Chief]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', CAST(20000.00 AS Decimal(18, 2)), 602)
INSERT [dbo].[Engineer] ([ID_Engineer], [Tab_Number], [Specialization_Engineer]) VALUES (1, 153, N'электроник')
INSERT [dbo].[Engineer] ([ID_Engineer], [Tab_Number], [Specialization_Engineer]) VALUES (2, 241, N'электроник')
INSERT [dbo].[Engineer] ([ID_Engineer], [Tab_Number], [Specialization_Engineer]) VALUES (3, 242, N'программист')
INSERT [dbo].[Engineer] ([ID_Engineer], [Tab_Number], [Specialization_Engineer]) VALUES (4, 435, N'электроник')
INSERT [dbo].[Engineer] ([ID_Engineer], [Tab_Number], [Specialization_Engineer]) VALUES (5, 614, N'программист')
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (1, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (2, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (4, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (6, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (7, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Exam] ([ID_Exam], [Data], [Code_Discipline], [Reg_Number], [Tab_Number], [Auditoriya], [Ocenka]) VALUES (20, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
INSERT [dbo].[Faculty] ([Abreviatura_Faculty], [Name]) VALUES (N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([Abreviatura_Faculty], [Name]) VALUES (N'Ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([Abreviatura_Faculty], [Name]) VALUES (N'Ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([Abreviatura_Faculty], [Name]) VALUES (N'Фм', N'Физико-математический')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'вм', N'Высшая математика', N'ен')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'ис', N'Информационные системы', N'ит')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'мм', N'Математическое моделирование', N'фм')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'оф', N'Общая физика', N'ен')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'пи', N'Прикладная информатика', N'ит')
INSERT [dbo].[Kafedra] ([Shifr_Kafedra], [Name], [Abreviatura_Faculty]) VALUES (N'эф', N'Экспериментальная физика', N'фм')
INSERT [dbo].[Management] ([Id_Management], [Names]) VALUES (1, N'Конституционная монархия')
INSERT [dbo].[Management] ([Id_Management], [Names]) VALUES (2, N'Абсолютная монархия')
INSERT [dbo].[Management] ([Id_Management], [Names]) VALUES (3, N'Президентская республика')
INSERT [dbo].[Management] ([Id_Management], [Names]) VALUES (4, N'Парламентская республика')
INSERT [dbo].[Management] ([Id_Management], [Names]) VALUES (5, N'Военная хунта')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (1, 101, N'професср', N'д. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (2, 102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (3, 105, N'доцент', N'к. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (4, 201, N'професср', N'д. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (5, 202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (6, 301, N'професср', N'д. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (7, 302, N'доцент', N'к. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (8, 401, N'професср', N'д. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (9, 402, N'доцент', N'к. т.н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (10, 403, N'ассистент', NULL)
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (11, 501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (12, 502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (13, 503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Prepodavatel] ([ID_Prepodavatel], [Tab_Number], [Title], [Stepen]) VALUES (14, 601, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Specialization] ([Number_Specialization], [Napravlenie], [Shifr_Kafedra]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
INSERT [dbo].[Specialization] ([Number_Specialization], [Napravlenie], [Shifr_Kafedra]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Specialization] ([Number_Specialization], [Napravlenie], [Shifr_Kafedra]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
INSERT [dbo].[Specialization] ([Number_Specialization], [Napravlenie], [Shifr_Kafedra]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Specialization] ([Number_Specialization], [Napravlenie], [Shifr_Kafedra]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (10102, N'09.03.03', N'Иванов И. И.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (10103, N'09.03.03', N'Крюков К. К.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (20101, N'09.03.02', N'Андреев А. А.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (30102, N'14.03.02', N'Цветков К. К.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (30103, N'14.03.02', N'Петров П. П.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (50101, N'01.03.04', N'Сергеев С. С.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (80101, N'38.03.05', N'Макаров М. М.')
INSERT [dbo].[Student] ([Reg_Number], [Number_Specialization], [FIO]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.')
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (1, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (2, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (3, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (4, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (5, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (6, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (7, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (8, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (9, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (10, N'Барышева', N'Химия', N'Лицей', 88)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (12, N'Когорев', N'Математика', N'Гимназия', 99)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (13, N'Файзрахманов', N'Химия', N'Гимназия', 100)
INSERT [dbo].[Students] ([Id_Students], [Surname], [Subjecs], [School], [Scores]) VALUES (14, N'Семёнова', N'Иннформатика', N'Гимназия', 52)
SET IDENTITY_INSERT [dbo].[Students] OFF
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (1, 101, 15)
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (2, 201, 18)
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (3, 301, 20)
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (4, 401, 18)
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (5, 501, 18)
INSERT [dbo].[Zav_Kafedroi] ([ID_Zav_Kafedroi], [Tab_Number], [Experience]) VALUES (6, 601, 8)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (1, N'01.03.04', 101)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (2, N'01.03.04', 205)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (3, N'01.03.04', 209)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (4, N'09.03.02', 101)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (5, N'09.03.02', 102)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (6, N'09.03.02', 103)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (7, N'09.03.02', 202)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (8, N'09.03.02', 205)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (9, N'09.03.02', 209)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (10, N'09.03.03', 101)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (11, N'09.03.03', 102)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (12, N'09.03.03', 103)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (13, N'09.03.03', 202)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (14, N'09.03.03', 205)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (15, N'14.03.02', 101)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (16, N'14.03.02', 102)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (17, N'14.03.02', 103)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (18, N'14.03.02', 204)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (19, N'38.03.05', 101)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (20, N'38.03.05', 103)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (21, N'38.03.05', 202)
INSERT [dbo].[Zayavka] ([ID_Zayavka], [Number_Specialization], [Code_Discipline]) VALUES (22, N'38.03.05', 209)
ALTER TABLE [dbo].[Animal_Faiz_Kog] ADD  DEFAULT ('Хищные') FOR [Detachment]
GO
ALTER TABLE [dbo].[Flower_Faiz_Kog] ADD  DEFAULT ('Двудвольные') FOR [Class]
GO
ALTER TABLE [dbo].[Managament_Faiz_Kog] ADD  DEFAULT ('NULL') FOR [Vid]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Management] FOREIGN KEY([Id_Management])
REFERENCES [dbo].[Management] ([Id_Management])
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Management]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Kafedra] FOREIGN KEY([Shifr_Kafedra])
REFERENCES [dbo].[Kafedra] ([Shifr_Kafedra])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Kafedra]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Kafedra] FOREIGN KEY([Shifr_Kafedra])
REFERENCES [dbo].[Kafedra] ([Shifr_Kafedra])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Kafedra]
GO
ALTER TABLE [dbo].[Engineer]  WITH CHECK ADD  CONSTRAINT [FK_Engineer_Employee] FOREIGN KEY([Tab_Number])
REFERENCES [dbo].[Employee] ([Tab_Number])
GO
ALTER TABLE [dbo].[Engineer] CHECK CONSTRAINT [FK_Engineer_Employee]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Discipline] FOREIGN KEY([Code_Discipline])
REFERENCES [dbo].[Discipline] ([Code_Discipline])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Discipline]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Employee] FOREIGN KEY([Tab_Number])
REFERENCES [dbo].[Employee] ([Tab_Number])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Employee]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([Reg_Number])
REFERENCES [dbo].[Student] ([Reg_Number])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Kafedra]  WITH CHECK ADD  CONSTRAINT [FK_Kafedra_Faculty] FOREIGN KEY([Abreviatura_Faculty])
REFERENCES [dbo].[Faculty] ([Abreviatura_Faculty])
GO
ALTER TABLE [dbo].[Kafedra] CHECK CONSTRAINT [FK_Kafedra_Faculty]
GO
ALTER TABLE [dbo].[Prepodavatel]  WITH CHECK ADD  CONSTRAINT [FK_Prepodavatel_Employee] FOREIGN KEY([Tab_Number])
REFERENCES [dbo].[Employee] ([Tab_Number])
GO
ALTER TABLE [dbo].[Prepodavatel] CHECK CONSTRAINT [FK_Prepodavatel_Employee]
GO
ALTER TABLE [dbo].[Specialization]  WITH CHECK ADD  CONSTRAINT [FK_Specialization_Kafedra] FOREIGN KEY([Shifr_Kafedra])
REFERENCES [dbo].[Kafedra] ([Shifr_Kafedra])
GO
ALTER TABLE [dbo].[Specialization] CHECK CONSTRAINT [FK_Specialization_Kafedra]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialization] FOREIGN KEY([Number_Specialization])
REFERENCES [dbo].[Specialization] ([Number_Specialization])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialization]
GO
ALTER TABLE [dbo].[Zav_Kafedroi]  WITH CHECK ADD  CONSTRAINT [FK_Zav_Kafedroi_Employee] FOREIGN KEY([Tab_Number])
REFERENCES [dbo].[Employee] ([Tab_Number])
GO
ALTER TABLE [dbo].[Zav_Kafedroi] CHECK CONSTRAINT [FK_Zav_Kafedroi_Employee]
GO
ALTER TABLE [dbo].[Zayavka]  WITH CHECK ADD  CONSTRAINT [FK_Zayavka_Discipline] FOREIGN KEY([Code_Discipline])
REFERENCES [dbo].[Discipline] ([Code_Discipline])
GO
ALTER TABLE [dbo].[Zayavka] CHECK CONSTRAINT [FK_Zayavka_Discipline]
GO
ALTER TABLE [dbo].[Zayavka]  WITH CHECK ADD  CONSTRAINT [FK_Zayavka_Specialization] FOREIGN KEY([Number_Specialization])
REFERENCES [dbo].[Specialization] ([Number_Specialization])
GO
ALTER TABLE [dbo].[Zayavka] CHECK CONSTRAINT [FK_Zayavka_Specialization]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [CK__Students__Scores__6E01572D] CHECK  (([Scores]>=(0) AND [Scores]<=(100)))
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [CK__Students__Scores__6E01572D]
GO
/****** Object:  StoredProcedure [dbo].[Primer4P]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Primer4P]
    @columns NVARCHAR(MAX),
    @table NVARCHAR(128)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX);
    SET @query = 'SELECT ' + @columns + ' FROM ' + @table
    EXEC sp_executesql @query
END
GO
/****** Object:  StoredProcedure [dbo].[Primer5P]    Script Date: 15.11.2023 12:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Primer5P]
    @columns_list NVARCHAR(MAX),
    @table_name NVARCHAR(128),
	@check_column NVARCHAR(128),
	@check_op NVARCHAR(128),
	@check_arg NVARCHAR(50)
AS
BEGIN
    DECLARE @query NVARCHAR(MAX)
    SET @query = 'SELECT ' + @columns_list + ' FROM ' + @table_name + ' WHERE ' + @check_column + ' '+ @check_op + ' ' + @check_arg
    EXEC sp_executesql @query
END
GO
USE [master]
GO
ALTER DATABASE [PO_1] SET  READ_WRITE 
GO
