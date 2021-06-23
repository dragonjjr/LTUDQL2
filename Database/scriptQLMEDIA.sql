USE [QLMEDIA]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Image] [nvarchar](max) NULL,
	[ModuleAccount] [nvarchar](50) NULL,
	[LevelAccount] [int] NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[CreditCardNumber] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[TaxCode] [nchar](10) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KindOfVideo]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KindOfVideo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeVideo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListMediaLike]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMediaLike](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
 CONSTRAINT [PK_ListMediaLike] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListMediaView]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMediaView](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
	[Views] [int] NULL,
	[CompleteTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_ListMediaView] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media](
	[Describe] [nvarchar](max) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Time] [nvarchar](50) NULL,
	[Directors] [nchar](50) NULL,
	[Source] [nvarchar](max) NULL,
	[PostedDate] [datetime] NULL,
	[Actor] [nvarchar](max) NULL,
	[IMDB] [float] NULL,
	[Likes] [int] NULL,
	[Genre] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Media_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MyPlayList]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyPlayList](
	[IdAccount] [int] NOT NULL,
	[IdProfile] [int] NOT NULL,
	[IdMedia] [int] NOT NULL,
 CONSTRAINT [PK_MyPlayList] PRIMARY KEY CLUSTERED 
(
	[IdAccount] ASC,
	[IdProfile] ASC,
	[IdMedia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentHistory]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentHistory](
	[IdAccount] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Money] [float] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PaymentHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 6/23/2021 7:42:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[IdAccount] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Profile_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (1, N'sdsadfas', N'dasda', N'gsdgsd', N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Account] ([Id], [UserName], [Password], [Image], [ModuleAccount], [LevelAccount], [PhoneNumber], [CreditCardNumber], [Address], [TaxCode]) VALUES (2, N'gdffdmhgbn', N'hdfgfghg', N'dfgdf', N'0', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[KindOfVideo] ON 

INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (1, N'Tình cảm')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (2, N'Hành Động')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (3, N'Viễn tưởng')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (4, N'Phiêu lưu')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (5, N'Âm nhạc')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (6, N'Hài hước')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (7, N'Lịch sử')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (8, N'Hoạt hình')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (9, N'Kinh dị')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (10, N'Thần thoại')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (11, N'Hình sự')
INSERT [dbo].[KindOfVideo] ([Id], [Name]) VALUES (12, N'Huyền bí')
SET IDENTITY_INSERT [dbo].[KindOfVideo] OFF
GO
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (1, 1, 2, 3, N'1:34')
INSERT [dbo].[ListMediaView] ([IdAccount], [IdProfile], [IdMedia], [Views], [CompleteTime]) VALUES (2, 3, 3, 45, N'2:45')
GO
SET IDENTITY_INSERT [dbo].[Media] ON 

INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Cô Bé Trượt Ván là câu chuyện phát hiện ra đam mê trượt ván có thể thay đổi cuộc đời mình, thiếu nữ ở vùng nông thôn của Ấn Độ đối diện con đường chông gai khi theo đuổi ước mơ thi đấu.', 21, N'2:37', N'Manjari Makijany                                  ', N'Skater Girl - Official Trailer - Netflix.mp4', CAST(N'2021-06-08T07:52:36.000' AS DateTime), N'Amy Maghera, Rachel Saanchita Gupta, Shafin Patel', 6.7, 10, 1, N'Skater Girl  boy                                                                                    ', N'skater-girl1623763175.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Là bộ phim đề tài LGBT đề cập đến một phần ít ai biết đến trong lịch sử Mexico. Vào năm 1901, cảnh sát đã đột kích nhà của một quý tộc ở thành phố Mexico, nơi đang diễn ra vũ hội sang trọng. Bên trong họ nhìn thấy nhóm các nam giới vui chơi một số còn mặc quần áo nữ. Vào thời điểm đó, đồng tính bị khinh thường, vì thế sự kiện này đã trở thành vụ bê bối làm rung chuyển xã hội Mexico, bất chấp chính phủ ra sức nỗ lực ngăn chặn vụ việc bị lan truyền.', 22, N'1:57', N'David Pablos                                      ', N'Dance of the 41 - Official Trailer - Netflix.mp4', CAST(N'2021-06-09T07:55:07.000' AS DateTime), N'Alfonso Herrera, Emiliano Zurita, Mabel', 7.5, 10, 1, N'Dance Of The 41                                                                                     ', N'dance-of-the-411622965225.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Taylor Harris bất ngờ bị sa thải. Không còn cách nào khác Taylor Harris đành phải trở về quê nhà của mình ở Montana. Tại đây cô bắt tay vào việc giúp sức cứu khách sạn của anh trai mình trong thị trấn thoát khỏi bàn tay của gã tài phiệt lắm tiền Joel Sheenan. Anh ta đang lên kế hoạch cải tạo lại hoàn toàn khách sạn, mà đây không phải là điều anh trai và Taylor mong muốn, sau nhiều lần tiếp xúc đấu đá với nhau, Taylor và Joel dần nảy sinh tình cảm đặc biệt dành cho nhau.', 23, N'1:59', N'Bradley Walsh                                     ', N'Colors of Love - Official Trailer.mp4', CAST(N'2021-06-10T07:59:37.000' AS DateTime), N'Dennis Andres, Michael Brown, Jenni Burke', 8.3, 3, 1, N'Colors of love                                                                                      ', N'colors-of-love1620311367.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Mắt Thấy Tai Nghe là câu chuyện sau khi rời Manhattan về cuộc sống ở một thị trấn nhỏ, người phụ nữ trẻ phát hiện cả chồng cô và ngôi nhà mới của họ đều cất giấu những bí mật đáng sợ.', 24, N'2:41', N'Shari Springer Berman, Robert Pulcini             ', N'Things Heard & Seen starring Amanda Seyfried - Official Trailer - Netflix.mp4', CAST(N'2021-06-11T08:01:23.000' AS DateTime), N'Amanda Seyfried, James Norton, Natalia Dyer', 8.3, 8, 1, N'Things Heard & Seen                                                                                 ', N'things-heard-seen1620302745.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Một nhân viên môi giới chứng khoán trẻ tuổi tại một công ty ở Phố Wall do Mob kiểm soát bị phản bội và bị tống vào tù 6 năm. Khi ra ngoài, anh ta tìm cách trả thù.', 25, N'1:58', N'Joseph Mensch                                     ', N'BAD TRIP Official Trailer (Redband) (2020).mp4', CAST(N'2021-06-18T08:03:40.000' AS DateTime), N'Toby Leonard Moore, Rade Serbedzija, Elena Satine, Bill Sage, Ari Barkan, Matt Levett, Anna Baryshnikov, Lev Gorn, Boris Lee Krutonog, David Vadim, Mat Vairo, Alice Sophie Malyukova, Vonia Arslanian, Marc Alan Austen, Joe Cummings', 6, 9, 1, N'Payback                                                                                             ', N'bad-trip.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Dựa trên câu chuyện đời thực phi thường của Chiefess Kapiolani, một người đã nhảy xuống miệng núi lửa phun trào để thể hiện đức tin của cô và đánh dấu một khởi đầu mới tại Hawaii.', 26, N'2:43', N'Timothy A. Chey                                   ', N'Old - Official Trailer [HD].mp4', CAST(N'2021-06-15T08:04:47.000' AS DateTime), N'Mira Sorvino, John Savage, Teuira Shanti Napa, Ricky Sua''ava, Michael Camp, Malia Marquez, Ichiro Tange, Malia Mahi, John Huser, Harry Walia, Lehi Makisi Falepapalangi, Ala''amoe Keolanui, Boyd Lauano, Andrew Sexton Iii, David Galea''i', 6, 3, 1, N'The Islands                                                                                         ', N'the-islands.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Infinite (2021) là một bộ phim hành động khoa học viễn tưởng của Mỹ năm 2021 do Antoine Fuqua làm đạo diễn. Ian Shorr đã chuyển thể kịch bản và Todd Stein đã viết câu chuyện trên màn ảnh từ cuốn tiểu thuyết năm 2009 The Reincaacian Papers của D. Eric Maikranz.', 27, N'2:45', N'Antoine Fuqua                                     ', N'INFINITE Official Trailer (2021).mp4', CAST(N'2021-06-11T08:09:16.000' AS DateTime), N'Mark Wahlberg, Chiwetel Ejiofor, Sophie Cookson', 7, 5, 9, N'Infinite                                                                                            ', N'infinite1623547067.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Khác với phong cách nhà ma ám trong hai phần phim trước, The Conjuring mùa mới mang đến tính hình sự sâu sắc hơn khi khai thác một trong những vụ án kinh điển của lịch sử toà án Mỹ. Đó là Arne Johnson, một kẻ sát nhân máu lạnh tới từ Brookfield mượn có bị quỷ ám để biện hộ cho tội ác đáng kinh tởm của mình. Trên thực tế, Arne đã bị buộc tội ngộ sát trong vụ xét xử năm 1981 và bị kết án 10 năm tù giam. Hắn đã được thả khoan hồng sau 5 năm cải tạo, và đến nay vẫn gây ra nhiều tranh cãi về sự bất công.', 28, N'2:39', N'Michael Chaves                                    ', N'THE CONJURING- THE DEVIL MADE ME DO IT – Official Trailer.mp4', CAST(N'2021-06-12T08:10:29.000' AS DateTime), N'Patrick Wilson, Vera Farmiga, Ruairi O''Connor', 7, 7, 9, N'The Conjuring: The Devil Made Me Do It                                                              ', N'the-conjuring-the-devil-made-me-do-it1623251511.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hung Thần Trắng là phim kinh dị. Một cặp tình nhân và người điều khiển thủy phi cơ, Kaz Fellows ( Katrina Bowden ) và bạn trai của cô ấy Charlie Brody ( Aaron Jakubenko ), cùng với hành khách của họ, Joji Minase ( Tim Kano ), vợ của anh ấy là Michelle ( Kimie Tsukakoshi ), và đầu bếp Benny ( Te Kohe Tuhaka ), đáp chuyến bay đến Rạn san hô địa ngục đẹp như tranh vẽ. Khi hạ cánh, họ bắt gặp một xác chết trôi dạt sau một cuộc tấn công nghi ngờ của cá mập. Họ báo cho lực lượng bảo vệ bờ biển nhưng phát hiện điện thoại của người đàn ông có hình bạn gái.', 29, N'1:57', N'Martin Wilson                                     ', N'GREAT WHITE Trailer (2021).mp4', CAST(N'2021-06-01T08:11:21.000' AS DateTime), N'Aaron Jakubenko, Katrina Bowden, Tatjana Marjanovic', 7, 6, 9, N'Great White                                                                                         ', N'great-white1622358515.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hannah Faber, một thợ hút khói , đang vật lộn sau khi không ngăn được cái chết của ba trại viên trẻ tuổi và một đồng nghiệp hút khói trong một vụ cháy rừng . Hiện cô được đưa lên tháp canh lửa ở Quận Park, Montana . Trong khi đó, Owen Casserly, một nhân viên kế toán pháp y, biết về cái chết của ông chủ và gia đình anh ta trong một vụ nổ khí rõ ràng; họ đã thực sự bị sát hại bởi hai sát thủ Jack và Patrick Blackwell.', 30, N'2:44', N'Taylor Sheridan                                   ', N'Those Who Wish Me Dead Trailer #1 (2021) - Movieclips Trailers.mp4', CAST(N'2021-06-03T08:13:30.000' AS DateTime), N'Angelina Jolie, Finn Little, Nicholas Hoult', 7, 7, 9, N'Those Who Wish Me Dead                                                                              ', N'those-who-wish-me-dead1622050544.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Ấn Quỷ là một phim kinh dị. Phim xoay quanh cô gái khiếm thính Alice tại một thị trấn nhỏ thuộc vùng New England. Một ngày nọ, cô bỗng nhiên có thể nghe, nói như bình thường và có được năng lực chữa bệnh cho mọi người. Hàng trăm nghìn người từ khắp đất nước đổ về chứng kiến phép màu của cô. Trong số này, nhà báo Gerry Fenn muốn thực hiện một phóng sự để cứu vãn sự nghiệp. Song, hàng loạt những sự kiện kinh hoàng xảy ra khiến ông dần nhận ra thế lực ma quỷ thật sự đứng sau lưng cô gái trẻ.', 31, N'2:51', N'Evan Spiliotopoulos                               ', N'THE UNHOLY Official Trailer (2021).mp4', CAST(N'2021-06-03T08:14:28.000' AS DateTime), N'Jeffrey Dean Morgan, Katie Aselton, William Sadler', 7.5, 3, 9, N'The Unholy                                                                                          ', N'the-unholy_1622358090.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Cuộc Chiến Vì Mọi Bé Gái là phim kinh dị. Vị thanh tra kiên trì tìm được điểm chung với một kẻ sát nhân – hắn nhắm một cách có hệ thống vào những kẻ ác điều hành một đường dây buôn bán trẻ em quyền lực.', 32, N'1:41', N'Donovan Marsh                                     ', N'I Am All Girls - Official Trailer - Netflix.mp4', CAST(N'2021-06-04T08:16:12.000' AS DateTime), N'Deon Lotz, Erica Wessels, Masasa Mbangeni', 7.5, 6, 9, N'I Am All Girls                                                                                      ', N'i-am-all-girls1622357874.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Jennifer Aniston, Courteney Cox, Lisa Kudrow, Matt LeBlanc, Matthew Perry, và David Schwimmer sẽ trở lại phim trường cũ của loạt phim hài biểu tượng, Phim trường 24, tại xưởng phim Warner Bros để tổ chức buổi trò chuyện kỉ niệm bộ phim yêu dấu của họ.', 33, N'2:11', N'Ben Winston                                       ', N'FRIENDS- THE REUNION Official Trailer (NEW 2021).mp4', CAST(N'2021-06-09T08:18:08.000' AS DateTime), N'Jennifer Aniston, David Schwimmer, Courteney Cox, Lisa Kudrow, Matthew Perry, Matt LeBlanc', 5.6, 4, 6, N'Friends : The Reunion                                                                               ', N'friends-the-reunion1622968073.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Nào Mình Cùng Mơ! (Dreambuilders) là tựa phim hoạt hình vô cùng dễ thương và đáng yêu dành cho các bé. Phim xoay quanh câu chuyện của cô bé Minna khi sống chung với mẹ kế và cô em gái khó ưa Jenny.

Mãi đến một ngày Minna phát hiện ra thành phố chuyên xây dựng giấc mơ và từ đó, cô bé đã bắt đầu xâm nhập và điều khiển giấc mơ của Jenny. Bỗng một ngày, Jenny không thể tỉnh dậy, Minna hối hận và quyết định quay lại thành phố giấc mở để cứu lấy người em vô tội của mình.', 34, N'2:22', N'Kim Hagen Jensen, Tonni Zinck                     ', N'DREAMBUILDERS Trailer (2020).mp4', CAST(N'2021-06-07T08:19:44.000' AS DateTime), N'Martin Buch, Rasmus Botoft, Mia Lerdam', 5.5, 55, 6, N'Dreambuilders                                                                                       ', N'dreambuilders_1622966807.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Tác phẩm kể về một gia đình bị rối loạn chức năng, gặp khó khăn khi phải ra tay giải cứu Trái Đất khỏi cuộc nổi dậy của người máy lúc đang đi trên đường.', 35, N'3:02', N'Michael Rianda                                    ', N'The Mitchells vs. The Machines - Official Trailer - Netflix.mp4', CAST(N'2021-06-09T08:21:24.000' AS DateTime), N'Abbi Jacobson, Danny McBride, Maya Rudolph, Eric Andre, Fred Armisen, Beck Bennett, Conan O''Brien, Charlyne Yi', 8.3, 44, 6, N'The Mitchells vs. the Machines                                                                      ', N'the-mitchells-vs-the-machines1620309980.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Tình dục, ma túy và một gia đình hỗn loạn tạo nên một cơn bão hoàn hảo cho Bữa tiệc trưởng thành của Donny. Chúng ta quay ngược thời gian trở lại năm 1998 khi theo dõi một loạt các nhân vật đầy màu sắc dưới góc nhìn của một nhà quay phim được thuê. Donny cố gắng tận hưởng buổi tối trong khi đối phó với người mẹ điên rồ của mình, người đang giận dữ ở tuổi thiếu niên của anh ta, và bạn gái mới của anh ta, Hannah Quay tay. Trong khi đó Gerald, MC của bữa tiệc, đang làm nhiệm vụ ngăn chặn Val Dho đang âm mưu phá hoại bữa tiệc. Tất cả những điều đó, cộng thêm những cuộc tình tai tiếng, mối tình tay ba, quay chai... Nhưng theo truyền thống, tất cả phải được giải quyết trước khi bài hát cuối vang lên.', 36, N'2:26', N'Jonathan Kaufman                                  ', N'DONNY''S BAR MITZVAH (2021) Official Trailer — Redband.mp4', CAST(N'2021-06-11T08:22:32.000' AS DateTime), N'Steele Stebbins, Adrian Ciscato, Wendy Braun, Michael Patrick Mcgill, Adam Herschman, Radek Lord, Jeremy Tardy, Zemyhe Curtis, Joshua Gonzalez, Regan Burns, Jennifer Sorenson, Tricia O''kelley, John Deluca, Jessica Renee Russell, Isabelle Anaya', 7.6, 5, 6, N'Donny''s Bar Mitzvah                                                                                 ', N'donny039s-bar-mitzvah.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Trong chương trình hài chơi khăm có máy quay ẩn, đôi bạn thân gắn kết trong chuyến đi náo loạn đến New York qua việc kéo người thật vào các trò đùa thô tục, bát nháo.', 37, N'2:37', N'Kitao Sakurai                                     ', N'BAD TRIP Official Trailer (Redband) (2020).mp4', CAST(N'2021-06-17T08:25:31.000' AS DateTime), N'Eric André, Michaela Conlin, Tiffany Haddish, Lil Rel Howery, Gerald Espinoza, Kaleila Johnson, Michael Starr, Yvette Tucker, Allan Graf, Kevin Cassidy, Cory Demeyers, Charles Green, Henry Wang, Greg Smithaldridge, Peter A. Chevako', 6.6, 56, 6, N'Bad Trip                                                                                            ', N'bad-trip.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Ở Oʻahu vào mùa hè, hai anh em ruột từ Brooklyn kết nối với di sản Hawaii của họ – và với gia đình – trong một nhiệm vụ táo bạo: tìm kho báu thất lạc từ lâu.', 38, N'2:32', N'Jude Weng  g                                      ', N'FINDING ‘OHANA - Official Trailer - Netflix.mp4', CAST(N'2021-06-22T08:27:14.000' AS DateTime), N'Owen Vaccaro, Kelly Hu, Branscombe Richmond, Marc Evan Jackson, Chris Parnell, Kea Peahu, Alex Aiono, Lindsay Watson, Brad Kalilimoku, Ke Huy Quan, Ricky Garcia, Mapuana Makia, Ryan Higa, Kyndra Sanchez, Stephon Fung', 6.1, 54, 6, N'Finding ''Ohana                                                                                      ', N'finding-039ohana.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Chính tại những khu ổ chuột của thành Luân Đôn thời Trung Cổ, Arthur lớn lên như một kẻ vô danh, tự do và nghèo khổ. Không ai ngờ được, anh là người được định mệnh sắp đặt trở thành chủ nhân của thanh gươm huyền thoại Excalibur. Phát hiện ra dòng máu vương quyền của mình, Arthur nhanh chóng bị cuốn vào cuộc đại chiến ma thuật chống lại tên vua độc tài Vortigern với hi vọng đem lại hoà bình cho vương quốc.', 39, N'2:34', N'Guy Ritchie                                       ', N'King Arthur- Legend of the Sword - Official Comic-Con Trailer [HD].mp4', CAST(N'2021-06-17T08:30:49.000' AS DateTime), N'Charlie Hunnam, Astrid Bergès-Frisbey, Jude Law, Djimon Hounsou, Eric Bana, Aidan Gillen, Freddie Fox, Craig Mcginlay, Tom Wu, Kingsley Ben-Adir, Neil Maskell, Annabelle Wallis, Geoff Bell, Zac Barker', 7.3, 133, 10, N'King Arthur: Legend of the Sword                                                                    ', N'king-arthur-legend-of-the-sword.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Đã 8 năm trôi qua kể từ khi Rick và Evelyn lần đầu tiên gặp nhau. Trong phần hai của loạt phim về xác ướp Ai Cập, họ đã kết hôn và có một câu con trai kháu khỉnh 8 tuổi Alex. Lần trở lại này, cả Evelyn và Alex đều gặp nguy hiểm khi cậu bé nghịch ngợm đeo vào tay chiếc vòng của Vua Bọ Cạp còn Evelyn thì phát hiện ra mình là một công chúa Ai Cập trong thế giới cổ xưa...', 40, N'2:08', N'Stephen Sommers                                   ', N'The Mummy 5 (2021)Trailer Teaser Concept - Dwayne Johnson, Tom Cruise.mp4', CAST(N'2021-06-24T08:32:35.000' AS DateTime), N'Brendan Fraser, Rachel Weisz, John Hannah, Arnold Vosloo, Patricia Velasquez, Alun Armstrong, Dwayne Johnson, Adewale Akinnuoye-Agbaje, Shaun Parkes, Joe Dixon, Tom Fisher, Oded Fehr, Freddie Boath, Bruce Byron, Aharon Ipalé', 6.3, 3, 10, N'The Mummy Returns                                                                                   ', N'the-mummy-returns.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Wrath of Titans (Sự Phẫn Nộ Của Các Vị Thần) nói về Perseus - con trai thần Zeus đang trải qua cuộc sống êm đềm bên làng chai cùng cậu con trai 10 tuổi tên là Helius, nhưng cuộc tranh chấp giữa các vị thần đã phá vỡ khung cảnh yên ả ấy sự trỗi dậy của các Titan và Zeus bị giam cầm đã buộc Perseus phải tham gia vào nhiệm vụ đầy hiểm nguy mới… Bối cảnh của phim được thực hiện rất chân thực, từ cảnh chiến trường, cảnh vật núi rừng cho đến những khung hình nhanh của những trận giao chiến nảy lửa. Diễn xuất của các nhân vật khá tốt nên mặc dù là 1 phim sử dụng nhiều kĩ xảo nhưng các nhân vật vẫn hiện lên chân thực và sống động.', 41, N'2:21', N'Jonathan Liebesman                                ', N'Wrath of the Titans Official Trailer #1 - Sam Worthington Movie (2012) HD.mp4', CAST(N'2021-06-15T08:34:18.000' AS DateTime), N'John Bell, Toby Kebbell, Rosamund Pike, Matt Milne, Danny Huston, Édgar Ramírez, Sam Worthington, Kathryn Carpenter, Lily James, Bill Nighy, Ralph Fiennes, Liam Neeson, Kett Turton, Freddy Drabble, Alejandro Naranjo', 5.7, 66, 10, N'Wrath of the Titans                                                                                 ', N'wrath-of-the-titans.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Rise of the Guardians (Sự Trỗi Dậy Của Các Vệ Thần) kể về một tên ác quỷ có tên là Pitch âm mưu chiếm lĩnh thế giới bằng cách khơi dậy nỗi sợ hãi trong trái tim trẻ con khắp mọi nơi, một nhóm những người hùng - Ông Già Noel, Chú Thỏ Phục Sinh, Người Cát Nàng Tiên Răng và Jack Frost - hợp lực lại để ngăn cản Pitch. Nhưng đây không phải là tập hợp những nhân vật lấy ra từ các câu chuyện kể, The Guardians là một nhóm người hùng với những sức mạnh đặc biệt. Giờ cùng nhau hợp lực chống lại một kẻ thù chung, The Guardians lắng nghe lời kêu gọi và kết hợp sức mạnh để đánh bại Pitch và bảo vệ thế giới khỏi bóng ma sợ hãi…', 42, N'2:31', N'Peter Ramsey                                      ', N'Trollhunters- Rise Of The Titans - Guillermo del Toro - Official Trailer - Netflix.mp4', CAST(N'2021-06-22T08:35:35.000' AS DateTime), N'Isla Fisher, Dakota Goyo, Khamani Griffin, Alec Baldwin, Jude Law, Dominique Grund, Kamil Mcfadden, Chris Pine, Hugh Jackman, Jacob Bertrand, Emily Nordwind, Ryan Crego, April Lawrence, Olivia Mattingly, Georgie Grieve', 7.2, 5, 10, N'Rise Of The Guardians                                                                               ', N'rise-of-the-guardians.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Đại Náo Thiên Cung là câu chuyện về cuộc đời của Tôn Ngộ Không trước chuyến tháp tùng Đường Tăng đi Ấn Độ thỉnh kinh. Ngưu Ma Vương vì muốn đưa người vợ yêu là Thiết phiến công chúa và con trai là Hồng hài nhi lên thiên đàng nên đã xúi giục Tôn Ngộ Không tấn công triều đình. Do phạm tội đại náo thiên cung nên Tôn Ngộ Không bị Phật Tổ Như Lai phạt nhốt dưới Ngũ Hành Sơn 500 năm cho đến khi được Tam Tạng giải thoát và theo ông đi thỉnh kinh.', 43, N'2:31', N'Pou-Soi Cheang                                    ', N'Monkey King- The One and Only (大圣无双, 2021) chinese fantasy trailer.mp4', CAST(N'2021-06-15T08:37:56.000' AS DateTime), N'Chung Tử Đơn, Châu Nhuận Phát, Quách Phú Thành, Trần Kiều Ân, Trần Tuệ Lâm, Gigi Leung, Trương Tử Lâm, Siu-Fai Cheung, Phàn Thiếu Hoàng, Hà Nhuận Đông, La Trọng Khiêm, Hua Liu, Yitian Hai, Calvin Cheng Ka-Sing, Jing Li', 5.4, 1, 10, N'The Monkey King 1                                                                                   ', N'the-monkey-king-1.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Batman: Under The Red Hood (Batman Đối Đầu Mặt Nạ đỏ) kể về cuộc chiến mới giữa Batman và Người mang mặt nạ đỏ, bộ phim hoạt hình dành cho người lớn với nhiều cảnh bạo lực và được giới phê bình đánh giá rất cao...', 44, N'1:53', N'Brandon Vietti                                    ', N'The Batman- Under the Red Hood - Movie Trailer Concept.mp4', CAST(N'2021-06-17T08:39:17.000' AS DateTime), N'Jim Piddock, Kelly Hu, Jensen Ackles, Carlos Alazraqui, John Dimaggio, Vincent Martella, Wade Williams, Phil Lamarr, Gary Cole, Bruce Greenwood, Brian George, Alexander Martella, Jason Isaacs, Robert Clotworthy, Neil Patrick Harris', 7.8, 67, 10, N'Batman: Under The Red Hood                                                                          ', N'batman-under-the-red-hood.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Loki kể về khi Steve Rogers, Tony Stark và Scott Lang quay trở về cột mốc 2012, ngay khi trận chiến ở New York kết thúc, để “mượn tạm” quyền trượng của Loki. Nhưng một tai nạn bất ngờ xảy đến, khiến Loki nhặt được khối lặp phương Tesseract và tiện thể tẩu thoát. Cuộc trốn thoát này đã dẫn đến dòng thời gian bị rối loạn. Cục TVA – tổ chức bảo vệ tính nguyên vẹn của dòng chảy thời gian, buộc phải can thiệp, đi gô cổ ông thần này về làm việc. Tại đây, Loki có hai lựa chọn, một là giúp TVA ổn định lại thời gian, không thì bị tiêu hủy. Dĩ nhiên Loki chọn lựa chọn thứ nhất. Nhưng đây là nước đi vô cùng mạo hiểm, vì ông thần này thường lọc lừa, “lươn lẹo”, chuyên đâm lén như bản tính tự nhiên của gã.', 45, N'2:16', N'Kate Herron                                       ', N'Marvel Studios'' Loki - Official Trailer - Disney+.mp4', CAST(N'2021-06-10T08:42:49.000' AS DateTime), N'Tom Hiddleston, Owen Wilson, Sophia Di Martino, Wunmi Mosaku, Eugene Cordero, Tara Strong', 7, 32, 3, N'Loki                                                                                                ', N'loki_1623740387.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Dominic Toretto đang có một cuộc sống yên tĩnh ngoài lưới điện với Letty và con trai của anh ta, cậu bé Brian, nhưng họ biết rằng nguy hiểm luôn rình rập ngay phía chân trời yên bình của họ. Lần này, mối đe dọa đó sẽ buộc Dom phải đối mặt với tội lỗi trong quá khứ của mình nếu anh ấy định cứu những người anh ấy yêu thương nhất. Phi hành đoàn của anh ấy tham gia cùng nhau để ngăn chặn một âm mưu kinh hoàng thế giới được dẫn dắt bởi sát thủ lành nghề nhất và người lái xe hiệu suất cao nhất mà họ từng gặp: một người đàn ông cũng là người anh trai bị bỏ rơi của Dom, Jakob.', 46, N'3:50', N'Justin Lin                                        ', N'FAST AND FURIOUS 9 Trailer (2021).mp4', CAST(N'2021-06-16T08:44:16.000' AS DateTime), N'Vin Diesel, Tyrese Gibson, Cody Rain Murray, Krzysztof Mardula, John Cena', 8.5, 100, 3, N'Fast & Furious 9                                                                                    ', N'fast-furious-91622477760.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Một nhóm thanh thiếu niên bắt đầu một chuyến hành trình khai phá sự sống ở một hành tinh xa xôi khác. Tuy nhiên, họ phát hiện ra bí mật được che giấu đằng sau nhiệm vụ cao cả này, tất cả bắt đầu kháng cự lại việc huấn luyện và để bản năng nguyên thuỷ lấn chiếm cảm xúc. Khi vận mệnh của cả phi đoàn rơi vào hỗn loạn, họ bị chôn vùi trong sợ hãi, ham muốn và cơn khao khát quyền lực.', 47, N'2:26', N'Neil Burger                                       ', N'Voyagers (2021 Movie) Official Trailer – Tye Sheridan, Lily-Rose Depp.mp4', CAST(N'2021-05-30T08:45:47.000' AS DateTime), N'Colin Farrell, Tye Sheridan, Lily-Rose Depp', 8.3, 23, 3, N'Voyagers                                                                                            ', N'voyagers1620311197.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Todd Hewwitt (Tom Holland) tình cờ phát hiện ra Viola (Daisy Ridley)- một cô gái sống sót sau khi phi thuyền của cô gặp nạn và rơi xuống hành tinh của cậu. Hành tinh này không hề có bóng dáng phụ nữ, còn đàn ông thì bị ảnh hưởng bởi ''Tiếng Ồn'' - một thế lực thể hiện toàn bộ suy nghĩ của họ ra bên ngoài. Vì là cô gái duy nhất trên hành tinh kì lạ này, tính mạng của Viola bị đe dọa. Todd quyết tâm bảo vệ Viola và cả hai bị cuốn vào cuộc phiêu lưu nguy hiểm. Từ đó, Todd dần khám phá ra năng lực đặc biệt của mình, và phát hiện ra những bí mật đen tối của hành tinh mà cậu đang sống.', 48, N'2:30', N'Doug Liman                                        ', N'Chaos Walking (2021 Movie) Official Trailer – Daisy Ridley, Tom Holland, Nick Jonas.mp4', CAST(N'2021-06-08T08:47:37.000' AS DateTime), N'Tom Holland, Daisy Ridley, Demian Bichir, David Oyelowo, Cynthia Erivo, Bethany Anne Lind, Mads Mikkelsen, Nick Jonas, Ray Mckinnon, Vincent Leclerc, Frank Fontaine, Kurt Sutter, Blane Crockarell, François Gauthier, Tyrone Benskin', 5.8, 5, 3, N'Chaos Walking                                                                                       ', N'chaos-walking.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Khi Snyder rời dự án vì cái chết của con gái Autumn vào năm 2017, Hãng Warner Bros. tuyển đạo diễn Joss Whedon, người từng làm The Avengers và Avengers: Age of Ultron của Marvel, thay thế. Rốt cuộc, đó là một trong những bộ phim "tệ hại nhất thập niên 2010" với các tuyến nhân vật mỏng, hình ảnh âm u và những pha hành động hỗn loạn.

Bản dựng Justice League dài 4 tiếng của đạo diễn Zack Snyder là bản dựng mang đúng phong cách Snyder - một trong những nhà sáng tạo quan trọng của vũ trụ siêu anh hùng DC với tầm nhìn xa và giọng kể riêng biệt.

Khán giả sẽ thấy Victor Stone - siêu anh hùng Cyborg đã có một thời trung học thiếu vắng tình cha, mất đi người mẹ, và nguyên do anh trở thành một siêu anh hùng "nửa người nửa máy" với bộ óc siêu việt, khả năng thao túng công nghệ và thích ứng với người ngoài hành tinh.

Khán giả sẽ thấy sự kết hợp giữa các siêu anh hùng lừng lẫy nhất vũ trụ DC - Batman, Superman, Wonder Woman, Flash, Cyborg, Aquaman - diễn ra đầy thuyết phục, vừa đủ để tôn vinh mỗi người nhưng vừa đoàn kết, cân bằng để không ai "một mình cân tất".', 49, N'2:26', N'Zack Snyder                                       ', N'Zack Snyder''s Justice League - Official Trailer - HBO Max.mp4', CAST(N'2021-04-15T08:50:33.000' AS DateTime), N'Ben Affleck, Henry Cavill, Amy Adams, Gal Gadot, Ray Fisher, Jason Momoa, Ezra Miller, Willem Dafoe, Jesse Eisenberg, Jeremy Irons, Diane Lane, Connie Nielsen, J.k. Simmons, Ciarán Hinds, Trịnh Khải, Jared Leto, Robin Wright, Kiersey Clemons, Karen B', 8.4, 56, 3, N'Zack Snyder''s Justice League                                                                        ', N'zack-snyder039s-justice-league.jpg')
INSERT [dbo].[Media] ([Describe], [Id], [Time], [Directors], [Source], [PostedDate], [Actor], [IMDB], [Likes], [Genre], [Name], [Poster]) VALUES (N'Hậu Duệ Thần Sấm là câu chuyện phiêu lưu giả tưởng về một chàng trai trẻ tên Eric (Nat Wolff), người phát hiện ra mình có sức mạnh giống như “Thần Sấm” trong thần thoại Na Uy cổ đại. Trong khi ẩn náu ở vùng hoang dã phía tây Na Uy, Eric vô tình giết chết một thiếu niên theo cách khó giải thích và không lâu sau cậu bị bắt.

Trước khi bị thẩm vấn, anh gặp Christine, một nhà tâm lý học trẻ tuổi đang cố gắng tìm hiểu thực sự đã có điều gì xảy ra. Cô tin vào Eric và cảm thấy đồng cảm với anh. Ngay sau đó, đại sứ quán Mỹ xuất hiện, ông ta muốn dẫn độ Eric, nhưng Eric đã nhanh chóng chạy trốn cùng Christine. Trên đường chạy trốn, theo sau là những nhà chức trách của Na Uy và Mỹ theo đuổi, Eric cuối cùng đã phát hiện ra anh ta thực sự là ai, hay là cái gì đó mà trước nay anh luôn muốn biết….', 50, N'2:17', N'André Øvredal                                     ', N'Mortal Kombat Movie - Official Hindi Trailer.mp4', CAST(N'2021-06-07T08:52:21.000' AS DateTime), N'Nat Wolff, Priyanka Bose, Iben Akerlie, Arthur Hakalahti, Ania Nova, Oddrun Valestrand, Ravdeep Singh Bajwa, Sunniva Lind Høverstad, Martin Grid Toennesen, Per Frisch, Per Egil Aske, Sveinung Augestad, Inger Berit Grøterud, Craig Narveson, Torunn Lød', 5.8, 2, 3, N'Mortal                                                                                              ', N'mortal.jpg')
SET IDENTITY_INSERT [dbo].[Media] OFF
GO
INSERT [dbo].[MyPlayList] ([IdAccount], [IdProfile], [IdMedia]) VALUES (1, 1, 2)
INSERT [dbo].[MyPlayList] ([IdAccount], [IdProfile], [IdMedia]) VALUES (2, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[PaymentHistory] ON 

INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), 324123.22, 1)
INSERT [dbo].[PaymentHistory] ([IdAccount], [Date], [Money], [Id]) VALUES (1, CAST(N'2020-12-12T00:00:00.000' AS DateTime), 45354654, 2)
SET IDENTITY_INSERT [dbo].[PaymentHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Profile] ON 

INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (1, 1, N'profile', NULL)
INSERT [dbo].[Profile] ([IdAccount], [Id], [Name], [Age]) VALUES (2, 3, N'dssf', 45)
SET IDENTITY_INSERT [dbo].[Profile] OFF
GO
ALTER TABLE [dbo].[Media] ADD  DEFAULT (NULL) FOR [Name]
GO
USE [master]
GO
ALTER DATABASE [QLMEDIA] SET  READ_WRITE 
GO
