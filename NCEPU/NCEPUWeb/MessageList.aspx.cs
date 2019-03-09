using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace NCEPUWeb
{
    public partial class MessageList : System.Web.UI.Page
    {
        private NewsHandler newsHandler;
        private int sum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                newsHandler = new NewsHandler();

                newsList.DataSource = newsHandler.GetNewsList(1, 10,out sum);

                newsList.DataBind();
                AspNetPager1.RecordCount = sum;
            }
        }

        private  void GetList()
        {
            newsHandler = new NewsHandler();
            int pageIndex = AspNetPager1.CurrentPageIndex;
            newsList.DataSource = newsHandler.GetNewsList(pageIndex, 10, out sum);
            newsList.DataBind();
        }

        //分页事件
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            GetList();
        }


        //判断是新闻还是网页
        public string UrlOrNews(string newsId,string newsType)
        {
           
            if (newsType == "2")
            {
                string Url = new NewsHandler().GetNewsById(newsId).NewsContent;
                return Url;
            }
            else
            {
                return "News.aspx?id=" + newsId;
            }
        }
    }
}