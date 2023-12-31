USE [BD_3NF]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id_dep] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[DName] [nvarchar](100) NULL,
	[ID_fac] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id_dep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Id_disc] [int] IDENTITY(1,1) NOT NULL,
	[Workload] [int] NULL,
	[DName] [nvarchar](max) NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[Id_disc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id_emp] [int] IDENTITY(1,1) NOT NULL,
	[Id_dep] [int] NULL,
	[Surname] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Id_tit] [int] NULL,
	[Salary] [int] NULL,
	[Chef] [int] NULL,
	[Exp] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Employe] PRIMARY KEY CLUSTERED 
(
	[Id_emp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Id_exam] [int] IDENTITY(1,1) NOT NULL,
	[EDate] [date] NULL,
	[Id_disc] [int] NULL,
	[Id_stud] [int] NULL,
	[Id_emp] [int] NULL,
	[Auditory] [nchar](4) NULL,
	[Points] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Exasm] PRIMARY KEY CLUSTERED 
(
	[Id_exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamAuditory]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamAuditory](
	[AName] [nchar](4) NOT NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_ExamAuditory] PRIMARY KEY CLUSTERED 
(
	[AName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id_fac] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[FName] [nvarchar](100) NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[Id_fac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id_req] [int] IDENTITY(1,1) NOT NULL,
	[Id_disc] [int] NULL,
	[Id_spec] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Request_1] PRIMARY KEY CLUSTERED 
(
	[Id_req] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[Id_spec] [int] IDENTITY(1,1) NOT NULL,
	[SName] [nvarchar](200) NULL,
	[Id_dep] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[Id_spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id_stud] [int] IDENTITY(1,1) NOT NULL,
	[Id_spec] [int] NULL,
	[Surname] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id_stud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Title]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Title](
	[Id_tit] [int] IDENTITY(1,1) NOT NULL,
	[TName] [nvarchar](max) NULL,
	[Id_tr] [int] NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_Title] PRIMARY KEY CLUSTERED 
