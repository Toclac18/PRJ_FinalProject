USE master
-- Check if the database exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Project')
BEGIN
    -- Set database to single user mode
    ALTER DATABASE Project SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    
    -- Drop the existing database
    DROP DATABASE Project;
END

-- Create a new database named "Project"
CREATE DATABASE Project;

USE Project
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[sesid] [int] NOT NULL,
	[stuid] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[att_datetime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[sup_iis] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_Student]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_Student](
	[stuid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Group_Student] PRIMARY KEY CLUSTERED 
(
	[stuid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[iid] [int] NOT NULL,
	[iname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[iid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomid] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] IDENTITY(1,1) NOT NULL,
	[gid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [varchar](150) NOT NULL,
	[iid] [int] NOT NULL,
	[isAtt] [bit] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stuid] [int] NOT NULL,
	[stuname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/5/2024 1:23:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [nvarchar](250) NOT NULL,
	[password] [nvarchar](250) NOT NULL,
	[displayName] [nvarchar](250) NOT NULL,
	[iid] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (1, 1, 1, N'nothing', CAST(N'2024-11-04T23:08:31.693' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (1, 2, 1, N'nothing', CAST(N'2024-11-04T23:08:31.697' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (1, 3, 1, N'nothing', CAST(N'2024-11-04T23:08:31.697' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (2, 1, 1, N'A', CAST(N'2024-11-04T22:37:12.393' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (2, 2, 0, N'B', CAST(N'2024-11-04T22:37:12.393' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (2, 3, 1, N'C', CAST(N'2024-11-04T22:37:12.393' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (3, 1, 1, N'XX', CAST(N'2024-10-25T03:03:27.910' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (3, 2, 0, N'XX', CAST(N'2024-10-25T03:03:27.910' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (3, 3, 0, N'XXX', CAST(N'2024-10-25T03:03:27.910' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (4, 1, 1, N'', CAST(N'2024-11-01T22:44:41.767' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (4, 4, 1, N'', CAST(N'2024-11-01T22:44:41.767' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (4, 5, 1, N'', CAST(N'2024-11-01T22:44:41.767' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (5, 1, 1, N'', CAST(N'2024-11-04T23:50:34.507' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (5, 4, 1, N'', CAST(N'2024-11-04T23:50:34.510' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (5, 5, 1, N'', CAST(N'2024-11-04T23:50:34.510' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (6, 1, 1, N'', CAST(N'2024-11-05T00:43:14.597' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (6, 2, 1, N'', CAST(N'2024-11-05T00:43:14.600' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (6, 3, 0, N'', CAST(N'2024-11-05T00:43:14.600' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (7, 1, 1, N'', CAST(N'2024-11-05T00:43:22.653' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (7, 2, 1, N'', CAST(N'2024-11-05T00:43:22.653' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (7, 3, 1, N'', CAST(N'2024-11-05T00:43:22.653' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (8, 1, 1, N'no', CAST(N'2024-11-05T00:42:49.410' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (8, 2, 1, N'no', CAST(N'2024-11-05T00:42:49.413' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (8, 3, 0, N'', CAST(N'2024-11-05T00:42:49.413' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (9, 1, 1, N'no', CAST(N'2024-11-05T00:46:04.853' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (9, 2, 1, N'no', CAST(N'2024-11-05T00:46:04.857' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (9, 3, 0, N'no', CAST(N'2024-11-05T00:46:04.857' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (13, 1, 1, N'', CAST(N'2024-11-05T00:44:07.360' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (13, 4, 0, N'', CAST(N'2024-11-05T00:44:07.360' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (13, 5, 1, N'', CAST(N'2024-11-05T00:44:07.360' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (14, 1, 1, N'', CAST(N'2024-11-05T00:44:21.167' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (14, 4, 1, N'', CAST(N'2024-11-05T00:44:21.167' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (14, 5, 0, N'', CAST(N'2024-11-05T00:44:21.167' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (15, 1, 1, N'', CAST(N'2024-11-05T00:43:58.280' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (15, 4, 1, N'', CAST(N'2024-11-05T00:43:58.280' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (15, 5, 0, N'', CAST(N'2024-11-05T00:43:58.280' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (16, 1, 1, N'', CAST(N'2024-11-05T00:44:01.897' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (16, 4, 1, N'', CAST(N'2024-11-05T00:44:01.897' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (16, 5, 0, N'', CAST(N'2024-11-05T00:44:01.897' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 6, 1, N'', CAST(N'2024-11-05T00:32:50.707' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 7, 1, N'', CAST(N'2024-11-05T00:32:50.707' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 8, 1, N'', CAST(N'2024-11-05T00:32:50.707' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 9, 1, N'', CAST(N'2024-11-05T00:32:50.707' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 10, 1, N'', CAST(N'2024-11-05T00:32:50.710' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 11, 1, N'', CAST(N'2024-11-05T00:32:50.710' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (22, 12, 1, N'', CAST(N'2024-11-05T00:32:50.710' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 6, 1, N'', CAST(N'2024-11-05T00:33:02.417' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 7, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 8, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 9, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 10, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 11, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (23, 12, 1, N'', CAST(N'2024-11-05T00:33:02.420' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 6, 1, N'', CAST(N'2024-11-05T00:33:13.790' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 7, 1, N'', CAST(N'2024-11-05T00:33:13.790' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 8, 1, N'', CAST(N'2024-11-05T00:33:13.790' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 9, 1, N'', CAST(N'2024-11-05T00:33:13.790' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 10, 1, N'', CAST(N'2024-11-05T00:33:13.790' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 11, 1, N'', CAST(N'2024-11-05T00:33:13.793' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (24, 12, 1, N'', CAST(N'2024-11-05T00:33:13.793' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 6, 1, N'', CAST(N'2024-11-05T00:43:17.033' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 7, 1, N'', CAST(N'2024-11-05T00:43:17.033' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 8, 1, N'', CAST(N'2024-11-05T00:43:17.037' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 9, 1, N'', CAST(N'2024-11-05T00:43:17.037' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 10, 1, N'', CAST(N'2024-11-05T00:43:17.037' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 11, 1, N'', CAST(N'2024-11-05T00:43:17.037' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (25, 12, 0, N'', CAST(N'2024-11-05T00:43:17.037' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 6, 1, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 7, 1, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 8, 1, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 9, 1, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 10, 1, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 11, 0, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (26, 12, 0, N'', CAST(N'2024-11-05T00:43:20.277' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 6, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 7, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 8, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 9, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 10, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 11, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (27, 12, 1, N'', CAST(N'2024-11-05T00:45:53.840' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 6, 1, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 7, 1, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 8, 0, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 9, 1, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 10, 1, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 11, 0, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (28, 12, 0, N'', CAST(N'2024-11-05T00:45:28.550' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 13, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 14, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 15, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 16, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 17, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 18, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 19, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (32, 20, 1, N'', CAST(N'2024-11-05T00:50:40.343' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 13, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 14, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 15, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 16, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
GO
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 17, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 18, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 19, 1, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (33, 20, 0, N'', CAST(N'2024-11-05T00:50:49.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 13, 1, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 14, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 15, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 16, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 17, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 18, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 19, 0, N'', CAST(N'2024-11-05T00:51:08.487' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (34, 20, 0, N'', CAST(N'2024-11-05T00:51:08.490' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 13, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 14, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 15, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 16, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 17, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 18, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 19, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (35, 20, 1, N'', CAST(N'2024-11-05T00:51:04.210' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 13, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 14, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 15, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 16, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 17, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 18, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 19, 1, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (36, 20, 0, N'', CAST(N'2024-11-05T00:44:57.943' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 13, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 14, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 15, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 16, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 17, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 18, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 19, 1, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (37, 20, 0, N'', CAST(N'2024-11-05T00:43:55.423' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 20, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 21, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 22, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 23, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 24, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 25, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (43, 26, 1, N'', CAST(N'2024-11-05T01:06:23.087' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 20, 1, N'', CAST(N'2024-11-05T01:06:31.190' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 21, 1, N'', CAST(N'2024-11-05T01:06:31.190' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 22, 1, N'', CAST(N'2024-11-05T01:06:31.193' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 23, 1, N'', CAST(N'2024-11-05T01:06:31.193' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 24, 1, N'', CAST(N'2024-11-05T01:06:31.193' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 25, 1, N'', CAST(N'2024-11-05T01:06:31.193' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (44, 26, 1, N'', CAST(N'2024-11-05T01:06:31.193' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 20, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 21, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 22, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 23, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 24, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 25, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (45, 26, 1, N'', CAST(N'2024-11-05T01:06:37.723' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 20, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 21, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 22, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 23, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 24, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 25, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (46, 26, 1, N'', CAST(N'2024-11-05T01:07:02.543' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 20, 1, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 21, 1, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 22, 1, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 23, 0, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 24, 0, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 25, 0, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (47, 26, 1, N'', CAST(N'2024-11-05T01:07:09.503' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 20, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 21, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 22, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 23, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 24, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 25, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (48, 26, 1, N'', CAST(N'2024-11-05T01:07:33.320' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 20, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 21, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 22, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 23, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 24, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 25, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (49, 26, 1, N'', CAST(N'2024-11-05T01:07:41.700' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (53, 1, 1, N'', CAST(N'2024-11-05T01:06:00.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (53, 2, 1, N'', CAST(N'2024-11-05T01:06:00.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (53, 3, 1, N'', CAST(N'2024-11-05T01:06:00.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (53, 4, 1, N'', CAST(N'2024-11-05T01:06:00.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (53, 5, 1, N'', CAST(N'2024-11-05T01:06:00.940' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (54, 1, 1, N'', CAST(N'2024-11-05T01:06:06.297' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (54, 2, 1, N'', CAST(N'2024-11-05T01:06:06.300' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (54, 3, 1, N'', CAST(N'2024-11-05T01:06:06.300' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (54, 4, 1, N'', CAST(N'2024-11-05T01:06:06.300' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (54, 5, 1, N'', CAST(N'2024-11-05T01:06:06.300' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (55, 1, 1, N'', CAST(N'2024-11-05T01:06:14.333' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (55, 2, 1, N'', CAST(N'2024-11-05T01:06:14.333' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (55, 3, 1, N'', CAST(N'2024-11-05T01:06:14.333' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (55, 4, 1, N'', CAST(N'2024-11-05T01:06:14.333' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (55, 5, 1, N'', CAST(N'2024-11-05T01:06:14.333' AS DateTime))
GO
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (56, 1, 1, N'', CAST(N'2024-11-05T01:06:48.207' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (56, 2, 1, N'', CAST(N'2024-11-05T01:06:48.207' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (56, 3, 1, N'', CAST(N'2024-11-05T01:06:48.207' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (56, 4, 1, N'', CAST(N'2024-11-05T01:06:48.207' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (56, 5, 0, N'', CAST(N'2024-11-05T01:06:48.207' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (57, 1, 1, N'', CAST(N'2024-11-05T01:06:54.810' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (57, 2, 1, N'', CAST(N'2024-11-05T01:06:54.810' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (57, 3, 1, N'', CAST(N'2024-11-05T01:06:54.810' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (57, 4, 0, N'', CAST(N'2024-11-05T01:06:54.810' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (57, 5, 1, N'', CAST(N'2024-11-05T01:06:54.810' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (58, 1, 1, N'', CAST(N'2024-11-05T01:07:19.460' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (58, 2, 1, N'', CAST(N'2024-11-05T01:07:19.460' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (58, 3, 1, N'', CAST(N'2024-11-05T01:07:19.460' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (58, 4, 1, N'', CAST(N'2024-11-05T01:07:19.460' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (58, 5, 0, N'', CAST(N'2024-11-05T01:07:19.460' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (59, 1, 1, N'', CAST(N'2024-11-05T01:07:25.467' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (59, 2, 1, N'', CAST(N'2024-11-05T01:07:25.467' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (59, 3, 1, N'', CAST(N'2024-11-05T01:07:25.467' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (59, 4, 1, N'', CAST(N'2024-11-05T01:07:25.467' AS DateTime))
INSERT [dbo].[Attendance] ([sesid], [stuid], [status], [description], [att_datetime]) VALUES (59, 5, 1, N'', CAST(N'2024-11-05T01:07:25.467' AS DateTime))
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (1, N'SE001', 1, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (2, N'SE002', 2, 2)
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (3, N'SE003', 3, 1)
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (4, N'SE004', 3, 2)
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (5, N'SE005', 2, 3)
INSERT [dbo].[Group] ([gid], [gname], [subid], [sup_iis]) VALUES (6, N'SE001', 2, 3)
GO
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (1, 1)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (1, 2)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (1, 6)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (2, 1)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (2, 6)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (3, 1)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (3, 6)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (4, 2)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (4, 6)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (5, 2)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (5, 6)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (6, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (7, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (8, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (9, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (10, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (11, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (12, 3)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (13, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (14, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (15, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (16, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (17, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (18, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (19, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (20, 4)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (20, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (21, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (22, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (23, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (24, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (25, 5)
INSERT [dbo].[Group_Student] ([stuid], [gid]) VALUES (26, 5)
GO
INSERT [dbo].[Instructor] ([iid], [iname]) VALUES (1, N'caupd')
INSERT [dbo].[Instructor] ([iid], [iname]) VALUES (2, N'nguyetnt')
INSERT [dbo].[Instructor] ([iid], [iname]) VALUES (3, N'tuanvm')
GO
INSERT [dbo].[Room] ([roomid]) VALUES (N'D101')
INSERT [dbo].[Room] ([roomid]) VALUES (N'D102')
INSERT [dbo].[Room] ([roomid]) VALUES (N'D103')
INSERT [dbo].[Room] ([roomid]) VALUES (N'D201')
INSERT [dbo].[Room] ([roomid]) VALUES (N'D202')
INSERT [dbo].[Room] ([roomid]) VALUES (N'D203')
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (1, 1, 1, CAST(N'2024-10-18' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (2, 1, 2, CAST(N'2024-10-19' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (3, 1, 3, CAST(N'2024-10-20' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (4, 2, 1, CAST(N'2024-10-18' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (5, 2, 2, CAST(N'2024-10-19' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (6, 1, 4, CAST(N'2024-10-25' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (7, 1, 5, CAST(N'2024-10-26' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (8, 1, 6, CAST(N'2024-11-01' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (9, 1, 7, CAST(N'2024-11-02' AS Date), 1, N'D101', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (10, 1, 8, CAST(N'2024-11-08' AS Date), 1, N'D101', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (11, 1, 9, CAST(N'2024-11-09' AS Date), 1, N'D101', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (12, 1, 10, CAST(N'2024-11-10' AS Date), 1, N'D101', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (13, 2, 3, CAST(N'2024-10-25' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (14, 2, 4, CAST(N'2024-10-26' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (15, 2, 5, CAST(N'2024-11-01' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (16, 2, 6, CAST(N'2024-11-02' AS Date), 2, N'D101', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (17, 2, 7, CAST(N'2024-11-07' AS Date), 2, N'D101', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (18, 2, 8, CAST(N'2024-11-08' AS Date), 2, N'D101', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (19, 2, 9, CAST(N'2024-11-15' AS Date), 2, N'D101', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (20, 2, 10, CAST(N'2024-11-16' AS Date), 2, N'D101', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (22, 3, 1, CAST(N'2024-10-18' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (23, 3, 2, CAST(N'2024-10-19' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (24, 3, 3, CAST(N'2024-10-20' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (25, 3, 4, CAST(N'2024-10-25' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (26, 3, 5, CAST(N'2024-10-26' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (27, 3, 6, CAST(N'2024-11-01' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (28, 3, 7, CAST(N'2024-11-02' AS Date), 3, N'D201', 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (29, 3, 8, CAST(N'2024-11-08' AS Date), 3, N'D201', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (30, 3, 9, CAST(N'2024-11-09' AS Date), 3, N'D201', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (31, 3, 10, CAST(N'2024-11-10' AS Date), 3, N'D201', 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (32, 4, 1, CAST(N'2024-10-18' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (33, 4, 2, CAST(N'2024-10-19' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (34, 4, 3, CAST(N'2024-10-25' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (35, 4, 4, CAST(N'2024-10-26' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (36, 4, 5, CAST(N'2024-11-01' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (37, 4, 6, CAST(N'2024-11-02' AS Date), 3, N'D202', 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (38, 4, 7, CAST(N'2024-11-07' AS Date), 3, N'D202', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (39, 4, 8, CAST(N'2024-11-08' AS Date), 3, N'D202', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (40, 4, 9, CAST(N'2024-11-15' AS Date), 3, N'D202', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (42, 4, 10, CAST(N'2024-11-16' AS Date), 3, N'D202', 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (43, 5, 1, CAST(N'2024-10-18' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (44, 5, 2, CAST(N'2024-10-19' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (45, 5, 3, CAST(N'2024-10-20' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (46, 5, 4, CAST(N'2024-10-25' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (47, 5, 5, CAST(N'2024-10-26' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (48, 5, 6, CAST(N'2024-11-01' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (49, 5, 7, CAST(N'2024-11-02' AS Date), 4, N'D103', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (50, 5, 8, CAST(N'2024-11-08' AS Date), 4, N'D103', 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (51, 5, 9, CAST(N'2024-11-09' AS Date), 4, N'D103', 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (52, 5, 10, CAST(N'2024-11-10' AS Date), 4, N'D103', 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (53, 6, 1, CAST(N'2024-10-18' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (54, 6, 2, CAST(N'2024-10-19' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (55, 6, 3, CAST(N'2024-10-20' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (56, 6, 4, CAST(N'2024-10-25' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (57, 6, 5, CAST(N'2024-10-26' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (58, 6, 6, CAST(N'2024-11-01' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (59, 6, 7, CAST(N'2024-11-02' AS Date), 3, N'D203', 3, 1)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (60, 6, 8, CAST(N'2024-11-08' AS Date), 3, N'D203', 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (61, 6, 9, CAST(N'2024-11-09' AS Date), 3, N'D203', 3, 0)
INSERT [dbo].[Session] ([sesid], [gid], [index], [date], [tid], [rid], [iid], [isAtt]) VALUES (62, 6, 10, CAST(N'2024-11-10' AS Date), 3, N'D203', 3, 0)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (1, N'Mr A')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (2, N'Mr B')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (3, N'Mr C')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (4, N'Mr D')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (5, N'Mr E')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (6, N'QQQ')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (7, N'WWW')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (8, N'EEE')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (9, N'RRR')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (10, N'TTT')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (11, N'YYY')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (12, N'UUU')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (13, N'III')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (14, N'OOO')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (15, N'PPP')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (16, N'AAA')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (17, N'SSS')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (18, N'DDD')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (19, N'FFF')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (20, N'GGG')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (21, N'HHH')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (22, N'JJJ')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (23, N'KKK')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (24, N'LLL')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (25, N'ZZZ')
INSERT [dbo].[Student] ([stuid], [stuname]) VALUES (26, N'BBB')
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'CSD201')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'DBI202')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7h30 - 9h50')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'10h - 12h20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'12h50 - 15h10')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'15h20 - 17h40')
GO
INSERT [dbo].[User] ([username], [password], [displayName], [iid]) VALUES (N'quangvh123', N'123', N'Vu Hong Quang', 2)
INSERT [dbo].[User] ([username], [password], [displayName], [iid]) VALUES (N'phuclh123', N'123', N'Le Hong Phuc', 3)
INSERT [dbo].[User] ([username], [password], [displayName], [iid]) VALUES (N'quannt123', N'123', N'Nguyen Tat Quan', 1)
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Session]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Student] FOREIGN KEY([stuid])
REFERENCES [dbo].[Student] ([stuid])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Instructor] FOREIGN KEY([sup_iis])
REFERENCES [dbo].[Instructor] ([iid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Instructor]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Group]
GO
ALTER TABLE [dbo].[Group_Student]  WITH CHECK ADD  CONSTRAINT [FK_Group_Student_Student] FOREIGN KEY([stuid])
REFERENCES [dbo].[Student] ([stuid])
GO
ALTER TABLE [dbo].[Group_Student] CHECK CONSTRAINT [FK_Group_Student_Student]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Instructor] FOREIGN KEY([iid])
REFERENCES [dbo].[Instructor] ([iid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Instructor]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([roomid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Instructor] FOREIGN KEY([iid])
REFERENCES [dbo].[Instructor] ([iid])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Instructor]
GO
