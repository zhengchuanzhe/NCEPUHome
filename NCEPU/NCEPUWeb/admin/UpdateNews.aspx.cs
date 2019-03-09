using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace NCEPUWeb.Admin
{
    public partial class UpdateNews : System.Web.UI.Page
    {
        private NewsModel newsModel;
        private string newsId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("weiyena2017.aspx");
                }
                newsId = Request.QueryString["newsId"];
                //无newsId传入返回首页
                if (newsId == null)
                {
                    Response.Redirect("NewsManager.aspx");
                }
                JudgmentAuthority((string)Session["admin"]);
                newsModel = new NewsHandler().GetNewsById(newsId);
                titleText.Text = newsModel.NewsTitle;
                if (newsModel.NewsType == 1)
                {
                    newsContentCKE1.Value = newsModel.NewsContent;
                    RadioButton1.Checked = true;
                    newsContent.Style.Add("display", "inline");
                    urlContent.Style.Add("display", "none");
                    RequiredFieldValidator2.ErrorMessage = "请输入新闻内容!";
                    RequiredFieldValidator2.ControlToValidate = "newsContentCKE1";
                }
                else { 
                    UrlText.Text= newsModel.NewsContent;
                    RadioButton2.Checked = true;
                    newsContent.Style.Add("display", "none");
                    urlContent.Style.Add("display", "inline");
                     RequiredFieldValidator2.ErrorMessage = "请输入网址!";
                    RequiredFieldValidator2.ControlToValidate = "UrlText";
                }
                
                writerText.Text = newsModel.AddUserName;
            }
            else
            {
                if (RadioButton1.Checked)
                {
                    newsContent.Style.Add("display", "inline");
                    urlContent.Style.Add("display", "none");
                    RequiredFieldValidator2.ErrorMessage = "请输入新闻内容!";
                    RequiredFieldValidator2.ControlToValidate = "newsContentCKE1";
                }
                else
                {
                    newsContent.Style.Add("display", "none");
                    urlContent.Style.Add("display", "inline");
                    RequiredFieldValidator2.ErrorMessage = "请输入网址!";
                    RequiredFieldValidator2.ControlToValidate = "UrlText";
                }
            }
        }

        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (!UserRights.Contains(1))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('改用户无此权限,请重新登陆！');</script>");
                Session["admin"] = null;
                Response.Redirect("weiyena2017.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("weiyena2017.aspx");
            }
            newsId = Request.QueryString["newsId"];
            newsModel = new NewsModel();
            newsModel.NewsId = int.Parse(newsId);
            newsModel.NewsTitle = titleText.Text.Trim();
            if (RadioButton1.Checked)
            {
                 newsModel.NewsType = 1;
                 newsModel.NewsContent = newsContentCKE1.Value;
            }
            else
            {
                newsModel.NewsType = 2;
                newsModel.NewsContent = UrlText.Text.Trim();
                if (!newsModel.NewsContent.StartsWith("http://") && !newsModel.NewsContent.StartsWith("https://"))
                {
                    newsModel.NewsContent = "http://" + newsModel.NewsContent;
                }
            }
            if (new NewsHandler().UpdateNews(newsModel)>0)
            {
                 Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改成功！');</script>");
            }
            else
            {

                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改失败！');</script>");
            }
        }
    }
}