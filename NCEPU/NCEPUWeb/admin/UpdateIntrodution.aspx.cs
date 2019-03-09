using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace NCEPUWeb.Admin
{
    public partial class UpdateIntrodution : System.Web.UI.Page
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
                newsContentCKE1.Value = new IntrodutionHandler().GetIntrodution();
            }
        }

        //判断权限
        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (!UserRights.Contains(4))
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            new IntrodutionHandler().UpdateIntrodution(newsContentCKE1.Value);
        }

        //退出登录
        protected void signOutLinkButton_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("weiyena2017.aspx");
        }


    }
}