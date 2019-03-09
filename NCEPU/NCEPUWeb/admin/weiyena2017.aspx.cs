using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace NCEPUWeb.aodili2017
{
    public partial class weiyena2017 : System.Web.UI.Page
    {
        private UserHandler userHandler;
        private string[] url = { "", "NewsManager.aspx", "UserManager.aspx", "UrlManager.aspx", "UpdateIntrodution.aspx" };
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断是否为第一次登陆
            if (!Page.IsPostBack)
            {
                //查询是否有cookie值
                HttpCookie cookieName = Context.Request.Cookies["userName"];
                if (cookieName != null && Context.Request.Cookies["passWord"] != null)
                {
                    nameText.Text = cookieName.Value;
                    passWordText.Text = Context.Request.Cookies["passWord"].Value;
                    IsRemanber.Checked = true;
                }
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            UserModel userModel = new UserModel();
            userModel.UserName = nameText.Text.Trim();
            userModel.Password = passWordText.Text.Trim();

            userHandler = new UserHandler();
            int userId = userHandler.UserLogin(userModel);

            //判段是否登录成功
            if (userId > 0)
            {
                //判断是否记住用户名
                if (IsRemanber.Checked)
                {
                    HttpCookie cookieName = new HttpCookie("userName", userModel.UserName);
                    cookieName.Expires = DateTime.Now.AddMonths(2);
                    Response.SetCookie(cookieName);
                    HttpCookie cookiePassWord = new HttpCookie("passWord", userModel.Password);
                    cookiePassWord.Expires = DateTime.Now.AddDays(2);
                    Response.SetCookie(cookiePassWord);
                }
                else
                {
                    //删除存入的cookie
                    if (Request.Cookies["userName"] != null)
                    {
                        HttpCookie cookieName = new HttpCookie("userName");
                        cookieName.Expires = DateTime.Now.AddDays(-1d);
                        Response.SetCookie(cookieName);
                        HttpCookie cookiePassWord = new HttpCookie("passWord");
                        cookiePassWord.Expires = DateTime.Now.AddDays(-1d);
                        Response.SetCookie(cookiePassWord);
                    }
                }
                Session["admin"] = userId.ToString();
                List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
                if (UserRights.Count<=0)
                {
                    Response.Redirect("UpdataUser.aspx");
                }
                Response.Redirect(url[UserRights[0]]);


            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('用户名或密码错误！');</script>");
            }
        }


    }
}