USE [master]
GO
/****** Object:  Database [TheWineCellar]    Script Date: 10/17/2016 3:11:19 PM ******/
CREATE DATABASE [TheWineCellar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NovaCosmetics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NovaCosmetics.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NovaCosmetics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\NovaCosmetics_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TheWineCellar] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheWineCellar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheWineCellar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheWineCellar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheWineCellar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheWineCellar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheWineCellar] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheWineCellar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TheWineCellar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheWineCellar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheWineCellar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheWineCellar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheWineCellar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheWineCellar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheWineCellar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheWineCellar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheWineCellar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TheWineCellar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheWineCellar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheWineCellar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheWineCellar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheWineCellar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheWineCellar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheWineCellar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheWineCellar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheWineCellar] SET  MULTI_USER 
GO
ALTER DATABASE [TheWineCellar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheWineCellar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheWineCellar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheWineCellar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TheWineCellar] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TheWineCellar]
GO
/****** Object:  Table [dbo].[platform_user]    Script Date: 10/17/2016 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platform_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[surname] [varchar](25) NOT NULL,
	[shipping_address] [varchar](100) NOT NULL,
	[city] [varchar](25) NOT NULL,
	[zip] [varchar](10) NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](25) NOT NULL,
	[password] [varchar](25) NOT NULL,
 CONSTRAINT [PK_platform_iser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/17/2016 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_group_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[info] [varchar](500) NULL,
	[price] [money] NOT NULL,
	[pic] [varchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_group]    Script Date: 10/17/2016 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 10/17/2016 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[platform_user_id] [bigint] NULL,
	[date] [timestamp] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transaction_product]    Script Date: 10/17/2016 3:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[transaction_id] [bigint] NOT NULL,
 CONSTRAINT [PK_transaction_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[platform_user] ON 

INSERT [dbo].[platform_user] ([id], [name], [surname], [shipping_address], [city], [zip], [phone], [email], [password]) VALUES (1, N'luke', N'duncan', N'id dar please', N'il mosta', N'', N'', N'luke@gmail.com', N'Abcd1234?!')
INSERT [dbo].[platform_user] ([id], [name], [surname], [shipping_address], [city], [zip], [phone], [email], [password]) VALUES (2, N'Kenneth', N'Mizzi', N'id dar please', N'il mosta', N'', N'', N'kenneth@gmail.com', N'Abcd1234?!')
INSERT [dbo].[platform_user] ([id], [name], [surname], [shipping_address], [city], [zip], [phone], [email], [password]) VALUES (4, N'Albert', N'Albert', N'id dar', N'il mosta', NULL, NULL, N'albert@gmail.com', N'Abcd1234?!')
SET IDENTITY_INSERT [dbo].[platform_user] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (22, 1, N'AMEZTOI', N'It''s a place. It''s a demarcated wine region divided into 3 appellations. Getariako is one of them. Its wines are made from the Hondarribi Zuri and Hondarribi Beltza grapes. Rolls right off the tongue. Refreshingly briny and crisp, Txakolina is bottled with a touch of residual carbonation, giving it a playful spritz of a sparkle.', 21.0000, N'ameztoi')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (23, 1, N'ANTERRA', N'From Mezzacorona and the fine folks at Prestige Wine Imports, Anterra Pinot Grigio is sourced from vineyards in Trentino, the Veneto and Friuli. It has creamy, lemon tart aromas and a clean, satisfyingly crisp finish. A perfect wine for your next party, casual supper or office get-together.', 23.0000, N'anterra')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (24, 1, N'ARCA NOVA', N'Everybody and their backpacking hippie mom knows and loves Vinho Verde, the early picked and bottled “green” wine of Portugal. Did you know that they produce and consume way more red wine in Vinho Verde and export most of the white? Quintas das Arcas produces a slamming version of this Portuguese classic that’s as crisp as a white linen suit. Saúde!', 17.0000, N'arcanova')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (26, 2, N'ARROWHEAD', N'Established in 2005, Arrowhead Spring Vineyards is a "zoo" of a property. Protected by Lake Ontario, the grapes are grown on the Niagara Escarpment among cats, a dog, mobile-cooped chickens, hawks, owls, and praying mantis. "Clean and green", their barrel room is cooled by the earth, and solar powered speakers (as well as glitter ribbons) deter birds from gorging on grapes!', 21.0000, N'arrowhead')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (27, 2, N'DOMAINE BERSAN', N'Domaine Bersan is located in St. Bris, the region near Chablis that is known for being the only area of Burgundy allowed to bottle Sauvignon Blanc. In fact, the Bersans (Jean-Louis and son Jean-Christophe) produce wine from no less than 6 different grapes. A rarity in Burgundy. Their cellars are a network of tunnels built in the 12th century by the Templars. Their wines, certified organic.', 21.0000, N'domaine')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (30, 2, N'MOMO', N'Cinematographer Michael Seresin (Bugsy Malone, Fame to Step Up, Harry Potter 3, etc.),purchased land in the Wairau Valley in the early 90''s, setting up his vineyards according to strict biodynamic principles. Seresin''s Momo Pinot Noir combines purchased grapes from organically-farmed plots in Marlborough with estate fruit and ferments them in used French barriques', 17.0000, N'momo')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (31, 3, N'ASCHERI', N'With cellars in Bra and vineyards dispersed through the Langhe and Roero (while concurrently operating a traditional osteria and a super-sleek hotel), the Ascheris produce a range of wines extolled by enthusiasts from Slow Food to Decanter. Fermented in steel tanks and aged 2 years in Slavonian oak, this modern gem goes back in tank and then a year in bottle before release.', 48.0000, N'ascheri')
INSERT [dbo].[product] ([id], [product_group_id], [name], [info], [price], [pic]) VALUES (32, 3, N'ALBAN VINEYARDS', N'Patrina is Gypsy-speak for grass or leaves. Gypsies would mark secret trails by piling up the "patrin." John Alban is marking his trails too, blending his bricolage of vineyards and soil types (Reva, Lorraine, etc.) into a single, sensational assemblage. An original Rhône Ranger, Alban continues to expand the boundaries of California Syrah. Snatch some up while you can.', 52.0000, N'alban')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[product_group] ON 

INSERT [dbo].[product_group] ([id], [name]) VALUES (1, N'White')
INSERT [dbo].[product_group] ([id], [name]) VALUES (2, N'Red')
INSERT [dbo].[product_group] ([id], [name]) VALUES (3, N'Exclusive')
SET IDENTITY_INSERT [dbo].[product_group] OFF
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_group] FOREIGN KEY([product_group_id])
REFERENCES [dbo].[product_group] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_group]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_platform_user_id] FOREIGN KEY([platform_user_id])
REFERENCES [dbo].[platform_user] ([id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_platform_user_id]
GO
ALTER TABLE [dbo].[transaction_product]  WITH CHECK ADD  CONSTRAINT [FK_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[transaction_product] CHECK CONSTRAINT [FK_product_id]
GO
ALTER TABLE [dbo].[transaction_product]  WITH CHECK ADD  CONSTRAINT [FK_transaction_id] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transaction] ([id])
GO
ALTER TABLE [dbo].[transaction_product] CHECK CONSTRAINT [FK_transaction_id]
GO
USE [master]
GO
ALTER DATABASE [TheWineCellar] SET  READ_WRITE 
GO