(
	[Id_tit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleRank]    Script Date: 20.11.2023 12:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleRank](
	[Id_tr] [int] IDENTITY(1,1) NOT NULL,
	[TRRank] [nvarchar](max) NULL,
	[IsRemoved] [bit] NULL,
 CONSTRAINT [PK_TitleRank] PRIMARY KEY CLUSTERED 
(
	[Id_tr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (1, N'вм', N'Высшая математика', 1, NULL)
INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (2, N'ис', N'Информатика', 3, NULL)
INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (3, N'мм', N'Математическое моделирование', 4, NULL)
INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (4, N'оф', N'Общая физика', 1, NULL)
INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (5, N'пи', N'Прикладная информатика', 3, NULL)
INSERT [dbo].[Department] ([Id_dep], [Abbreviation], [DName], [ID_fac], [IsRemoved]) VALUES (6, N'эф', N'Экспериментальная физика', 4, NULL)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Discipline] ON 

INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (101, 320, N'Математика', 0)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (102, 160, N'Информатика', 0)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (103, 160, N'Физика', 1)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (202, 120, N'Базы данных', 1)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (204, 160, N'Электроника', 0)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (205, 80, N'Программирование', 0)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (209, 80, N'Моделирование', 1)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (210, 123, N'Мемография', NULL)
INSERT [dbo].[Discipline] ([Id_disc], [Workload], [DName], [IsRemoved]) VALUES (211, 120, N'Мемология', 1)
SET IDENTITY_INSERT [dbo].[Discipline] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (101, 5, N'Прохоров П.П.', N'z', 1, 35000, NULL, 15, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (102, 5, N'Семенов С.С.', N' ', 3, 25000, 101, NULL, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (105, 5, N'Петров П.П.', N' ', 3, 25000, 101, NULL, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (153, 5, N'Сидорова С.С.', N' ', 6, 15000, 102, NULL, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (201, 2, N'Андреев А.А.', N' ', 2, 35000, NULL, 18, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (202, 2, N'Борисов Б.Б.', N' ', 3, 25000, 201, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (241, 2, N'Глухов Г.Г.', N'', 6, 20000, 201, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (242, 2, N'Чернов Ч.Ч.', N' ', 7, 15000, 202, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (301, 3, N'Басов Б.Б.', N' ', 1, 35000, NULL, 20, 1)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (302, 3, N'Сергеева С.С.', N' ', 3, 25000, 301, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (401, 4, N'Волков В.В.', N' ', 1, 35000, NULL, 18, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (402, 4, N'Смирнов С.С.', N' ', 3, 25000, 401, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (403, 4, N'Смирнов С.С.', N' ', 5, 15000, 401, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (435, 4, N'Лисин Л.Л.', N' ', 6, 20000, 402, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (501, 1, N'Кузнецов К.К.', N' ', 2, 35000, NULL, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (502, 1, N'Романцев Р.Р.', N' ', 2, 25000, 501, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (503, 1, N'Соловьев С.С.', N' ', 3, 25000, 501, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (601, 6, N'Зверев З.З.', N' ', 2, 35000, NULL, 8, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (602, 6, N'Сорокина С.С.', N' ', 8, 25000, 601, NULL, 0)
INSERT [dbo].[Employee] ([Id_emp], [Id_dep], [Surname], [Description], [Id_tit], [Salary], [Chef], [Exp], [IsRemoved]) VALUES (614, 6, N'Григорьев Г.Г.', N' ', 7, 20000, 602, NULL, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (1, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4, 1)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (2, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (4, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (6, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (7, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4, 1)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4, 1)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4, 1)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4, 1)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (20, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5, 0)
INSERT [dbo].[Exam] ([Id_exam], [EDate], [Id_disc], [Id_stud], [Id_emp], [Auditory], [Points], [IsRemoved]) VALUES (21, CAST(N'2023-11-17' AS Date), 101, 80102, 105, N'с324', 5, 1)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'м424', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'м425', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'с324', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'т505', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'т506', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф201', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф333', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф349', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф414', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф417', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'ф419', 0)
INSERT [dbo].[ExamAuditory] ([AName], [IsRemoved]) VALUES (N'э105', 0)
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id_fac], [Abbreviation], [FName], [IsRemoved]) VALUES (1, N'Ен', N'Естественные науки', NULL)
INSERT [dbo].[Faculty] ([Id_fac], [Abbreviation], [FName], [IsRemoved]) VALUES (2, N'Гн', N'Гуманитарные науки', NULL)
INSERT [dbo].[Faculty] ([Id_fac], [Abbreviation], [FName], [IsRemoved]) VALUES (3, N'Ит', N'Информационные технологии', NULL)
INSERT [dbo].[Faculty] ([Id_fac], [Abbreviation], [FName], [IsRemoved]) VALUES (4, N'Фм', N'Физико-математический', NULL)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (1, 101, 1, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (2, 205, 1, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (3, 209, 1, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (4, 101, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (5, 102, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (6, 103, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (7, 202, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (8, 205, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (9, 209, 2, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (10, 101, 3, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (11, 102, 3, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (12, 103, 3, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (13, 202, 3, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (14, 205, 3, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (15, 101, 4, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (16, 102, 4, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (17, 103, 4, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (18, 204, 4, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (19, 101, 5, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (20, 103, 5, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (21, 202, 5, 0)
INSERT [dbo].[Request] ([Id_req], [Id_disc], [Id_spec], [IsRemoved]) VALUES (22, 209, 5, 0)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([Id_spec], [SName], [Id_dep], [IsRemoved]) VALUES (1, N'01.03.04', 3, NULL)
INSERT [dbo].[Speciality] ([Id_spec], [SName], [Id_dep], [IsRemoved]) VALUES (2, N'09.03.02', 2, NULL)
INSERT [dbo].[Speciality] ([Id_spec], [SName], [Id_dep], [IsRemoved]) VALUES (3, N'09.03.03', 5, NULL)
INSERT [dbo].[Speciality] ([Id_spec], [SName], [Id_dep], [IsRemoved]) VALUES (4, N'14.03.02', 6, NULL)
INSERT [dbo].[Speciality] ([Id_spec], [SName], [Id_dep], [IsRemoved]) VALUES (5, N'38.03.05', 2, NULL)
SET IDENTITY_INSERT [dbo].[Speciality] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (10101, 4, N'Николаева Н. Н.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (10102, 4, N'Иванов И. И.', N' ', 1)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (10103, 4, N'Крюков К. К.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (20101, 2, N'Андреев А. А.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (20102, 2, N'Федоров Ф. Ф.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (30101, 4, N'Бондаренко Б. Б.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (30102, 4, N'Цветков К. К.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (30103, 4, N'Петров П. П.', N' ', 1)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (50101, 1, N'Сергеев С. С.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (50102, 1, N'Кудрявцев К. К.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (80101, 5, N'Макаров М. М.', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (80102, 5, N'Петров П. П.', N' ', 1)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (80103, 3, N'Шкода', N' ', 0)
INSERT [dbo].[Student] ([Id_stud], [Id_spec], [Surname], [Description], [IsRemoved]) VALUES (80104, 3, N'Шкода2', N' ', 0)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Title] ON 

INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (1, N'Профессор', 1, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (2, N'Доцент', 3, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (3, N'Доцент', 4, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (4, N'Профессор', 2, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (5, N'Ассистент', 5, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (6, N'Электроник', 5, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (7, N'Программист', 5, 0)
INSERT [dbo].[Title] ([Id_tit], [TName], [Id_tr], [IsRemoved]) VALUES (8, N'Нет должности', 5, 0)
SET IDENTITY_INSERT [dbo].[Title] OFF
GO
SET IDENTITY_INSERT [dbo].[TitleRank] ON 

INSERT [dbo].[TitleRank] ([Id_tr], [TRRank], [IsRemoved]) VALUES (1, N'д. т.н.   ', 0)
INSERT [dbo].[TitleRank] ([Id_tr], [TRRank], [IsRemoved]) VALUES (2, N'д. ф.-м. н.', 0)
INSERT [dbo].[TitleRank] ([Id_tr], [TRRank], [IsRemoved]) VALUES (3, N'к. ф.-м. н.', 0)
INSERT [dbo].[TitleRank] ([Id_tr], [TRRank], [IsRemoved]) VALUES (4, N'к. т.н.', 0)
INSERT [dbo].[TitleRank] ([Id_tr], [TRRank], [IsRemoved]) VALUES (5, N'Нет звания', 0)
SET IDENTITY_INSERT [dbo].[TitleRank] OFF
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Faculty] FOREIGN KEY([ID_fac])
REFERENCES [dbo].[Faculty] ([Id_fac])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Faculty]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Id_dep])
REFERENCES [dbo].[Department] ([Id_dep])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Title] FOREIGN KEY([Id_tit])
REFERENCES [dbo].[Title] ([Id_tit])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Title]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Discipline] FOREIGN KEY([Id_disc])
REFERENCES [dbo].[Discipline] ([Id_disc])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Discipline]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Employee] FOREIGN KEY([Id_emp])
REFERENCES [dbo].[Employee] ([Id_emp])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Employee]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_ExamAuditory] FOREIGN KEY([Auditory])
REFERENCES [dbo].[ExamAuditory] ([AName])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_ExamAuditory]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([Id_stud])
REFERENCES [dbo].[Student] ([Id_stud])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Discipline] FOREIGN KEY([Id_disc])
REFERENCES [dbo].[Discipline] ([Id_disc])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Discipline]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Speciality] FOREIGN KEY([Id_spec])
REFERENCES [dbo].[Speciality] ([Id_spec])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Speciality]
GO
ALTER TABLE [dbo].[Speciality]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Department] FOREIGN KEY([Id_dep])
REFERENCES [dbo].[Department] ([Id_dep])
GO
ALTER TABLE [dbo].[Speciality] CHECK CONSTRAINT [FK_Speciality_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Speciality] FOREIGN KEY([Id_spec])
REFERENCES [dbo].[Speciality] ([Id_spec])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Speciality]
GO
ALTER TABLE [dbo].[Title]  WITH CHECK ADD  CONSTRAINT [FK_Title_TitleRank] FOREIGN KEY([Id_tr])
REFERENCES [dbo].[TitleRank] ([Id_tr])
GO
ALTER TABLE [dbo].[Title] CHECK CONSTRAINT [FK_Title_TitleRank]
GO
