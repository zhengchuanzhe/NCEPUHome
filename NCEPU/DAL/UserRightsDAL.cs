using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    /// <summary>
    /// 用户权限操作类
    /// </summary>
    public class UserRightsDAL
    {
        private SQLHelper sqlHelper;
        public UserRightsDAL()
        {
            sqlHelper = new SQLHelper();
        }
        /// <summary>
        /// 根据用户Id获取用户权限
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<int> GetRigtsCodeByUserId(string userId) 
        {
            try
            {
                string sqlStr = "SELECT RIGHTS_CODE FROM TB_USER_RIGHTS WHERE [USER_ID]=@UserId";
                SqlParameter[] param = new SqlParameter[] {
                    new SqlParameter("@UserId",userId)
                };
                DataTable dt = sqlHelper.SQLChaXun(sqlStr, param);
                if (null==dt||dt.Rows.Count==0)
                {
                    return new List<int>();
                }
                List<int> listInt = new List<int>();
                foreach (DataRow item in dt.Rows)
                {
                    listInt.Add((int)item["RIGHTS_CODE"]);
                }
                return listInt;
            }
            catch (Exception)
            {
                return new List<int>();
            }
        }

        /// <summary>
        /// 添加权限
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="rightsCode"></param>
        /// <returns></returns>
        public int AddRigts(string userId, string rightsCode)
        {
            try
            {
                string sqlStr = "INSERT INTO TB_USER_RIGHTS([USER_ID],RIGHTS_CODE)VALUES(@userId,@rightsCode)";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@userId",userId),
                    new SqlParameter("@rightsCode",rightsCode)
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
