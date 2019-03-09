using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace NCEPUWeb.Admin
{
    public partial class UpdataUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("weiyena2017.aspx");
                }
                string userId = Session["admin"].ToString();
                JudgmentAuthority(userId);
                UserModel userModel = new UserHandler().GetUserById(userId);
                if (null == userModel)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('用户错误，请重新登录！');</script>");
                    Response.Redirect("weiyena2017.aspx");
                }
                else
                {
                    userNameLab.Text = userModel.UserName;
                    nameText.Text = userModel.UserName;
                }
            }
        }
        //判断权限
        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (UserRights.Contains(1))
            {
                NewsManagerPag.Style.Add("display", "inline");
            }
            else
            {
                NewsManagerPag.Style.Add("display", "none");
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

        protected void signOutLinkButton_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("weiyena2017.aspx");
        }

        //修改密码
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (passwordText.Text.Trim() != passwordText1.Text.Trim())
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('两次密码不一致，请重新输入！');</script>");
                return;
            }
            if (Session["admin"] == null)
            {
                Response.Redirect("weiyena2017.aspx");
            }
            string userId = Session["admin"].ToString();
            UserHandler userHandler=new UserHandler ();
            UserModel userModel = userHandler.GetUserById(userId);
            if (null == userModel)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('用户错误，请重新登录！');</script>");
                Response.Redirect("weiyena2017.aspx");
            }
            else
            {
                string oldPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(oldPasswordText.Text.Trim(), "MD5").ToLower();
                if (oldPwd != userModel.Password)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('原密码错误！');</script>");
                    return;
                }
                userModel.Password = passwordText1.Text.Trim();
                if (userHandler.UpdataUser (userModel)>0)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改成功！');</script>");
                    Response.Redirect("weiyena2017.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改失败，请联系管理员！');</script>");
                   
                }
            }
        }
    }
}