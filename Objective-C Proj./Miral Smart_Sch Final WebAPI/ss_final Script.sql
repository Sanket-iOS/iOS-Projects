USE [Smart_Scheduler]
GO
/****** Object:  Table [dbo].[timetableinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[timetableinformation](
	[rowid] [int] NOT NULL,
	[Tid] [varchar](max) NULL,
	[Dayid] [varchar](max) NULL,
	[SUBid] [varchar](10) NULL,
	[time] [varchar](15) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[timetableinformation] ([rowid], [Tid], [Dayid], [SUBid], [time]) VALUES (1, N'8001mon', N'mon', N'800101', N'09:30-10:30')
INSERT [dbo].[timetableinformation] ([rowid], [Tid], [Dayid], [SUBid], [time]) VALUES (2, N'8001mon', N'mon', N'800102', N'10:30-11:30')
/****** Object:  Table [dbo].[subjectinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subjectinformation](
	[rowid] [int] NOT NULL,
	[SUBid] [varchar](10) NULL,
	[SBid] [varchar](max) NULL,
	[subject] [varchar](max) NULL,
	[syallabus] [varchar](max) NULL,
 CONSTRAINT [PK_subjectinformation_1] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[subjectinformation] ([rowid], [SUBid], [SBid], [subject], [syallabus]) VALUES (1, N'800101', N'8001', N'Parallel Processsing', N'parallel processing.pdf')
INSERT [dbo].[subjectinformation] ([rowid], [SUBid], [SBid], [subject], [syallabus]) VALUES (2, N'800102', N'8001', N'Distributed system', N'distributed system.pdf')
INSERT [dbo].[subjectinformation] ([rowid], [SUBid], [SBid], [subject], [syallabus]) VALUES (3, N'800103', N'8001', N'Advance computer networking', N'advance computer networking.pdf')
/****** Object:  Table [dbo].[resultinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[resultinformation](
	[rowid] [int] NOT NULL,
	[Enno] [varchar](12) NOT NULL,
	[SUBid] [varchar](10) NOT NULL,
	[marks] [varchar](3) NOT NULL,
 CONSTRAINT [PK_resultinformation] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[resultinformation] ([rowid], [Enno], [SUBid], [marks]) VALUES (1, N'110001001', N'800101', N'50')
INSERT [dbo].[resultinformation] ([rowid], [Enno], [SUBid], [marks]) VALUES (2, N'110001001', N'800102', N'48')
INSERT [dbo].[resultinformation] ([rowid], [Enno], [SUBid], [marks]) VALUES (3, N'110001001', N'8001003', N'45')
/****** Object:  Table [dbo].[profileinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[profileinformation](
	[rowid] [int] NOT NULL,
	[Enno] [varchar](12) NULL,
	[name] [varchar](max) NULL,
	[semester] [varchar](2) NULL,
	[branch] [varchar](max) NULL,
	[mobile] [varchar](10) NULL,
	[Emailid] [varchar](max) NULL,
	[password] [varchar](15) NULL,
 CONSTRAINT [PK_profileinformation_1] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[profileinformation] ([rowid], [Enno], [name], [semester], [branch], [mobile], [Emailid], [password]) VALUES (1, N'110001001', N'Miral Parmar', N'8', N'Computer engineering', N'121321311', N'parmar_miral@ymail.com', N'110001001')
INSERT [dbo].[profileinformation] ([rowid], [Enno], [name], [semester], [branch], [mobile], [Emailid], [password]) VALUES (2, N'110002001', N'Madhuri kulkarni', N'8', N'Bio-medical engineering', N'9977885544', N'kingi@gmail.com', N'110002001')
/****** Object:  Table [dbo].[placementinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[placementinformation](
	[rowid] [int] NOT NULL,
	[SBid] [varchar](max) NULL,
	[notes] [varchar](max) NULL,
	[Placement_title] [varchar](max) NULL,
	[date] [varchar](15) NULL,
 CONSTRAINT [PK_placementinformation_1] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[placementinformation] ([rowid], [SBid], [notes], [Placement_title], [date]) VALUES (1, N'8001', N'L&T campus placement on 14th jan', N'L&T placement', N'12/03/2015')
INSERT [dbo].[placementinformation] ([rowid], [SBid], [notes], [Placement_title], [date]) VALUES (2, N'8002', N'parul institue placement on 25th april . selected student will reporting on 8 am ', N'Parul campus', N'02/04/2015')
/****** Object:  Table [dbo].[noticeinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[noticeinformation](
	[rowid] [int] NOT NULL,
	[Noticeid] [varchar](max) NULL,
	[SBid] [varchar](max) NULL,
	[noticetitle] [varchar](max) NULL,
	[noticedetails] [varchar](max) NULL,
	[date] [varchar](15) NULL,
 CONSTRAINT [PK_noticeinformation] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[noticeinformation] ([rowid], [Noticeid], [SBid], [noticetitle], [noticedetails], [date]) VALUES (1, N'1', N'0000', N'techfest', N'gecg campus technical event at 25th march', N'20/03/2015')
INSERT [dbo].[noticeinformation] ([rowid], [Noticeid], [SBid], [noticetitle], [noticedetails], [date]) VALUES (2, N'2', N'8001', N'submission', N'on 25th april ACDN submission', N'15/04/2015')
/****** Object:  Table [dbo].[notesinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notesinformation](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[Enno] [varchar](12) NOT NULL,
	[Title] [varchar](max) NULL,
	[notes] [varchar](max) NULL,
	[date] [varchar](15) NOT NULL,
 CONSTRAINT [PK_notesinformation] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[notesinformation] ON
INSERT [dbo].[notesinformation] ([rowid], [Enno], [Title], [notes], [date]) VALUES (1, N'110001001', N'exam date', N'tommorow PP exam', N'12/03/2015')
INSERT [dbo].[notesinformation] ([rowid], [Enno], [Title], [notes], [date]) VALUES (2, N'120003002', N'technical event', N'16 april technical festival at gecg', N'13/04/2015')
INSERT [dbo].[notesinformation] ([rowid], [Enno], [Title], [notes], [date]) VALUES (5, N'12120000', N'chem', N'notes', N'13-Apr-15')
SET IDENTITY_INSERT [dbo].[notesinformation] OFF
/****** Object:  Table [dbo].[holidayinformation]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[holidayinformation](
	[serial] [int] NOT NULL,
	[holiday] [varchar](max) NULL,
	[date] [varchar](15) NULL,
	[day] [varchar](max) NULL,
 CONSTRAINT [PK_holidayinformation] PRIMARY KEY CLUSTERED 
(
	[serial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[holidayinformation] ([serial], [holiday], [date], [day]) VALUES (1, N'Makarsankarti', N'14/01/2015', N'WEDNESDAY')
INSERT [dbo].[holidayinformation] ([serial], [holiday], [date], [day]) VALUES (2, N'Merry Chrishmas', N'25/12/2015', N'Friday')
/****** Object:  Table [dbo].[branchID]    Script Date: 04/13/2015 16:10:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[branchID](
	[rowid] [int] NOT NULL,
	[bname] [varchar](max) NOT NULL,
	[id] [varchar](3) NOT NULL,
 CONSTRAINT [PK_branchID] PRIMARY KEY CLUSTERED 
(
	[rowid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[branchID] ([rowid], [bname], [id]) VALUES (1, N'Computer Engineering', N'001')
INSERT [dbo].[branchID] ([rowid], [bname], [id]) VALUES (2, N'Bio-medical Engineering', N'002')
