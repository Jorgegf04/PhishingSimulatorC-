USE [master]
GO

/****** Object:  Database [ProyectoFinalDB]    Script Date: 30/05/2024 ******/
CREATE DATABASE [ProyectoFinalDB]
GO

ALTER DATABASE [ProyectoFinalDB] SET COMPATIBILITY_LEVEL = 160
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
    EXEC [ProyectoFinalDB].[dbo].[sp_fulltext_database] @action = 'enable'
END
GO

ALTER DATABASE [ProyectoFinalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoFinalDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinalDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoFinalDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

EXEC sys.sp_db_vardecimal_storage_format N'ProyectoFinalDB', N'ON'
GO

ALTER DATABASE [ProyectoFinalDB] SET QUERY_STORE = ON
GO

ALTER DATABASE [ProyectoFinalDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO

USE [ProyectoFinalDB]
GO

/****** Object:  Table [dbo].[Campaigns]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Campaigns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	  NOT NULL,
	  NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EmailResults]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmailResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[Opened] [bit] NOT NULL,
	[Clicked] [bit] NOT NULL,
	[OpenedDateTime] [datetime] NULL,
	[ClickedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EmailTemplates]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmailTemplates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	  NOT NULL,
	  NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsSuspicious] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PhishingReports]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PhishingReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[TotalEmailsSent] [int] NOT NULL,
	[TotalEmailsOpened] [int] NOT NULL,
	[TotalLinksClicked] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PhishingTests]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PhishingTests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsPhished] [bit] NOT NULL,
	[PhishedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Recipients]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Recipients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CampaignId] [int] NOT NULL,
	  NOT NULL,
	  NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	  NOT NULL,
	  NOT NULL,
	[IsPhished] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/05/2024 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	  NOT NULL,
	[NombreUsuario] [nvarchar](100) NOT NULL,
	  NOT NULL,
	  NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Insert data into Campaigns
SET IDENTITY_INSERT [dbo].[Campaigns] ON 
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (1, N'Campaign 1', N'Template 1', CAST(N'2024-05-23T15:52:28.153' AS DateTime), CAST(N'2024-05-30T15:52:28.153' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (2, N'Campaign 2', N'Template 2', CAST(N'2024-05-23T15:52:28.153' AS DateTime), CAST(N'2024-05-30T15:52:28.153' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (3, N'Campaign 3', N'Template 3', CAST(N'2024-05-23T15:52:28.153' AS DateTime), CAST(N'2024-05-30T15:52:28.153' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (4, N'Campaign 4', N'Template 4', CAST(N'2024-05-23T15:52:28.153' AS DateTime), CAST(N'2024-05-30T15:52:28.153' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (5, N'Campaign 5', N'Template 5', CAST(N'2024-05-23T15:52:28.153' AS DateTime), CAST(N'2024-05-30T15:52:28.153' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (6, N'Campaign 1', N'Welcome', CAST(N'2024-05-24T10:01:16.680' AS DateTime), CAST(N'2024-05-31T10:01:16.680' AS DateTime))
INSERT [dbo].[Campaigns] ([Id], [Name], [TemplateName], [StartDate], [EndDate]) VALUES (7, N'Campaign 2', N'Goodbye', CAST(N'2024-05-24T10:01:16.683' AS DateTime), CAST(N'2024-05-31T10:01:16.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[Campaigns] OFF
GO

-- Insert data into EmailResults
SET IDENTITY_INSERT [dbo].[EmailResults] ON 
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (1, 1, 1, 1, 0, CAST(N'2024-05-23T15:52:28.157' AS DateTime), NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (2, 1, 2, 0, 0, NULL, NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (3, 2, 3, 1, 1, CAST(N'2024-05-23T15:52:28.157' AS DateTime), CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (4, 2, 4, 1, 0, CAST(N'2024-05-23T15:52:28.157' AS DateTime), NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (5, 3, 5, 0, 0, NULL, NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (6, 1, 1, 1, 0, NULL, NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (7, 1, 2, 0, 1, NULL, NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (8, 2, 3, 1, 1, NULL, NULL)
INSERT [dbo].[EmailResults] ([Id], [CampaignId], [RecipientId], [Opened], [Clicked], [OpenedDateTime], [ClickedDateTime]) VALUES (9, 2, 4, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmailResults] OFF
GO

-- Insert data into EmailTemplates
SET IDENTITY_INSERT [dbo].[EmailTemplates] ON 
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Subject], [Body], [IsSuspicious]) VALUES (1, N'Welcome', N'Welcome to our service', N'Hello, welcome to our service!', 0)
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Subject], [Body], [IsSuspicious]) VALUES (2, N'Goodbye', N'Goodbye from our service', N'We''re sorry to see you go!', 0)
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Subject], [Body], [IsSuspicious]) VALUES (3, N'Reminder', N'Reminder for your upcoming event', N'Don''t forget about your event!', 0)
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Subject], [Body], [IsSuspicious]) VALUES (4, N'ThankYou', N'Thank you for your purchase', N'We appreciate your business!', 0)
INSERT [dbo].[EmailTemplates] ([Id], [Name], [Subject], [Body], [IsSuspicious]) VALUES (7, N'Goodbye', N'Goodbye from our service', N'<h1>Goodbye</h1><p>We are sorry to see you go!</p>', 0)
SET IDENTITY_INSERT [dbo].[EmailTemplates] OFF
GO

-- Insert data into PhishingReports
SET IDENTITY_INSERT [dbo].[PhishingReports] ON 
INSERT [dbo].[PhishingReports] ([Id], [CampaignId], [TotalEmailsSent], [TotalEmailsOpened], [TotalLinksClicked], [CreatedAt]) VALUES (1, 1, 100, 50, 20, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingReports] ([Id], [CampaignId], [TotalEmailsSent], [TotalEmailsOpened], [TotalLinksClicked], [CreatedAt]) VALUES (2, 2, 150, 80, 40, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingReports] ([Id], [CampaignId], [TotalEmailsSent], [TotalEmailsOpened], [TotalLinksClicked], [CreatedAt]) VALUES (3, 3, 200, 100, 50, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingReports] ([Id], [CampaignId], [TotalEmailsSent], [TotalEmailsOpened], [TotalLinksClicked], [CreatedAt]) VALUES (4, 4, 250, 120, 60, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingReports] ([Id], [CampaignId], [TotalEmailsSent], [TotalEmailsOpened], [TotalLinksClicked], [CreatedAt]) VALUES (5, 5, 300, 150, 70, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[PhishingReports] OFF
GO

-- Insert data into PhishingTests
SET IDENTITY_INSERT [dbo].[PhishingTests] ON 
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (1, 1, 1, 1, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (2, 1, 2, 0, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (3, 2, 3, 1, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (4, 2, 4, 1, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (5, 3, 5, 0, CAST(N'2024-05-23T15:52:28.157' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (6, 1, 1, 1, CAST(N'2024-05-24T10:01:39.480' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (7, 1, 2, 0, CAST(N'2024-05-24T10:01:39.480' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (8, 2, 1, 1, CAST(N'2024-05-24T10:01:39.480' AS DateTime))
INSERT [dbo].[PhishingTests] ([Id], [CampaignId], [UserId], [IsPhished], [PhishedAt]) VALUES (9, 2, 2, 0, CAST(N'2024-05-24T10:01:39.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[PhishingTests] OFF
GO

-- Insert data into Recipients
SET IDENTITY_INSERT [dbo].[Recipients] ON 
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (1, 1, N'recipient1@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (2, 1, N'recipient2@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (3, 2, N'recipient3@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (4, 2, N'recipient4@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (5, 3, N'recipient5@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (6, 1, N'test1@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (7, 1, N'test2@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (8, 2, N'test3@example.com', N'Unknown')
INSERT [dbo].[Recipients] ([Id], [CampaignId], [Email], [Name]) VALUES (9, 2, N'test4@example.com', N'Unknown')
SET IDENTITY_INSERT [dbo].[Recipients] OFF
GO

-- Insert data into Users
SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (2, N'user2@example.com', N'User Two', 1)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (3, N'user3@example.com', N'User Three', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (4, N'user4@example.com', N'User Four', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (5, N'user5@example.com', N'User Five', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (6, N'user6@example.com', N'User Six', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (7, N'user7@example.com', N'User Seven', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (8, N'user8@example.com', N'User Eight', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (9, N'user9@example.com', N'User Nine', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (10, N'user10@example.com', N'User Ten', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (11, N'user11@example.com', N'User Eleven', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (12, N'user12@example.com', N'User Twelve', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (13, N'user13@example.com', N'User Thirteen', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (14, N'user14@example.com', N'User Fourteen', 0)
INSERT [dbo].[Users] ([Id], [Email], [Name], [IsPhished]) VALUES (15, N'user15@example.com', N'User Fifteen', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

-- Insert data into Usuarios
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
INSERT [dbo].[Usuarios] ([Id], [Nombre], [NombreUsuario], [Contraseña], [Email]) VALUES (1, N'Juan Perez', N'jperez', N'password1', N'juan.perez@example.com')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [NombreUsuario], [Contraseña], [Email]) VALUES (2, N'Maria Lopez', N'mlopez', N'password2', N'maria.lopez@example.com')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [NombreUsuario], [Contraseña], [Email]) VALUES (3, N'Carlos Garcia', N'cgarcia', N'password3', N'carlos.garcia@example.com')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [NombreUsuario], [Contraseña], [Email]) VALUES (4, N'Ana Martinez', N'amartinez', N'password4', N'ana.martinez@example.com')
INSERT [dbo].[Usuarios] ([Id], [Nombre], [NombreUsuario], [Contraseña], [Email]) VALUES (5, N'Luis Rodriguez', N'lrodriguez', N'password5', N'luis.rodriguez@example.com')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO

-- Default constraints
ALTER TABLE [dbo].[Campaigns] ADD  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[EmailResults] ADD  DEFAULT ((0)) FOR [Opened]
GO
ALTER TABLE [dbo].[EmailResults] ADD  DEFAULT ((0)) FOR [Clicked]
GO
ALTER TABLE [dbo].[EmailTemplates] ADD  DEFAULT ((0)) FOR [IsSuspicious]
GO
ALTER TABLE [dbo].[PhishingReports] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[PhishingTests] ADD  DEFAULT (getdate()) FOR [PhishedAt]
GO

-- Foreign keys
ALTER TABLE [dbo].[EmailResults]  WITH CHECK ADD  CONSTRAINT [FK_EmailResults_Campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
GO
ALTER TABLE [dbo].[EmailResults] CHECK CONSTRAINT [FK_EmailResults_Campaign]
GO
ALTER TABLE [dbo].[EmailResults]  WITH CHECK ADD  CONSTRAINT [FK_EmailResults_Recipient] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[Recipients] ([Id])
GO
ALTER TABLE [dbo].[EmailResults] CHECK CONSTRAINT [FK_EmailResults_Recipient]
GO
ALTER TABLE [dbo].[PhishingReports]  WITH CHECK ADD  CONSTRAINT [FK_PhishingReports_Campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
GO
ALTER TABLE [dbo].[PhishingReports] CHECK CONSTRAINT [FK_PhishingReports_Campaign]
GO
ALTER TABLE [dbo].[PhishingTests]  WITH CHECK ADD  CONSTRAINT [FK_PhishingTests_Campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
GO
ALTER TABLE [dbo].[PhishingTests] CHECK CONSTRAINT [FK_PhishingTests_Campaign]
GO
ALTER TABLE [dbo].[PhishingTests]  WITH CHECK ADD  CONSTRAINT [FK_PhishingTests_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[PhishingTests] CHECK CONSTRAINT [FK_PhishingTests_User]
GO
ALTER TABLE [dbo].[Recipients]  WITH CHECK ADD  CONSTRAINT [FK_Recipients_Campaign] FOREIGN KEY([CampaignId])
REFERENCES [dbo].[Campaigns] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recipients] CHECK CONSTRAINT [FK_Recipients_Campaign]
GO

USE [master]
GO
ALTER DATABASE [ProyectoFinalDB] SET  READ_WRITE 
