using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.IO;

namespace NCEPUWeb.Admin
{
    public partial class NewsManager : System.Web.UI.Page
    {
        private NewsHandler newsHandler;
        private int sum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("weiyena2017.aspx");
                }
                JudgmentAuthority((string)Session["admin"]);
                newsHandler = new NewsHandler();
                newsRepeater.DataSource = newsHandler.GetNewsList(1, 10, out sum);
                newsRepeater.DataBind();
                AspNetPager1.RecordCount = sum;

                UserModel um = new UserHandler().GetUserById((string)Session["admin"]);
                if (um == null)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('用户错误，请重新登录！');</script>");
                    Response.Redirect("weiyena2017.aspx");
                }
                userNameLab.Text = um.UserName;
            }
        }


        //分页控件
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            int index = AspNetPager1.CurrentPageIndex;
            newsRepeater.DataSource = new NewsHandler().GetNewsList(index, 10, out sum);
            newsRepeater.DataBind();
        }

        //删除已经选择
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            newsHandler = new NewsHandler();
            //遍历repeater控件的itemtemplate模版  
            foreach (RepeaterItem item in newsRepeater.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("radioCheckBox"); //根据控件id获得控件对象，cdDelete是checkBox控件的id  
                if (cb.Checked == true)
                {
                    string newsId = cb.ToolTip;
                    if (newsHandler.DeleteNews(newsId) <= 0)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('删除失败,请联系管理员！');</script>");
                        break;
                    }
                }
            }
            newsRepeater.DataSource = newsHandler.GetNewsList(1, 10, out sum);
            newsRepeater.DataBind();
            AspNetPager1.RecordCount = sum;
        }
        //删除某一条
        protected void deleteButton_OnClick(object sender, EventArgs e)
        {
            newsHandler = new NewsHandler();
            //点击当前按钮
            ImageButton IB = (ImageButton)sender;
            //获取新闻Id
            string newsId = IB.CommandArgument;
            //删除该新闻
            if (newsHandler.DeleteNews(newsId) <= 0)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('删除失败,请联系管理员！');</script>");
            }

            newsRepeater.DataSource = newsHandler.GetNewsList(1, 10, out sum);
            newsRepeater.DataBind();
            AspNetPager1.RecordCount = sum;
        }

        protected void signOutLinkButton_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("weiyena2017.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NewsModel newsModel = new NewsModel();
            //获取新闻标题
            newsModel.NewsTitle = titleText.Text.Trim();
            //获取新闻作者
            newsModel.AddUserId = int.Parse(Session["admin"].ToString());
            
            newsHandler = new NewsHandler();
            if (RadioButton1.Checked)
            {
                newsModel.NewsType = 1;
                //获取新闻内容
                newsModel.NewsContent = newsContentCKE1.Value;
            }
            if (RadioButton2.Checked)
            {
                newsModel.NewsType = 2;
                newsModel.NewsContent = UrlText.Text.Trim();
                if (!newsModel.NewsContent.StartsWith("http://")&&!newsModel.NewsContent.StartsWith("https://"))
                {
                    newsModel.NewsContent = "http://" + newsModel.NewsContent;
                }
            }
            //if (RadioButton3.Checked)
            //{
            //    newsModel.NewsType = 3;
            //}
            //添加新闻
            if (newsHandler.AddNews(newsModel) > 0)
            {

                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('提交成功！');</script>");
                Response.Redirect("NewsManager.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('提交失败,请联系管理员！');</script>");
            }
        }

        //判断权限
        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (!UserRights.Contains(1))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('改用户无此权限,请重新登陆！');</script>");
                Session["admin"] = null;
                Response.Redirect("weiyena2017.aspx");
            }
            if (UserRights.Contains(2))
            {
                UserManagerPag.Style.Add("display", "inline");
            }
            else
            {
                UserManagerPag.Style.Add("display", "none");
            }
            if (UserRights.Contains(3))
            {
                UrlManagerPag.Style.Add("display", "inline");
            }
            else
            {
                UrlManagerPag.Style.Add("display", "none");
            }
            if (UserRights.Contains(4))
            {
                UpdateIntrodutionPad.Style.Add("display", "inline");
            }
            else
            {
                UpdateIntrodutionPad.Style.Add("display", "none");
            }
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("上传文字图片说明书.doc");//路径

            //以字符流的形式下载文件
            FileStream fs = new FileStream(filePath, FileMode.Open);
            byte[] bytes = new byte[(int)fs.Length];
            fs.Read(bytes, 0, bytes.Length);
            fs.Close();
            Response.ContentType = "application/octet-stream";
            //通知浏览器下载文件而不是打开
            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode("上传文字图片说明书.doc", System.Text.Encoding.UTF8));
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        //判断是新闻还是网页
        public string UrlOrNews(string newsId, string newsType)
        {

            if (newsType == "2")
            {
                string Url = new NewsHandler().GetNewsById(newsId).NewsContent;
                return Url;
            }
            else
            {
                return "../News.aspx?id=" + newsId;
            }
        }
    }
}