<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="NCEPUWeb.Error" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>出错了</title>
    <link href="../CSS/loginfrm.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        var i = 5;
        var intervslid;
        intervslid = setInterval("fun()", 1000);
        function fun() {
            if (i == 0) {
                window.location.href = "Index.aspx";
                clearInterval(intervslid);
            }
            document.getElementById("mas").innerHTML = i;
            i--;
        }
    </script>
    <style type="text/css">
        .style1
        {
            color: #3333FF;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="loginfrm " align="center">
        <h4>
            出错啦</h4>
        <div class="login ">
            <p>
                访问出错，请联系管理员</p>
            <p>
                将在<span id="mas" class="style1">5</span>秒后返回<a href="Index.aspx">主页</a></p>
        </div>
    </div>
    </form>
</body>
</html>
