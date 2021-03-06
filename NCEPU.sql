USE [NCEPUSQL]
GO
/****** Object:  Table [dbo].[TB_USER_RIGHTS]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_USER_RIGHTS](
	[USER_RIGHTS_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NOT NULL,
	[RIGHTS_CODE] [int] NOT NULL,
	[ADD_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[USER_RIGHTS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_USER_RIGHTS] ON
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (2, 1, 1, CAST(0x0000A7380115BF6B AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (3, 1, 2, CAST(0x0000A741011912DB AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (4, 1, 3, CAST(0x0000A74101191A04 AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (5, 1, 4, CAST(0x0000A741011920DA AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (6, 2, 2, CAST(0x0000A7410119648B AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (7, 2, 3, CAST(0x0000A74101196499 AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (8, 1, 1, CAST(0x0000A7410124FA26 AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (9, 1, 2, CAST(0x0000A7410124FA30 AS DateTime))
INSERT [dbo].[TB_USER_RIGHTS] ([USER_RIGHTS_ID], [USER_ID], [RIGHTS_CODE], [ADD_TIME]) VALUES (10, 17, 1, CAST(0x0000A7410125319C AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_USER_RIGHTS] OFF
/****** Object:  Table [dbo].[TB_USER]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_USER](
	[USE_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_NAME] [varchar](20) NOT NULL,
	[PASSWORD] [varchar](20) NOT NULL,
	[USER_TYPE] [int] NOT NULL,
	[IS_DELETE] [bit] NOT NULL,
	[MARK] [varchar](200) NULL,
	[ADD_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[USE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_USER] ON
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (1, N'shitelaosi2017', N'password', 1, 0, NULL, CAST(0x0000A72A010ACBB8 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (2, N'ncepu', N'123456', 0, 1, NULL, CAST(0x0000A72E016FBE39 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (3, N'ceshi2017001', N'cengjingshui', 0, 1, NULL, CAST(0x0000A73200EBEAB4 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (4, N'ceshi2017002', N'weitiao2017', 0, 1, NULL, CAST(0x0000A73500B02550 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (5, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A7410119647D AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (6, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A74101203DF8 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (7, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A74101208D0F AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (8, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A7410122BE91 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (9, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A74101232EFA AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (10, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A741012343CA AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (11, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A7410123965C AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (12, N'ceshi', N'123456', 0, 1, NULL, CAST(0x0000A7410123E6F2 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (13, N'test', N'123456', 0, 1, NULL, CAST(0x0000A74101243816 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (14, N'11', N'123456', 0, 1, NULL, CAST(0x0000A74101246F99 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (15, N'112', N'123456', 0, 1, NULL, CAST(0x0000A7410124BFD7 AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (16, N'1122', N'123456', 0, 1, NULL, CAST(0x0000A7410124F34B AS DateTime))
INSERT [dbo].[TB_USER] ([USE_ID], [USER_NAME], [PASSWORD], [USER_TYPE], [IS_DELETE], [MARK], [ADD_TIME]) VALUES (17, N'zcz', N'123456', 0, 1, NULL, CAST(0x0000A7410125318E AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_USER] OFF
/****** Object:  Table [dbo].[TB_URL]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_URL](
	[URL_ID] [int] IDENTITY(1,1) NOT NULL,
	[URL_PATH] [varchar](100) NOT NULL,
	[MARK] [varchar](100) NOT NULL,
	[ADD_TIME] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[URL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_URL] ON
INSERT [dbo].[TB_URL] ([URL_ID], [URL_PATH], [MARK], [ADD_TIME]) VALUES (1, N'http://www.ncepu.edu.cn/xxgk/xxjj/index.htm', N'首页“More”按钮链接', CAST(0x0000A72E0115D2C9 AS DateTime))
SET IDENTITY_INSERT [dbo].[TB_URL] OFF
/****** Object:  Table [dbo].[TB_NEWS]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_NEWS](
	[NEWS_ID] [int] IDENTITY(1,1) NOT NULL,
	[NEWS_TYPE] [int] NOT NULL,
	[NEWS_TITLE] [varchar](50) NOT NULL,
	[NEWS_CONTENT] [text] NOT NULL,
	[ADD_USER_ID] [int] NOT NULL,
	[ADD_TIME] [datetime] NOT NULL,
	[IS_DELETE] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NEWS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_NEWS] ON
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (1, 1, N'华电新闻华电新闻华电新闻', N'测试内容', 1, CAST(0x0000A72C0138F645 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (2, 1, N'河北新闻', N'测试测试测试车四 i', 1, CAST(0x0000A72C0139255B AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (3, 1, N'唐山新闻', N'<p style="text-align: center;"><strong>唐山新闻唐山新闻唐山新闻唐山新闻</strong></p>
', 1, CAST(0x0000A72D013227D1 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (4, 1, N'唐山新闻', N'<p style="text-align: center;"><strong>唐山新闻唐山新闻唐山新闻唐山新闻<img alt="" src="/files/images/1.png" style="width: 1440px; height: 900px;" /></strong></p>
', 1, CAST(0x0000A72D01324CE8 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (5, 1, N'保定新闻', N'<p>保定新闻保定新闻保定新闻保定新闻保定新闻嗯嗯嗯嗯嗯嗯嗯嗯嗯嗯呃嗯嗯嗯</p>
', 1, CAST(0x0000A72D013474CA AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (6, 1, N'北京新闻', N'<p><span style="font-size:20px;"><u><strong>北京新闻北京新闻北京新闻北京新闻北京新闻北京新闻</strong></u></span></p>
', 1, CAST(0x0000A72D01405FEC AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (7, 1, N'新闻新闻新闻新闻新闻新闻', N'<p>新闻内容<img alt="" src="/files/images/link.jpg" style="width: 533px; height: 300px;" /></p>
', 1, CAST(0x0000A72E016F85DD AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (8, 1, N'测试xxxx', N'<p>谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢谢</p>
', 1, CAST(0x0000A72F008A1CC1 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (9, 1, N'如果你没有看比赛，看到2-10的总比分', N'<p>如果你没有看比赛，看到2-10的总比分，哂笑和悲悯或许成了必然。但这又不是故事的一切：或许在阿森纳球员在今晚踏入酋长球场的那一刻之时，他们仍然有&ldquo;至少站着死&rdquo;的期盼。但现实又是那么的残酷，几乎和首回合在安联球场同样的剧情，又是科斯切尔尼的离场导致的球队崩盘。同样1比5的比分，这一次阿森纳甚至比首回合经历了更惨烈、又更加令人难以接受的故事。</p>

<p>恐怕不少阿森纳球迷都会抱着这样的念头奔赴现场，或是打开直播：落后四球翻盘这样的事情从未在欧冠赛场发生过，双方又存在着实力差距，所以翻盘也并不敢指望；就希望着自己的球队好好公平踢一踢，涨涨士气，给接下来的联赛足总杯开个好头。结果今天，酋长球场南看台（大钟看台）下站着的底线裁判，连这样的机会都没有给过。</p>

<p>客观说，没有这些细微的误差，阿森纳想要逆转总比分也算是天方夜谭，但事实就在那里，本场比赛这个来自希腊的裁判组，各自拗口的姓名已经不那么重要。但这样一场比赛，阿森纳连最后做弱者拼命的机会都被剥夺了&mdash;&mdash;同样的南看台的底线裁判，上下半场的两次关键判罚虽然不能算是严重误判，但也彻底打压了阿森纳燃起的火焰，摧毁了最后的心理防线。上半场，当沃尔科特打进精彩进球后不久，曾有一次精彩的突破被阿隆索放倒，就在底线裁判的眼皮底下。慢镜头清晰显示，这似乎应该是一个点球。阿森纳首先就这样错过了将比分扩大为2比0的绝佳机会。</p>

<p>&nbsp;</p>
', 1, CAST(0x0000A730007E39D8 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (10, 1, N'这一次阿森纳甚至比首回合经历了更惨烈', N'<p>如果你没有看比赛，看到2-10的总比分，哂笑和悲悯或许成了必然。但这又不是故事的一切：或许在阿森纳球员在今晚踏入酋长球场的那一刻之时，他们仍然有&ldquo;至少站着死&rdquo;的期盼。但现实又是那么的残酷，几乎和首回合在安联球场同样的剧情，又是科斯切尔尼的离场导致的球队崩盘。同样1比5的比分，这一次阿森纳甚至比首回合经历了更惨烈、又更加令人难以接受的故事。</p>

<p>恐怕不少阿森纳球迷都会抱着这样的念头奔赴现场，或是打开直播：落后四球翻盘这样的事情从未在欧冠赛场发生过，双方又存在着实力差距，所以翻盘也并不敢指望；就希望着自己的球队好好公平踢一踢，涨涨士气，给接下来的联赛足总杯开个好头。结果今天，酋长球场南看台（大钟看台）下站着的底线裁判，连这样的机会都没有给过。</p>

<p>客观说，没有这些细微的误差，阿森纳想要逆转总比分也算是天方夜谭，但事实就在那里，本场比赛这个来自希腊的裁判组，各自拗口的姓名已经不那么重要。但这样一场比赛，阿森纳连最后做弱者拼命的机会都被剥夺了&mdash;&mdash;同样的南看台的底线裁判，上下半场的两次关键判罚虽然不能算是严重误判，但也彻底打压了阿森纳燃起的火焰，摧毁了最后的心理防线。上半场，当沃尔科特打进精彩进球后不久，曾有一次精彩的突破被阿隆索放倒，就在底线裁判的眼皮底下。慢镜头清晰显示，这似乎应该是一个点球。阿森纳首先就这样错过了将比分扩大为2比0的绝佳机会。</p>

<p>&nbsp;</p>
', 1, CAST(0x0000A730007ECFD2 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (11, 1, N'“信息快递”和“弹出窗口”版面说明', N'<p>&nbsp;</p>

<p>保定校区主页的&ldquo;信息快递&rdquo;和&ldquo;弹出窗口&rdquo;版面，为各单位发布重要工作通知，对校外人员访问网站提供强大信息服务功能，是保定校区方便快捷的电子公告平台。内容更新权限在网络与信息化办公室，需要在&ldquo;信息快递&rdquo;和&ldquo;弹出窗口&rdquo;发布信息的单位，请提前与网络与信息化办公室联系，电话7522921，填写需要更新的内容登记表提交。</p>
', 1, CAST(0x0000A731007FD009 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (12, 1, N'关于保定校区主页栏目变动的通告', N'<p>&nbsp;</p>

<p>根据《华北电力大学关于加强和改进校园网信息建设与管理的若干意见》（华电党宣〔2007〕8号）中的有关规定，保定校区主页取消&ldquo;校园快讯&rdquo;和&ldquo;媒体报道&rdquo;栏目，相关功能和&ldquo;华电新闻网&rdquo;一起并入大学新闻中心网页，形成一个两地共享的新闻信息平台；加快新闻中心网页改版工作，打造高水平、高品质的新闻网。</p>

<p>特此通告，欢迎继续关注。</p>

<p>新闻中心网页地址：<a href="http://news.ncepu.edu.cn/">http://news.ncepu.edu.cn/</a></p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;党委宣传部</p>

<p>2007年10月</p>

<p>&nbsp;</p>
', 1, CAST(0x0000A7310080F5AA AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (13, 1, N'关于保定校区主页栏目变动的通告', N'<p>&nbsp;</p>

<p>根据《华北电力大学关于加强和改进校园网信息建设与管理的若干意见》（华电党宣〔2007〕8号）中的有关规定，保定校区主页取消&ldquo;校园快讯&rdquo;和&ldquo;媒体报道&rdquo;栏目，相关功能和&ldquo;华电新闻网&rdquo;一起并入大学新闻中心网页，形成一个两地共享的新闻信息平台；加快新闻中心网页改版工作，打造高水平、高品质的新闻网。</p>

<p>特此通告，欢迎继续关注。</p>

<p>新闻中心网页地址：<a href="http://news.ncepu.edu.cn/">http://news.ncepu.edu.cn/</a></p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;党委宣传部</p>

<p>2007年10月</p>
', 1, CAST(0x0000A73100868C84 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (14, 1, N'关于保定校区主页栏目变动的通告', N'<p>&nbsp;</p>

<p>根据《华北电力大学关于加强和改进校园网信息建设与管理的若干意见》（华电党宣〔2007〕8号）中的有关规定，保定校区主页取消&ldquo;校园快讯&rdquo;和&ldquo;媒体报道&rdquo;栏目，相关功能和&ldquo;华电新闻网&rdquo;一起并入大学新闻中心网页，形成一个两地共享的新闻信息平台；加快新闻中心网页改版工作，打造高水平、高品质的新闻网。</p>

<p>特此通告，欢迎继续关注。</p>

<p>新闻中心网页地址：<a href="http://news.ncepu.edu.cn/">http://news.ncepu.edu.cn/</a></p>

<p>&nbsp;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;党委宣传部</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2007年10月</p>
', 1, CAST(0x0000A73100871996 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (15, 1, N'关于保定校区主页栏目变动的通告', N'<p>&nbsp;</p>

<p>根据《华北电力大学关于加强和改进校园网信息建设与管理的若干意见》（华电党宣〔2007〕8号）中的有关规定，保定校区主页取消&ldquo;校园快讯&rdquo;和&ldquo;媒体报道&rdquo;栏目，相关功能和&ldquo;华电新闻网&rdquo;一起并入大学新闻中心网页，形成一个两地共享的新闻信息平台；加快新闻中心网页改版工作，打造高水平、高品质的新闻网。</p>

<p>特此通告，欢迎继续关注。</p>

<p>新闻中心网页地址：<a href="http://news.ncepu.edu.cn/">http://news.ncepu.edu.cn/</a></p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;党委宣传部</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2007年10月</p>
', 1, CAST(0x0000A7310087857A AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (16, 1, N'关于从保定校区主页登录办公平台的说明', N'<p>&nbsp;</p>

<p>按照学校工作安排，正推进设计调试2017版办公自动化系统，为加快访问保定校区主页速度，不再设置展开办公平台登录窗口功能，所有校内IP用户均可点击保定校区主页右侧按钮&ldquo;办公平台&rdquo;、&ldquo;OA系统&rdquo;登录办公平台和OA办公自动化系统。dd</p>

<p>为保证网络信息安全，办公平台系统服务器是不对校外IP开放的，通过公共网络（网通、铁通等）访问保定校区主页，则不能登录办公平台和OA系统。通过申请VPN即可在公共网络访问办公平台等校内资源。</p>
', 1, CAST(0x0000A731008CA7FD AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (17, 1, N'策划案', N'<p>策划案策划案策划案策划案策划案策划案策划案策划案策划案</p>
', 1, CAST(0x0000A731011DBD04 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (18, 1, N'ddddd', N'<p>xinwen</p>
', 1, CAST(0x0000A731011DD3E3 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (19, 1, N'xinwen', N'<p>ddddddd dfsfs</p>
', 1, CAST(0x0000A731011E05D0 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (20, 1, N'nihao', N'<p>dsadad</p>
', 1, CAST(0x0000A731014F2426 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (21, 1, N'测试20170315001', N'<p>测试dasda</p>
', 1, CAST(0x0000A737007AB451 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (22, 1, N'测试20170315002', N'<p>测试<img alt="" src="/files/images/d4ad7417aad2b01_size93_w950_h619(1).jpg" style="width: 950px; height: 619px;" /></p>
', 1, CAST(0x0000A737007ACB15 AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (23, 1, N'测试20170315003', N'<p>测<img alt="" src="/files/images/d4ad7417aad2b01_size93_w950_h619.jpg" style="width: 950px; height: 619px;" /></p>
', 1, CAST(0x0000A737007AE0BA AS DateTime), 0)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (24, 1, N'测试20170329001', N'<p>1111111111</p>
', 1, CAST(0x0000A74501179E37 AS DateTime), 1)
INSERT [dbo].[TB_NEWS] ([NEWS_ID], [NEWS_TYPE], [NEWS_TITLE], [NEWS_CONTENT], [ADD_USER_ID], [ADD_TIME], [IS_DELETE]) VALUES (25, 1, N'测试20170329002', N'<p>https://www.baidu.com/<img alt="" src="/files/images/9191FB1CAC3CA3CE1A84119723502AE3.jpg" style="width: 600px; height: 487px;" /></p>
', 1, CAST(0x0000A7450117C5E2 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TB_NEWS] OFF
/****** Object:  Table [dbo].[TB_LOG]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_LOG](
	[LOG_ID] [int] IDENTITY(1,1) NOT NULL,
	[LOG_CONTENT] [varchar](100) NULL,
	[IP_ADDRESS] [varchar](100) NOT NULL,
	[OP_USER_ID] [int] NOT NULL,
	[ADD_TIME] [datetime] NOT NULL,
	[IS_ERROR] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LOG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TB_INTRODUTION]    Script Date: 04/05/2017 09:25:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_INTRODUTION](
	[IN_ID] [int] IDENTITY(1,1) NOT NULL,
	[IN_CONTENT] [text] NOT NULL,
	[ADD_TIME] [datetime] NOT NULL,
	[MARK] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[IN_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_INTRODUTION] ON
INSERT [dbo].[TB_INTRODUTION] ([IN_ID], [IN_CONTENT], [ADD_TIME], [MARK]) VALUES (1, N'<p style="text-align: justify;">华北电力大学是教育部直属的国家 &ldquo;211工程&rdquo; 重点建设大学、国家 &ldquo;985工程优势学科平台&rdquo; 重点建设大学。学校校部设在北京，分设保定校区。学校现有教职工 3 千余人，全日制在校本科生 2 万余人，研究生 1 万人。学校占地1600余亩，建筑面积100余万平方米。</p>

<p style="text-align: justify;">学校1958年创建于北京，原名北京电力学院。 1969年由北京迁至河北，先后更名为河北电力学院、华北电力学院。 1995年华北电力学院与北京动力经济学院（含华北电力学院北京研究生部）合并组建为华北电力大学。 2003 年， 在国家电力体制改革中， 学校由国家电力公司划转教育部管理，同时组建了由国家电网公司、 中国南方电网公司、 中国华能集团公司、中国大唐集团公司、 中国华电集团公司、 中国国电集团公司和中国电力投资集团公司组成的理事会与教育部共建华北电力大学。 2013年，华北电力大学理事会换届，理事会成员单位包括七大电力央企和中国电力企业联合会、 华北电力大学等九家单位<strong>&hellip;&hellip;</strong></p>
', CAST(0x0000A7300103302F AS DateTime), N'首页学校简介')
SET IDENTITY_INSERT [dbo].[TB_INTRODUTION] OFF
/****** Object:  StoredProcedure [dbo].[PRO_PAGE]    Script Date: 04/05/2017 09:25:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PRO_PAGE]
  @RCount int output,
  @tableName varchar(200),        --要搜索的表格
  @fieldList varchar(200),        --取出哪几列
  @pageSize int ,                 --页面大小
  @pageIndex int,                 --当前页面
  @order varchar(200),            --排序条件
  @orderType varchar(10)='desc',  --排列类型，默认值为desc
  @strWhere varchar(100)=''       --限制条件
  
AS
BEGIN
	declare @strSql varchar(1000),
	@SqlCount nvarchar(100)
	
    	SET @SqlCount = 'SELECT @RCount=COUNT(1) FROM ' + @tableName +' where '+ @strWhere  
           EXEC SP_EXECUTESQL @SqlCount,N'@RCount INT OUTPUT',  @RCount OUTPUT
               
	if @strWhere !=''
	 set @strSql ='SELECT top ' +str(@pageSize)+' '+@fieldList +' FROM '+  @tableName +
                     ' WHERE ( '+@order + '  >=
       (SELECT min ( '+@order +'  )
         FROM (SELECT TOP ( '+str(@pageIndex *@pageSize )+') '+@order + 
                 ' FROM ' +@tableName +' where '+@strWhere +
                 ' ORDER BY '+@order +'  '+ @orderType + '  ) AS T)) ' +' and '+
            ' ( '+@order + '  <=
       (SELECT min ( '+@order +'  )
         FROM (SELECT TOP ( '+str((@pageIndex-1) *@pageSize+1 )+') '+@order + 
                 ' FROM ' +@tableName +' where '+@strWhere +
                 ' ORDER BY '+@order +'  '+ @orderType + '  ) AS T)) ' 
                 +' and '+@strWhere    
                 + ' 
ORDER BY ' +@order+' ' + @orderType
	else 
	
	 set @strSql ='SELECT top ' +str(@pageSize)+' '+@fieldList +' FROM '+  @tableName +
                     ' WHERE ( '+@order + '  >=
       (SELECT min ( '+@order +'  )
         FROM (SELECT TOP ( '+str(@pageIndex *@pageSize )+') '+@order + 
                 ' FROM ' +@tableName  +
                 ' ORDER BY '+@order +'  '+ @orderType + '  ) AS T)) ' +' and '+
            ' ( '+@order + '  <=
       (SELECT min ( '+@order +'  )
         FROM (SELECT TOP ( '+str((@pageIndex-1) *@pageSize+1 )+') '+@order + 
                 ' FROM ' +@tableName  +
                 ' ORDER BY '+@order +'  '+ @orderType + '  ) AS T)) ' 
                 
                 + ' 
ORDER BY ' +@order+' ' + @orderType
	
     exec (@strSql )
	


END
GO
/****** Object:  View [dbo].[View_NEWS_USER]    Script Date: 04/05/2017 09:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_NEWS_USER]
AS
SELECT     dbo.TB_NEWS.NEWS_ID, dbo.TB_NEWS.NEWS_TITLE, dbo.TB_NEWS.NEWS_TYPE, dbo.TB_NEWS.ADD_TIME, dbo.TB_NEWS.IS_DELETE, dbo.TB_USER.USER_NAME
FROM         dbo.TB_NEWS INNER JOIN
                      dbo.TB_USER ON dbo.TB_NEWS.ADD_USER_ID = dbo.TB_USER.USE_ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TB_NEWS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "TB_USER"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 126
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NEWS_USER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_NEWS_USER'
GO
/****** Object:  StoredProcedure [dbo].[PRO_INSERT_OUTID]    Script Date: 04/05/2017 09:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	添加用户，并返回用户Id
-- =============================================
CREATE PROCEDURE [dbo].[PRO_INSERT_OUTID]
@USER_NAME VARCHAR(20),
@PASSWORD VARCHAR(20),
@USER_TYPE INT
AS
BEGIN
	
	INSERT INTO TB_USER ([USER_NAME],[PASSWORD],USER_TYPE)VALUES(@USER_NAME,@PASSWORD,@USER_TYPE)
	SELECT ident_current ('TB_USER') as [USER_ID]
	
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_UPDATE_URL]    Script Date: 04/05/2017 09:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	修改首页链接
-- =============================================
CREATE PROCEDURE [dbo].[PRO_UPDATE_URL] 
	@URL VARCHAR(100)
AS
BEGIN
	
	declare @count int;
	select @count=COUNT(*) from TB_URL;
	if(@count<=0)
	begin
		insert into TB_URL (URL_PATH,MARK) values (@URL,'首页“More”按钮链接');
	end
	else
	begin
		update TB_URL set URL_PATH=@URL;
	end
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_UPDATE_INTRODUTION]    Script Date: 04/05/2017 09:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	修改学校简介
-- =============================================
CREATE PROCEDURE [dbo].[PRO_UPDATE_INTRODUTION]
@CONTENT TEXT
AS
BEGIN
	declare @count int;
	select @count=COUNT(*) from TB_INTRODUTION;
	if(@count<=0)
	begin
		insert into TB_INTRODUTION (IN_CONTENT,MARK) values (@CONTENT,'首页学校简介');
	end
	else
	begin
		update TB_INTRODUTION set IN_CONTENT=@CONTENT;
	end
END
GO
/****** Object:  Default [DF_TB_USER_RIGHTS_ADD_TIME]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_USER_RIGHTS] ADD  CONSTRAINT [DF_TB_USER_RIGHTS_ADD_TIME]  DEFAULT (getdate()) FOR [ADD_TIME]
GO
/****** Object:  Default [DF_TB_USER_IS_DELETE]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_USER] ADD  CONSTRAINT [DF_TB_USER_IS_DELETE]  DEFAULT ((0)) FOR [IS_DELETE]
GO
/****** Object:  Default [DF_TB_USER_ADD_TIME]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_USER] ADD  CONSTRAINT [DF_TB_USER_ADD_TIME]  DEFAULT (getdate()) FOR [ADD_TIME]
GO
/****** Object:  Default [DF_TB_URL_ADD_TIME]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_URL] ADD  CONSTRAINT [DF_TB_URL_ADD_TIME]  DEFAULT (getdate()) FOR [ADD_TIME]
GO
/****** Object:  Default [DF_TB_NEWS_ADD_TIME]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_NEWS] ADD  CONSTRAINT [DF_TB_NEWS_ADD_TIME]  DEFAULT (getdate()) FOR [ADD_TIME]
GO
/****** Object:  Default [DF_TB_NEWS_IS_DELETE]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_NEWS] ADD  CONSTRAINT [DF_TB_NEWS_IS_DELETE]  DEFAULT ((0)) FOR [IS_DELETE]
GO
/****** Object:  Default [DF_TB_INTRODUTION_ADD_TIME]    Script Date: 04/05/2017 09:25:54 ******/
ALTER TABLE [dbo].[TB_INTRODUTION] ADD  CONSTRAINT [DF_TB_INTRODUTION_ADD_TIME]  DEFAULT (getdate()) FOR [ADD_TIME]
GO
