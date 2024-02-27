CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[RegistrationDate] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[HikingTrails](
	[TrailID] [int] NOT NULL,
	[MountainID] [int] NULL,
	[TrailName] [nvarchar](max) NULL,
	[DifficultyLevel] [int] NULL,
	[Length] [nvarchar](max) NULL,
 CONSTRAINT [PK_HikingTrails] PRIMARY KEY CLUSTERED 
(
	[TrailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[HikingTrails]  WITH CHECK ADD  CONSTRAINT [FK_HikingTrails_Mountain] FOREIGN KEY([MountainID])
REFERENCES [dbo].[Mountain] ([MountainID])
GO

ALTER TABLE [dbo].[HikingTrails] CHECK CONSTRAINT [FK_HikingTrails_Mountain]
GO



CREATE TABLE [dbo].[Mountain](
	[MountainID] [int] NOT NULL,
	[MountainName] [nvarchar](max) NULL,
	[StreetLine] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Elevation] [nvarchar](max) NULL,
	[MountainRatings] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mountain] PRIMARY KEY CLUSTERED 
(
	[MountainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




CREATE TABLE [dbo].[MountainRating](
	[MountainRatingID] [int] NOT NULL,
	[MountainID] [int] NULL,
	[UserID] [int] NULL,
	[Rating] [int] NULL,
	[DatedRated] [date] NULL,
 CONSTRAINT [PK_MountainRating] PRIMARY KEY CLUSTERED 
(
	[MountainRatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MountainRating]  WITH CHECK ADD  CONSTRAINT [FK_MountainRating_Mountain] FOREIGN KEY([MountainID])
REFERENCES [dbo].[Mountain] ([MountainID])
GO

ALTER TABLE [dbo].[MountainRating] CHECK CONSTRAINT [FK_MountainRating_Mountain]
GO

ALTER TABLE [dbo].[MountainRating]  WITH CHECK ADD  CONSTRAINT [FK_MountainRating_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO

ALTER TABLE [dbo].[MountainRating] CHECK CONSTRAINT [FK_MountainRating_User]
GO



REATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Amount] [money] NOT NULL,
	[PaymentDate] [date] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO

ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO




CREATE TABLE [dbo].[WeatherHistory](
	[WeatherHistoryID] [nvarchar](50) NOT NULL,
	[WeatherHistoryMonth] [nvarchar](50) NULL,
	[WeatherHistoryAvgTemp] [nvarchar](50) NULL,
	[MountainID] [int] NULL,
	[WeatherHisotryAvgRainfall] [nvarchar](max) NULL,
 CONSTRAINT [PK_WeatherHistory] PRIMARY KEY CLUSTERED 
(
	[WeatherHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[WeatherHistory]  WITH CHECK ADD  CONSTRAINT [FK_WeatherHistory_Mountain] FOREIGN KEY([MountainID])
REFERENCES [dbo].[Mountain] ([MountainID])
GO

ALTER TABLE [dbo].[WeatherHistory] CHECK CONSTRAINT [FK_WeatherHistory_Mountain]
GO