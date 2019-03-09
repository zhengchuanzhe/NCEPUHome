<%@ Page Title="管理机构" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="institutional_settings.aspx.cs" Inherits="NCEPUWeb.institutional_settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="body">
        <div id="institutional_settings">
            <div class="chart chart-vertical">
                <div class="root-con"><p class="chart-root">管理机构</p></div>
                <ul>
                    <li><a href="http://202.206.208.57/zzhb/" class="chart-leaf chart-leaf-right">党委组织部 统战部 党校</a></li>
                    <li><a href="http://202.206.208.58/xiaoban/" class="chart-leaf">党委办公室 校长办公室</a></li>
                    <li><a href="http://202.206.208.42/" class="chart-leaf chart-leaf-right">党委学生工作部 学生处 武装部</a></li>
                    <li><a href="http://xcb.ncepu.edu.cn/" class="chart-leaf">党委宣传部（新闻中心）</a></li>
                    <li><a href="http://202.206.208.58/jjw/" class="chart-leaf chart-leaf-right">纪委办公室 监察处 审计处</a></li>
                    <li><a href="http://202.206.208.58/baoweichu/" class="chart-leaf">党委保卫部、保卫处（保定）</a></li>
                    <li><a href="http://202.206.223.104/" class="chart-leaf chart-leaf-right">财务与资产管理处</a></li>
                    <li><a href="http://202.206.208.58/rshch/webpages/default.aspx" class="chart-leaf">人事处</a></li>
                    <li><a href="http://icd.ncepu.edu.cn/" class="chart-leaf chart-leaf-right">国际合作处</a></li>
                    <li><a href="http://jwc.ncepubd.edu.cn/jiaowuchu/" class="chart-leaf">教务处</a></li>
                    <li><a href="http://202.206.217.109/" class="chart-leaf chart-leaf-right">学位与学科建设办公室</a></li>
                    <li><a href="http://kjc.ncepubd.edu.cn:8080/" class="chart-leaf">科学技术处</a></li>
                    <li><a href="http://59.67.225.2:8080/" class="chart-leaf chart-leaf-right">招标中心</a></li>
                    <li><a href="http://202.206.217.109/" class="chart-leaf">研究生院</a></li>
                    <li><a href="http://202.206.208.58/gonghui/" class="chart-leaf chart-leaf-right">校工会</a></li>
                    <li><a href="http://202.206.208.57/hqc/" class="chart-leaf">后勤与基建管理处</a></li>
                    <li><a href="http://202.206.208.57:8080/xc/frontMain/indexCrud.action" class="chart-leaf chart-leaf-right">产业管理处</a>
                    </li>
                    <li><a href="http://202.206.208.58/tuanwei/" class="chart-leaf">校团委</a></li>
                    <li><a href="http://202.206.208.58/lgb/" class="chart-leaf chart-leaf-right">离退休工作办公室</a></li>
                    <li><a href="http://www.hdcj.com/" class="chart-leaf">继续教育学院</a></li>
                    <li><a href="#" class="chart-leaf chart-leaf-right">对外联络与合作部</a></li>
                    <li><a href="http://xxhb.ncepu.edu.cn/" class="chart-leaf">网络与信息化办公室</a></li>
                </ul>

            </div>
            <div class="chart chart-left">
                <div class="root-con"><p class="chart-root">教辅单位</p></div>
                <ul>
                    <li><a href="http://202.206.214.254/" class="chart-leaf">图书馆</a></li>
                    <li><a href="http://gjs.ncepu.edu.cn/" class="chart-leaf">高等教育研究所</a></li>
                </ul>

            </div>
            <div class="chart chart-right">
                <div class="root-con"><p class="chart-root">附属单位</p></div>
                <ul>
                    <li><a href="http://202.206.214.254/" class="chart-leaf">校医院</a></li>
                </ul>

            </div>
        </div>
    </div>
    <script type ="text/javascript" src="https://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type ="text/javascript" src="js/chart.js"></script>
<script  type ="text/javascript">
    var chat1 = new Chat($('.chart-vertical')).drawVertical();
    var chat2 = new Chat($('.chart-left')).drawLeft();
    var chat3 = new Chat($('.chart-right')).drawRight();
</script>
</asp:Content>
