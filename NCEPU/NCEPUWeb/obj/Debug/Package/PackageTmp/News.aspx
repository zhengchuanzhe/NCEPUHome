<%@ Page Title="新闻页" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="NCEPUWeb.News" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="body">
        <div id="message">
            <div class="nav">您的位置：<a href="Index.aspx">华电主页</a>&rarr;
                <a href="MessageList.aspx">信息快递</a>&rarr; 
        <asp:Label ID="LabUrl" runat="server" Text=""></asp:Label>
            </div>
            <h2>
            <asp:Label ID="LabTitle" runat="server" Text=""></asp:Label></h2>
            <ul class="about">
                <li class="time"><span>发布时间：<asp:Label ID="LabTime" runat="server" Text=""></asp:Label> </span>
             </li>
            </ul>
            <p><asp:Label ID="LabContent" runat="server" Text=""></asp:Label></p>
        </div>
    </div>
</asp:Content>
