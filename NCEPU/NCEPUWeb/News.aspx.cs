using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using Model;
using BLL;
using System.Web.UI.WebControls;

namespace NCEPUWeb
{
    public partial class News : System.Web.UI.Page
    {
        private NewsHandler newsHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    newsHandler = new NewsHandler();
                    //获取新闻Id
                    string newsId = Request.QueryString["id"];
                    //无newsId传入返回首页
                    if (newsId == null)
                    {
                        Response.Redirect("Index.aspx");
                    }
                    NewsModel newsModel = newsHandler.GetNewsById(newsId);
                    LabUrl.Text = newsModel.NewsTitle;
                    LabTitle.Text = newsModel.NewsTitle;
                    LabTime.Text = newsModel.AddTime.ToString();
                    LabContent.Text = newsModel.NewsContent;
                }
                catch (Exception)
                {
                }
            }
        }
    }
}