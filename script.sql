USE [master]
GO
/****** Object:  Database [PRJ-Project]    Script Date: 4/23/2024 5:22:18 PM ******/
CREATE DATABASE [PRJ-Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ-Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ-Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ-Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PRJ-Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ-Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ-Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ-Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ-Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ-Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ-Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ-Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ-Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ-Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ-Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ-Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ-Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ-Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ-Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ-Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ-Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ-Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ-Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ-Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ-Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ-Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ-Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ-Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ-Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ-Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ-Project] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ-Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ-Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ-Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ-Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ-Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ-Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ-Project] SET QUERY_STORE = OFF
GO
USE [PRJ-Project]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[assid] [int] NULL,
	[subid] [varchar](50) NOT NULL,
	[weight] [decimal](18, 2) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendance](
	[aid] [int] NULL,
	[sesid] [int] NULL,
	[sid] [varchar](50) NULL,
	[isPresent] [bit] NULL,
	[description] [varchar](50) NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[did] [int] NOT NULL,
	[dname] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [varchar](50) NULL,
	[gid] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NULL,
	[fname] [varchar](50) NULL,
	[url] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[gradeid] [int] NOT NULL,
	[assid] [varchar](50) NULL,
	[sid] [varchar](50) NULL,
	[score] [varchar](50) NULL,
	[gid] [int] NULL,
	[isTaken] [bit] NULL,
	[description] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeItemTaken]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeItemTaken](
	[gtid] [int] NULL,
	[assid] [int] NULL,
	[gid] [int] NULL,
	[isTaken] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group](
	[gid] [int] NOT NULL,
	[gname] [varchar](50) NOT NULL,
	[subid] [varchar](50) NOT NULL,
	[PIC] [varchar](50) NOT NULL,
	[term] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturer]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturer](
	[lid] [varchar](50) NOT NULL,
	[lname] [varchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[truename] [varchar](50) NULL,
	[dob] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] NOT NULL,
	[name] [nvarchar](2500) NULL,
	[content] [varchar](2500) NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestChangeTimetable]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestChangeTimetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lidfrom] [varchar](50) NULL,
	[lidto] [varchar](50) NULL,
	[room] [varchar](50) NULL,
	[slot] [int] NULL,
	[date] [date] NULL,
	[gid] [int] NULL,
	[description] [varchar](50) NULL,
	[status] [bit] NULL,
	[sesid] [int] NULL,
	[responsed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] NULL,
	[rolename] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[username] [varchar](50) NULL,
	[roleid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleid] [int] NULL,
	[fid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[rid] [varchar](50) NOT NULL,
	[rnumber] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session](
	[sesid] [int] NULL,
	[gid] [int] NOT NULL,
	[lid] [varchar](50) NOT NULL,
	[room] [varchar](50) NOT NULL,
	[tid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isTaken] [bit] NOT NULL,
	[term] [varchar](50) NULL,
	[change] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[sid] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[did] [int] NOT NULL,
	[gender] [bit] NOT NULL,
	[username] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subid] [varchar](50) NOT NULL,
	[subname] [varchar](50) NOT NULL,
	[credit] [int] NOT NULL,
	[did] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[term]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[term](
	[tid] [varchar](50) NOT NULL,
	[timeStart] [date] NOT NULL,
	[timeEnd] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[timeslot]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timeslot](
	[tid] [int] NOT NULL,
	[timeStart] [varchar](50) NULL,
	[timeEnd] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[totalcourse]    Script Date: 4/23/2024 5:22:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[totalcourse](
	[toid] [int] NULL,
	[sid] [varchar](50) NULL,
	[term] [varchar](50) NULL,
	[total] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[gid] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'handg', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'cuonghv', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'linhnd', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'sonnt', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'tuanvm', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'anhnn', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'dungvt', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'yennth', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'hoannn', N'abc')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'tuanpd', N'abc')
