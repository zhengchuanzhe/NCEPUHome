<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateNews.aspx.cs" Inherits="NCEPUWeb.Admin.UpdateNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>修改新闻</title>
    <!-- Invalid Stylesheet. This makes stuff look pretty. Remove it if you want the CSS completely valid -->
    <link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />
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
        function divShow() {
            var newsContent = document.getElementById("newsContent");
            var urlContent = document.getElementById("urlContent");
            var r1 = document.getElementById("RadioButton1");
            var r2 = document.getElementById("RadioButton2");
            var v1 = document.getElementById("RequiredFieldValidator2");
            if (r1.checked === true) {
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
                        上传者</label>
                    <asp:TextBox ID="writerText" runat="server" CssClass=" text-input  small-input "></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="请输入上传者！"
                        Text="*" ControlToValidate="writerText" ValidationGroup="news"></asp:RequiredFieldValidator>
                    <br />
                </p>
                <p>
                    <label>
                        新闻类型
                    </label>
                    <asp:RadioButton ID="RadioButton1" Text="新闻" runat="server" Width="100px" Checked="true"
                        onclick="divShow()" GroupName="checks" />
                    <asp:RadioButton ID="RadioButton2" Text="网页链接" runat="server" Width="100px" GroupName="checks"
                        onclick="divShow()" />
                </p>
                <p id="newsContent" runat="server" style="display: inline">
                    <label>
                        新闻内容</label>
                    <textarea rows="30" cols="50" id="newsContentCKE1" runat="server"></textarea>
                    <%--<CKEditor:CKEditorControl ID="newsContentCKE" runat="server" Height="400px"></CKEditor:CKEditorControl>--%>
                    <!--<textarea class="text-input textarea wysiwyg" id="textarea" name="textfield" cols="79"
                         rows="15"></textarea>-->
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                        ValidationGroup="news" ShowSummary="false" />
                </p>
                <p id="urlContent" runat="server" style="display: none">
                    <label>
                        网页链接</label>
                    <asp:TextBox ID="UrlText" runat="server" CssClass="text-input  medium-input " ReadOnly="false"></asp:TextBox>
                </p>
                <p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入新闻内容！"
                        Text="*" ControlToValidate="newsContentCKE1" ValidationGroup="news"></asp:RequiredFieldValidator>
                    <asp:Button ID="Button1" runat="server" Text="提交" CssClass=" button " OnClick="Button1_Click"
                        ValidationGroup="news" />
                </p>
            </fieldset>
            <div class="clear">
            </div>
            <!-- End .clear -->
        </div>
    </div>
    </form>
</body>
</html>
