using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using Model;
using System.Data;

namespace DAL
{
    /// <summary>
    /// 用户数据库操作类
    /// </summary>
    public class UserDAL
    {
        private SQLHelper sqlHelper;
        public UserDAL()
        {
            sqlHelper = new SQLHelper();
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int AddUser(UserModel userModel)
        {
            try
            {
                string sqlStr = "PRO_INSERT_OUTID";
                SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@USER_NAME",userModel.UserName),
                    new SqlParameter("@PASSWORD",userModel.Password),
                    new SqlParameter("@USER_TYPE",userModel.Type)
                };
                DataTable dt = sqlHelper.SQLChaXun(sqlStr, param,CommandType.StoredProcedure);
                if (dt==null||dt.Rows.Count<=0)
                {
                    return -1;
                }
                string res= dt.Rows[0]["USER_ID"].ToString();
                return int.Parse(res);
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int UpdataUser(UserModel userModel)
        {
            try
            {
                string sqlStr = "UPDATE TB_USER SET [USER_NAME]=@USER_NAME,[PASSWORD]=@PASSWORD,USER_TYPE=@USER_TYPE WHERE USE_ID=@USE_ID";
                SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@USER_NAME",userModel.UserName),
                    new SqlParameter("@PASSWORD",userModel.Password),
                    new SqlParameter("@USER_TYPE",userModel.Type),
                    new SqlParameter("@USE_ID",userModel.UserId)
                };
                return sqlHelper.SQLadd(sqlStr, param);
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int DeleteUser(string userId)
        {
            try
            {
                string sqlStr = "UPDATE TB_USER SET IS_DELETE=1 WHERE USE_ID=@USE_ID";
                SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@USE_ID",userId)
                };
                return sqlHelper.SQLadd(sqlStr, param);
            }
            catch (Exception)
            {
                return -1;
            }
        }
        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <returns></returns>
        public List<UserModel> GetUsers()
        {
            try
            {
                string sqlStr = "SELECT * FROM TB_USER WHERE IS_DELETE=0";
                DataTable data = sqlHelper.SQLChaXun(sqlStr);
                if (data == null || data.Rows.Count <= 0)
                {
                    return new List<UserModel>();
                }
                List<UserModel> userList = new List<UserModel>();
                foreach (DataRow item in data.Rows)
                {
                    UserModel um = new UserModel();
                    um.UserId = (int)item["USE_ID"];
                    um.UserName = (string)item["USER_NAME"];
                    um.Password = (string)item["PASSWORD"];
                    um.Type = (int)item["USER_TYPE"];
                    um.AddTime = (DateTime)item["ADD_TIME"];
                    userList.Add(um);
                }
                return userList;
            }
            catch (Exception)
            {
                return new List<UserModel>();
            }
        }

        /// <summary>
        /// 获取用户DataTable
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="sum"></param>
        /// <returns></returns>
        public DataTable GetUsersData(int pageIndex,int pageSize,out int sum)
        {
            sum = 0;
            string sqlStr = "PRO_PAGE";
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@RCount",SqlDbType .Int),
                new SqlParameter ("@tableName","TB_USER"),
                new SqlParameter ("@fieldList","USE_ID,[USER_NAME],USER_TYPE,ADD_TIME"),
                new SqlParameter ("@pageSize",pageSize ),
                new SqlParameter ("@pageIndex",pageIndex  ),
                new SqlParameter ("@order","ADD_TIME"),
                new SqlParameter ("@orderType","desc"),
                new SqlParameter ("@strWhere","IS_DELETE=0"  )
            };
            param[0].Value = null;
            param[0].Direction = ParameterDirection.Output;

            DataTable data = sqlHelper.SQLChaXun(sqlStr, param, CommandType.StoredProcedure);
            if (data == null || data.Rows.Count <= 0)
            {
                return null;
            }
            return data;
        }

        /// <summary>
        /// 根据用户名称获取用户数量
        /// </summary>
        /// <param name="userName"></param>
        /// <returns>-1为错误</returns>
        public int GetCountByUserName(string userName)
        {
            try
            {
                string sqlStr = "SELECT COUNT(*) AS USER_COUNT FROM TB_USER WHERE IS_DELETE=0 AND [USER_NAME]=@USER_NAME";
                SqlParameter[] param = new SqlParameter[] {
                    new SqlParameter("@USER_NAME",userName)
                };
                DataTable data = sqlHelper.SQLChaXun(sqlStr,param);
                if (data == null || data.Rows.Count <= 0)
                {
                    return 0;
                }
                int userCount = (int)data.Rows[0]["USER_COUNT"];
                return userCount;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>用户id，-1代表错误</returns>
        public int UserLogin(UserModel userModel)
        {
            try
            {
                string sqlStr = "SELECT * FROM TB_USER WHERE IS_DELETE=0 AND [USER_NAME]=@USER_NAME AND [PASSWORD]=@PASSWORD";
                SqlParameter[] param = new SqlParameter[] { 
                    new SqlParameter("@USER_NAME",userModel.UserName),
                    new SqlParameter("@PASSWORD",userModel.Password)
                };
                DataTable data = sqlHelper.SQLChaXun(sqlStr, param);
                if (data == null || data.Rows.Count <= 0)
                {
                    return 0;
                }
                int userId = (int)data.Rows[0]["USE_ID"];
                return userId;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        /// <summary>
        /// 根据用户ID获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public UserModel GetUserById(string userId)
        {
            try
            {
                string sqlStr = "SELECT USE_ID,[USER_NAME],[PASSWORD],USER_TYPE,ADD_TIME FROM TB_USER WHERE IS_DELETE=0 AND USE_ID=@USE_ID";
                SqlParameter[] param = new SqlParameter[] {
                    new SqlParameter("@USE_ID",userId)
                };
                DataTable data = sqlHelper.SQLChaXun(sqlStr, param);
                if (data==null||data.Rows .Count<=0)
                {
                    return null;
                }
                UserModel userModel = new UserModel();
                userModel.UserId = (int)data.Rows[0]["USE_ID"];
                userModel.UserName = (string)data.Rows[0]["USER_NAME"];
                userModel.Password = (string)data.Rows[0]["PASSWORD"];
                userModel.AddTime = (DateTime)data.Rows[0]["ADD_TIME"];
                userModel.Type = (int)data.Rows[0]["USER_TYPE"];
                return userModel;
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
