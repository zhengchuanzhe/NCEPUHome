using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace NCEPUWeb
{
    public partial class Index : System.Web.UI.Page
    {
        private NewsHandler newsHandler;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                introdutionLab.Text = new IntrodutionHandler().GetIntrodution();
                HyperLink1.NavigateUrl = new URLHandler().GetURL();
                newsHandler = new NewsHandler();
                newNewsList.DataSource = newsHandler.GetNewNews(4);
                newNewsList.DataBind();
            }
        }

        ///   <summary> 
        ///   将指定字符串按指定长度进行剪切， 
        ///   </summary> 
        ///   <param   name= "oldStr "> 需要截断的字符串 </param> 
        ///   <param   name= "maxLength "> 字符串的最大长度 </param> 
        ///   <param   name= "endWith "> 超过长度的后缀 </param> 
        ///   <returns> 如果超过长度，返回截断后的新字符串加上后缀，否则，返回原字符串 </returns> 
        public static string StringTruncat(string oldStr, int maxLength, string endWith)
        {
            if (string.IsNullOrEmpty(oldStr))
                //   throw   new   NullReferenceException( "原字符串不能为空 "); 
                return oldStr + endWith;
            if (maxLength < 1)
                throw new Exception("返回的字符串长度必须大于[0] ");
            if (oldStr.Length > maxLength)
            {
                string strTmp = oldStr.Substring(0, maxLength);
                if (string.IsNullOrEmpty(endWith))
                    return strTmp;
                else
                    return strTmp + endWith;
            }
            return oldStr;
        }

        /// <summary>
        /// 转换时间
        /// </summary>
        /// <param name="oldString"></param>
        /// <returns></returns>
        public static string StringTime(string oldString)
        {
            int idex = oldString.IndexOf(' ');
            return oldString.Substring(0, idex);
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
                return "News.aspx?id=" + newsId;
            }
        }
    }
}