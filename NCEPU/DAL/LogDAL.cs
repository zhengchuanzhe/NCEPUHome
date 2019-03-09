using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace DAL
{
    public class LogDAL
    {
        private SQLHelper sqlHelper;
        public LogDAL()
        {
            sqlHelper = new SQLHelper();
        }

        /// <summary>
        /// 记录日志
        /// </summary>
        /// <param name="logContent"></param>
        /// <param name="ipAddress"></param>
        /// <param name="OPUserId"></param>
        /// <param name="isError"></param>
        /// <returns></returns>
        public int AddLog(string logContent, string ipAddress, string OPUserId, bool isError)
        {
            try
            {
                string sqlStr = "INSERT INTO TB_LOG (LOG_CONTENT,IP_ADDRESS,OP_USER_ID,IS_ERROR)VALUES(@LOG_CONTENT,@IP_ADDRESS,@OP_USER_ID,@IS_ERROR)";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@LOG_CONTENT",logContent),
                    new SqlParameter("@IP_ADDRESS",ipAddress),
                    new SqlParameter("@OP_USER_ID",OPUserId),
                    new SqlParameter ("@IS_ERROR",isError)
                };
                int res = sqlHelper.SQLadd(sqlStr, param);
                return res;
            }
            catch (Exception)
            {
                return -1;
            }
        }
    }
}
