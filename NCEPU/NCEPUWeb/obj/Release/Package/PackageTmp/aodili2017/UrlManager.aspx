<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UrlManager.aspx.cs" Inherits="NCEPUWeb.Admin.UrlManager" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>华北电力大学保定校区后台管理</title>
    <!--                       CSS                       -->
     <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Reset Stylesheet -->
    <link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
    <!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
    <link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
    <!--                       Javascripts                       -->
    <!-- jQuery -->
    <script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
    <!-- jQuery Configuration表格 -->
    <script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
    <!-- Facebox jQuery Plugin -->
    <script type="text/javascript" src="resources/scripts/facebox.js"></script>
    <!-- jQuery WYSIWYG Plugin -->
    <script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
    <!-- jQuery Datepicker Plugin -->
    <script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
    <script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
    <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
    <script src="ckfinder/ckfinder.js" type="text/javascript"></script>
    <script type="text/javascript">
        function openwindow(url, winName, width, height, newsId) {
            xposition = 0; yposition = 0;
            url = url + newsId;
            if ((parseInt(navigator.appVersion) >= 4)) {
                xposition = (screen.width - width) / 2;
                yposition = (screen.height - height) / 2;
            }
            theproperty = "width=" + width + ","
+ "height=" + height + ","
+ "location=0,"
+ "menubar=0,"
+ "resizable=1,"
+ "scrollbars=0,"
+ "status=0,"
+ "titlebar=0,"
+ "toolbar=0,"
+ "hotkeys=0,"
+ "screenx=" + xposition + "," //仅适用于Netscape
+ "screeny=" + yposition + "," //仅适用于Netscape
+ "left=" + xposition + "," //IE
+ "top=" + yposition; //IE

            window.open(url, winName, theproperty);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="body-wrapper">
            <!-- Wrapper for the radial gradient background -->
            <div id="sidebar">
                <div id="sidebar-wrapper">
                    <a>
                        <img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a>
                    <!-- Sidebar Profile links -->
                    <div id="profile-links">
                        Hello, <a href="#" title="Edit your profile">
                            <asp:Label ID="userNameLab" runat="server" Text=""></asp:Label></a>
                        <br />
                        <a href="#" title="Sign Out">
                            <asp:LinkButton ID="signOutLinkButton" runat="server" OnClick="signOutLinkButton_Click">退出</asp:LinkButton>
                        </a>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.nav-top-item').click(function () {
                                $('.nav-top-item').removeClass('current');
                                $(this).addClass('current');
                            })
                        })

                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.ms').click(function () {
                                $('.ms').removeClass('current');
                                $(this).addClass('current');
                            })
                        })

                    </script>
                    <ul id="main-nav">
                         <li id="NewsManagerPag" runat="server"><a href="NewsManager.aspx" class="nav-top-item no-submenu ">
                            新闻管理 </a></li>
                        <li id="UserManagerPag" runat="server"><a href="UserManager.aspx" class="nav-top-item  no-submenu">用户管理
                        </a></li>
                        <li id="UpdataUserPag" runat="server"><a href="UpdataUser.aspx" class="nav-top-item no-submenu">密码修改 </a>
                        </li>
                        <li id="UrlManagerPag"  runat="server"><a href="UrlManager.aspx" class="nav-top-item  no-submenu  current">链接修改
                        </a></li>
                        <li id="UpdateIntrodutionPad"  runat="server"><a href="UpdateIntrodution.aspx" class="nav-top-item  no-submenu ">
                            简介修改 </a></li>
                    </ul>
                    <!-- End #main-nav -->
                </div>
            </div>
            <!-- End #sidebar -->
            <div id="main-content">
                <!-- Page Head -->
                <div class="clear">
                </div>
                <!-- End .clear -->
                <div class="content-box">
                    <!-- Start Content Box -->
                    <div class="content-box-header">
                        <ul class="content-box-tabs">
                            <li><a href="#tab1" class="default-tab">修改地址</a></li>
                        </ul>
                        <div class="clear">
                        </div>
                    </div>
                    <!-- End .content-box-header -->
                    <div class="content-box-content">
                        <div class="tab-content default-tab" id="tab1">
                            <fieldset>
                                <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                                <p>
                                    <label>
                                        原链接地址</label>
                                    <asp:TextBox ID="oldUrlText" runat="server" ReadOnly="true" CssClass="text-input  medium-input "></asp:TextBox>
                                </p>
                                <p>
                                    <label>
                                        新链接地址（注意加"http://"）</label>
                                    <asp:TextBox ID="newUrlText" runat="server" CssClass=" text-input  medium-input "></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="密码！"
                                        Text="*" ControlToValidate="newUrlText" ValidationGroup="news"></asp:RequiredFieldValidator>
                                    <br />
                                </p>
                                <p>
                                    <asp:Button ID="Button1" runat="server" Text="修改" CssClass=" button " OnClick="Button1_Click"
                                        ValidationGroup="news" />
                                </p>
                            </fieldset>
                            <div class="clear">
                            </div>
                        </div>
                        <!-- End #tab1 -->
                    </div>
                    <!-- End .content-box-content -->
                </div>
                <!-- End .content-box -->
                <!-- End .content-box -->
                <!-- End Notifications -->
                <div id="footer">
                    <small>
                        <!-- Remove this notice or replace it with whatever you want -->
                        版权所有&#169;华北电力大学 | Powered by <a>Dreamtech</a> | <a href="#">Top</a> </small>
                </div>
                <!-- End #footer -->
            </div>
            <!-- End #main-content -->
        </div>
    </div>
    </form>
</body>
</html>
