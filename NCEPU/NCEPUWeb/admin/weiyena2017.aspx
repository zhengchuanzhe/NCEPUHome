<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="weiyena2017.aspx.cs" Inherits="NCEPUWeb.aodili2017.weiyena2017" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head1" runat="server">
    <title></title>
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
<!-- jQuery Configuration -->
<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
<!-- Facebox jQuery Plugin -->
<script type="text/javascript" src="resources/scripts/facebox.js"></script>
<!-- jQuery WYSIWYG Plugin -->
<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
</head>



    <body id ="login">
    <div id="login-wrapper" class="png_bg">
  <div id="login-top">
    <h1>后台管理</h1>
    <!-- Logo (221px width) -->
    <a><img id="logo" src="resources/images/logo.png" alt="Simpla Admin logo" /></a> </div>
  <!-- End #logn-top -->
  <div id="login-content">
      <form id="form1" runat="server">
      <div class="">
      </div>
      <p>
          <label>
              用户名</label>
          <asp:TextBox ID="nameText" runat="server" CssClass="text-input "></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入用户名！"
              Text="*" ControlToValidate="nameText"></asp:RequiredFieldValidator>
      </p>
      <div class="clear">
      </div>
      <p>
          <label>
              密码</label>
          <asp:TextBox ID="passWordText" runat="server" TextMode="Password" CssClass="text-input "></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请输入密码！"
              Text="*" ControlToValidate="passWordText"></asp:RequiredFieldValidator>
      </p>
      <div class="clear">
      </div>
      <p id="remember-password">
          <asp:CheckBox ID="IsRemanber" runat="server" />
          记住我
      </p>
      <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
          ShowSummary="false" />
      <div class="clear">
      </div>
      <p>
          <asp:Button ID="loginButton" runat="server" Text="登录" CssClass="button " OnClick="loginButton_Click" />
      </p>
      </form>
  </div>
  <!-- End #login-content -->
</div>
</body> 
  

</html>
