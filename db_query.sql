USE [master]
GO
/****** Object:  Database [VideojuegosPatoDataBase]    Script Date: 6/4/2026 02:01:14 ******/
CREATE DATABASE [VideojuegosPatoDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VideojuegosPatoDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VideojuegosPatoDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VideojuegosPatoDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VideojuegosPatoDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VideojuegosPatoDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET RECOVERY FULL 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'VideojuegosPatoDataBase', N'ON'
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET QUERY_STORE = ON
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [VideojuegosPatoDataBase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advertisements]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertisements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_advertisements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartProduct]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartProduct](
	[CartsID] [int] NOT NULL,
	[ProductsID] [int] NOT NULL,
 CONSTRAINT [PK_CartProduct] PRIMARY KEY CLUSTERED 
(
	[CartsID] ASC,
	[ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_carts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryUser]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryUser](
	[FavoriteCategoriesID] [int] NOT NULL,
	[FavoritedByUsersID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryUser] PRIMARY KEY CLUSTERED 
(
	[FavoriteCategoriesID] ASC,
	[FavoritedByUsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[Tip] [nvarchar](max) NOT NULL,
	[Video] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUser]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUser](
	[LikedByUsersID] [int] NOT NULL,
	[LikedProductsID] [int] NOT NULL,
 CONSTRAINT [PK_ProductUser] PRIMARY KEY CLUSTERED 
(
	[LikedByUsersID] ASC,
	[LikedProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Admin] [bit] NOT NULL,
	[CartID] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220804033033_FirstMigration', N'6.0.7')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220828001316_Add Carts to Products', N'6.0.7')
GO
SET IDENTITY_INSERT [dbo].[advertisements] ON 
GO
INSERT [dbo].[advertisements] ([ID], [ImageName]) VALUES (1, N'summer_sale.jpg')
GO
INSERT [dbo].[advertisements] ([ID], [ImageName]) VALUES (2, N'steam_deck.jpg')
GO
INSERT [dbo].[advertisements] ([ID], [ImageName]) VALUES (3, N'steam_awards.jpg')
GO
INSERT [dbo].[advertisements] ([ID], [ImageName]) VALUES (11, N'Anuncio2.webp')
GO
INSERT [dbo].[advertisements] ([ID], [ImageName]) VALUES (12, N'Anuncio3.webp')
GO
SET IDENTITY_INSERT [dbo].[advertisements] OFF
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (2, 1)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (1, 2)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (10, 2)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (4, 3)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (3, 4)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (1, 5)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (5, 6)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (3, 7)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (7, 8)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (2, 9)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (6, 10)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (8, 11)
GO
INSERT [dbo].[CartProduct] ([CartsID], [ProductsID]) VALUES (9, 12)
GO
SET IDENTITY_INSERT [dbo].[carts] ON 
GO
INSERT [dbo].[carts] ([ID]) VALUES (1)
GO
INSERT [dbo].[carts] ([ID]) VALUES (2)
GO
INSERT [dbo].[carts] ([ID]) VALUES (3)
GO
INSERT [dbo].[carts] ([ID]) VALUES (4)
GO
INSERT [dbo].[carts] ([ID]) VALUES (5)
GO
INSERT [dbo].[carts] ([ID]) VALUES (6)
GO
INSERT [dbo].[carts] ([ID]) VALUES (7)
GO
INSERT [dbo].[carts] ([ID]) VALUES (8)
GO
INSERT [dbo].[carts] ([ID]) VALUES (9)
GO
INSERT [dbo].[carts] ([ID]) VALUES (10)
GO
INSERT [dbo].[carts] ([ID]) VALUES (11)
GO
INSERT [dbo].[carts] ([ID]) VALUES (12)
GO
INSERT [dbo].[carts] ([ID]) VALUES (13)
GO
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (1, N'Accion')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (2, N'Aventura')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (3, N'RPG')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (4, N'Deportes')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (5, N'Estrategia')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (6, N'Simulacion')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (7, N'Terror')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (8, N'Carreras')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (9, N'Puzzle')
GO
INSERT [dbo].[categories] ([ID], [Name]) VALUES (10, N'Plataformas')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (1, 1)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (3, 1)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (2, 2)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (6, 2)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (4, 3)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (7, 3)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (5, 4)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (8, 5)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (9, 6)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (10, 7)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (1, 8)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (2, 9)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (3, 10)
GO
INSERT [dbo].[CategoryUser] ([FavoriteCategoriesID], [FavoritedByUsersID]) VALUES (6, 10)
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (1, N'God of War Ragnarok', N'Secuela epica de la saga nordica de Kratos', 1, N'gow_ragnarok.jpg', N'Usa el hacha y las espadas segun el enemigo', N'https://youtube.com/gow', 59.99, 50)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (2, N'The Legend of Zelda: TOTK', N'Explora el vasto mundo de Hyrule', 2, N'zelda_totk.jpg', N'Combina objetos para crear herramientas', N'https://youtube.com/zelda', 69.99, 30)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (3, N'Elden Ring', N'RPG de mundo abierto por FromSoftware', 3, N'elden_ring.jpg', N'Sube de nivel Vigor primero', N'https://youtube.com/eldenring', 49.99, 40)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (4, N'FIFA 24', N'El simulador de futbol mas popular del mundo', 4, N'fifa24.jpg', N'Practica tiros libres en el modo entreno', N'https://youtube.com/fifa24', 59.99, 100)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (5, N'Civilization VI', N'Construye un imperio que resista el paso del tiempo', 5, N'civ6.jpg', N'Prioriza ciencia en las primeras eras', N'https://youtube.com/civ6', 29.99, 60)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (6, N'The Sims 4', N'Simula la vida cotidiana de tus personajes', 6, N'sims4.jpg', N'Enfoca habilidades desde el inicio', N'https://youtube.com/sims4', 39.99, 80)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (7, N'Resident Evil 4 Remake', N'Remake del clasico juego de terror y accion', 7, N're4_remake.jpg', N'Conserva municion para los jefes', N'https://youtube.com/re4', 59.99, 35)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (8, N'Forza Horizon 5', N'Carreras de mundo abierto en Mexico', 8, N'forza5.jpg', N'Ajusta la suspension para cada terreno', N'https://youtube.com/forza5', 49.99, 45)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (9, N'Portal 2', N'Resuelve puzzles con tu pistola de portales', 9, N'portal2.jpg', N'Piensa con portales y usa la fisica', N'https://youtube.com/portal2', 9.99, 200)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (10, N'Hollow Knight', N'Explora un reino de insectos en este metroidvania', 10, N'hollow_knight.jpg', N'Explora cada rincon para encontrar amuletos', N'https://youtube.com/hollowknight', 14.99, 150)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (11, N'Hades', N'Roguelike de accion en el inframundo griego', 1, N'hades.jpg', N'Prueba todas las armas para encontrar tu estilo', N'https://youtube.com/hades', 24.99, 70)
GO
INSERT [dbo].[products] ([ID], [Name], [Description], [CategoryID], [ImageName], [Tip], [Video], [Price], [Quantity]) VALUES (12, N'Stardew Valley', N'Simulador de granja relajante y adictivo', 6, N'stardew.jpg', N'Planta cultivos de temporada para maximizar ganancias', N'https://youtube.com/stardew', 14.99, 120)
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (1, 1)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (10, 1)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (2, 2)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (1, 3)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (3, 4)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (4, 5)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (2, 6)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (3, 7)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (5, 8)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (6, 9)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (10, 9)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (7, 10)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (8, 11)
GO
INSERT [dbo].[ProductUser] ([LikedByUsersID], [LikedProductsID]) VALUES (9, 12)
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (1, N'Carlos Lopez', N'Admin123!', N'carlos@email.com', 1, 1)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (2, N'Maria Garcia', N'Pass456!', N'maria@email.com', 0, 2)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (3, N'Pedro Martinez', N'Pass789!', N'pedro@email.com', 0, 3)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (4, N'Ana Rodriguez', N'Pass012!', N'ana@email.com', 0, 4)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (5, N'Luis Hernandez', N'Pass345!', N'luis@email.com', 1, 5)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (6, N'Sofia Ramirez', N'Pass678!', N'sofia@email.com', 0, 6)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (7, N'Diego Torres', N'Pass901!', N'diego@email.com', 0, 7)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (8, N'Valentina Flores', N'Pass234!', N'valentina@email.com', 0, 8)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (9, N'Andres Morales', N'Pass567!', N'andres@email.com', 0, 9)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (10, N'Camila Vargas', N'Pass890!', N'camila@email.com', 0, 10)
GO
INSERT [dbo].[users] ([ID], [Name], [Password], [Email], [Admin], [CartID]) VALUES (11, N'Prueba', N'Prueba', N'prueba@prueba.com', 0, 13)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [IX_CartProduct_ProductsID]    Script Date: 6/4/2026 02:01:14 ******/
CREATE NONCLUSTERED INDEX [IX_CartProduct_ProductsID] ON [dbo].[CartProduct]
(
	[ProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CategoryUser_FavoritedByUsersID]    Script Date: 6/4/2026 02:01:14 ******/
CREATE NONCLUSTERED INDEX [IX_CategoryUser_FavoritedByUsersID] ON [dbo].[CategoryUser]
(
	[FavoritedByUsersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_products_CategoryID]    Script Date: 6/4/2026 02:01:14 ******/
CREATE NONCLUSTERED INDEX [IX_products_CategoryID] ON [dbo].[products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductUser_LikedProductsID]    Script Date: 6/4/2026 02:01:14 ******/
CREATE NONCLUSTERED INDEX [IX_ProductUser_LikedProductsID] ON [dbo].[ProductUser]
(
	[LikedProductsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_users_CartID]    Script Date: 6/4/2026 02:01:14 ******/
CREATE NONCLUSTERED INDEX [IX_users_CartID] ON [dbo].[users]
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [FK_CartProduct_carts_CartsID] FOREIGN KEY([CartsID])
REFERENCES [dbo].[carts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [FK_CartProduct_carts_CartsID]
GO
ALTER TABLE [dbo].[CartProduct]  WITH CHECK ADD  CONSTRAINT [FK_CartProduct_products_ProductsID] FOREIGN KEY([ProductsID])
REFERENCES [dbo].[products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartProduct] CHECK CONSTRAINT [FK_CartProduct_products_ProductsID]
GO
ALTER TABLE [dbo].[CategoryUser]  WITH CHECK ADD  CONSTRAINT [FK_CategoryUser_categories_FavoriteCategoriesID] FOREIGN KEY([FavoriteCategoriesID])
REFERENCES [dbo].[categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryUser] CHECK CONSTRAINT [FK_CategoryUser_categories_FavoriteCategoriesID]
GO
ALTER TABLE [dbo].[CategoryUser]  WITH CHECK ADD  CONSTRAINT [FK_CategoryUser_users_FavoritedByUsersID] FOREIGN KEY([FavoritedByUsersID])
REFERENCES [dbo].[users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoryUser] CHECK CONSTRAINT [FK_CategoryUser_users_FavoritedByUsersID]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories_CategoryID]
GO
ALTER TABLE [dbo].[ProductUser]  WITH CHECK ADD  CONSTRAINT [FK_ProductUser_products_LikedProductsID] FOREIGN KEY([LikedProductsID])
REFERENCES [dbo].[products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductUser] CHECK CONSTRAINT [FK_ProductUser_products_LikedProductsID]
GO
ALTER TABLE [dbo].[ProductUser]  WITH CHECK ADD  CONSTRAINT [FK_ProductUser_users_LikedByUsersID] FOREIGN KEY([LikedByUsersID])
REFERENCES [dbo].[users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductUser] CHECK CONSTRAINT [FK_ProductUser_users_LikedByUsersID]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_carts_CartID] FOREIGN KEY([CartID])
REFERENCES [dbo].[carts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_carts_CartID]
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeAdvertisements]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_ChangeAdvertisements: Update an advertisement image
-- Called as: ExecuteSqlRaw($"SP_ChangeAdvertisements {advertisement.ID},'{advertisement.ImageName}'")
CREATE   PROCEDURE [dbo].[SP_ChangeAdvertisements]
    @Id INT = 0,
    @ImageName NVARCHAR(MAX) = ''
AS
BEGIN
    UPDATE [advertisements] SET ImageName = @ImageName WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeCategories]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_ChangeCategories: Update a category name
-- Called as: ExecuteSqlRaw($"SP_ChangeCategories {category.ID},{category.Name}")
CREATE   PROCEDURE [dbo].[SP_ChangeCategories]
    @Id INT = 0,
    @Name NVARCHAR(MAX) = ''
AS
BEGIN
    UPDATE [categories] SET Name = @Name WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeProducts]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_ChangeProducts: Update an existing product
-- Called as: ExecuteSqlRaw($"SP_ChangeProducts {Id},{Name},'{Description}',{CategoryId},'{ImageName}','{Tip}',{Video},'{Price}',{Quantity}")
CREATE   PROCEDURE [dbo].[SP_ChangeProducts]
    @Id INT = 0,
    @Name NVARCHAR(MAX) = '',
    @Description NVARCHAR(MAX) = '',
    @CategoryID INT = 0,
    @ImageName NVARCHAR(MAX) = '',
    @Tip NVARCHAR(MAX) = '',
    @Video NVARCHAR(MAX) = '',
    @Price NVARCHAR(MAX) = '0',
    @Quantity INT = 0
AS
BEGIN
    UPDATE [products]
    SET Name = @Name,
        Description = @Description,
        CategoryID = @CategoryID,
        ImageName = @ImageName,
        Tip = @Tip,
        Video = @Video,
        Price = CAST(@Price AS FLOAT),
        Quantity = @Quantity
    WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultAdvertisements]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- ADVERTISEMENTS (4 SPs)
-- ============================================

-- SP_ConsultAdvertisements: Id=0 returns all, otherwise by ID
-- Called as: FromSqlRaw($"SP_ConsultAdvertisements {Id}")
CREATE   PROCEDURE [dbo].[SP_ConsultAdvertisements]
    @Id INT = 0
AS
BEGIN
    IF @Id = 0
        SELECT * FROM [advertisements];
    ELSE
        SELECT * FROM [advertisements] WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultCategories]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- CATEGORIES (4 SPs)
