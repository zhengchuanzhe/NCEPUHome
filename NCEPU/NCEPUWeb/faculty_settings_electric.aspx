<%@ Page Title="电气与电子工程学院" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="faculty_settings_electric.aspx.cs" Inherits="NCEPUWeb.faculty_settings_electric" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="chart chart-level sub_institutional_settings">
            <div class="root-con"><p class="chart-root">电气与电子工程学院</p></div>
            <div class="leaf-con">
                <a href="http://202.206.208.58/dianlixi/" class="chart-leaf">电力工程系</a>
                <a href="http://202.206.208.57/dianzi/" class="chart-leaf">电子与通信工程系</a>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/chart.js"></script>
    <script type="text/javascript">
        var chat = new Chat($('.chart')).drawLevel();
</script>
</asp:Content>
