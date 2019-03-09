<%@ Page Title="信息快递" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="MessageList.aspx.cs" Inherits="NCEPUWeb.MessageList" %>
    
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div id="message-list">
            <h2>
                信息快递</h2>
            <table>
                <tr>
                    <th class="title">
                        标题
                    </th>
                    <th class="time">
                        发布时间
                    </th>
                </tr>
                        <asp:Repeater ID="newsList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td class="title">
                                    <a href='<%#UrlOrNews( Eval("NEWS_ID").ToString(),Eval("NEWS_TYPE").ToString() )%>'>
                                        <%# Eval("NEWS_TITLE")%></a>
                                </td>
                                <td class="time">
                                    <%# Eval("ADD_TIME")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
 
            </table>
           <div align="center">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" 
                      NextPageText="下一页" PrevPageText="上一页" AlwaysShow="true" PageSize="10" OnPageChanged="AspNetPager1_PageChanged">
                            </webdiyer:AspNetPager>
                            </div>
        </div>
    </div>
</asp:Content>
