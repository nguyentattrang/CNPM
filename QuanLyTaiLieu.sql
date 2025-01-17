
USE [QuanLyTaiLieuSV]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Class] [nvarchar](50) NULL,
	[StudentCode] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
	[LastLogin] [datetime2](7) NULL,
	[IsActive] [bit] NULL,
	[RoleID] [int] NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminMenu]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminMenu](
	[AdminMenuID] [bigint] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemLevel] [int] NULL,
	[ParentLevel] [int] NULL,
	[ItemOrder] [int] NULL,
	[IsActive] [bit] NULL,
	[ItemTarget] [nvarchar](50) NULL,
	[AreaName] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[IdName] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdminMenu] PRIMARY KEY CLUSTERED 
(
	[AdminMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Detail] [nvarchar](4000) NULL,
	[Image] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogComment]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogComment](
	[BlogCommentID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NULL,
	[AccountID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[Detail] [nvarchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_BlogComment] PRIMARY KEY CLUSTERED 
(
	[BlogCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[Levels] [int] NULL,
	[ParentID] [int] NULL,
	[Link] [nvarchar](50) NULL,
	[MenuOrder] [int] NULL,
	[Position] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19/10/2024 5:10:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminMenu] ON 

INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (1, N'Quản lý Menu', 1, 0, 1, 1, N'forms-nav', N'Admin', N'Home', N'Index', N'bi bi-journal', N'forms-nav')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (2, N'Danh sách Menu', 2, 1, 1, 1, NULL, N'Admin', N'Menu', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (3, N'Quản lý bài viết', 1, 0, 1, 1, N'forms-nav', N'Admin', N'Blogs', N'Index', N'bi bi-journal', N'forms-nav')
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (4, N'Danh sách bài viết', 2, 3, 1, 1, NULL, N'Admin', N'Blogs', N'Index', NULL, NULL)
INSERT [dbo].[AdminMenu] ([AdminMenuID], [ItemName], [ItemLevel], [ParentLevel], [ItemOrder], [IsActive], [ItemTarget], [AreaName], [ControllerName], [ActionName], [Icon], [IdName]) VALUES (5, N'Danh sách menu admin', 2, 1, 2, 1, NULL, N'Admin', N'AdminMenus', N'Index', NULL, NULL)
SET IDENTITY_INSERT [dbo].[AdminMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [IsActive], [AccountID]) VALUES (1, N'Thông báo bảo trì', N'dai-hoc-vinh', N'Bảo trì định kì', N'Bảo trì nâng cấp hệ thống', N'/files/Picture1.png', NULL, NULL, 1, NULL)
INSERT [dbo].[Blog] ([BlogID], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [IsActive], [AccountID]) VALUES (4, N'Đại học vinh', N'dai-hoc-vinh', N'Bảo trì định kì', N'Thông báo bảo trì', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Blog] ([BlogID], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [IsActive], [AccountID]) VALUES (6, N'Đại học vinh3', N'dai-hoc-vinh', N'Bảo trì định kì', N'<p>Thông báo bảo trì</p>', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Blog] ([BlogID], [Title], [Alias], [Description], [Detail], [Image], [CreatedDate], [CreatedBy], [IsActive], [AccountID]) VALUES (8, N'Đại học vinh5', N'dai-hoc-vinh', N'Bảo trì định kì', N'<p>Nâng cấp hệ thống</p>', NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (1, N'Trang chủ', 1, NULL, NULL, 1, 0, N'Home/Index', 1, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (2, N'Trang cá nhân', 1, NULL, NULL, 1, 0, NULL, 2, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (3, N'Khóa học', 1, NULL, NULL, 1, 0, NULL, 3, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (4, N'Quản lý tài liệu', 1, NULL, NULL, 1, 0, NULL, 4, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (5, N'Giới thiệu', 1, NULL, NULL, 1, 0, NULL, 5, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (6, N'Hỗ trợ và liên hệ', 1, NULL, NULL, 1, 0, NULL, 6, 1)
INSERT [dbo].[Menu] ([MenuID], [MenuName], [IsActive], [ControllerName], [ActionName], [Levels], [ParentID], [Link], [MenuOrder], [Position]) VALUES (8, N'Thông báo', 1, NULL, NULL, 2, 6, N'Blog/Index', 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