-- ============================================

-- SP_ConsultCategories: empty/no arg returns all, otherwise filter by Name
-- Called as: FromSqlRaw($"SP_ConsultCategories {Name}") where Name can be ""
CREATE   PROCEDURE [dbo].[SP_ConsultCategories]
    @Name NVARCHAR(MAX) = ''
AS
BEGIN
    IF @Name = '' OR @Name IS NULL
        SELECT * FROM [categories];
    ELSE
        SELECT * FROM [categories] WHERE Name = @Name;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultProducts]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- PRODUCTS (4 SPs)
-- ============================================

-- SP_ConsultProducts: Id=0 returns all, otherwise by ID
-- Called as: FromSqlRaw($"SP_ConsultProducts {Id}")
CREATE   PROCEDURE [dbo].[SP_ConsultProducts]
    @Id INT = 0
AS
BEGIN
    IF @Id = 0
        SELECT * FROM [products];
    ELSE
        SELECT * FROM [products] WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultUsers]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ============================================
-- USERS (2 SPs)
-- ============================================

-- SP_ConsultUsers: Id=0 returns all, otherwise by ID
-- Called as: FromSqlRaw($"SP_ConsultUsers {Id}")
CREATE   PROCEDURE [dbo].[SP_ConsultUsers]
    @Id INT = 0
