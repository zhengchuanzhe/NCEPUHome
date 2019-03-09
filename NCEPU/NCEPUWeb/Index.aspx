<%@ Page Title="华北电力大学保定校区" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Index.aspx.cs" Inherits="NCEPUWeb.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    window.open('notice2.htm', 'popwindow', 'height=250, width=470,top=0, left=15, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <span class="u-icon-explosion explosion"></span>
        <ul class="nav-right" style="align-items:center">
            <li><a class="u-icon-nav-blue" href="http://www.hbjswm.gov.cn/">河北文明网</a></li>
            <li><a class="u-icon-nav-blue" href="http://qnzs.youth.cn/2016jyj/">青年之声</a></li>
            <li><a class="u-icon-nav-blue" href="http://bgpt.ncepu.edu.cn/">办公平台</a></li>
            <li><a class="u-icon-nav-blue" href="http://202.206.208.53/OA/Default.MSPX">OA系统</a></li>
            <li><a class="u-icon-nav-blue" href="http://59.67.225.73/jiaowuchu/">教务信息</a></li>
            <li><a class="u-icon-nav-blue" href="http://59.67.225.73/syjx/default.html">仿真教学</a></li>
            <li><a class="u-icon-nav-blue" href="http://zhaopinbd.ncepu.edu.cn/rs/recruit/">人才招聘</a></li>
            <li><a class="u-icon-nav-blue" href="http://202.206.208.43/ECWeb/notice.htm">精品课堂</a></li>
            <li><a class="u-icon-nav-blue" href="http://www.hdky.edu.cn/">科技学院</a></li>
        </ul>
        <div class="nav-left">
            <div class="message">
                <h2 class="u-icon-message">
                    <span><a href="MessageList.aspx">信息快递</a></span></h2>
                <marquee behavior="scroll" loop="-1" direction="up" scrollamount="4" height="96" width="170" 
                    onmouseover="this.stop()" onmouseout="this.start()">
<asp:Repeater ID="newNewsList" runat="server">
<ItemTemplate>
<div class="message-item">
                        <span class="u-icon-arrow-right-message"></span>
                        <ul>
                            <li class="title"><a href='<%#UrlOrNews( Eval("NEWS_ID").ToString(),Eval("NEWS_TYPE").ToString() )%>'><%#  StringTruncat((Eval("NEWS_TITLE")).ToString(), 8, "...")%></a></li>
                            <li class="time"><%# StringTime(Eval("ADD_TIME").ToString())%></li>
                        </ul>
                    </div>
</ItemTemplate>
</asp:Repeater>

                    <a href="MessageList.aspx" class="message-more">More>></a>
                </marquee>
                <span class="u-icon-message-bg"></span>
            </div>
            <div class="links">
                <h2 class="u-icon-links">
                    <span>校内热线</span></h2>
                <ul>
                    <li class="link"><a href="http://www.ncepu.edu.cn/"><span class="u-icon-arrow-right">
                    </span>大学主页</a> </li>
                    <li class="link"><a href="http://www.ncepubbs.cn/"><span class="u-icon-arrow-right">
                    </span>缘路有你</a> </li>
                    <li class="link"><a href="http://202.206.208.58/wlzx/Second.aspx?id1=103&id2=104"><span
                        class="u-icon-arrow-right"></span>网络服务</a></li>
                    <li class="link"><a href="http://202.206.223.102/"><span class="u-icon-arrow-right">
                    </span>资源导航</a> </li>
                </ul>
                <span class="u-icon-links-bg"></span>
            </div>
        </div>
        <div class="middle">
            <asp:Label ID="introdutionLab" runat="server" Text=""></asp:Label>
            <div class="more">
                <asp:HyperLink ID="HyperLink1" class="u-icon-more" runat="server"></asp:HyperLink>
                <span>
                </span>
            </div>
        </div>
    </div>
</asp:Content>
