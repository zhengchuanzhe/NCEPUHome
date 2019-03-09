using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class URLDAL
    {
        private SQLHelper sqlHelper;
        public URLDAL()
        {
            sqlHelper = new SQLHelper();
        }

        /// <summary>
        /// 获取URL
        /// </summary>
        /// <returns></returns>
        public string GetURL()
        {
            try
            {
                string sqlStr = "SELECT URL_PATH FROM TB_URL";
                DataTable data = sqlHelper.SQLChaXun(sqlStr);
                if (data == null || data.Rows.Count <= 0)
                {
                    return "";
                }
                return (string)data.Rows[0]["URL_PATH"];
            }
            catch (Exception)
            {
                return "";
            }

        }
        /// <summary>
        /// 修改URL
        /// </summary>
        /// <param name="URL"></param>
        /// <returns></returns>
        public int UpdateURL(string URL)
        {
            try
            {
                string sqlStr = "PRO_UPDATE_URL";
                SqlParameter[] param = new SqlParameter[] { 
                    new  SqlParameter ("@URL",URL)
                };
                int res = sqlHelper.SQLadd(sqlStr, param, CommandType.StoredProcedure);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}