AS
BEGIN
    IF @Id = 0
        SELECT * FROM [users];
    ELSE
        SELECT * FROM [users] WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAdvertisements]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_DeleteAdvertisements: Delete advertisement by ID
-- Called as: ExecuteSqlRaw($"SP_DeleteAdvertisements {Id}")
CREATE   PROCEDURE [dbo].[SP_DeleteAdvertisements]
    @Id INT = 0
AS
BEGIN
    DELETE FROM [advertisements] WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCategories]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_DeleteCategories: Delete category by name and its relations
-- Called as: ExecuteSqlRaw($"SP_DeleteCategories {name}")
CREATE   PROCEDURE [dbo].[SP_DeleteCategories]
    @Name NVARCHAR(MAX) = ''
AS
BEGIN
    DECLARE @CatID INT;
    SELECT @CatID = ID FROM [categories] WHERE Name = @Name;

    IF @CatID IS NOT NULL
    BEGIN
        DELETE FROM [CategoryUser] WHERE FavoriteCategoriesID = @CatID;
        DELETE FROM [ProductUser] WHERE LikedProductsID IN (SELECT ID FROM [products] WHERE CategoryID = @CatID);
        DELETE FROM [CartProduct] WHERE ProductsID IN (SELECT ID FROM [products] WHERE CategoryID = @CatID);
        DELETE FROM [products] WHERE CategoryID = @CatID;
        DELETE FROM [categories] WHERE ID = @CatID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProducts]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_DeleteProducts: Delete product and its relations
