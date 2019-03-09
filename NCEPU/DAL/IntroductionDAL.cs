using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    /// <summary>
    /// 首页简介操作类
    /// </summary>
    public class IntroductionDAL
    {
        private SQLHelper sqlHelper;
        public IntroductionDAL()
        {
            sqlHelper = new SQLHelper();
        }

        /// <summary>
        /// 修改首页简介
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public int UpdateIntrodution(string content) 
        {
            try
            {
                string sqlStr = "PRO_UPDATE_INTRODUTION";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter ("@CONTENT",content)
                };
                int res = sqlHelper.SQLadd(sqlStr, param,CommandType.StoredProcedure);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// 获取学校简介
        /// </summary>
        /// <returns></returns>
        public string GetIntrodution()
        {
            try
            {
                string sqlStr = "SELECT IN_CONTENT FROM TB_INTRODUTION";
                DataTable data = sqlHelper.SQLChaXun(sqlStr);
                if (null==data||data.Rows.Count<=0)
                {
                    return "";
                }
                return (string)data.Rows[0]["IN_CONTENT"];
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}
