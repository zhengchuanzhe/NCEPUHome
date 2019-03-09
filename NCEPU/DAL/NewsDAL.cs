using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using Model;

namespace DAL
{
    /// <summary>
    /// 用户数据库操作类
    /// </summary>
    public class NewsDAL
    {
        private SQLHelper sqlHelper;
        public NewsDAL()
        {
            sqlHelper = new SQLHelper();
        }

        /// <summary>
        /// 添加新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int AddNews(NewsModel newsModel)
        {
            try
            {
                string sqlStr = "INSERT INTO TB_NEWS (NEWS_TYPE,NEWS_TITLE,NEWS_CONTENT,ADD_USER_ID)VALUES(@NEWS_TYPE,@NEWS_TITLE,@NEWS_CONTENT,@ADD_USER_ID)";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@NEWS_TYPE",newsModel.NewsType ),
                    new SqlParameter("@NEWS_TITLE",newsModel.NewsTitle),
                    new SqlParameter("@NEWS_CONTENT",newsModel .NewsContent ),
                    new SqlParameter("@ADD_USER_ID",newsModel .AddUserId)
                };
                int res = sqlHelper.SQLadd(sqlStr, param);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }
        /// <summary>
        /// 删除新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int DeleteNews(string  newsId)
        {
            try
            {
                string sqlStr = "UPDATE TB_NEWS SET IS_DELETE=1 WHERE NEWS_ID=@NEWS_ID AND IS_DELETE=0";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@NEWS_ID",newsId )
                };
                int res = sqlHelper.SQLadd(sqlStr, param);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        ///更新新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int UpdateNews(NewsModel newsModel)
        {
            try
            {
                string sqlStr = "UPDATE TB_NEWS SET NEWS_TYPE=@NEWS_TYPE,NEWS_TITLE=@NEWS_TITLE,NEWS_CONTENT =@NEWS_CONTENT WHERE IS_DELETE=0 AND NEWS_ID=@NEWS_ID";
                SqlParameter[] param = new SqlParameter[] {
                    new SqlParameter("@NEWS_TYPE",newsModel .NewsType ),
                    new SqlParameter ("@NEWS_TITLE",newsModel .NewsTitle ),
                    new SqlParameter("@NEWS_CONTENT",newsModel.NewsContent ),
                    new SqlParameter ("@NEWS_ID",newsModel.NewsId)
                };
                int res = sqlHelper.SQLadd(sqlStr, param);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }
        /// <summary>
        /// 根据新闻ID获取新闻内容
        /// </summary>
        /// <param name="newsId"></param>
        /// <returns></returns>
        public NewsModel GetNewsById(string newsId)
        {
            try
            {
                string sqlStr = "SELECT NEWS_ID,NEWS_TYPE,NEWS_TITLE,n.ADD_TIME,NEWS_CONTENT,u.[USER_NAME],u.USE_ID  FROM TB_NEWS n " +
                                " INNER JOIN TB_USER u ON n.ADD_USER_ID=u.USE_ID "+
                                " WHERE n.IS_DELETE=0 AND n.NEWS_ID =@NEWS_ID";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@NEWS_ID",newsId)
                };
                DataTable data = sqlHelper.SQLChaXun(sqlStr, param);
                if (null==data||data.Rows .Count <=0)
                {
                    return null;
                }
                NewsModel newsModel = new NewsModel();
                newsModel.AddUserId = (int)data.Rows[0]["USE_ID"];
                newsModel.NewsId = (int)data.Rows[0]["NEWS_ID"];
                newsModel.NewsType =(int)data.Rows [0]["NEWS_TYPE"];
                newsModel.NewsTitle = (string)data.Rows[0]["NEWS_TITLE"];
                newsModel.AddTime = (DateTime)data.Rows[0]["ADD_TIME"];
                newsModel.AddUserName = (string)data.Rows[0]["USER_NAME"];
                newsModel.NewsContent = (string)data.Rows[0]["NEWS_CONTENT"];
                return newsModel;
            }
            catch (Exception)
            {
                return null;    
            }
        }

        /// <summary>
        /// 获取新闻列表
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSiz"></param>
        /// <param name="sum"></param>
        /// <returns></returns>
        public DataTable GetNewsList(int pageIndex, int pageSize,out int sum)
        {
            try
            {
                sum = 0;
                string sqlStr = "PRO_PAGE";

                SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@RCount",SqlDbType .Int),
                new SqlParameter ("@tableName","View_NEWS_USER"),
                new SqlParameter ("@fieldList","NEWS_ID,NEWS_TITLE,NEWS_TYPE,ADD_TIME,[USER_NAME]"),
                new SqlParameter ("@pageSize",pageSize ),
                new SqlParameter ("@pageIndex",pageIndex  ),
                new SqlParameter ("@order","ADD_TIME"),
                new SqlParameter ("@orderType","desc"),
                new SqlParameter ("@strWhere","IS_DELETE=0"  )
            };
                param[0].Value = null;
                param[0].Direction = ParameterDirection.Output;
                DataTable data = sqlHelper.SQLChaXun(sqlStr, param, CommandType.StoredProcedure);
                if (data==null||data .Rows.Count<=0)
                {
                    return null;
                }
                //List<NewsModel> newsList = new List<NewsModel>();
                //foreach (DataRow  item in data.Rows )
                //{
                //    NewsModel newsModel = new NewsModel();
                //    newsModel.NewsId = (int)data.Rows[0]["NEWS_ID"];
                //    newsModel .NewsTitle =(string )data .Rows[0]["NEWS_TITLE"];
                //    newsModel.NewsType = (int)data.Rows[0]["NEWS_TYPE"];
                //    newsList.Add(newsModel);
                //}
                sum = (int)param[0].Value;
                return data;
            }
            catch (Exception e)
            {
                sum = 0;
                return null;
            }
        }

        /// <summary>
        /// 获取最新新闻
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        public DataTable GetNewNews(int num)
        {
            try
            {
                string sqlStr = "SELECT TOP " + num.ToString() + " NEWS_ID,NEWS_TITLE ,NEWS_TYPE,ADD_TIME FROM TB_NEWS WHERE IS_DELETE=0  ORDER BY ADD_TIME DESC";
                return sqlHelper.SQLChaXun(sqlStr);
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}