GO
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (1, N'PRJ301', CAST(0.05 AS Decimal(18, 2)), N'PT1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (2, N'PRJ301', CAST(0.05 AS Decimal(18, 2)), N'PT2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (3, N'PRJ301', CAST(0.05 AS Decimal(18, 2)), N'WS1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (4, N'PRJ301', CAST(0.05 AS Decimal(18, 2)), N'WS2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (5, N'PRJ301', CAST(0.20 AS Decimal(18, 2)), N'PE')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (6, N'PRJ301', CAST(0.40 AS Decimal(18, 2)), N'Assignment')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (7, N'PRJ301', CAST(0.20 AS Decimal(18, 2)), N'FE')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (8, N'PRJ301', CAST(0.20 AS Decimal(18, 2)), N'FE Resit')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (9, N'MAS291', CAST(0.15 AS Decimal(18, 2)), N'Computer project')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (10, N'MAS291', CAST(0.10 AS Decimal(18, 2)), N'Assignment1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (11, N'MAS291', CAST(0.10 AS Decimal(18, 2)), N'Assignment2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (12, N'MAS291', CAST(0.10 AS Decimal(18, 2)), N'PT1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (13, N'MAS291', CAST(0.10 AS Decimal(18, 2)), N'PT2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (14, N'MAS291', CAST(0.10 AS Decimal(18, 2)), N'PT3')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (15, N'MAS291', CAST(0.35 AS Decimal(18, 2)), N'FE')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (16, N'MAS291', CAST(0.35 AS Decimal(18, 2)), N'FE Resit')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (17, N'JPD123', CAST(0.10 AS Decimal(18, 2)), N'Participation')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (18, N'JPD123', CAST(0.10 AS Decimal(18, 2)), N'PT1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (19, N'JPD123', CAST(0.10 AS Decimal(18, 2)), N'PT2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (20, N'JPD123', CAST(0.30 AS Decimal(18, 2)), N'Mid term')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (21, N'JPD123', CAST(0.10 AS Decimal(18, 2)), N'FE: Listening')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (22, N'JPD123', CAST(0.30 AS Decimal(18, 2)), N'FE: GVR')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (23, N'JPD123', CAST(0.10 AS Decimal(18, 2)), N'FE: Listening Resit')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (24, N'JPD123', CAST(0.30 AS Decimal(18, 2)), N'FE: GVR Resit')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (25, N'IOT102', CAST(0.10 AS Decimal(18, 2)), N'Active learning')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (26, N'IOT102', CAST(0.05 AS Decimal(18, 2)), N'Ex 1')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (27, N'IOT102', CAST(0.05 AS Decimal(18, 2)), N'Ex 2')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (28, N'IOT102', CAST(0.10 AS Decimal(18, 2)), N'Presentation')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (29, N'IOT102', CAST(0.30 AS Decimal(18, 2)), N'Project')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (30, N'IOT102', CAST(0.40 AS Decimal(18, 2)), N'FE')
INSERT [dbo].[Assessment] ([assid], [subid], [weight], [name]) VALUES (31, N'IOT102', CAST(0.40 AS Decimal(18, 2)), N'FE Resit')
GO
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (1, 1, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (2, 1, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (3, 1, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (4, 2, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (5, 2, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (6, 2, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (7, 3, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (8, 3, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (9, 3, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (10, 4, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (11, 4, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (12, 4, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (13, 5, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (14, 5, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (15, 5, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (16, 6, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (17, 6, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (18, 6, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (19, 7, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (20, 7, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (21, 7, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (22, 8, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (23, 8, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (24, 8, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (25, 9, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (26, 9, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (27, 9, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (28, 10, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (29, 10, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (30, 10, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (46, 15, N'h1', 0, N'hoc dot', CAST(N'2024-03-12T02:21:49.123' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (47, 15, N'h2', 1, N'', CAST(N'2024-03-03T03:34:35.150' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (48, 15, N'h3', 1, N'', CAST(N'2024-03-03T03:34:35.153' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (34, 12, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (35, 12, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (36, 12, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (37, 13, N'h1', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (38, 13, N'h2', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (39, 13, N'h3', 1, NULL, CAST(N'1900-01-01T12:00:00.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (49, 16, N'h1', 0, N'', CAST(N'2024-03-15T01:35:43.000' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (50, 16, N'h2', 1, N'', CAST(N'2024-03-12T01:10:57.720' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (51, 16, N'h3', 1, N'', CAST(N'2024-03-12T01:10:57.720' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (52, 17, N'h1', 0, N'', CAST(N'2024-03-15T01:43:40.247' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (53, 17, N'h2', 1, N'', CAST(N'2024-03-12T21:33:13.240' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (55, 21, N'h4', 1, N'', CAST(N'2024-03-13T23:02:54.007' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (56, 21, N'h5', 1, N'', CAST(N'2024-03-13T23:02:54.010' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (57, 21, N'h6', 1, N'', CAST(N'2024-03-13T23:02:54.013' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (58, 21, N'h1', 1, N'', CAST(N'2024-03-13T23:02:54.013' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (59, 21, N'h2', 1, N'', CAST(N'2024-03-13T23:02:54.013' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (60, 21, N'h3', 1, N'', CAST(N'2024-03-13T23:02:54.013' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (61, 37, N'h4', 1, N'', CAST(N'2024-03-13T23:03:27.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (62, 37, N'h5', 1, N'', CAST(N'2024-03-13T23:03:27.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (63, 37, N'h6', 1, N'', CAST(N'2024-03-13T23:03:27.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (64, 37, N'h1', 1, N'', CAST(N'2024-03-13T23:03:27.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (65, 37, N'h2', 1, N'', CAST(N'2024-03-13T23:03:27.033' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (66, 37, N'h3', 1, N'', CAST(N'2024-03-13T23:03:27.033' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (79, 36, N'h4', 1, N'', CAST(N'2024-03-13T23:26:36.043' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (80, 36, N'h5', 1, N'', CAST(N'2024-03-13T23:26:36.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (81, 36, N'h6', 1, N'', CAST(N'2024-03-13T23:26:36.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (82, 36, N'h1', 1, N'', CAST(N'2024-03-13T23:26:36.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (83, 36, N'h2', 1, N'', CAST(N'2024-03-13T23:26:36.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (84, 36, N'h3', 1, N'', CAST(N'2024-03-13T23:26:36.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (91, 24, N'h4', 1, N'', CAST(N'2024-03-13T23:27:16.017' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (92, 24, N'h5', 1, N'', CAST(N'2024-03-13T23:27:16.020' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (93, 24, N'h6', 1, N'', CAST(N'2024-03-13T23:27:16.020' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (94, 24, N'h1', 1, N'', CAST(N'2024-03-13T23:27:16.020' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (95, 24, N'h2', 1, N'', CAST(N'2024-03-13T23:27:16.020' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (96, 24, N'h3', 1, N'', CAST(N'2024-03-13T23:27:16.020' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (121, 29, N'h4', 1, N'', CAST(N'2024-03-13T23:28:16.987' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (122, 29, N'h5', 1, N'', CAST(N'2024-03-13T23:28:16.987' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (123, 29, N'h6', 1, N'', CAST(N'2024-03-13T23:28:16.987' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (124, 29, N'h1', 1, N'', CAST(N'2024-03-13T23:28:16.987' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (125, 29, N'h2', 1, N'', CAST(N'2024-03-13T23:28:16.987' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (126, 29, N'h3', 1, N'', CAST(N'2024-03-13T23:28:16.990' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (127, 30, N'h4', 1, N'', CAST(N'2024-03-13T23:28:25.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (128, 30, N'h5', 1, N'', CAST(N'2024-03-13T23:28:25.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (129, 30, N'h6', 1, N'', CAST(N'2024-03-13T23:28:25.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (130, 30, N'h1', 1, N'', CAST(N'2024-03-13T23:28:25.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (131, 30, N'h2', 1, N'', CAST(N'2024-03-13T23:28:25.863' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (132, 30, N'h3', 1, N'', CAST(N'2024-03-13T23:28:25.863' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (133, 31, N'h4', 1, N'', CAST(N'2024-03-13T23:28:42.687' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (134, 31, N'h5', 1, N'', CAST(N'2024-03-13T23:28:42.690' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (135, 31, N'h6', 1, N'', CAST(N'2024-03-13T23:28:42.690' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (136, 31, N'h1', 1, N'', CAST(N'2024-03-13T23:28:42.690' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (137, 31, N'h2', 1, N'', CAST(N'2024-03-13T23:28:42.690' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (138, 31, N'h3', 1, N'', CAST(N'2024-03-13T23:28:42.690' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (139, 32, N'h4', 1, N'', CAST(N'2024-03-13T23:28:50.570' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (140, 32, N'h5', 1, N'', CAST(N'2024-03-13T23:28:50.570' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (141, 32, N'h6', 1, N'', CAST(N'2024-03-13T23:28:50.573' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (142, 32, N'h1', 1, N'', CAST(N'2024-03-13T23:28:50.573' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (143, 32, N'h2', 1, N'', CAST(N'2024-03-13T23:28:50.573' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (144, 32, N'h3', 1, N'', CAST(N'2024-03-13T23:28:50.573' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (151, 34, N'h4', 1, N'', CAST(N'2024-03-13T23:29:05.827' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (152, 34, N'h5', 1, N'', CAST(N'2024-03-13T23:29:05.827' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (153, 34, N'h6', 1, N'', CAST(N'2024-03-13T23:29:05.827' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (154, 34, N'h1', 1, N'', CAST(N'2024-03-13T23:29:05.830' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (155, 34, N'h2', 1, N'', CAST(N'2024-03-13T23:29:05.830' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (156, 34, N'h3', 1, N'', CAST(N'2024-03-13T23:29:05.830' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (157, 41, N'h9', 1, N'', CAST(N'2024-03-13T23:32:31.100' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (158, 41, N'h1', 1, N'', CAST(N'2024-03-13T23:32:31.100' AS DateTime))
GO
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (159, 41, N'h2', 1, N'', CAST(N'2024-03-13T23:32:31.100' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (160, 41, N'h3', 1, N'', CAST(N'2024-03-13T23:32:31.103' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (161, 42, N'h9', 1, N'', CAST(N'2024-03-13T23:32:43.370' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (162, 42, N'h1', 1, N'', CAST(N'2024-03-13T23:32:43.370' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (163, 42, N'h2', 1, N'', CAST(N'2024-03-13T23:32:43.370' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (164, 42, N'h3', 1, N'', CAST(N'2024-03-13T23:32:43.373' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (165, 43, N'h9', 1, N'', CAST(N'2024-03-13T23:32:50.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (166, 43, N'h1', 1, N'', CAST(N'2024-03-13T23:32:50.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (167, 43, N'h2', 1, N'', CAST(N'2024-03-13T23:32:50.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (168, 43, N'h3', 1, N'', CAST(N'2024-03-13T23:32:50.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (169, 44, N'h9', 1, N'', CAST(N'2024-03-13T23:32:58.580' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (170, 44, N'h1', 1, N'', CAST(N'2024-03-13T23:32:58.580' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (171, 44, N'h2', 1, N'', CAST(N'2024-03-13T23:32:58.580' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (172, 44, N'h3', 1, N'', CAST(N'2024-03-13T23:32:58.583' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (173, 45, N'h9', 1, N'', CAST(N'2024-03-13T23:33:06.730' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (174, 45, N'h1', 1, N'', CAST(N'2024-03-13T23:33:06.733' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (175, 45, N'h2', 1, N'', CAST(N'2024-03-13T23:33:06.733' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (176, 45, N'h3', 1, N'', CAST(N'2024-03-13T23:33:06.733' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (181, 47, N'h9', 1, N'', CAST(N'2024-03-13T23:33:22.257' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (182, 47, N'h1', 1, N'', CAST(N'2024-03-13T23:33:22.260' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (183, 47, N'h2', 1, N'', CAST(N'2024-03-13T23:33:22.260' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (184, 47, N'h3', 1, N'', CAST(N'2024-03-13T23:33:22.260' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (185, 48, N'h9', 1, N'', CAST(N'2024-03-13T23:33:38.500' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (186, 48, N'h1', 1, N'', CAST(N'2024-03-13T23:33:38.500' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (187, 48, N'h2', 1, N'', CAST(N'2024-03-13T23:33:38.500' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (188, 48, N'h3', 1, N'', CAST(N'2024-03-13T23:33:38.500' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (213, 55, N'h9', 1, N'', CAST(N'2024-03-13T23:34:55.477' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (214, 55, N'h1', 1, N'', CAST(N'2024-03-13T23:34:55.477' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (215, 55, N'h2', 1, N'', CAST(N'2024-03-13T23:34:55.477' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (216, 55, N'h3', 1, N'', CAST(N'2024-03-13T23:34:55.477' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (221, 57, N'h9', 1, N'', CAST(N'2024-03-13T23:35:10.357' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (222, 57, N'h1', 1, N'', CAST(N'2024-03-13T23:35:10.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (223, 57, N'h2', 1, N'', CAST(N'2024-03-13T23:35:10.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (224, 57, N'h3', 1, N'', CAST(N'2024-03-13T23:35:10.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (225, 61, N'h1', 1, N'', CAST(N'2024-03-13T23:40:49.597' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (226, 61, N'h2', 1, N'', CAST(N'2024-03-13T23:40:49.600' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (227, 61, N'h3', 1, N'', CAST(N'2024-03-13T23:40:49.603' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (228, 62, N'h1', 1, N'', CAST(N'2024-03-13T23:40:56.430' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (229, 62, N'h2', 1, N'', CAST(N'2024-03-13T23:40:56.430' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (230, 62, N'h3', 1, N'', CAST(N'2024-03-13T23:40:56.430' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (231, 63, N'h1', 1, N'', CAST(N'2024-03-13T23:41:03.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (232, 63, N'h2', 1, N'', CAST(N'2024-03-13T23:41:03.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (233, 63, N'h3', 1, N'', CAST(N'2024-03-13T23:41:03.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (234, 64, N'h1', 1, N'', CAST(N'2024-03-13T23:41:13.243' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (235, 64, N'h2', 1, N'', CAST(N'2024-03-13T23:41:13.243' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (236, 64, N'h3', 1, N'', CAST(N'2024-03-13T23:41:13.243' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (240, 66, N'h1', 1, N'', CAST(N'2024-03-13T23:41:29.427' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (241, 66, N'h2', 1, N'', CAST(N'2024-03-13T23:41:29.427' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (242, 66, N'h3', 1, N'', CAST(N'2024-03-13T23:41:29.427' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (249, 69, N'h1', 1, N'', CAST(N'2024-03-13T23:41:57.393' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (250, 69, N'h2', 1, N'', CAST(N'2024-03-13T23:41:57.393' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (251, 69, N'h3', 1, N'', CAST(N'2024-03-13T23:41:57.393' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (252, 70, N'h1', 1, N'', CAST(N'2024-03-13T23:42:03.947' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (253, 70, N'h2', 1, N'', CAST(N'2024-03-13T23:42:03.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (254, 70, N'h3', 1, N'', CAST(N'2024-03-13T23:42:03.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (258, 38, N'h4', 1, N'', CAST(N'2024-03-14T22:46:04.807' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (259, 38, N'h5', 1, N'', CAST(N'2024-03-14T22:46:04.817' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (260, 38, N'h6', 1, N'', CAST(N'2024-03-14T22:46:04.817' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (261, 38, N'h1', 1, N'', CAST(N'2024-03-14T22:46:04.817' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (262, 38, N'h2', 1, N'', CAST(N'2024-03-14T22:46:04.820' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (263, 38, N'h3', 1, N'', CAST(N'2024-03-14T22:46:04.820' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (264, 58, N'h9', 1, N'', CAST(N'2024-03-14T22:46:21.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (265, 58, N'h1', 1, N'', CAST(N'2024-03-14T22:46:21.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (266, 58, N'h2', 1, N'', CAST(N'2024-03-14T22:46:21.360' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (267, 58, N'h3', 1, N'', CAST(N'2024-03-14T22:46:21.363' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (268, 19, N'h1', 0, N'', CAST(N'2024-03-20T15:39:30.310' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (269, 19, N'h2', 0, N'', CAST(N'2024-03-20T15:39:30.317' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (270, 19, N'h3', 0, N'', CAST(N'2024-03-20T15:39:30.320' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (271, 73, N'h1', 1, N'', CAST(N'2024-04-09T04:56:41.740' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (273, 73, N'h3', 1, N'', CAST(N'2024-04-09T04:56:41.743' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (274, 74, N'h1', 1, N'', CAST(N'2024-04-09T04:56:49.773' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (275, 74, N'h2', 1, N'', CAST(N'2024-04-09T04:56:49.773' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (276, 74, N'h3', 1, N'', CAST(N'2024-04-09T04:56:49.777' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (277, 73, N'h11', 1, N'', CAST(N'2024-04-09T04:56:41.743' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (278, 74, N'h11', 1, N'', CAST(N'2024-04-09T04:56:41.743' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (291, 76, N'h1', 1, N'', CAST(N'2024-04-10T13:07:05.153' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (292, 76, N'h2', 1, N'', CAST(N'2024-04-10T13:07:05.157' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (293, 76, N'h3', 1, N'', CAST(N'2024-04-10T13:07:05.157' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (294, 76, N'h11', 1, N'', CAST(N'2024-04-10T13:07:05.157' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (295, 77, N'h1', 1, N'', CAST(N'2024-04-12T15:43:29.047' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (296, 77, N'h2', 1, N'', CAST(N'2024-04-12T15:43:29.050' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (297, 77, N'h3', 1, N'', CAST(N'2024-04-12T15:43:29.053' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (298, 77, N'h11', 1, N'', CAST(N'2024-04-12T15:43:29.053' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (303, 79, N'h1', 1, N'', CAST(N'2024-04-12T15:43:43.640' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (304, 79, N'h2', 1, N'', CAST(N'2024-04-12T15:43:43.640' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (305, 79, N'h3', 1, N'', CAST(N'2024-04-12T15:43:43.643' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (306, 79, N'h11', 1, N'', CAST(N'2024-04-12T15:43:43.643' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (307, 80, N'h1', 1, N'', CAST(N'2024-04-12T15:43:51.533' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (308, 80, N'h2', 1, N'', CAST(N'2024-04-12T15:43:51.533' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (309, 80, N'h3', 1, N'', CAST(N'2024-04-12T15:43:51.537' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (310, 80, N'h11', 1, N'', CAST(N'2024-04-12T15:43:51.537' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (331, 86, N'h1', 1, N'', CAST(N'2024-04-17T14:04:55.867' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (332, 86, N'h2', 1, N'', CAST(N'2024-04-17T14:04:55.870' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (333, 86, N'h3', 1, N'', CAST(N'2024-04-17T14:04:55.870' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (334, 86, N'h11', 1, N'', CAST(N'2024-04-17T14:04:55.870' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (339, 88, N'h1', 1, N'', CAST(N'2024-04-19T15:31:32.893' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (340, 88, N'h2', 1, N'', CAST(N'2024-04-19T15:31:32.893' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (341, 88, N'h3', 1, N'', CAST(N'2024-04-19T15:31:32.893' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (342, 88, N'h11', 1, N'', CAST(N'2024-04-19T15:31:32.897' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (351, 91, N'h1', 1, N'', CAST(N'2024-04-22T15:35:02.543' AS DateTime))
GO
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (352, 91, N'h2', 1, N'', CAST(N'2024-04-22T15:35:02.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (353, 91, N'h3', 1, N'', CAST(N'2024-04-22T15:35:02.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (354, 91, N'h11', 1, N'', CAST(N'2024-04-22T15:35:02.547' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (54, 17, N'h3', 1, N'', CAST(N'2024-03-12T14:10:31.997' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (197, 51, N'h9', 1, N'', CAST(N'2024-03-13T23:34:03.727' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (198, 51, N'h1', 1, N'', CAST(N'2024-03-13T23:34:03.727' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (199, 51, N'h2', 1, N'', CAST(N'2024-03-13T23:34:03.727' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (200, 51, N'h3', 1, N'', CAST(N'2024-03-13T23:34:03.730' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (209, 54, N'h9', 1, N'', CAST(N'2024-03-13T23:34:32.630' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (210, 54, N'h1', 1, N'', CAST(N'2024-03-13T23:34:32.630' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (211, 54, N'h2', 1, N'', CAST(N'2024-03-13T23:34:32.630' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (212, 54, N'h3', 1, N'', CAST(N'2024-03-13T23:34:32.633' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (272, 73, N'h2', 1, N'', CAST(N'2024-04-09T04:56:41.743' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (315, 82, N'h1', 1, N'', CAST(N'2024-04-16T14:57:29.517' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (316, 82, N'h2', 1, N'', CAST(N'2024-04-16T14:57:29.517' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (317, 82, N'h3', 1, N'', CAST(N'2024-04-16T14:57:29.517' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (318, 82, N'h11', 1, N'', CAST(N'2024-04-16T14:57:29.520' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (335, 87, N'h1', 1, N'', CAST(N'2024-04-19T15:31:24.930' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (336, 87, N'h2', 1, N'', CAST(N'2024-04-19T15:31:24.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (337, 87, N'h3', 1, N'', CAST(N'2024-04-19T15:31:24.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (338, 87, N'h11', 1, N'', CAST(N'2024-04-19T15:31:24.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (40, 11, N'h1', 1, N'', CAST(N'2024-03-03T02:56:53.753' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (41, 11, N'h2', 1, N'', CAST(N'2024-03-03T02:56:53.757' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (42, 11, N'h3', 1, N'', CAST(N'2024-03-03T02:56:53.757' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (43, 14, N'h1', 0, N'abc', CAST(N'2024-03-12T02:24:33.873' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (44, 14, N'h2', 1, N'', CAST(N'2024-03-03T03:10:21.503' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (45, 14, N'h3', 1, N'', CAST(N'2024-03-03T03:10:21.507' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (279, 71, N'h1', 1, N'', CAST(N'2024-04-09T13:42:10.787' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (280, 71, N'h2', 1, N'', CAST(N'2024-04-09T13:42:10.797' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (281, 71, N'h3', 1, N'', CAST(N'2024-04-09T13:42:10.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (282, 71, N'h11', 1, N'', CAST(N'2024-04-09T13:42:10.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (283, 72, N'h1', 0, N'', CAST(N'2024-04-09T13:42:37.633' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (284, 72, N'h2', 1, N'', CAST(N'2024-04-09T13:42:26.447' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (285, 72, N'h3', 1, N'', CAST(N'2024-04-09T13:42:26.447' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (286, 72, N'h11', 1, N'', CAST(N'2024-04-09T13:42:26.447' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (311, 81, N'h1', 1, N'', CAST(N'2024-04-16T14:57:21.830' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (312, 81, N'h2', 1, N'', CAST(N'2024-04-16T14:57:21.837' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (313, 81, N'h3', 1, N'', CAST(N'2024-04-16T14:57:21.840' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (314, 81, N'h11', 1, N'', CAST(N'2024-04-16T14:57:21.840' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (347, 90, N'h1', 1, N'', CAST(N'2024-04-22T15:34:55.193' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (348, 90, N'h2', 1, N'', CAST(N'2024-04-22T15:34:55.193' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (349, 90, N'h3', 1, N'', CAST(N'2024-04-22T15:34:55.193' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (350, 90, N'h11', 1, N'', CAST(N'2024-04-22T15:34:55.193' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (67, 22, N'h4', 1, N'', CAST(N'2024-03-13T23:03:56.947' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (68, 22, N'h5', 1, N'', CAST(N'2024-03-13T23:03:56.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (69, 22, N'h6', 1, N'', CAST(N'2024-03-13T23:03:56.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (70, 22, N'h1', 1, N'', CAST(N'2024-03-13T23:03:56.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (71, 22, N'h2', 1, N'', CAST(N'2024-03-13T23:03:56.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (72, 22, N'h3', 1, N'', CAST(N'2024-03-13T23:03:56.950' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (73, 35, N'h4', 1, N'', CAST(N'2024-03-13T23:26:26.857' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (74, 35, N'h5', 1, N'', CAST(N'2024-03-13T23:26:26.857' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (75, 35, N'h6', 1, N'', CAST(N'2024-03-13T23:26:26.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (76, 35, N'h1', 1, N'', CAST(N'2024-03-13T23:26:26.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (77, 35, N'h2', 1, N'', CAST(N'2024-03-13T23:26:26.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (78, 35, N'h3', 1, N'', CAST(N'2024-03-13T23:26:26.860' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (109, 27, N'h4', 1, N'', CAST(N'2024-03-13T23:27:52.923' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (110, 27, N'h5', 1, N'', CAST(N'2024-03-13T23:27:52.923' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (111, 27, N'h6', 1, N'', CAST(N'2024-03-13T23:27:52.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (112, 27, N'h1', 1, N'', CAST(N'2024-03-13T23:27:52.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (113, 27, N'h2', 1, N'', CAST(N'2024-03-13T23:27:52.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (114, 27, N'h3', 1, N'', CAST(N'2024-03-13T23:27:52.927' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (355, 92, N'h1', 1, N'', CAST(N'2024-04-23T15:07:51.260' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (356, 92, N'h2', 1, N'', CAST(N'2024-04-23T15:06:53.613' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (357, 92, N'h3', 1, N'', CAST(N'2024-04-23T15:06:53.617' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (358, 92, N'h11', 1, N'', CAST(N'2024-04-23T15:06:53.617' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (85, 23, N'h4', 1, N'', CAST(N'2024-03-13T23:27:03.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (86, 23, N'h5', 1, N'', CAST(N'2024-03-13T23:27:03.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (87, 23, N'h6', 1, N'', CAST(N'2024-03-13T23:27:03.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (88, 23, N'h1', 1, N'', CAST(N'2024-03-13T23:27:03.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (89, 23, N'h2', 1, N'', CAST(N'2024-03-13T23:27:03.800' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (90, 23, N'h3', 1, N'', CAST(N'2024-03-13T23:27:03.803' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (115, 28, N'h4', 1, N'', CAST(N'2024-03-13T23:28:02.847' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (116, 28, N'h5', 1, N'', CAST(N'2024-03-13T23:28:02.847' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (117, 28, N'h6', 1, N'', CAST(N'2024-03-13T23:28:02.847' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (118, 28, N'h1', 1, N'', CAST(N'2024-03-13T23:28:02.850' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (119, 28, N'h2', 1, N'', CAST(N'2024-03-13T23:28:02.850' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (120, 28, N'h3', 1, N'', CAST(N'2024-03-13T23:28:02.850' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (189, 49, N'h9', 1, N'', CAST(N'2024-03-13T23:33:50.443' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (190, 49, N'h1', 1, N'', CAST(N'2024-03-13T23:33:50.443' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (191, 49, N'h2', 1, N'', CAST(N'2024-03-13T23:33:50.443' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (192, 49, N'h3', 1, N'', CAST(N'2024-03-13T23:33:50.443' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (193, 50, N'h9', 1, N'', CAST(N'2024-03-13T23:33:56.530' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (194, 50, N'h1', 1, N'', CAST(N'2024-03-13T23:33:56.530' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (195, 50, N'h2', 1, N'', CAST(N'2024-03-13T23:33:56.530' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (196, 50, N'h3', 1, N'', CAST(N'2024-03-13T23:33:56.530' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (205, 53, N'h9', 1, N'', CAST(N'2024-03-13T23:34:21.977' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (206, 53, N'h1', 1, N'', CAST(N'2024-03-13T23:34:21.980' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (207, 53, N'h2', 1, N'', CAST(N'2024-03-13T23:34:21.980' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (208, 53, N'h3', 1, N'', CAST(N'2024-03-13T23:34:21.980' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (255, 18, N'h1', 1, N'', CAST(N'2024-03-15T01:47:02.783' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (256, 18, N'h2', 1, N'', CAST(N'2024-03-13T23:42:47.090' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (257, 18, N'h3', 1, N'', CAST(N'2024-03-13T23:47:03.207' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (97, 25, N'h4', 1, N'', CAST(N'2024-03-13T23:27:30.487' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (98, 25, N'h5', 1, N'', CAST(N'2024-03-13T23:27:30.490' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (99, 25, N'h6', 1, N'', CAST(N'2024-03-13T23:27:30.490' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (100, 25, N'h1', 1, N'', CAST(N'2024-03-13T23:27:30.490' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (101, 25, N'h2', 1, N'', CAST(N'2024-03-13T23:27:30.490' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (102, 25, N'h3', 1, N'', CAST(N'2024-03-13T23:27:30.490' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (103, 26, N'h4', 1, N'', CAST(N'2024-03-13T23:27:43.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (104, 26, N'h5', 1, N'', CAST(N'2024-03-13T23:27:43.030' AS DateTime))
GO
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (105, 26, N'h6', 1, N'', CAST(N'2024-03-13T23:27:43.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (106, 26, N'h1', 1, N'', CAST(N'2024-03-13T23:27:43.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (107, 26, N'h2', 1, N'', CAST(N'2024-03-13T23:27:43.030' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (108, 26, N'h3', 1, N'', CAST(N'2024-03-13T23:27:43.033' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (145, 33, N'h4', 1, N'', CAST(N'2024-03-13T23:28:58.523' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (146, 33, N'h5', 1, N'', CAST(N'2024-03-13T23:28:58.523' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (147, 33, N'h6', 1, N'', CAST(N'2024-03-13T23:28:58.523' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (148, 33, N'h1', 1, N'', CAST(N'2024-03-13T23:28:58.523' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (149, 33, N'h2', 1, N'', CAST(N'2024-03-13T23:28:58.527' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (150, 33, N'h3', 1, N'', CAST(N'2024-03-13T23:28:58.527' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (177, 46, N'h9', 1, N'', CAST(N'2024-03-13T23:33:15.083' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (178, 46, N'h1', 1, N'', CAST(N'2024-03-13T23:33:15.083' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (179, 46, N'h2', 1, N'', CAST(N'2024-03-13T23:33:15.087' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (180, 46, N'h3', 1, N'', CAST(N'2024-03-13T23:33:15.087' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (201, 52, N'h9', 1, N'', CAST(N'2024-03-13T23:34:12.370' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (202, 52, N'h1', 1, N'', CAST(N'2024-03-13T23:34:12.373' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (203, 52, N'h2', 1, N'', CAST(N'2024-03-13T23:34:12.373' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (204, 52, N'h3', 1, N'', CAST(N'2024-03-13T23:34:12.373' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (217, 56, N'h9', 1, N'', CAST(N'2024-03-13T23:35:02.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (218, 56, N'h1', 1, N'', CAST(N'2024-03-13T23:35:02.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (219, 56, N'h2', 1, N'', CAST(N'2024-03-13T23:35:02.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (220, 56, N'h3', 1, N'', CAST(N'2024-03-13T23:35:02.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (237, 65, N'h1', 1, N'', CAST(N'2024-03-13T23:41:19.577' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (238, 65, N'h2', 1, N'', CAST(N'2024-03-13T23:41:19.577' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (239, 65, N'h3', 1, N'', CAST(N'2024-03-13T23:41:19.580' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (243, 67, N'h1', 1, N'', CAST(N'2024-03-13T23:41:42.767' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (244, 67, N'h2', 1, N'', CAST(N'2024-03-13T23:41:42.767' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (245, 67, N'h3', 1, N'', CAST(N'2024-03-13T23:41:42.767' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (246, 68, N'h1', 1, N'', CAST(N'2024-03-13T23:41:52.003' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (247, 68, N'h2', 1, N'', CAST(N'2024-03-13T23:41:52.007' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (248, 68, N'h3', 1, N'', CAST(N'2024-03-13T23:41:52.007' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (287, 75, N'h1', 1, N'', CAST(N'2024-04-10T13:06:56.907' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (288, 75, N'h2', 1, N'', CAST(N'2024-04-10T13:06:56.917' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (289, 75, N'h3', 1, N'', CAST(N'2024-04-10T13:06:56.917' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (290, 75, N'h11', 1, N'', CAST(N'2024-04-10T13:06:56.917' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (299, 78, N'h1', 1, N'', CAST(N'2024-04-12T15:43:35.930' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (300, 78, N'h2', 1, N'', CAST(N'2024-04-12T15:43:35.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (301, 78, N'h3', 1, N'', CAST(N'2024-04-12T15:43:35.933' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (302, 78, N'h11', 1, N'', CAST(N'2024-04-12T15:43:35.937' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (327, 85, N'h1', 0, N'', CAST(N'2024-04-17T14:04:25.683' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (328, 85, N'h2', 1, N'', CAST(N'2024-04-17T14:03:56.343' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (329, 85, N'h3', 1, N'', CAST(N'2024-04-17T14:03:56.347' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (330, 85, N'h11', 0, N'', CAST(N'2024-04-17T14:03:56.347' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (343, 89, N'h1', 1, N'', CAST(N'2024-04-22T15:34:47.390' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (344, 89, N'h2', 1, N'', CAST(N'2024-04-22T15:34:47.393' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (345, 89, N'h3', 1, N'', CAST(N'2024-04-22T15:34:47.397' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (346, 89, N'h11', 1, N'', CAST(N'2024-04-22T15:34:47.397' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (319, 83, N'h1', 1, N'', CAST(N'2024-04-16T14:57:36.123' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (320, 83, N'h2', 1, N'', CAST(N'2024-04-16T14:57:36.123' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (321, 83, N'h3', 1, N'', CAST(N'2024-04-16T14:57:36.127' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (322, 83, N'h11', 1, N'', CAST(N'2024-04-16T14:57:36.127' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (323, 84, N'h1', 1, N'', CAST(N'2024-04-16T14:57:42.267' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (324, 84, N'h2', 1, N'', CAST(N'2024-04-16T14:57:42.267' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (325, 84, N'h3', 1, N'', CAST(N'2024-04-16T14:57:42.267' AS DateTime))
INSERT [dbo].[attendance] ([aid], [sesid], [sid], [isPresent], [description], [time]) VALUES (326, 84, N'h11', 1, N'', CAST(N'2024-04-16T14:57:42.270' AS DateTime))
GO
INSERT [dbo].[department] ([did], [dname]) VALUES (1, N'Software Engineering')
INSERT [dbo].[department] ([did], [dname]) VALUES (2, N'International Business')
INSERT [dbo].[department] ([did], [dname]) VALUES (3, N'Digital Marketing')
INSERT [dbo].[department] ([did], [dname]) VALUES (4, N'Graphic Design')
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'1')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'1')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'1')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h4', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h5', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h6', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h7', N'6')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h8', N'6')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h9', N'3')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'2')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'5')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'5')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'5')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'3')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'3')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'3')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'4')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'4')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'4')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'7')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'7')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'7')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'8')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'8')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'8')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'9')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'9')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'9')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'10')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'10')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'10')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'11')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'11')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'11')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'12')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'12')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'12')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'13')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'13')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'13')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'14')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'14')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'14')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'15')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'15')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'15')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'16')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'16')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'16')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'17')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'17')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'17')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'18')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'18')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'18')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'19')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'19')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'19')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h1', N'20')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h2', N'20')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h3', N'20')
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (N'h11', N'20')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'View student home', N'/studenthome')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'View student timetable', N'/studenttimetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'View student grade', N'/studentgrade')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'View lecturer home', N'/lecturerhome')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'View lecturer timetable', N'/lecturertimetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'Lecturer take attendance', N'/attendance')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (7, N'Lecturer take grade', N'/takegrade')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (8, N'Attendance View', N'/viewattend')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (9, N'Change Schedule', N'/changeschedule')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (10, N'View Request', N'/viewrequest')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (11, N'Request Received', N'/requestreceived')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (14, N'Test role', N'/test')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (16, N'View News', N'/news')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (15, N'View News Detail', N'/newdetail')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (12, N'Student Information', N'/studentinfo')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (13, N'Lecturer Information', N'/lecturerinfo')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (17, N'Lecturer attendance report', N'/attendancereport')
GO
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (1, N'1', N'h1', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (2, N'1', N'h2', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (3, N'1', N'h3', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (4, N'2', N'h1', N'1', 1, 1, N'hoc dot')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (5, N'2', N'h2', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (6, N'2', N'h3', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (7, N'3', N'h1', N'10', 1, 1, N'sua diem')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (26, N'13', N'h4', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (27, N'13', N'h5', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (28, N'13', N'h6', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (29, N'13', N'h1', N'6', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (30, N'13', N'h2', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (31, N'13', N'h3', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (35, N'26', N'h1', N'8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (39, N'30', N'h1', N'9.8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (40, N'4', N'h1', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (41, N'4', N'h2', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (42, N'4', N'h3', N'10', 1, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (43, N'1', N'h1', N'10', 20, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (44, N'1', N'h2', N'10', 20, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (45, N'1', N'h3', N'10', 20, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (46, N'1', N'h11', N'3', 20, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (48, N'2', N'h2', N'10', 20, 1, NULL)
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (49, N'2', N'h3', N'10', 20, 1, NULL)
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (50, N'2', N'h11', N'10', 20, 1, NULL)
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (8, N'10', N'h4', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (9, N'10', N'h5', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (10, N'10', N'h6', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (11, N'10', N'h1', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (12, N'10', N'h2', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (13, N'10', N'h3', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (32, N'25', N'h1', N'8.8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (33, N'25', N'h2', N'8.8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (34, N'25', N'h3', N'8.8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (36, N'27', N'h1', N'8.3', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (38, N'29', N'h1', N'8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (47, N'2', N'h1', N'5', 20, 1, NULL)
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (14, N'11', N'h4', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (15, N'11', N'h5', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (16, N'11', N'h6', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (17, N'11', N'h1', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (18, N'11', N'h2', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (19, N'11', N'h3', N'10', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (37, N'28', N'h1', N'8', 4, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (20, N'12', N'h4', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (21, N'12', N'h5', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (22, N'12', N'h6', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (23, N'12', N'h1', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (24, N'12', N'h2', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (25, N'12', N'h3', N'8', 2, 1, N'')
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (51, N'3', N'h1', N'10', 20, 1, NULL)
INSERT [dbo].[grade] ([gradeid], [assid], [sid], [score], [gid], [isTaken], [description]) VALUES (52, N'3', N'h11', N'10', 20, 1, NULL)
GO
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (1, 1, 1, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (2, 2, 1, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (7, 13, 2, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (9, 26, 4, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (14, 4, 1, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (15, 1, 20, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (3, 3, 1, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (4, 10, 2, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (6, 12, 2, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (13, 30, 4, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (5, 11, 2, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (11, 28, 4, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (8, 25, 4, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (10, 27, 4, 1)
INSERT [dbo].[GradeItemTaken] ([gtid], [assid], [gid], [isTaken]) VALUES (12, 29, 4, 1)
GO
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (1, N'SE1817', N'PRJ301', N'sonnt', N'SP24')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (2, N'SE1817', N'MAS291', N'dungvt', N'SP24')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (3, N'SE1817', N'JPD123', N'anhnn', N'SP24')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (4, N'SE1817', N'IOT102', N'yennth', N'SP24')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (5, N'SE1815', N'PRO192', N'duynq', N'SU23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (6, N'SE1849', N'PRJ301', N'sonnt', N'SP24')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (7, N'SE1815', N'PRF192', N'thopn', N'SP23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (8, N'SE1815', N'CSI104', N'hienda', N'SP23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (9, N'SE1815', N'MAE101', N'donnt', N'SP23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (10, N'SE1815', N'CEA201', N'hieubv', N'SP23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (11, N'SE1815', N'SSG104', N'dungbh', N'SU23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (12, N'SE1815', N'MAD101', N'phuongvtm', N'SU23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (13, N'SE1815', N'OSG202', N'tudq', N'SU23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (14, N'SE1815', N'NWC203c', N'huyvv', N'SU23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (15, N'SE1817', N'JPD113', N'dungltk', N'FA23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (16, N'SE1803', N'LAB211', N'tuanvm', N'FA23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (17, N'SE1817', N'CSD201', N'oanhnt', N'FA23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (18, N'SE1817', N'DBI202', N'quantl', N'FA23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (19, N'SE1817', N'WED201c', N'loandt', N'FA23')
INSERT [dbo].[group] ([gid], [gname], [subid], [PIC], [term]) VALUES (20, N'	PRJ301.E2.BL5', N'PRJ301', N'hoannn', N'SP24')
GO
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l1', N'sonnt', 1, N'sonnt', N'handghe170064@fpt.edu.vn', N'Ngo Tung Son', CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l2', N'tuanvm', 1, N'tuanvm', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l3', N'anhnn', 0, N'anhnn', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l4', N'dungvt', 1, N'dungvt', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l5', N'yennth', 0, N'yennth', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l6', N'duynq', 1, N'duynq', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l7', N'khuongpd', 1, N'khuongpd', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l8', N'dungltk', 1, N'dungltk', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l9', N'oanhnt', 0, N'oanhnt', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l10', N'quantl', 1, N'quantl', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l11', N'loandt', 0, N'loandt', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l12', N'dungbh', 1, N'dungbh', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l13', N'phuongvtm', 0, N'phuongvtm', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l14', N'tudq', 1, N'tudq', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l15', N'huyvv', 1, N'huyvv', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l16', N'thopn', 1, N'thopn', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l17', N'hienda', 1, N'hienda', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l18', N'donnt', 1, N'donnt', N'handghe170064@fpt.edu.vn', NULL, CAST(N'1997-03-19' AS Date))
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l19', N'hieubv', 1, N'hieubv', N'handghe170064@fpt.edu.vn', NULL, NULL)
INSERT [dbo].[lecturer] ([lid], [lname], [gender], [username], [email], [truename], [dob]) VALUES (N'l20', N'hoannn', 1, N'hoannn', N'tuanpdhe171507@fpt.edu.vn', N'HoanNN', CAST(N'1997-03-19' AS Date))
GO
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (1, N'name1', N'content1', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (2, N'name2', N'content2', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (3, N'name3 ', N'content3', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (4, N'name4 ', N'content4', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (5, N'name5', N'content5', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (6, N'name6', N'content6', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (7, N'name7', N'content7', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (8, N'name8', N'content8', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (9, N'name9', N'content9', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (10, N'name10', N'content10', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (11, N'name11', N'content11', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (12, N'name12', N'content12', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([id], [name], [content], [time]) VALUES (13, N'name13', N'content13', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RequestChangeTimetable] ON 

INSERT [dbo].[RequestChangeTimetable] ([id], [lidfrom], [lidto], [room], [slot], [date], [gid], [description], [status], [sesid], [responsed]) VALUES (13, N'l20', N'l2', N'BE102', 2, CAST(N'2024-04-11' AS Date), 20, N'em b?n', 0, 71, 1)
INSERT [dbo].[RequestChangeTimetable] ([id], [lidfrom], [lidto], [room], [slot], [date], [gid], [description], [status], [sesid], [responsed]) VALUES (14, N'l20', N'l1', N'BE102', 3, CAST(N'2024-04-23' AS Date), 20, N'em ban', 0, 92, 1)
INSERT [dbo].[RequestChangeTimetable] ([id], [lidfrom], [lidto], [room], [slot], [date], [gid], [description], [status], [sesid], [responsed]) VALUES (15, N'l20', N'l1', N'BE102', 3, CAST(N'2024-04-24' AS Date), 20, NULL, NULL, 92, NULL)
INSERT [dbo].[RequestChangeTimetable] ([id], [lidfrom], [lidto], [room], [slot], [date], [gid], [description], [status], [sesid], [responsed]) VALUES (16, N'l20', N'l2', N'BE101', 1, CAST(N'2024-04-24' AS Date), 20, N'oke anh', 1, 92, 1)
SET IDENTITY_INSERT [dbo].[RequestChangeTimetable] OFF
GO
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (1, N'student')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (2, N'lecturer')
GO
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'handg', 1)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'sonnt', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'cuonghv', 1)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'sonnt', 3)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'anhnn', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'yennth', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'dungvt', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'tuanvm', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'hoannn', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'tuanpd', 1)
GO
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 7)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 8)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 9)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 10)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 11)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 14)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 15)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 16)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 12)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 13)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 17)
GO
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'1', N'BE101')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'2', N'BE102')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'3', N'BE103')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'4', N'BE104')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'5', N'BE105')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'6', N'BE106')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'7', N'BE107')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'8', N'BE108')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'9', N'BE109')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'10', N'BE110')
INSERT [dbo].[room] ([rid], [rnumber]) VALUES (N'11', N'AL205')
GO
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (1, 1, N'l1', N'BE101', 4, CAST(N'2024-01-03' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (2, 1, N'l1', N'BE101', 3, CAST(N'2024-01-05' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (3, 1, N'l1', N'BE101', 4, CAST(N'2024-01-10' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (4, 1, N'l1', N'BE101', 3, CAST(N'2024-01-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (5, 1, N'l1', N'BE101', 4, CAST(N'2024-01-17' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (6, 1, N'l1', N'BE101', 3, CAST(N'2024-01-19' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (7, 1, N'l1', N'BE101', 4, CAST(N'2024-01-24' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (8, 1, N'l1', N'BE101', 3, CAST(N'2024-01-26' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (9, 1, N'l1', N'BE101', 4, CAST(N'2024-01-31' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (10, 1, N'l1', N'BE101', 3, CAST(N'2024-02-02' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (11, 1, N'l1', N'BE101', 4, CAST(N'2024-02-21' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (12, 1, N'l1', N'BE101', 3, CAST(N'2024-02-23' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (13, 1, N'l1', N'BE101', 4, CAST(N'2024-02-28' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (14, 1, N'l1', N'BE101', 3, CAST(N'2024-03-01' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (15, 1, N'l1', N'BE101', 4, CAST(N'2024-03-06' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (21, 2, N'l4', N'BE101', 3, CAST(N'2024-01-02' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (22, 2, N'l4', N'BE101', 4, CAST(N'2024-01-04' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (23, 2, N'l4', N'BE101', 3, CAST(N'2024-01-09' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (24, 2, N'l4', N'BE101', 4, CAST(N'2024-01-11' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (25, 2, N'l4', N'BE101', 3, CAST(N'2024-01-16' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (26, 2, N'l4', N'BE101', 4, CAST(N'2024-01-18' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (27, 2, N'l4', N'BE101', 3, CAST(N'2024-01-23' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (28, 2, N'l4', N'BE101', 4, CAST(N'2024-01-25' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (29, 2, N'l4', N'BE101', 3, CAST(N'2024-01-30' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (30, 2, N'l4', N'BE101', 4, CAST(N'2024-02-01' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (31, 2, N'l4', N'BE101', 3, CAST(N'2024-02-20' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (32, 2, N'l4', N'BE101', 4, CAST(N'2024-02-22' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (33, 2, N'l4', N'BE101', 3, CAST(N'2024-02-27' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (34, 2, N'l4', N'BE101', 4, CAST(N'2024-02-29' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (35, 2, N'l4', N'BE101', 3, CAST(N'2024-03-05' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (36, 2, N'l4', N'BE101', 4, CAST(N'2024-03-07' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (37, 2, N'l4', N'BE101', 3, CAST(N'2024-03-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (38, 2, N'l4', N'BE101', 4, CAST(N'2024-03-14' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (39, 2, N'l4', N'BE101', 3, CAST(N'2024-03-19' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (40, 2, N'l4', N'BE101', 4, CAST(N'2024-03-21' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (41, 3, N'l3', N'BE101', 4, CAST(N'2024-01-02' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (42, 3, N'l3', N'BE101', 3, CAST(N'2024-01-04' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (43, 3, N'l3', N'BE101', 4, CAST(N'2024-01-09' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (44, 3, N'l3', N'BE101', 3, CAST(N'2024-01-11' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (45, 3, N'l3', N'BE101', 4, CAST(N'2024-01-16' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (46, 3, N'l3', N'BE101', 3, CAST(N'2024-01-18' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (47, 3, N'l3', N'BE101', 4, CAST(N'2024-01-23' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (48, 3, N'l3', N'BE101', 3, CAST(N'2024-01-25' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (49, 3, N'l3', N'BE101', 4, CAST(N'2024-01-30' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (50, 3, N'l3', N'BE101', 3, CAST(N'2024-02-01' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (51, 3, N'l3', N'BE101', 4, CAST(N'2024-02-20' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (52, 3, N'l3', N'BE101', 3, CAST(N'2024-02-22' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (53, 3, N'l3', N'BE101', 4, CAST(N'2024-02-27' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (54, 3, N'l3', N'BE101', 3, CAST(N'2024-02-29' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (55, 3, N'l3', N'BE101', 4, CAST(N'2024-03-05' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (56, 3, N'l3', N'BE101', 3, CAST(N'2024-03-07' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (57, 3, N'l3', N'BE101', 4, CAST(N'2024-03-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (58, 3, N'l3', N'BE101', 3, CAST(N'2024-03-14' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (59, 3, N'l3', N'BE101', 4, CAST(N'2024-03-19' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (60, 3, N'l3', N'BE101', 3, CAST(N'2024-03-21' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (71, 20, N'l20', N'AL205', 4, CAST(N'2024-04-09' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (72, 20, N'l20', N'AL205', 5, CAST(N'2024-04-09' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (73, 20, N'l20', N'AL205', 4, CAST(N'2024-04-08' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (74, 20, N'l20', N'AL205', 5, CAST(N'2024-04-08' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (75, 20, N'l20', N'AL205', 4, CAST(N'2024-04-10' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (76, 20, N'l20', N'AL205', 5, CAST(N'2024-04-10' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (77, 20, N'l20', N'AL205', 4, CAST(N'2024-04-11' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (78, 20, N'l20', N'AL205', 5, CAST(N'2024-04-11' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (79, 20, N'l20', N'AL205', 4, CAST(N'2024-04-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (80, 20, N'l20', N'AL205', 5, CAST(N'2024-04-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (81, 20, N'l20', N'AL205', 4, CAST(N'2024-04-15' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (82, 20, N'l20', N'AL205', 5, CAST(N'2024-04-15' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (83, 20, N'l20', N'AL205', 4, CAST(N'2024-04-16' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (84, 20, N'l20', N'AL205', 5, CAST(N'2024-04-16' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (85, 20, N'l20', N'AL205', 4, CAST(N'2024-04-17' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (86, 20, N'l20', N'AL205', 5, CAST(N'2024-04-17' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (87, 20, N'l20', N'AL205', 4, CAST(N'2024-04-19' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (88, 20, N'l20', N'AL205', 5, CAST(N'2024-04-19' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (89, 20, N'l20', N'AL205', 4, CAST(N'2024-04-22' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (90, 20, N'l20', N'AL205', 5, CAST(N'2024-04-22' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (91, 20, N'l20', N'AL205', 6, CAST(N'2024-04-22' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (92, 20, N'l2', N'BE101', 1, CAST(N'2024-04-24' AS Date), 1, N'SP24', 1)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (93, 20, N'l20', N'AL205', 5, CAST(N'2024-04-23' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (94, 20, N'l20', N'AL205', 6, CAST(N'2024-04-23' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (95, 20, N'l20', N'AL205', 4, CAST(N'2024-04-24' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (96, 20, N'l20', N'AL205', 5, CAST(N'2024-04-24' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (97, 20, N'l20', N'AL205', 4, CAST(N'2024-04-25' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (98, 20, N'l20', N'AL205', 5, CAST(N'2024-04-25' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (99, 20, N'l20', N'AL205', 4, CAST(N'2024-04-26' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (100, 20, N'l20', N'AL205', 5, CAST(N'2024-04-26' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (101, 6, N'l1', N'BE102', 1, CAST(N'2024-04-24' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (102, 6, N'l1', N'BE102', 2, CAST(N'2024-04-24' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (16, 1, N'l1', N'BE101', 3, CAST(N'2024-03-08' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (17, 1, N'l1', N'BE101', 4, CAST(N'2024-03-13' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (18, 1, N'l1', N'BE101', 3, CAST(N'2024-03-15' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (19, 1, N'l1', N'BE101', 4, CAST(N'2024-03-20' AS Date), 1, N'SP24', 1)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (20, 1, N'l1', N'BE101', 3, CAST(N'2024-03-22' AS Date), 0, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (61, 4, N'l5', N'BE101', 3, CAST(N'2024-01-03' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (62, 4, N'l5', N'BE101', 4, CAST(N'2024-01-05' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (63, 4, N'l5', N'BE101', 3, CAST(N'2024-01-10' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (64, 4, N'l5', N'BE101', 4, CAST(N'2024-01-12' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (65, 4, N'l5', N'BE101', 3, CAST(N'2024-01-17' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (66, 4, N'l5', N'BE101', 4, CAST(N'2024-01-19' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (67, 4, N'l5', N'BE101', 3, CAST(N'2024-01-24' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (68, 4, N'l5', N'BE101', 4, CAST(N'2024-01-26' AS Date), 1, N'SP24', NULL)
GO
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (69, 4, N'l5', N'BE101', 3, CAST(N'2024-01-31' AS Date), 1, N'SP24', NULL)
INSERT [dbo].[session] ([sesid], [gid], [lid], [room], [tid], [date], [isTaken], [term], [change]) VALUES (70, 4, N'l5', N'BE101', 4, CAST(N'2024-02-02' AS Date), 1, N'SP24', NULL)
GO
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h1', N'Dinh Gia Han', CAST(N'2003-12-05' AS Date), 1, 1, N'handg', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h2', N'Ha Van Cuong', CAST(N'1992-05-15' AS Date), 1, 1, N'cuonghv', N'cuonghvhe176362@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h3', N'Nguyen Dieu Linh', CAST(N'1993-09-30' AS Date), 1, 0, N'linhnd', N'linhndhe173491@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h4', N'Vu Van Phat', CAST(N'1991-07-12' AS Date), 1, 1, N'phatvv', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h5', N'Pham Duy Kien', CAST(N'1994-03-18' AS Date), 1, 1, N'kienpd', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h6', N'Tran Viet Thinh', CAST(N'1995-11-25' AS Date), 1, 0, N'thinhtv', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h7', N'Dau Dinh Hieu', CAST(N'1993-02-08' AS Date), 1, 1, N'hieudd', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h8', N'Hai Yen', CAST(N'1992-09-22' AS Date), 1, 0, N'yen', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h9', N'Phuong Trang', CAST(N'1994-06-05' AS Date), 1, 1, N'trang', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h10', N'Nguyen Khac Tung', CAST(N'1996-12-10' AS Date), 1, 0, N'tungnk', N'handghe170064@fpt.edu.vn')
INSERT [dbo].[student] ([sid], [name], [dob], [did], [gender], [username], [email]) VALUES (N'h11', N'Phan Dinh Tuan', CAST(N'2003-01-01' AS Date), 1, 1, N'tuanpd', N'tuanpdhe171507@fpt.edu.vn')
GO
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'1', N'PRJ301', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'2', N'MAS291', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'3', N'IOT102', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'4', N'SWE201c', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'5', N'JPD123', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'6', N'	JPD113', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'7', N'	CSD201', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'8', N'DBI202', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'9', N'LAB211', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'10', N'WED201c', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'11', N'SSG104', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'12', N'MAD101', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'13', N'PRO192', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'14', N'OSG202', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'15', N'NWC203c', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'16', N'CSI104', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'17', N'PRF192', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'18', N'MAE101', 3, 1)
INSERT [dbo].[subject] ([subid], [subname], [credit], [did]) VALUES (N'19', N'CEA201', 3, 1)
GO
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'SP23', CAST(N'2023-01-01' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'SU23', CAST(N'2023-05-01' AS Date), CAST(N'2023-08-31' AS Date))
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'FA23', CAST(N'2023-09-01' AS Date), CAST(N'2023-12-31' AS Date))
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'SP24', CAST(N'2024-01-01' AS Date), CAST(N'2024-04-30' AS Date))
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'SU24', CAST(N'2024-05-01' AS Date), CAST(N'2024-08-31' AS Date))
INSERT [dbo].[term] ([tid], [timeStart], [timeEnd]) VALUES (N'FA24', CAST(N'2024-09-01' AS Date), CAST(N'2024-12-31' AS Date))
GO
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (1, N'07:30', N'09:00')
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (2, N'09:10', N'10:40')
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (3, N'10:50', N'12:20')
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (4, N'12:50', N'14:20')
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (5, N'14:30', N'16:00')
INSERT [dbo].[timeslot] ([tid], [timeStart], [timeEnd]) VALUES (6, N'16:10', N'17:40')
GO
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (1, N'h1', N'SP24', N'6.8', N'NOT PASS', NULL, 1)
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (2, N'h1', N'SP24', N'8.7', N'PASSED', NULL, 2)
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (3, N'h1', N'SU23', N'0.0', N'NOT PASS', NULL, 5)
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (4, N'h1', N'SP24', N'9.8', N'PASSED', NULL, 3)
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (5, N'h1', N'SP24', N'8.8', N'PASSED', NULL, 4)
INSERT [dbo].[totalcourse] ([toid], [sid], [term], [total], [status], [description], [gid]) VALUES (6, N'h1', N'SP24', N'0.0', N'STUDYING', NULL, 20)
GO
USE [master]
GO
ALTER DATABASE [PRJ-Project] SET  READ_WRITE 
GO