-- Called as: ExecuteSqlRaw($"SP_DeleteProducts {Id}")
CREATE   PROCEDURE [dbo].[SP_DeleteProducts]
    @Id INT = 0
AS
BEGIN
    DELETE FROM [CartProduct] WHERE ProductsID = @Id;
    DELETE FROM [ProductUser] WHERE LikedProductsID = @Id;
    DELETE FROM [products] WHERE ID = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteUsers]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_DeleteUsers: Delete user, their relations, and their cart
-- Called as: ExecuteSqlRaw($"SP_DeleteUsers {Id}")
CREATE   PROCEDURE [dbo].[SP_DeleteUsers]
    @Id INT = 0
AS
BEGIN
    DECLARE @CartID INT;
    SELECT @CartID = CartID FROM [users] WHERE ID = @Id;

    DELETE FROM [CategoryUser] WHERE FavoritedByUsersID = @Id;
    DELETE FROM [ProductUser] WHERE LikedByUsersID = @Id;
    DELETE FROM [CartProduct] WHERE CartsID = @CartID;
    DELETE FROM [users] WHERE ID = @Id;
    DELETE FROM [carts] WHERE ID = @CartID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAdvertisements]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_InsertAdvertisements: Insert a new advertisement
-- Called as: ExecuteSqlRaw($"SP_InsertAdvertisements '{ImageName}'")
CREATE   PROCEDURE [dbo].[SP_InsertAdvertisements]
    @ImageName NVARCHAR(MAX) = ''
