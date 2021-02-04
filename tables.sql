USE [bookmaker]
GO

/****** Object:  Table [dbo].[balance_history]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[balance_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[balance] [money] NOT NULL,
	[timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_balance_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[bets]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[bets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
	[ammount] [money] NOT NULL,
	[team_id] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[withdrawn] [bit] NOT NULL,
 CONSTRAINT [PK_bets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[games]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[games](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
 CONSTRAINT [PK_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[goals]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[goals](
	[id] [int] NOT NULL,
	[time] [datetime] NOT NULL,
	[team_id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
 CONSTRAINT [PK_goals] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[odds]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[odds](
	[id] [int] NOT NULL,
	[game_id] [int] NOT NULL,
	[team_id] [int] NOT NULL,
	[value] [float] NOT NULL,
 CONSTRAINT [PK_odds] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[sports]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sports](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_sports] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[teams]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[teams](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_teams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[teams_games]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[teams_games](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[game_id] [int] NOT NULL,
	[team_id] [int] NOT NULL,
	[is_home] [bit] NOT NULL,
 CONSTRAINT [PK_teams_games] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[users]    Script Date: 04.02.2021 14:42:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[login] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[balance] [money] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[balance_history]  WITH CHECK ADD  CONSTRAINT [FK_balance_history_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[balance_history] CHECK CONSTRAINT [FK_balance_history_users]
GO

ALTER TABLE [dbo].[bets]  WITH CHECK ADD  CONSTRAINT [FK_bets_games] FOREIGN KEY([game_id])
REFERENCES [dbo].[games] ([id])
GO

ALTER TABLE [dbo].[bets] CHECK CONSTRAINT [FK_bets_games]
GO

ALTER TABLE [dbo].[bets]  WITH CHECK ADD  CONSTRAINT [FK_bets_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([id])
GO

ALTER TABLE [dbo].[bets] CHECK CONSTRAINT [FK_bets_teams]
GO

ALTER TABLE [dbo].[bets]  WITH CHECK ADD  CONSTRAINT [FK_bets_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO

ALTER TABLE [dbo].[bets] CHECK CONSTRAINT [FK_bets_users]
GO

ALTER TABLE [dbo].[games]  WITH CHECK ADD  CONSTRAINT [FK_games_games] FOREIGN KEY([id])
REFERENCES [dbo].[games] ([id])
GO

ALTER TABLE [dbo].[games] CHECK CONSTRAINT [FK_games_games]
GO

ALTER TABLE [dbo].[goals]  WITH CHECK ADD  CONSTRAINT [FK_goals_games] FOREIGN KEY([game_id])
REFERENCES [dbo].[games] ([id])
GO

ALTER TABLE [dbo].[goals] CHECK CONSTRAINT [FK_goals_games]
GO

ALTER TABLE [dbo].[goals]  WITH CHECK ADD  CONSTRAINT [FK_goals_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([id])
GO

ALTER TABLE [dbo].[goals] CHECK CONSTRAINT [FK_goals_teams]
GO

ALTER TABLE [dbo].[odds]  WITH CHECK ADD  CONSTRAINT [FK_odds_games] FOREIGN KEY([game_id])
REFERENCES [dbo].[games] ([id])
GO

ALTER TABLE [dbo].[odds] CHECK CONSTRAINT [FK_odds_games]
GO

ALTER TABLE [dbo].[odds]  WITH CHECK ADD  CONSTRAINT [FK_odds_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([id])
GO

ALTER TABLE [dbo].[odds] CHECK CONSTRAINT [FK_odds_teams]
GO

ALTER TABLE [dbo].[teams_games]  WITH CHECK ADD  CONSTRAINT [FK_teams_games_games] FOREIGN KEY([game_id])
REFERENCES [dbo].[games] ([id])
GO

ALTER TABLE [dbo].[teams_games] CHECK CONSTRAINT [FK_teams_games_games]
GO

ALTER TABLE [dbo].[teams_games]  WITH CHECK ADD  CONSTRAINT [FK_teams_games_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([id])
GO

ALTER TABLE [dbo].[teams_games] CHECK CONSTRAINT [FK_teams_games_teams]
GO

ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [CK_users] CHECK  (([balance]>(0)))
GO

ALTER TABLE [dbo].[users] CHECK CONSTRAINT [CK_users]
GO

