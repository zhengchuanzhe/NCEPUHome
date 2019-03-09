using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

namespace NCEPUWeb.Admin
{
    public partial class UserManager : System.Web.UI.Page
    {
        int sum;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["admin"] == null)
                {
                    Response.Redirect("weiyena2017.aspx");
                }
                JudgmentAuthority((string)Session["admin"]);
                userRepeater.DataSource = new UserHandler().GetUsersData(1, 10, out sum);
                userRepeater.DataBind();
                AspNetPager1.RecordCount = sum;
                UserModel um = new UserHandler().GetUserById((string)Session["admin"]);
                userNameLab.Text = um.UserName;
            }
        }

        //判断权限
        private void JudgmentAuthority(string userId)
        {
            List<int> UserRights = new UserRightsHandler().GetRigtsCodeByUserId(userId.ToString());
            if (!UserRights.Contains(2))
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

        //分页控件
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            int index = AspNetPager1.CurrentPageIndex;
            userRepeater.DataSource = new UserHandler().GetUsersData(index, 10, out sum);
            userRepeater.DataBind();
        }

        //删除已经选择
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UserHandler userHandler = new UserHandler();
            //遍历repeater控件的itemtemplate模版  
            foreach (RepeaterItem item in userRepeater.Items)
            {
                CheckBox cb = (CheckBox)item.FindControl("radioCheckBox"); //根据控件id获得控件对象，cdDelete是checkBox控件的id  
                if (cb.Checked == true)
                {
                    string userId = cb.ToolTip;
                    if (userHandler.DeleteUser(userId) <= 0)
                    {
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('删除失败,请联系管理员！');</script>");
                        break;
                    }
                }
            }
            userRepeater.DataSource = userHandler.GetUsersData(1, 10, out sum);
            userRepeater.DataBind();
            AspNetPager1.RecordCount = sum;
        }
        //删除某一条
        protected void deleteButton_OnClick(object sender, EventArgs e)
        {
            UserHandler userHandler = new UserHandler();
            //点击当前按钮
            ImageButton IB = (ImageButton)sender;
            //获取新闻Id
            string userId = IB.CommandArgument;
            //删除该新闻
            if (userHandler.DeleteUser(userId) <= 0)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('删除失败,请联系管理员！');</script>");
            }

            userRepeater.DataSource = userHandler.GetUsersData(1, 10, out sum);
            userRepeater.DataBind();
            AspNetPager1.RecordCount = sum;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (passwordText.Text.Trim() != passwordText1.Text.Trim())
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('两次密码不一致！');</script>");
                return;
            }
            if (!(CheckBox1.Checked || CheckBox3.Checked || CheckBox3.Checked || CheckBox4.Checked))
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('该用户未分配任何权限！');</script>");
                return;
            }

            UserModel userModel = new UserModel();
            userModel.UserName = nameText.Text.Trim();
            userModel.Password = passwordText.Text.Trim();
            if (new UserHandler().GetCountByUserName(userModel.UserName)>0)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('该用户名已存在！');</script>");
                return;
            }
            int userId = new UserHandler().AddUser(userModel);
            if (userId > 0)
            {
                if (!AddRights(userId.ToString()))
                {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('添加失败,请联系管理员！');</script>");
                    return;
                }
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('添加成功！');</script>");
                Response.Redirect("UserManager.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('添加失败,请联系管理员！');</script>");
                return;
            }
        }

        /// <summary>
        /// 添加用户权限
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        private bool AddRights(string userId)
        {
            UserRightsHandler urHandler = new UserRightsHandler();
            if (CheckBox1.Checked)
            {
                if (urHandler.AddRigts(userId, "1") <= 0)
                {
                    return false;
                }
            }
            if (CheckBox2.Checked)
            {
                if (urHandler.AddRigts(userId, "2") <= 0)
                {
                    return false;
                }
            }
            if (CheckBox3.Checked)
            {
                if (urHandler.AddRigts(userId, "3") <= 0)
                {
                    return false;
                }
            }
            if (CheckBox4.Checked)
            {
                if (urHandler.AddRigts(userId, "4") <= 0)
                {
                    return false;
                }
            }
            return true;
        }



    }
}