AS
BEGIN
    INSERT INTO [advertisements] (ImageName) VALUES (@ImageName);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCategories]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_InsertCategories: Insert a new category
-- Called as: ExecuteSqlRaw($"SP_InsertCategories {Name}")
CREATE   PROCEDURE [dbo].[SP_InsertCategories]
    @Name NVARCHAR(MAX) = ''
AS
BEGIN
    INSERT INTO [categories] (Name) VALUES (@Name);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertProducts]    Script Date: 6/4/2026 02:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SP_InsertProducts: Insert a new product
-- Called as: ExecuteSqlRaw($"SP_InsertProducts {Name},'{Description}',{CategoryId},'{ImageName}','{Tip}','{Video}','{Price}',{Quantity}")
CREATE   PROCEDURE [dbo].[SP_InsertProducts]
    @Name NVARCHAR(MAX) = '',
    @Description NVARCHAR(MAX) = '',
    @CategoryID INT = 0,
    @ImageName NVARCHAR(MAX) = '',
    @Tip NVARCHAR(MAX) = '',
    @Video NVARCHAR(MAX) = '',
    @Price NVARCHAR(MAX) = '0',
    @Quantity INT = 0
AS
BEGIN
    INSERT INTO [products] (Name, Description, CategoryID, ImageName, Tip, Video, Price, Quantity)
    VALUES (@Name, @Description, @CategoryID, @ImageName, @Tip, @Video, CAST(@Price AS FLOAT), @Quantity);
END
GO
USE [master]
GO
ALTER DATABASE [VideojuegosPatoDataBase] SET  READ_WRITE 
GO
