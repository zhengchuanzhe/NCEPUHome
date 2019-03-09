using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

namespace NCEPUWeb.Admin
{
    public partial class UrlManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("weiyena2017.aspx");
                }
                JudgmentAuthority((string)Session["admin"]);
                oldUrlText.Text = new URLHandler().GetURL();
                UserModel um = new UserHandler().GetUserById((string)Session["admin"]);
                if (um == null)
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('用户错误，请重新登录！');</script>");
                    Response.Redirect("weiyena2017.aspx");
                }
                userNameLab.Text = um.UserName;
            }
        }

        //判断权限
        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (!UserRights.Contains(3))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('改用户无此权限,请重新登陆！');</script>");
                Session["admin"] = null;
                Response.Redirect("weiyena2017.aspx");
            }
            if (UserRights.Contains(1))
            {
                UserManagerPag.Style.Add("display", "inline");
            }
            else
            {
                UserManagerPag.Style.Add("display", "none");
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (new URLHandler().UpdateURL (newUrlText .Text )>0)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改成功！');</script>");
                Response.Redirect("UrlManager.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('修改失败,请联系管理员！');</script>");
                       
            }
        }

    }
}