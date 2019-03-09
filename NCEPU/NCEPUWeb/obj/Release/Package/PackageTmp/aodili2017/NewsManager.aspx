<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsManager.aspx.cs" Inherits="NCEPUWeb.Admin.NewsManager" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>华北电力大学保定校区后台管理</title>
    <!--                       CSS                       -->
    <!-- Reset Stylesheet -->
     <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
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
        window.onload = function () {
            // 创建编辑器
            var editor = CKEDITOR.replace('newsContentCKE1');
            // 为编辑器绑定"上传控件"
            CKFinder.setupCKEditor(editor, '/ckfinder/');
        };
     </script>
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

        function divShow() {
            var newsContent = document.getElementById("newsContent");
            var urlContent = document.getElementById("urlContent");
            var r1 = document.getElementById("RadioButton1");
            var r2 = document.getElementById("RadioButton2");
            var v1 = document.getElementById("RequiredFieldValidator2");
            if (r1.checked===true) {
                newsContent.style.display = "inline";
                urlContent.style.display = "none";
                v1.controltovalidate = "newsContentCKE1";
                v1.errormessage = "请输入新闻内容！"
            } else {
                newsContent.style.display = "none"
                urlContent.style.display = "inline";
                v1.controltovalidate = "UrlText";
                v1.errormessage = "请输入网址！"
            }
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
                        <!-- Accordion Menu -->
                        <li id="NewsManagerPag" runat="server"><a href="NewsManager.aspx" class="nav-top-item no-submenu current">
                            新闻管理 </a></li>
                        <li id="UserManagerPag" runat="server"><a href="UserManager.aspx" class="nav-top-item  no-submenu">
                            用户管理 </a></li>
                        <li id="UpdataUserPag" runat="server"><a href="UpdataUser.aspx" class="nav-top-item no-submenu">
                            密码修改 </a></li>
                        <li id="UrlManagerPag" runat="server"><a href="UrlManager.aspx" class="nav-top-item  no-submenu">
                            链接修改 </a></li>
                        <li id="UpdateIntrodutionPad" runat="server"><a href="UpdateIntrodution.aspx" class="nav-top-item  no-submenu ">
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
                            <li><a href="#tab1" class="default-tab">新闻列表</a></li>
                            <!-- href must be unique and match the id of target div -->
                            <li><a href="#tab2">上传新闻</a></li>
                        </ul>
                        <div class="clear">
                        </div>
                    </div>
                    <!-- End .content-box-header -->
                    <div class="content-box-content">
                        <div class="tab-content default-tab" id="tab1">
                            <div class="notification attention png_bg">
                                <a href="#" class="close">
                                    <img src="resources/images/icons/cross_grey_small.png" title="Close this notification"
                                        alt="close" /></a>
                                <!--       <div> This is a Content Box. You can put whatever you want in it. By the way, you can close this notification with the top-right cross. </div> -->
                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>
                                            <input class="check-all" type="checkbox" />
                                        </th>
                                        <th>
                                            新闻名
                                        </th>
                                        <th>
                                            上传者
                                        </th>
                                        <th>
                                            上传时间
                                        </th>
                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="5">
                                            <div class="bulk-actions align-left">
                                                <asp:LinkButton ID="deleteLinkButton" runat="server" CssClass="button " OnClientClick="return confirm('是否删除选中项？')"
                                                    OnClick="LinkButton1_Click">删除选中项目</asp:LinkButton>
                                            </div>
                                            <div class="pagination">
                                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                                    CssClass="aspNetPager" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                                                    PrevPageText="上一页" AlwaysShow="true" PageSize="10">
                                                </webdiyer:AspNetPager>
                                                <!--<a href="#" title="First Page">&laquo; 首页</a><a href="#" title="Previous Page">&laquo; 上一页</a> <a href="#" class="number current" title="1">1</a> <a href="#" class="number" title="2">2</a> <a href="#" class="number " title="3">3</a> <a href="#" class="number" title="4">4</a> <a href="#" title="Next Page">下一页 &raquo;</a><a href="#" title="Last Page">尾页 &raquo;</a> 
                 
                  <!-- End .pagination -->
                                            </div>
                                            <div class="clear">
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <asp:Repeater ID="newsRepeater" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="radioCheckBox" runat="server" ToolTip='<%#Eval("NEWS_ID") %>' />
                                                </td>
                                                <td>
                                                    <a href='<%#UrlOrNews( Eval("NEWS_ID").ToString(),Eval("NEWS_TYPE").ToString() )%>'>
                                                        <%#Eval("NEWS_TITLE")%></a>
                                                </td>
                                                <td>
                                                    <%# Eval("USER_NAME")%>
                                                </td>
                                                <td>
                                                    <%# Eval("ADD_TIME")%>
                                                </td>
                                                <td>
                                                    <!-- Icons -->
                                                    <asp:ImageButton ID="deleteButton" runat="server" OnClientClick="return confirm('是否删除该新闻？')"
                                                        ImageUrl="resources/images/icons/cross.png" OnClick="deleteButton_OnClick" CommandArgument='<%# Eval("NEWS_ID") %>'
                                                        title="删除" />
                                                    <!--  <img src="resources/images/icons/cross.png" alt="删除"  id="delect" runat ="server" />-->
                                                    <a href='javascript:openwindow("UpdateNews.aspx?newsId=","修改新闻",800,600,<%#Eval("NEWS_ID") %> )'
                                                        title="修改">
                                                        <img src="resources/images/icons/hammer_screwdriver.png" alt="修改" /></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <!-- End #tab1 -->
                        <div class="tab-content" id="tab2">
                            <fieldset>
                                <!-- Set class to "column-left" or "column-right" on fieldsets to divide the form into columns -->
                           
                                <p>
                                    <label>
                                        新闻标题</label>
                                    <asp:TextBox ID="titleText" runat="server" CssClass="text-input  medium-input " ReadOnly="false"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入新闻标题！"
                                        Text="*" ControlToValidate="titleText" ValidationGroup="news"></asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <label>
                                        新闻类型
                                    </label>
                                    <asp:RadioButton ID="RadioButton1" Text="新闻" runat="server" Width="100px" Checked="true" onclick="divShow()" 
                                        GroupName="checks" />
                                    <%-- <asp:RadioButton ID="RadioButton2" Text="文件" runat="server" Width="100px" GroupName="checks" />--%>
                                    <asp:RadioButton ID="RadioButton2" Text="网页链接" runat="server" Width="100px" GroupName="checks" onclick="divShow()" />
                                </p>
                                <p id="newsContent" runat="server" style="display: inline">
                                    <label>
                                        新闻内容</label>
                                    <%--<CKEditor:CKEditorControl ID="newsContentCKE" runat="server" Height="400px"></CKEditor:CKEditorControl>--%>
                                    <textarea rows="30" cols="50" ID="newsContentCKE1" runat="server"></textarea><br />
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                                        ValidationGroup="news" ShowSummary="false" />
                                </p>
                                <p id="fileContent" style="display: none">
                                    <label>
                                        选择文件</label>
                                    <input id="InputAffixFile" style="width: 450px; height: 22px" type="file" size="33"
                                        name="InputPictureFile" runat="server" title="ascsa">
                                </p>
                                <p id="urlContent" runat="server" style="display: none">
                                    <label>
                                        网页链接</label>
                                    <asp:TextBox ID="UrlText" runat="server" CssClass="text-input  medium-input " ReadOnly="false"></asp:TextBox>
                                    
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入新闻内容！"
                                        Text="*" ControlToValidate="newsContentCKE1" ValidationGroup="news"></asp:RequiredFieldValidator>
                                    </p>
                                <p>
                                    <asp:Button ID="Button1" runat="server" Text="提交" CssClass=" button " OnClick="Button1_Click"
                                        ValidationGroup="news" />
                                </p>
                            </fieldset>
                            <div class="clear">
                            </div>
                        </div>
                        <!-- End #tab2 -->
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
