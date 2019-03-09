<%@ Page Title="院系设置" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="faculty_settings.aspx.cs" Inherits="NCEPUWeb.faculty_settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="chart chart-level">
            <div class="root-con">
                <p class="chart-root">
                    华北电力大学院系设置</p>
            </div>
            <a href="http://202.206.208.58/fksys/" class="chart-leaf">仿真与控制实验室</a> <a href="faculty_settings_electric.aspx"
                class="chart-leaf">电气与电子工程学院</a> <a href="faculty_settings_energe.aspx" class="chart-leaf">
                    能源动力与机械工程学院</a> <a href="faculty_settings_computer.aspx" class="chart-leaf">控制与计算机工程学院</a>
            <a href="http://202.206.208.57/dianjing/" class="chart-leaf">经济与管理学院</a> <a href="http://202.206.208.58/slx/"
                class="chart-leaf">数理学院</a> <a href="http://59.67.225.76/" class="chart-leaf">人文与社会科学学院</a>
            <a href="http://202.206.208.58/yyx/" class="chart-leaf">外国语学院</a> <a href="http://202.206.208.58/huangongxi/yemian/shouye/index.php"
                class="chart-leaf">环境科学与工程学院</a> <a href="http://iei.ncepu.edu.cn/" class="chart-leaf">
                    国际教育学院</a> <a href="http://59.67.225.13/" class="chart-leaf">马克思主义学院</a>
            <a href="http://www.hdky.edu.cn/" class="chart-leaf">科技学院</a> <a href="http://202.206.208.57/txb/"
                class="chart-leaf">体育教学部</a> <a href="http://www.hdcj.com/" class="chart-leaf">继续教育学院</a>
            <a href="http://202.206.208.57/YiJiaoZhongXin/portal.php" class="chart-leaf">艺术教育中心</a>
            <a href="http://59.67.225.74/" class="chart-leaf">工程训练中心</a>
        </div>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/chart.js"></script>
    <script type="text/javascript">
        var chat = new Chat($('.chart')).drawLevel();
</script>
</asp:Content>
