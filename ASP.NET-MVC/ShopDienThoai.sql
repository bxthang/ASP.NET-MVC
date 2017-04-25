USE [master]
GO
CREATE DATABASE [ShopDienThoai]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopDienThoai', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopDienThoai.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopDienThoai_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShopDienThoai_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopDienThoai] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopDienThoai].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopDienThoai] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopDienThoai] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopDienThoai] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopDienThoai] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopDienThoai] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopDienThoai] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopDienThoai] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopDienThoai] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopDienThoai] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopDienThoai] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopDienThoai] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopDienThoai] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopDienThoai] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopDienThoai] SET  MULTI_USER 
GO
ALTER DATABASE [ShopDienThoai] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopDienThoai] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopDienThoai] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopDienThoai] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopDienThoai] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopDienThoai', N'ON'
GO
USE [ShopDienThoai]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSP](
	[MaSP] [int] NULL,
	[ChiTietSP] [nvarchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [int] NULL,
	[MaTinhTrang] [int] NULL,
	[BiXoa] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSP](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[BiXoa] [int] NOT NULL CONSTRAINT [DF_HangSP_BiXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_HangSP] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[BiXoa] [int] NOT NULL CONSTRAINT [DF_LoaiSP_BiXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTK](
	[MaLoaiTK] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTK] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiTK] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[MaHang] [int] NULL,
	[MaLoai] [int] NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[TinhTrang] [int] NULL,
	[GiaBan] [int] NULL,
	[SoLuong] [int] NULL,
	[ThongTin] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](50) NULL,
	[BiXoa] [int] NOT NULL CONSTRAINT [DF_SanPham_BiXoa]  DEFAULT ((0)),
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [varchar](20) NULL,
	[MatKhau] [varchar](50) NULL,
	[MaLoaiTK] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[NgaySinh] [date] NULL,
	[MaTinhThanh] [int] NULL,
	[BiXoa] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[MaTinhThanh] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhThanh] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[MaTinhThanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDH](
	[MaTinhTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangDH] PRIMARY KEY CLUSTERED 
(
	[MaTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangSP](
	[MaTinhTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangSP] PRIMARY KEY CLUSTERED 
(
	[MaTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (4, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (5, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (6, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (7, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (8, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (9, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (10, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (11, N'Màn Hình: 5.5 inch (1920 x 1080 pixels);Ram: 4GB;Chip: Helio P10 8 nhân;Hệ Điều Hành: Andoid 5.1')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (12, N'Màn Hình: 5 inch (1280 x 720 pixels);Ram: 2GB;Chip: Snapdragon 410 4 nhân;Hệ Điều Hành: Andoid 5.1')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (13, N'Màn Hình: 5.2 inch (1920 x 1080 pixels);Ram: 3GB;Chip: Snapdragon 810 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (14, N'Màn Hình: 6 inch (1920 x 1080 pixels);Ram: 3GB;Chip: Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (15, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (16, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (17, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (18, N'Màn Hình: 5.7 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 7420 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (19, N'Màn Hình: 5.3 inch (1280 x 720 pixels);Ram: 2GB;Chip: MT6735 4 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (20, N'Màn Hình: 5.3 inch (1280 x 720 pixels);Ram: 1.5GB;Chip: MTK 6582 4 nhân;Hệ Điều Hành: Andoid 5.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (21, N'Màn Hình: 5.2 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Snapdragon 4 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (22, N'Màn Hình: 5 inch (1920 x 1080 pixels);Ram: 2GB;Chip: Snapdragon 617 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (23, N'Màn Hình: 5.5 inch (1920 x 1080 pixels);Ram: 4GB;Chip: MTK Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (24, N'Màn Hình: 5.2 inch (4096 x 2160 pixels);Ram: 3GB;Chip: MTK Helio X10 8 nhân;Hệ Điều Hành: Andoid 5.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (25, N'Màn Hình: 5 inch (1280 x 720 pixels);Ram: 2GB;Chip: MTK Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (26, N'Màn Hình: 6.4 inch (1920 x 1080 pixels);Ram: 6GB;Chip: Snapdragon 821;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (27, N'Màn Hình: 5.7 inch (1920 x 1080 pixels);Ram: 4/6GB;Chip: Snapdragon 821;Hệ Điều Hành: Andoid 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (28, N'Màn Hình: 4 inch (1136 x 640 pixels);Ram: 2GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (29, N'Màn Hình: 5.5 inch (1334 x 750 pixels);Ram: 2GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 10')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (30, N'Màn Hình: 5.7 inch (1920 x 1080 pixels);Ram: 4/6GB;Chip: Snapdragon 821;Hệ Điều Hành: Android 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (31, N'Màn Hình: 5.15 inch (1920 x 1080 pixels);Ram: 3/4GB;Chip: Snapdragon 821;Hệ Điều Hành: Android 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (32, N'Màn Hình: 5.3 inch (2560 x 1440 pixels);Ram: 4GB;Chip: Snapdragon 820;Hệ Điều Hành: Android 6.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (33, N'Màn Hình: 12.9 inch (2560 x 1440 pixels);Ram: 4GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 9.0')
INSERT [dbo].[ChiTietSP] ([MaSP], [ChiTietSP]) VALUES (34, N'Màn Hình: 9.7 inch (2560 x 1440 pixels);Ram: 2GB;Chip: Tripe Core 1.5Ghz;Hệ Điều Hành: IOS 8.0')
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [MaTK], [MaSP], [SoLuong], [GiaTien], [MaTinhTrang], [BiXoa]) VALUES (3, 1, 5, 1, 12300000, 1, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [MaTK], [MaSP], [SoLuong], [GiaTien], [MaTinhTrang], [BiXoa]) VALUES (4, 2, 7, 2, 10000000, 1, 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[HangSP] ON 

INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (1, N'Samsung', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (2, N'Apple', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (3, N'Sony', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (4, N'Xiaomi', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (5, N'HTC', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (6, N'Oppo', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (7, N'LG', 0)
INSERT [dbo].[HangSP] ([MaHang], [TenHang], [BiXoa]) VALUES (8, N'Toshiba', 0)
SET IDENTITY_INSERT [dbo].[HangSP] OFF
SET IDENTITY_INSERT [dbo].[LoaiSP] ON 

INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [BiXoa]) VALUES (1, N'SmartPhone', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [BiXoa]) VALUES (2, N'Table', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [BiXoa]) VALUES (3, N'Laptop', 0)
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai], [BiXoa]) VALUES (4, N'Con Cas', 1)
SET IDENTITY_INSERT [dbo].[LoaiSP] OFF
SET IDENTITY_INSERT [dbo].[LoaiTK] ON 

INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (1, N'Qu?n tr? viên')
INSERT [dbo].[LoaiTK] ([MaLoaiTK], [TenLoaiTK]) VALUES (2, N'Ngu?i dùng')
SET IDENTITY_INSERT [dbo].[LoaiTK] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (4, N'SamSung Galaxy A7', 1, 1, N'samsunggalaxya7.jpg', 1, 7200000, 3, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (5, N'Iphone 7 plus', 2, 1, N'iphone7plus.jpg', 1, 15900000, 0, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (6, N'Iphone 6', 2, 1, N'iphone6.jpg', 1, 8990000, 3, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (7, N'Iphone 6 plus', 2, 1, N'iphone6plus.jpg', 1, 11900000, 6, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (8, N'Sony Xperia X', 3, 1, N'sonyxperiax.jpg', 0, 12990000, 1, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (9, N'Iphone 6s', 2, 1, N'iphone6s.jpg', 1, 14990000, 7, N'Màn Hình: 4.7 inch(1334 x 750 pixel);Ram: 2GB; Chip: Apple A10;Hệ Điều Hành:IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (10, N'Sony Xperia XZ', 3, 1, N'sonyxperiaxz.jpg', 1, 12300000, 3, N'Màn Hình: 5.1 inch (1440 x 2560 pixels);Ram: 3GB;Chip: Exynos 8890;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (11, N'Oppo F1 Plus', 6, 1, N'oppof1plus.jpg', 1, 7000000, 10, N'Màn Hình: 5.5 inch (1920 x 1080 pixels);Ram: 4GB;Chip: Helio P10 8 nhân;Hệ Điều Hành: Andoid 5.1', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (12, N'Oppo A37', 6, 1, N'oppoa37.jpg', 1, 5600000, 6, N'Màn Hình: 5 inch (1280 x 720 pixels);Ram: 2GB;Chip: Snapdragon 410 4 nhân;Hệ Điều Hành: Andoid 5.1', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (13, N'Sony Xperia Z5 Dual', 3, 1, N'sonyxperiaz5dual.jpg', 1, 1500000, 3, N'Màn Hình: 5.2 inch (1920 x 1080 pixels);Ram: 3GB;Chip: Snapdragon 810 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (14, N'Sony Xperia XA Ultra', 3, 1, N'sonyxperiaxaultra.jpg', 1, 7000000, 8, N'Màn Hình: 6 inch (1920 x 1080 pixels);Ram: 3GB;Chip: Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (15, N'SamSung Galaxy S7E Blue', 1, 1, N'samsunggalaxys7edgeblue.jpg', 1, 16500000, 12, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (16, N'SamSung Galaxy S7 EDGE', 1, 1, N'samsunggalaxys7edge.jpg', 1, 14000000, 15, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (17, N'SamSung Galaxy S7E Pink', 1, 1, N'samsunggalaxys7edgepink.jpg', 1, 16000000, 2, N'Màn Hình: 5.5 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 8890 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (18, N'SamSung Galaxy Note 5', 1, 1, N'samsunggalaxynote5.jpg', 1, 9000000, 6, N'Màn Hình: 5.7 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Exynos 7420 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (19, N'LG X Power', 7, 1, N'lgxpower.jpg', 1, 5600000, 9, N'Màn Hình: 5.3 inch (1280 x 720 pixels);Ram: 2GB;Chip: MT6735 4 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (20, N'LG K10', 7, 1, N'lgk10.jpg', 1, 5700000, 12, N'Màn Hình: 5.3 inch (1280 x 720 pixels);Ram: 1.5GB;Chip: MTK 6582 4 nhân;Hệ Điều Hành: Andoid 5.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (21, N'HTC 10', 5, 1, N'htc10.jpg', 1, 10600000, 24, N'Màn Hình: 5.2 inch (4096 x 2160 pixels);Ram: 4GB;Chip: Snapdragon 4 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (22, N'HTC One A9', 5, 1, N'htconea9.jpg', 1, 7800000, 2, N'Màn Hình: 5 inch (1920 x 1080 pixels);Ram: 2GB;Chip: Snapdragon 617 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (23, N'HTC Desire 10 Pro', 5, 1, N'htcdesire10pro.jpg', 1, 7900000, 7, N'Màn Hình: 5.5 inch (1920 x 1080 pixels);Ram: 4GB;Chip: MTK Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (24, N'HTC One Me', 5, 1, N'htconeme.jpg', 1, 6500000, 3, N'Màn Hình: 5.2 inch (4096 x 2160 pixels);Ram: 3GB;Chip: MTK Helio X10 8 nhân;Hệ Điều Hành: Andoid 5.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (25, N'HTC One A9s', 5, 1, N'htconea9s.jpg', 1, 8000000, 7, N'Màn Hình: 5 inch (1280 x 720 pixels);Ram: 2GB;Chip: MTK Helio P10 8 nhân;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (26, N'Xiaomi Mi Mix', 4, 1, N'xiaomimimix.jpg', 1, 14000000, 2, N'Màn Hình: 6.4 inch (1920 x 1080 pixels);Ram: 6GB;Chip: Snapdragon 821;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (27, N'Xiaomi Mi Note 2', 4, 1, N'xiaomiminote2.jpg', 1, 9700000, 5, N'Màn Hình: 5.7 inch (1920 x 1080 pixels);Ram: 4/6GB;Chip: Snapdragon 821;Hệ Điều Hành: Andoid 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (28, N'Iphone SE', 2, 1, N'iphonese.jpg', 1, 8900000, 12, N'Màn Hình: 4 inch (1136 x 640 pixels);Ram: 2GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (29, N'Iphone 6s Plus', 2, 1, N'iphone6splus.jpg', 1, 14800000, 4, N'Màn Hình: 5.5 inch (1334 x 750 pixels);Ram: 2GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 10', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (30, N'Xiaomi Mi5s Plus', 4, 1, N'xiaomimi5splus.jpg', 1, 8900000, 6, N'Màn Hình: 5.7 inch (1920 x 1080 pixels);Ram: 4/6GB;Chip: Snapdragon 821;Hệ Điều Hành: Android 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (31, N'Xiaomi Mi5s', 4, 1, N'xiaomimi5s.jpg', 1, 10000000, 2, N'Màn Hình: 5.15 inch (1920 x 1080 pixels);Ram: 3/4GB;Chip: Snapdragon 821;Hệ Điều Hành: Android 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (32, N'LG G5', 7, 1, N'lgg5.jpg', 1, 7800000, 6, N'Màn Hình: 5.3 inch (2560 x 1440 pixels);Ram: 4GB;Chip: Snapdragon 820;Hệ Điều Hành: Android 6.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (33, N'iPad Pro Wifi 32GB', 2, 2, N'ipadprowifi32gb.jpg', 1, 16500000, 12, N'Màn Hình: 12.9 inch (2560 x 1440 pixels);Ram: 4GB;Chip: Apple A9 2 nhân;Hệ Điều Hành: IOS 9.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (34, N'iPad Air 2 Cellula 128GB', 2, 2, N'ipadair2cellular128gbnowatermark.jpg', 1, 15490000, 10, N'Màn Hình: 9.7 inch (2560 x 1440 pixels);Ram: 2GB;Chip: Tripe Core 1.5Ghz;Hệ Điều Hành: IOS 8.0', NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (35, N'1', 1, 1, N'1', 1, 1, 1, N'1', N'1', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (36, N'lg', 4, 3, N'a.png', 1, 20000000, 2, N'sd', N'new', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (41, N'lg', 2, 2, N'b', 1, 10000000, 1, N'we', N'new', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaHang], [MaLoai], [HinhAnh], [TinhTrang], [GiaBan], [SoLuong], [ThongTin], [GhiChu], [BiXoa]) VALUES (42, N'1', 1, 1, N'1', 1, 1, 1, N'1', N'1', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [MaLoaiTK], [HoTen], [Email], [SoDienThoai], [NgaySinh], [MaTinhThanh], [BiXoa]) VALUES (1, N'admin', N'25f9e794323b453885f5181f1b624d0b', 1, N'Huỳnh Vinh Phát', N'Theshadow159@yahoo.com', N'01212130469', CAST(N'1996-11-08' AS Date), 63, 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [MaLoaiTK], [HoTen], [Email], [SoDienThoai], [NgaySinh], [MaTinhThanh], [BiXoa]) VALUES (2, N'user1', N'25f9e794323b453885f5181f1b624d0b', 2, N'user1', N'abc@yahoo.com', N'01212121212', CAST(N'1995-07-13' AS Date), 61, 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTaiKhoan], [MatKhau], [MaLoaiTK], [HoTen], [Email], [SoDienThoai], [NgaySinh], [MaTinhThanh], [BiXoa]) VALUES (3, N'user2', N'25f9e794323b453885f5181f1b624d0b', 2, N'user23', N'xyz@yahoo.com', N'01313131313', CAST(N'1995-08-14' AS Date), 23, 0)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[TinhThanh] ON 

INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (1, N'An Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (2, N'Bà Rịa - Vùng Tàu')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (3, N'Bắc Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (5, N'Bạc Liêu')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (7, N'Bến Tre')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (8, N'Bình Định')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (9, N'Bình Dương')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (10, N'Bình Phước')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (12, N'Cà Mau')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (13, N'Cao Bằng')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (14, N'Đắk Lắk')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (15, N'Đắk Nông')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (16, N'Điện Biên')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (17, N'Đồng Nai')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (18, N'Đồng Tháp')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (19, N'Gia Lai')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (20, N'Hà Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (21, N'Hà Nam')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (22, N'Hà Tĩnh')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (23, N'Hải Dương')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (24, N'Hậu Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (25, N'Hòa Bình')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (26, N'Hưng Yên')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (27, N'Khánh Hòa')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (28, N'Kiên Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (29, N'Kon Tum')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (30, N'Lai Châu')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (31, N'Lâm Đồng')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (32, N'Lạng Sơn')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (33, N'Lào Cai')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (34, N'Long An')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (35, N'Nam Định')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (36, N'Nghệ An')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (37, N'Ninh Bình')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (38, N'Ninh Thuận')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (39, N'Phú Thọ')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (40, N'Quảng Bình')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (41, N'Quảng Nam')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (42, N'Quảng Ngãi')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (43, N'Quảng Ninh')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (44, N'Quảng Trị')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (45, N'Sóc Trăng')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (46, N'Sơn La')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (47, N'Tây Ninh')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (48, N'Thái Bình')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (49, N'Thái Nguyên')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (50, N'Thanh Hóa')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (51, N'Thừa Thiên Huế')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (52, N'Tiền Giang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (53, N'Trà Vinh')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (54, N'Tuyên Quang')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (55, N'Vĩnh Long')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (56, N'Vĩnh Phúc')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (57, N'Yên Bái')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (58, N'Phú Yên')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (59, N'Cần Thơ')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (60, N'Đà Nẵng')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (61, N'Hải Phòng')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (62, N'Hà Nội')
INSERT [dbo].[TinhThanh] ([MaTinhThanh], [TenTinhThanh]) VALUES (63, N'TP HCM')
SET IDENTITY_INSERT [dbo].[TinhThanh] OFF
SET IDENTITY_INSERT [dbo].[TinhTrangDH] ON 

INSERT [dbo].[TinhTrangDH] ([MaTinhTrang], [TenTinhTrang]) VALUES (1, N'Đang giao')
INSERT [dbo].[TinhTrangDH] ([MaTinhTrang], [TenTinhTrang]) VALUES (2, N'Đã giao')
INSERT [dbo].[TinhTrangDH] ([MaTinhTrang], [TenTinhTrang]) VALUES (3, N'Hủy')
INSERT [dbo].[TinhTrangDH] ([MaTinhTrang], [TenTinhTrang]) VALUES (4, N'Đang trong kho')
SET IDENTITY_INSERT [dbo].[TinhTrangDH] OFF
SET IDENTITY_INSERT [dbo].[TinhTrangSP] ON 

INSERT [dbo].[TinhTrangSP] ([MaTinhTrang], [TenTinhTrang]) VALUES (0, N'Hết hàng')
INSERT [dbo].[TinhTrangSP] ([MaTinhTrang], [TenTinhTrang]) VALUES (1, N'Còn hàng')
SET IDENTITY_INSERT [dbo].[TinhTrangSP] OFF
ALTER TABLE [dbo].[ChiTietSP]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSP_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietSP] CHECK CONSTRAINT [FK_ChiTietSP_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TaiKhoan]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TinhTrangDH] FOREIGN KEY([MaTinhTrang])
REFERENCES [dbo].[TinhTrangDH] ([MaTinhTrang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TinhTrangDH]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSP] FOREIGN KEY([MaHang])
REFERENCES [dbo].[HangSP] ([MaHang])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TinhTrangSP] FOREIGN KEY([TinhTrang])
REFERENCES [dbo].[TinhTrangSP] ([MaTinhTrang])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TinhTrangSP]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_LoaiTK] FOREIGN KEY([MaLoaiTK])
REFERENCES [dbo].[LoaiTK] ([MaLoaiTK])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_LoaiTK]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_TinhThanh] FOREIGN KEY([MaTinhThanh])
REFERENCES [dbo].[TinhThanh] ([MaTinhThanh])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_TinhThanh]
GO
USE [master]
GO
ALTER DATABASE [ShopDienThoai] SET  READ_WRITE 
GO
