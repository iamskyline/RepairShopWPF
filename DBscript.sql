USE [master]
GO
/****** Object:  Database [Accounting_applications]    Script Date: 25.10.2023 18:42:31 ******/
CREATE DATABASE [Accounting_applications]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Accounting_applications', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Accounting_applications.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Accounting_applications_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Accounting_applications_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Accounting_applications] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accounting_applications].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accounting_applications] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Accounting_applications] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Accounting_applications] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Accounting_applications] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Accounting_applications] SET ARITHABORT OFF 
GO
ALTER DATABASE [Accounting_applications] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Accounting_applications] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Accounting_applications] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Accounting_applications] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Accounting_applications] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Accounting_applications] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Accounting_applications] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Accounting_applications] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Accounting_applications] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Accounting_applications] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Accounting_applications] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Accounting_applications] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Accounting_applications] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Accounting_applications] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Accounting_applications] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Accounting_applications] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Accounting_applications] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Accounting_applications] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Accounting_applications] SET  MULTI_USER 
GO
ALTER DATABASE [Accounting_applications] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Accounting_applications] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Accounting_applications] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Accounting_applications] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Accounting_applications] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Accounting_applications] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Accounting_applications] SET QUERY_STORE = OFF
GO
USE [Accounting_applications]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Equipment_type_ID] [int] NOT NULL,
	[Application_status_ID] [int] NOT NULL,
	[Performer_ID] [int] NOT NULL,
	[Issue_ID] [int] NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Priority_type_ID] [int] NOT NULL,
	[Equipment_serial_number] [varchar](100) NOT NULL,
	[Malfunction_type_ID] [int] NOT NULL,
	[Date_added] [smalldatetime] NOT NULL,
	[Planned_end_date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__Applicat__3214EC2718BF5BDC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application_statuses]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application_statuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Applicat__3214EC27E5829BE2] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assistance]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assistance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Assistance_type] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Assistan__3214EC277C2EF48E] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](40) NOT NULL,
	[Surname_name] [varchar](40) NOT NULL,
	[Last_name] [varchar](40) NULL,
	[Address] [varchar](100) NOT NULL,
	[Tel] [varchar](11) NOT NULL,
 CONSTRAINT [PK__Client__3214EC2773696474] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_type]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Equipmen__3214EC2710C86CB4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issue]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](400) NULL,
 CONSTRAINT [PK__Issue__3214EC27D3748334] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Malfunction_type]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Malfunction_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Malfunction_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performer]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](40) NOT NULL,
	[Surname_name] [varchar](40) NOT NULL,
	[Last_name] [varchar](40) NULL,
	[Tel] [varchar](11) NOT NULL,
 CONSTRAINT [PK__Performe__3214EC27A657FCBF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority_type]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Priority__3214EC27C0053396] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Application] [int] NOT NULL,
	[Assistance] [int] NOT NULL,
	[Reason_of_malfunction] [varchar](150) NULL,
	[Resources_price] [decimal](18, 2) NOT NULL,
	[Job_price] [decimal](18, 2) NOT NULL,
	[Repair_start_time] [smalldatetime] NOT NULL,
	[Repair_finish_time] [smalldatetime] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK__Report__3214EC27D65A3623] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report_Spare_parts]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report_Spare_parts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Report_ID] [int] NOT NULL,
	[Spare_part_ID] [int] NOT NULL,
 CONSTRAINT [PK__Report_S__3214EC271660A767] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spare_part_order]    Script Date: 25.10.2023 18:42:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spare_part_order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Performer_ID] [int] NOT NULL,
	[Spare_part_type] [varchar](40) NOT NULL,
	[Spare_part_name] [varchar](40) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK__Spare_pa__3214EC2729FA2FB4] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (1, 1, 1, 1, 1, 1, 1, N'2281337', 1, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (2, 2, 1, 1, 10, 4, 2, N'223124453', 3, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (3, 5, 3, 3, 11, 1, 3, N'2312423', 6, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (4, 4, 2, 4, 12, 4, 2, N'2434694', 4, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (5, 2, 1, 1, 13, 1, 1, N'0983342', 5, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (6, 6, 3, 1, 14, 4, 1, N'1337', 2, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-10-25T18:00:00' AS SmallDateTime))
INSERT [dbo].[Application] ([ID], [Equipment_type_ID], [Application_status_ID], [Performer_ID], [Issue_ID], [Client_ID], [Priority_type_ID], [Equipment_serial_number], [Malfunction_type_ID], [Date_added], [Planned_end_date]) VALUES (7, 4, 3, 2, 15, 2, 2, N'42359643', 1, CAST(N'2023-10-25T12:00:00' AS SmallDateTime), CAST(N'2023-11-01T23:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[Application_statuses] ON 

INSERT [dbo].[Application_statuses] ([ID], [Status_name]) VALUES (1, N'Не завершено')
INSERT [dbo].[Application_statuses] ([ID], [Status_name]) VALUES (2, N'Завершено')
INSERT [dbo].[Application_statuses] ([ID], [Status_name]) VALUES (3, N'В процессе')
SET IDENTITY_INSERT [dbo].[Application_statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Assistance] ON 

INSERT [dbo].[Assistance] ([ID], [Assistance_type]) VALUES (1, N'Консультация')
INSERT [dbo].[Assistance] ([ID], [Assistance_type]) VALUES (2, N'Ремонтные работы')
INSERT [dbo].[Assistance] ([ID], [Assistance_type]) VALUES (3, N'Заказ запчастей')
SET IDENTITY_INSERT [dbo].[Assistance] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [First_name], [Surname_name], [Last_name], [Address], [Tel]) VALUES (1, N'Петр', N'Петров', N'Петрович', N'г. Коломна, ул. Ленина, д. 3', N'79264292435')
INSERT [dbo].[Client] ([ID], [First_name], [Surname_name], [Last_name], [Address], [Tel]) VALUES (2, N'Илья', N'Яцкевич', N'Александрович', N'г. Калининград, ул. Солнечный бульвар, д. 14', N'79998887766')
INSERT [dbo].[Client] ([ID], [First_name], [Surname_name], [Last_name], [Address], [Tel]) VALUES (3, N'Александр', N'Марсов', N'Максимович', N'г. Москва, ул. Волгоградский проспект, д. 13', N'79034445678')
INSERT [dbo].[Client] ([ID], [First_name], [Surname_name], [Last_name], [Address], [Tel]) VALUES (4, N'Станислав', N'Вишневский', N'Алексеевич', N'г. Санкт-Петербург, ул. Думская, д.23', N'79164291235')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment_type] ON 

INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (1, N'Стиральные машины')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (2, N'Печи СВЧ')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (3, N'Конвекционные печи')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (4, N'Газовая плита')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (5, N'Смеситель')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (6, N'Электроплита')
INSERT [dbo].[Equipment_type] ([ID], [Type_name]) VALUES (7, N'Другое')
SET IDENTITY_INSERT [dbo].[Equipment_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Issue] ON 

INSERT [dbo].[Issue] ([ID], [Description]) VALUES (1, N'Сломался электродвигатель в стиральной машине')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (10, N'Сломался чип')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (11, N'Труба дала течь')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (12, N'Сломалась трубка с охлаждением')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (13, N'Неисправна свч печь')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (14, N'Коротит проводка')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (15, N'Неисправна комфорка на газовой плите')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (16, N'тест')
INSERT [dbo].[Issue] ([ID], [Description]) VALUES (17, N'fdgdg')
SET IDENTITY_INSERT [dbo].[Issue] OFF
GO
SET IDENTITY_INSERT [dbo].[Malfunction_type] ON 

INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (1, N'Износ детали')
INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (2, N'Неисправность электрики')
INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (3, N'Неисправность электроники')
INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (4, N'Повреждение охлаждающей системы')
INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (5, N'Неисправность электродвигателя')
INSERT [dbo].[Malfunction_type] ([ID], [Type_name]) VALUES (6, N'Другое')
SET IDENTITY_INSERT [dbo].[Malfunction_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Performer] ON 

INSERT [dbo].[Performer] ([ID], [First_name], [Surname_name], [Last_name], [Tel]) VALUES (1, N'Иван', N'Иванов', N'Иванович', N'79012283344')
INSERT [dbo].[Performer] ([ID], [First_name], [Surname_name], [Last_name], [Tel]) VALUES (2, N'Максим', N'Богданов', N'Александрович', N'79034992234')
INSERT [dbo].[Performer] ([ID], [First_name], [Surname_name], [Last_name], [Tel]) VALUES (3, N'Илья', N'Шевченко', N'Алексеевич', N'79264352287')
INSERT [dbo].[Performer] ([ID], [First_name], [Surname_name], [Last_name], [Tel]) VALUES (4, N'Матвей', N'Шакалов', N'Ильдарович', N'79994562344')
SET IDENTITY_INSERT [dbo].[Performer] OFF
GO
SET IDENTITY_INSERT [dbo].[Priority_type] ON 

INSERT [dbo].[Priority_type] ([ID], [Type_name]) VALUES (1, N'Высокая')
INSERT [dbo].[Priority_type] ([ID], [Type_name]) VALUES (2, N'Средняя')
INSERT [dbo].[Priority_type] ([ID], [Type_name]) VALUES (3, N'Низкая')
SET IDENTITY_INSERT [dbo].[Priority_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ID], [Application], [Assistance], [Reason_of_malfunction], [Resources_price], [Job_price], [Repair_start_time], [Repair_finish_time], [Date]) VALUES (3, 1, 2, N'Поломка', CAST(1000.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(N'2023-10-17T12:00:00' AS SmallDateTime), CAST(N'2023-10-17T18:30:00' AS SmallDateTime), CAST(N'2023-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[Spare_part_order] ON 

INSERT [dbo].[Spare_part_order] ([ID], [Performer_ID], [Spare_part_type], [Spare_part_name], [Price], [Date]) VALUES (1, 1, N'Детали внутреннего механизма', N'Резиновые прокладки', CAST(1000.00 AS Decimal(18, 2)), CAST(N'2023-10-12' AS Date))
SET IDENTITY_INSERT [dbo].[Spare_part_order] OFF
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Appli__5165187F] FOREIGN KEY([Application_status_ID])
REFERENCES [dbo].[Application_statuses] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Appli__5165187F]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Clien__5441852A] FOREIGN KEY([Client_ID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Clien__5441852A]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Equip__4F7CD00D] FOREIGN KEY([Equipment_type_ID])
REFERENCES [dbo].[Equipment_type] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Equip__4F7CD00D]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Issue__534D60F1] FOREIGN KEY([Issue_ID])
REFERENCES [dbo].[Issue] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Issue__534D60F1]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Malfu__6E01572D] FOREIGN KEY([Malfunction_type_ID])
REFERENCES [dbo].[Malfunction_type] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Malfu__6E01572D]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Perfo__52593CB8] FOREIGN KEY([Performer_ID])
REFERENCES [dbo].[Performer] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Perfo__52593CB8]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK__Applicati__Prior__5535A963] FOREIGN KEY([Priority_type_ID])
REFERENCES [dbo].[Priority_type] ([ID])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK__Applicati__Prior__5535A963]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK__Report__Applicat__60A75C0F] FOREIGN KEY([Application])
REFERENCES [dbo].[Application] ([ID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK__Report__Applicat__60A75C0F]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK__Report__Assistan__4316F928] FOREIGN KEY([Assistance])
REFERENCES [dbo].[Assistance] ([ID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK__Report__Assistan__4316F928]
GO
ALTER TABLE [dbo].[Report_Spare_parts]  WITH CHECK ADD  CONSTRAINT [FK__Report_Sp__Repor__4AB81AF0] FOREIGN KEY([Report_ID])
REFERENCES [dbo].[Report] ([ID])
GO
ALTER TABLE [dbo].[Report_Spare_parts] CHECK CONSTRAINT [FK__Report_Sp__Repor__4AB81AF0]
GO
ALTER TABLE [dbo].[Report_Spare_parts]  WITH CHECK ADD  CONSTRAINT [FK__Report_Sp__Spare__4CA06362] FOREIGN KEY([Spare_part_ID])
REFERENCES [dbo].[Spare_part_order] ([ID])
GO
ALTER TABLE [dbo].[Report_Spare_parts] CHECK CONSTRAINT [FK__Report_Sp__Spare__4CA06362]
GO
ALTER TABLE [dbo].[Spare_part_order]  WITH CHECK ADD  CONSTRAINT [FK__Spare_par__Perfo__47DBAE45] FOREIGN KEY([Performer_ID])
REFERENCES [dbo].[Performer] ([ID])
GO
ALTER TABLE [dbo].[Spare_part_order] CHECK CONSTRAINT [FK__Spare_par__Perfo__47DBAE45]
GO
USE [master]
GO
ALTER DATABASE [Accounting_applications] SET  READ_WRITE 
GO
