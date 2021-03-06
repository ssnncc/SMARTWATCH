USE [TMDT]
GO
/****** Object:  Table [dbo].[Business]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Business](
	[ID] [varchar](60) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Business] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[ContentCategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Content_CreateDate_1]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Content_Status_1]  DEFAULT ((1)),
	[ViewCount] [int] NULL CONSTRAINT [DF_Content_ViewCount_1]  DEFAULT ((0)),
	[Active] [bit] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentCategory]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContentCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_ContentCategory_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ContentCategory_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_ContentCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GrantPermission]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrantPermission](
	[PermissionID] [bigint] NOT NULL,
	[GroupUserID] [bigint] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_GrantPermission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC,
	[GroupUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUser](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Desciption] [nvarchar](500) NULL,
 CONSTRAINT [PK_GroupUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[ShipName] [nvarchar](60) NULL,
	[ShipPhone] [nvarchar](20) NULL,
	[ShipAddress] [nvarchar](500) NULL,
	[ShipCreateDate] [datetime] NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[PaymentID] [bigint] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permission](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](260) NULL,
	[Desciption] [nvarchar](250) NULL,
	[BusinessID] [varchar](60) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MetaTitle] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_Producer_CreateDate]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[MetaDescriptions] [nchar](250) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Producer_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [ntext] NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImage] [xml] NULL,
	[Quantity] [int] NULL CONSTRAINT [DF_Product_Quantity_1]  DEFAULT ((0)),
	[ProductCategoryID] [bigint] NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_Product_CreateDate_1]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL CONSTRAINT [DF_Product_Status_1]  DEFAULT ((1)),
	[ProducerID] [bigint] NULL,
	[Cord] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_ProductCategory_CreateDate_1]  DEFAULT (getdate()),
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[Descriptions] [nchar](250) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_ProductCategory_Status_1]  DEFAULT ((1)),
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProductID] [bigint] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slide]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[Image] [nvarchar](200) NULL,
	[Status] [bit] NULL,
	[TypeID] [bigint] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SlideType]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_SlideType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 01-Dec-20 3:18:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](52) NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [varchar](100) NULL CONSTRAINT [DF_User_Avatar]  DEFAULT ('/Data/images/Avatar/avatar_default.png'),
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Genre] [nvarchar](5) NULL,
	[BirthDay] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_User_CreateDate_1]  DEFAULT (getdate()),
	[GroupUserID] [bigint] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModyfiedDate] [datetime] NULL,
	[ModyfiedBy] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'BusinessController', N'Quản lý nghiệp vụ tài khoản')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'ContentCategoryController', N'Quản lý danh mục bài viết')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'ContentController', N'Quản lý bài viết ')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'FeedBackController', N'Quản lý phản hồi')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'GrantPermissionController', N'Hành động ')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'GroupUserController', N'Quản lý quyền tài khoản')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'LoginController', N'Đăng nhập')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'OrderController', N'Đơn đặt hàng')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'PermissionController', N'Quản lý nghiệp vụ')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'PriceController', N'Quản lý giá sản phẩm')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'ProducerController', N'Quả lý nhà sản xuất')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'ProductCategoryController', N'Quản lý danh mục sản phẩm')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'ProductController', N'Quản lý sản phẩm')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'SaleController', N'Quản lý giảm giá sản phẩm')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'SlideController', N'Quản lý slide hình ảnh')
INSERT [dbo].[Business] ([ID], [Name]) VALUES (N'UserController', N'Quản lý tài khoản')
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [ContentCategoryID], [Detail], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status], [ViewCount], [Active]) VALUES (5, N'Giới thiệu thương hiệu đồng hồ AVI-8 & bộ sưu tập đầy nam tính', N'gioi-thieu-dong-ho', N'Đồng hồ phi công AVI-8 nổi tiếng đã lâu nhưng đến nay vẫn chưa có 1 nơi nào phân phối chính hãng tại Việt Nam và giờ AVI 8 đã xuất hiện tại PNJ Watch. Cùng PNJ Watch note lại những thông tin về thương...', N'/Data/images/Slide/slider1.jpg', 6, N'<p>Được th&agrave;nh lập từ năm 2012, thương hiệu AVI-8 lấy cảm hứng thiết kế bắt nguồn từ sự kết hợp giữa c&aacute;c phi c&ocirc;ng v&agrave; kỹ sư kh&ocirc;ng qu&acirc;n c&ugrave;ng với nh&agrave; sản xuất đồng hồ danh tiếng Solar Time. Sự ch&uacute; trọng trong từng thiết kế, chi tiết, c&ugrave;ng với niềm đam m&ecirc;, l&agrave; kết quả dẫn đến sự th&agrave;nh c&ocirc;ng trong c&acirc;u chuyện của AVI-8. Mỗi bộ sưu tập l&agrave; một sự t&ocirc;n k&iacute;nh r&otilde; r&agrave;ng đối với c&aacute;c m&aacute;y bay, con người v&agrave; lịch sử h&agrave;ng kh&ocirc;ng qu&acirc;n sự, l&agrave; lời tường thuật về c&acirc;u chuyện v&agrave; cảm hứng để l&agrave;m h&agrave;i l&ograve;ng v&agrave; thu h&uacute;t người đeo đồng hồ.</p>
', CAST(N'2020-07-17 15:45:25.103' AS DateTime), N'admin', CAST(N'2020-09-02 22:30:31.657' AS DateTime), NULL, NULL, 1, 8, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [ContentCategoryID], [Detail], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status], [ViewCount], [Active]) VALUES (6, N'Đồng hồ Rose Gold: Điểm nhấn sang trọng trên cổ tay', N'diem-nhan-sang-trong', N'Có khả năng ‘đốn tim’ phái đẹp trong tích tắc, rose gold luôn nằm trong top màu sắc được yêu thích nhất. Vậy nàng còn chờ gì mà chưa sở hữu một chiếc đồng hồ rose gold thời trang? Nếu như sắc hồng tượng trưng...', N'/Data/images/Slide/slider2.jpg', 5, N'Nếu như sắc hồng tượng trưng cho vẻ đẹp dịu dàng, nữ tính thì gam vàng lại gợi đến hình ảnh của sự xa hoa, sang trọng. Đặc biệt, màn kết hợp giữa hai tông màu này đã tạo thành một xu hướng thời trang khiến bao trái tim phải rung rinh, đó chính là tông màu rose-gold. Với sức hút mạnh mẽ, những chiếc đồng hồ đeo tay nữ rose-gold đã tạo hiệu ứng, trở thành món phụ kiện thời gian không thể thiếu của những quý cô hiện đại và phong cách.', CAST(N'2020-07-17 15:45:25.103' AS DateTime), N'admin', CAST(N'2020-07-17 15:45:25.103' AS DateTime), NULL, NULL, 1, 40, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [ContentCategoryID], [Detail], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status], [ViewCount], [Active]) VALUES (7, N'ĐỒNG HỒ ĐEO TAY – QUÀ TẶNG VU LAN LƯU GIỮ KHOẢNH KHẮC THỜI GIAN', N'dong-ho-deo-tay-qua-tang-vu-lan-lu-giu-khonh-khac-thoi-gian', N'QUÀ TẶNG BỐ MẸ NHÂN NGÀY LỄ VU LAN BÁO HIẾU Ý NGHĨA', N'/Data/images/Slide/bn1.jpg', 5, N'<p>Đối với rất nhiều bố mẹ, họ cũng c&oacute; nhiều đam m&ecirc; v&agrave; kh&aacute;t vọng muốn thực thi, tuy nhi&ecirc;n tuổi thanh xu&acirc;n đ&atilde; qua c&oacute; những mưu cầu sở th&iacute;ch ri&ecirc;ng kh&oacute; thực hiện được. Đơn giản như việc sở hữu một chiếc&nbsp;<a href="https://donghohaitrieu.com/dong-ho-deo-tay-chinh-hang" rel="noopener noreferrer" target="_blank">đồng hồ ch&iacute;nh h&atilde;ng</a>.</p>

<p>●&nbsp;&nbsp;Nhưng với c&aacute;i tuổi của m&igrave;nh để bắt kịp thị trường c&ocirc;ng nghệ, cập nhật những nơi b&aacute;n h&agrave;ng ch&iacute;nh h&atilde;ng uy t&iacute;n hơi kh&oacute; khăn. V&igrave; thế, trong dịp lễ Vu Lan n&agrave;y h&atilde;y d&agrave;nh tặng cho bố mẹ một cặp đồng hồ đeo tay ch&iacute;nh h&atilde;ng ngay nh&eacute;.</p>

<p>●&nbsp;&nbsp;Một chiếc đồng hồ đeo tay c&oacute; thể gi&uacute;p bố mẹ kiểm so&aacute;t thời gian, nhắc nhở lịch hẹn,&hellip; hoặc với một chiếc đồng hồ đeo tay để đo sức khỏe, nhịp tim,&hellip; hằng ng&agrave;y cho bố mẹ.</p>

<p>●&nbsp;&nbsp;Một số thương hiệu gợi &yacute; cho người trung ni&ecirc;n như sau:&nbsp;<a href="https://donghohaitrieu.com/brand/Citizen" rel="noopener noreferrer" target="_blank">Citizen</a>&nbsp;(hiện đại, phong c&aacute;ch),&nbsp;<a href="https://donghohaitrieu.com/brand/seiko" rel="noopener noreferrer" target="_blank">Seiko</a>&nbsp;(tinh tế, chuy&ecirc;n nghiệp),&nbsp;<a href="https://donghohaitrieu.com/brand/tissot" rel="noopener noreferrer" target="_blank">Tissot</a>&nbsp;(sang trọng, lịch thiệp), Doxa (đẳng cấp, thượng lưu),&hellip; v&agrave; hơn 3.000 sự lựa chọn kh&aacute;c đang sẵn c&oacute; tại Đồng Hồ Hải Triều.</p>
', CAST(N'2020-08-31 20:07:43.427' AS DateTime), N'admin', NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [Description], [Image], [ContentCategoryID], [Detail], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status], [ViewCount], [Active]) VALUES (9, N'CÁC LOẠI DÂY ĐỒNG HỒ, ƯU VÀ NHƯỢC ĐIỂM CỦA TỪNG LOẠI DÂY', N'cac-loi-day-dong-ho-u-va-nhoc-diem-ca-tung-loi-day', N'Hiện nay, đồng hồ đeo tay trở thành những món đồ trang sức không thể thiếu đối với mọi người giúp thể hiện đẳng cấp, sở thích, phong cách của người sử dụng', N'/Data/images/Slide/bn3.jpg', 5, N'<h3>D&Acirc;Y ĐỒNG HỒ KIM LOẠI</h3>

<p>Kim loại l&agrave; chất liệu được sử dụng hầu hết cho c&aacute;c d&ograve;ng đồng hồ tr&ecirc;n thị trường,&nbsp;<strong>ưu điểm</strong>&nbsp;của d&acirc;y đồng hồ kim loại l&agrave; sự bền bỉ, chắc chắn, chống chịu ăn m&ograve;n cho thời gian sử dụng l&ecirc;n đến chục năm. Với những người hay&nbsp;<strong>tiếp x&uacute;c với nước, c&aacute;c loại h&oacute;a chất hoặc tay ra nhiều mồ h&ocirc;i v&agrave; hoạt động trong m&ocirc;i trường vận động nhiều</strong>&nbsp;th&igrave; d&acirc;y kim loại l&agrave; lựa chọn th&iacute;ch hợp nhất đảm bảo qu&aacute; tr&igrave;nh sử dụng được l&acirc;u d&agrave;i.</p>

<h3><strong>D&Acirc;Y ĐỒNG HỒ BẰNG DA</strong></h3>

<p>D&acirc;y da thường được sử dụng cho mẫu đồng hồ Dress Watch mang tới sự thanh lịch v&agrave; c&oacute; ch&uacute;t ho&agrave;i cổ. Ưu điểm nổi bật của loại d&acirc;y da khi bạn đeo rất &ocirc;m tay, cho cảm gi&aacute;c &ecirc;m &aacute;i lu&ocirc;n mang đến sự thoải m&aacute;i cho kh&aacute;ch h&agrave;ng. Nhiều m&agrave;u sắc v&agrave; đa dạng kiểu d&aacute;ng l&agrave; lợi thế của d&acirc;y da đồng hồ, kh&aacute;ch h&agrave;ng c&oacute; thể t&ugrave;y biến dễ d&agrave;ng kết hợp trang phục. Th&iacute;ch hợp cho người ở xứ lạnh tạo khả năng giữ ấm tốt hơn so với d&acirc;y kim loại.</p>
', CAST(N'2020-09-02 22:29:55.383' AS DateTime), N'admin', NULL, NULL, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[ContentCategory] ON 

INSERT [dbo].[ContentCategory] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status]) VALUES (5, N'Tin mới', N'tin-moi', CAST(N'2020-07-19 22:34:22.983' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[ContentCategory] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status]) VALUES (6, N'Tin nổi bật', N'tin-noi-bat', CAST(N'2020-07-20 15:26:21.200' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ContentCategory] OFF
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status], [UserID]) VALUES (3, N'Vũ Vũ', N'(097) 601-2722', N'vuvu8200@gmail.com', N'D1/6 Đường 385, Tăng Nhơn Phú A, Quận 9, Tp.HCM', N'Giao hàng nhanh, đóng gói chắc chắn.', CAST(N'2020-08-25 01:16:17.140' AS DateTime), 0, NULL)
INSERT [dbo].[FeedBack] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status], [UserID]) VALUES (5, N'Trần Bò', N'(123) 456-7890', N'vuvu8200@gmail.com', N'D1/6 Đường 385', N'Giao hàng chậm', CAST(N'2020-08-31 20:12:47.983' AS DateTime), 0, NULL)
INSERT [dbo].[FeedBack] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status], [UserID]) VALUES (6, N'Vũ Thị Ngoãn', N'(123) 456-7899', N'ssnnccvtn@gmail.com', N'D1/6 Đường 385', N'Giao hàng chậm', CAST(N'2020-09-02 22:41:06.563' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (3, 3, N'')
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (4, 1, N'')
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (12, 1, N'')
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (14, 1, N'')
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (14, 3, N'')
INSERT [dbo].[GrantPermission] ([PermissionID], [GroupUserID], [Description]) VALUES (46, 3, N'')
SET IDENTITY_INSERT [dbo].[GroupUser] ON 

INSERT [dbo].[GroupUser] ([ID], [Name], [Desciption]) VALUES (1, N'Thành viên', N'Thành viên đăng ký ')
INSERT [dbo].[GroupUser] ([ID], [Name], [Desciption]) VALUES (2, N'Quản trị viên', N'Quản trị web')
INSERT [dbo].[GroupUser] ([ID], [Name], [Desciption]) VALUES (3, N'Nhân viên', N'Nhân viên')
SET IDENTITY_INSERT [dbo].[GroupUser] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (49, NULL, N'Vũ Thị Ngoan', N'(123) 456-7890', N'D1/6 TP.HCM', CAST(N'2020-08-17 15:02:02.670' AS DateTime), N'ssnnccvtn@gmail.com', 2, 1)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (53, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-25 08:46:01.043' AS DateTime), N'vuvu8200@gmail.com', 2, 1)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (54, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-25 08:46:20.610' AS DateTime), N'vuvu8200@gmail.com', 2, -1)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (55, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-25 18:47:59.177' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (56, NULL, N'VuVu', N'(123) 456-7890', N'D1/5', CAST(N'2020-08-29 02:17:10.607' AS DateTime), N'ssnnccvtn@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (57, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-29 09:41:13.093' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (58, NULL, N'Vũ Thị Noãn', N'(123) 456-45678', N'D1/6 Đường', CAST(N'2020-08-31 13:08:31.593' AS DateTime), N'vuvu8200@gmail.com', 2, 1)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (59, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-31 13:11:22.307' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (60, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-31 20:42:04.710' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (61, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-31 20:42:09.500' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (62, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-08-31 20:42:59.843' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (63, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-09-02 16:05:15.063' AS DateTime), N'vuvu8200@gmail.com', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (64, 16, N'Lê Vũ Trần Bò', N'(123) 456-7890', N'D1/6 Đường 385', CAST(N'2020-09-03 09:06:53.780' AS DateTime), N'N16DCCN105@student.ptithcm.edu.vn', 2, 0)
INSERT [dbo].[Order] ([ID], [UserID], [ShipName], [ShipPhone], [ShipAddress], [ShipCreateDate], [ShipEmail], [PaymentID], [Status]) VALUES (65, 15, N'Vũ Vũ', N'(097) 601-2722', N'D1/6 Đường 385', CAST(N'2020-09-03 13:09:27.553' AS DateTime), N'vuvu8200@gmail.com', 2, 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (9, 55, 1, CAST(1400000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (9, 63, 1, CAST(2000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (9, 65, 5, CAST(1000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (10, 60, 1, CAST(2000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (13, 57, 1, CAST(3400000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (13, 59, 2, CAST(3400000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (18, 55, 1, CAST(2340000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (18, 59, 1, CAST(2340000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (18, 64, 1, CAST(1000000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (19, 49, 5, CAST(4530000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (19, 62, 1, CAST(4530000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (20, 53, 1, CAST(6420000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (20, 56, 1, CAST(6420000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price], [Status]) VALUES (20, 58, 1, CAST(6420000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [Name], [Description]) VALUES (1, N'Thanh toán online', NULL)
INSERT [dbo].[Payment] ([ID], [Name], [Description]) VALUES (2, N'Chưa thanh toán', NULL)
INSERT [dbo].[Payment] ([ID], [Name], [Description]) VALUES (4, N'Đã thanh toán', NULL)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (1, N'BusinessController-Index', N'Danh sách các quyền hạn', N'BusinessController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (2, N'BusinessController-Update', N'Cập nhập quyền hạn', N'BusinessController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (3, N'ContentCategoryController-Index', N'Danh sách danh mục bài viết ', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (4, N'ContentController-ChangeActive', N'Cấp phép hiển thị', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (5, N'ContentController-ChangeStatus', N'Xóa tạm', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (7, N'ContentController-Create', N'Thêm bài viết (lưu)', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (8, N'ContentController-Delete', N'Xóa bài viết ', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (11, N'ContentController-DeleteSelectedRecycelBin', N'Chưa có mô tả', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (12, N'ContentController-Edit', N'Sửa bài viết', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (14, N'ContentController-Index', N'Danh sách bài viết', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (15, N'ContentController-RecycelBin', N'Thùng rác ', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (16, N'ContentController-setViewBag', N'Hiển thị tên', N'ContentController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (17, N'GroupUserController-Index', N'Xem danh sách các nhóm người dùng', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (22, N'PermissionController-Index', N'Xem danh sách chức năng ', N'PermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (23, N'ProductController-ChangeStatus', N'Xóa tạm sản phẩm', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (24, N'ProductController-Create', N'Thêm sản phẩm ', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (25, N'ProductController-Create', N'Thêm sản phẩm (lưu)', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (26, N'ProductController-Delete', N'Xóa sản phẩm', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (27, N'ProductController-DeleteSelected', N'Xóa tạm nhiều sản phẩm ', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (28, N'ProductController-DeleteSelectedDb', N'Xóa nhiều sản phẩm ', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (29, N'ProductController-DeleteSelectedRecycelBin', N'Hủy xóa tạm nhiều dòng', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (30, N'ProductController-Edit', N'Sửa sản phẩm ', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (31, N'ProductController-Edit', N'Sửa sản phẩm (lưu)', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (32, N'ProductController-Index', N'Xem danh sách sản phẩm', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (33, N'ProductController-RecycelBin', N'Xem danh sách các sản phẩm xóa tạm', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (34, N'ProductController-setProducer', N'Danh mục nhà sản xuất', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (35, N'ProductController-setViewBag', N'Danh mục sản phẩm', N'ProductController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (36, N'UserController-ChangeActive', N'Cấp phép truy cập', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (37, N'UserController-ChangeStatus', N'Xóa tạm', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (38, N'UserController-Create', N'Tạo tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (39, N'UserController-Create', N'Tạo tài khoản (lưu)', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (40, N'UserController-Delete', N'Xóa tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (41, N'UserController-DeleteSelected', N'Xóa tạm nhiều tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (42, N'UserController-DeleteSelectedDb', N'Xóa nhiều tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (43, N'UserController-DeleteSelectedRecycelBin', N'Hủy xóa tạm nhiều dòng', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (44, N'UserController-Edit', N'Cập nhập tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (45, N'UserController-Edit', N'Cập nhập tài khoản (lưu)', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (46, N'UserController-Index', N'Xem danh sách tài khoản', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (47, N'UserController-RecycelBin', N'Danh sách tài khoản xóa tạm', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (48, N'UserController-setViewBag', N'Xem quyền tài khoản ', N'UserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (50, N'BusinessController-Edit', N'Sửa quyền hạn', N'BusinessController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (51, N'PermissionController-Detail', N'Xem danh sách chi tiết chức năng ', N'PermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (52, N'PermissionController-Edit', N'Sừa chức năng ', N'PermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (53, N'PermissionController-Edit', N'Sửa chức năng (lưu)', N'PermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (54, N'GrantPermissionController-GetPermission', N'Lấy danh sách các hành động', N'GrantPermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (55, N'GrantPermissionController-Index', N'Cài đặt quyền cho tài khoản', N'GrantPermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (56, N'GrantPermissionController-UpdatePermission', N'Cập nhập lại các hành động của người dùng', N'GrantPermissionController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (57, N'GroupUserController-Create', N'Thêm nhóm người dùng mới ', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (58, N'GroupUserController-Create', N'Thêm nhóm người dùng mới (lưu)', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (59, N'GroupUserController-Delete', N'Xóa nhóm người dùng', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (60, N'GroupUserController-Edit', N'Cập nhập nhóm người dùng', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (61, N'GroupUserController-Edit', N'Cập nhập nhóm người dùng (lưu)', N'GroupUserController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (65, N'BusinessController-Delete', N'Xóa nghiệp vụ', N'BusinessController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (88, N'ContentCategoryController-ChangeStatus', N'Xóa tạm', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (89, N'ContentCategoryController-Create', N'Tạo', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (92, N'ContentCategoryController-DeleteSelected', N'Xóa tạm nhiều', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (93, N'ContentCategoryController-DeleteSelectedDb', N'Xóa nhiều', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (94, N'ContentCategoryController-DeleteSelectedRecycelBin', N'Hủy xóa tạm nhiều', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (96, N'ContentCategoryController-Edit', N'Cập nhật (lưu)', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (97, N'ContentCategoryController-RecycelBin', N'Danh sách xóa tạm', N'ContentCategoryController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (100, N'LoginController-Index', N'Xem danh sách tài khoản', N'LoginController')
INSERT [dbo].[Permission] ([ID], [PermissionName], [Desciption], [BusinessID]) VALUES (103, N'OrderController-Index', N'Xem danh sách đơn hàng', N'OrderController')
SET IDENTITY_INSERT [dbo].[Permission] OFF
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status]) VALUES (1, N'CASIO', N'casio', CAST(N'2020-07-21 10:43:15.020' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Producer] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status]) VALUES (2, N'CITIZENT', N'citizent', CAST(N'2020-07-21 10:43:15.020' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Producer] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status]) VALUES (3, N'SEIKO', N'seiko', CAST(N'2020-07-21 10:43:15.020' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Producer] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [MetaDescriptions], [Status]) VALUES (4, N'TISSOT', N'tissot', CAST(N'2020-07-21 10:43:15.020' AS DateTime), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Producer] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (9, N'Đồng hồ Casio CS03', N'casio-cs03', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/C03.jpg', NULL, 90, 9, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 1, N'Dây cao su', N'Nâu', N'Nhỏ', CAST(1400000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (10, N'Đồng hồ Casio CS04', N'casio-cs04', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/C04.jpg', NULL, 95, 8, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-25 08:37:54.957' AS DateTime), NULL, 1, 1, N'Dây kim loại', N'Vàng', N'Vừa', CAST(2000000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (13, N'Đồng hồ Casio CS05', N'casio-cs05', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/C05.jpg', NULL, 88, 8, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 1, N'Dây kim loại', N'Trắng', N'Lớn', CAST(3400000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (14, N'Đồng hồ Tissot T03', N'tissot-t03', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/OR03.jpg', NULL, 95, 9, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 4, N'Dây kim loại', N'Bạch kim', N'Nhỏ', CAST(3450000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (15, N'Đồng hồ Tissot T02', N'tissot-t02', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/OR02.jpg', NULL, 100, 9, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 4, N'Dây kim loại', N'Đen', N'Vừa', CAST(5400000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (16, N'Đồng hồ Tissot T01', N'tissot-t01', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/OR01.jpg', NULL, 99, 8, CAST(N'2020-07-10 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 4, N'Dây kim loại', N'Đen ', N'Vừa', CAST(2340000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (18, N'Đồng hồ Citizen CT02', N'citizent-ct02', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/CT02.jpg', NULL, 186, 9, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 2, N'Dây kim loại', N'Trắng', N'Lớn', CAST(2340000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (19, N'Đồng hồ Citizen CT03', N'citizent-ct03', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/CT03.jpg', NULL, 48, 8, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-25 08:37:54.620' AS DateTime), NULL, 1, 2, N'Dây kim loại', N'Vàng', N'Lớn', CAST(4530000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (20, N'Đồng hồ Citizen CT04', N'citizent-ct04', N'<p>Đồng hồ thời trang</p>
', N'/Data/images/Watch/CT04.jpg', NULL, 93, 8, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, CAST(N'2020-08-21 00:00:00.000' AS DateTime), NULL, 1, 2, N'Dây Da', N'Vàng', N'Vừa', CAST(6420000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (45, N'Đồng hồ  Casio CS01', N'dong-ho-casio-cs01', N'Đồng hồ thời trang', N'/Data/images/Product/C01.jpg', N'<Images />', 100, 10, CAST(N'2020-09-03 00:03:57.863' AS DateTime), NULL, NULL, NULL, 1, 1, N'Dây cao su', N'Trắng', N'Lớn', CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (46, N'Đồng hồ Seiko CK01', N'dong-ho-seiko-ck01', N'Đồng hồ thời trang', N'/Data/images/Product/SK01.jpg', N'<Images />', 100, 10, CAST(N'2020-09-03 00:10:44.453' AS DateTime), NULL, NULL, NULL, 1, 3, N'Dây kim loại', N'Bạch kim', N'Vừa', CAST(3100000 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [MetaTitle], [Description], [Image], [MoreImage], [Quantity], [ProductCategoryID], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Status], [ProducerID], [Cord], [Color], [Size], [Price]) VALUES (47, N'Đồng hồ Seiko CK02', N'dong-ho-seiko-ck02', N'Đồng hồ thời trang', N'/Data/images/Product/SK02.jpg', N'<Images />', 100, 9, CAST(N'2020-09-03 08:58:01.043' AS DateTime), NULL, CAST(N'2020-09-03 09:43:23.163' AS DateTime), NULL, 1, 3, N'Dây Da', N'Nâu', N'Nhỏ', CAST(2000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Descriptions], [Status]) VALUES (8, N'Đồng hồ nữ', N'dong-ho-nu', CAST(N'2020-08-14 16:57:01.553' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Descriptions], [Status]) VALUES (9, N'Đồng hồ nam', N'dong-ho-nam', CAST(N'2020-08-14 16:57:01.553' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [CreateDate], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Descriptions], [Status]) VALUES (10, N'Đồng hồ cặp', N'dong-ho-cap', CAST(N'2020-08-14 16:57:01.553' AS DateTime), NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([ID], [Price], [BeginDate], [EndDate], [ProductID]) VALUES (31, CAST(1000000 AS Decimal(18, 0)), CAST(N'2020-09-01 00:00:00.000' AS DateTime), CAST(N'2020-10-10 00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Sales] ([ID], [Price], [BeginDate], [EndDate], [ProductID]) VALUES (32, CAST(1500000 AS Decimal(18, 0)), CAST(N'2020-09-01 00:00:00.000' AS DateTime), CAST(N'2020-10-10 00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Sales] ([ID], [Price], [BeginDate], [EndDate], [ProductID]) VALUES (34, CAST(1500000 AS Decimal(18, 0)), CAST(N'2020-09-01 00:00:00.000' AS DateTime), CAST(N'2020-10-10 00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Sales] ([ID], [Price], [BeginDate], [EndDate], [ProductID]) VALUES (35, CAST(1000000 AS Decimal(18, 0)), CAST(N'2020-08-09 00:00:00.000' AS DateTime), CAST(N'2020-10-15 00:00:00.000' AS DateTime), 9)
SET IDENTITY_INSERT [dbo].[Sales] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Description], [CreateDate], [Image], [Status], [TypeID]) VALUES (1, N'Đồng hồ Casio', CAST(N'2020-06-28 16:53:12.327' AS DateTime), N'/Data/images/Slide/bn6.jpg', 1, 1)
INSERT [dbo].[Slide] ([ID], [Description], [CreateDate], [Image], [Status], [TypeID]) VALUES (2, N'Đồng hồ Seiko', CAST(N'2020-06-28 16:53:12.327' AS DateTime), N'/Data/images/Slide/bn7.jpg', 1, 1)
INSERT [dbo].[Slide] ([ID], [Description], [CreateDate], [Image], [Status], [TypeID]) VALUES (3, N'Đồng hồ Citizent', CAST(N'2020-06-28 16:53:12.327' AS DateTime), N'/Data/images/Slide/1.jpg', 1, 2)
INSERT [dbo].[Slide] ([ID], [Description], [CreateDate], [Image], [Status], [TypeID]) VALUES (4, N'Đồng hồ chính hãng', CAST(N'2017-08-28 23:24:31.703' AS DateTime), N'/Data/images/Slide/2.jpg', 1, 2)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[SlideType] ON 

INSERT [dbo].[SlideType] ([ID], [Name], [Description]) VALUES (1, N'Trang chính', NULL)
INSERT [dbo].[SlideType] ([ID], [Name], [Description]) VALUES (2, N'Trang sản phẩm chính', NULL)
INSERT [dbo].[SlideType] ([ID], [Name], [Description]) VALUES (4, N'Trang sản phẩm phụ', NULL)
SET IDENTITY_INSERT [dbo].[SlideType] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Avatar], [Address], [Email], [Genre], [BirthDay], [Phone], [CreateDate], [GroupUserID], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Active], [Status]) VALUES (1, N'admin', N'3HhxGocas55cs8Bct+/O3Q==', N'Vũ Vũ', N'/Data/images/Avatar/avatar_default.png', N'D1/6 Đường 385 Tăng Nhơn Phú A Quận 9', N'ssnnccvtn@gmail.com', N'Nữ', CAST(N'1998-04-07' AS Date), N'(097) 601-2722', CAST(N'2020-08-14 16:57:01.553' AS DateTime), 2, NULL, CAST(N'2020-08-22 17:38:42.347' AS DateTime), NULL, 1, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Avatar], [Address], [Email], [Genre], [BirthDay], [Phone], [CreateDate], [GroupUserID], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Active], [Status]) VALUES (5, N'sa', N'3HhxGocas55cs8Bct+/O3Q==', N'Trần Bò', N'/Data/images/Avatar/avatar_default.png', N'D1/6 Đường 385 Tăng Nhơn Phú A Quận 9', N'vungoan722@gmail.com', N'Nam', CAST(N'2019-08-05' AS Date), N'(012) 345-6789', CAST(N'2020-08-14 16:57:01.553' AS DateTime), 3, NULL, CAST(N'2020-09-03 08:39:23.167' AS DateTime), NULL, 1, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Avatar], [Address], [Email], [Genre], [BirthDay], [Phone], [CreateDate], [GroupUserID], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Active], [Status]) VALUES (15, N'VuVu', N'3HhxGocas55cs8Bct+/O3Q==', N'Vũ Vũ', N'/Data/images/Avatar/avatar_default.png', N'D1/6 Đường 385', N'vuvu8200@gmail.com', N'Nữ', CAST(N'1998-04-07' AS Date), N'(097) 601-2722', CAST(N'2020-08-23 09:41:01.007' AS DateTime), 1, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Avatar], [Address], [Email], [Genre], [BirthDay], [Phone], [CreateDate], [GroupUserID], [CreateBy], [ModyfiedDate], [ModyfiedBy], [Active], [Status]) VALUES (16, N'BoBo', N'3HhxGocas55cs8Bct+/O3Q==', N'Lê Vũ Trần Bò', N'/Data/images/Avatar/avatar_default.png', N'D1/6 Đường 385', N'N16DCCN105@student.ptithcm.edu.vn', N'Nam', CAST(N'2002-08-08' AS Date), N'(123) 456-7890', CAST(N'2020-08-25 01:27:10.497' AS DateTime), 1, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Email]    Script Date: 01-Dec-20 3:18:49 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Username]    Script Date: 01-Dec-20 3:18:49 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentCategory] FOREIGN KEY([ContentCategoryID])
REFERENCES [dbo].[ContentCategory] ([ID])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_ContentCategory]
GO
ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_User]
GO
ALTER TABLE [dbo].[GrantPermission]  WITH CHECK ADD  CONSTRAINT [FK_GrantPermission_GroupUser] FOREIGN KEY([GroupUserID])
REFERENCES [dbo].[GroupUser] ([ID])
GO
ALTER TABLE [dbo].[GrantPermission] CHECK CONSTRAINT [FK_GrantPermission_GroupUser]
GO
ALTER TABLE [dbo].[GrantPermission]  WITH CHECK ADD  CONSTRAINT [FK_GrantPermission_Permission] FOREIGN KEY([PermissionID])
REFERENCES [dbo].[Permission] ([ID])
GO
ALTER TABLE [dbo].[GrantPermission] CHECK CONSTRAINT [FK_GrantPermission_Permission]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payment] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Business] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Business] ([ID])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Business]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([ProducerID])
REFERENCES [dbo].[Producer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Product1]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_SlideType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[SlideType] ([ID])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_SlideType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_GroupUser] FOREIGN KEY([GroupUserID])
REFERENCES [dbo].[GroupUser] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_GroupUser]
GO
