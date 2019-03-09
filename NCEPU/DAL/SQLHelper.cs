/*
 * 创建人：郑传哲
 * 创建时间：2017/3/1 15:49:57
 * 说明：数据库助手类
 */
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class SQLHelper
    {
        private SqlConnection conn = null;
        private SqlCommand cmd = null;
        private DataTable dt;
        private SqlDataReader sdr;

        public SQLHelper()
        {
            string connstr = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            conn = new SqlConnection(connstr);
        }

        #region 该方法执行SQL语句的增加删除修改
        /// <summary>
        /// 该方法执行SQL语句的增加删除修改
        /// </summary>
        /// <param name="procName">要增加删除修改的SQL语句或者储存过程</param>
        /// <param name="param">参数集合</param>
        /// <param name="type">命令类型</param>
        /// <returns>返回受影响的行数</returns>
        public int SQLadd(string procName, SqlParameter[] param, CommandType type = CommandType.Text)
        {
            int res;
            conn.Open();
            using (cmd = new SqlCommand(procName, conn))
            {
                cmd.CommandType = type;
                cmd.Parameters.AddRange(param);
                res = cmd.ExecuteNonQuery();
            }
            conn.Close();
            return res;
        }
        #endregion

        #region 该方法执行SQL语句的查询(有参数)
        /// <summary>
        /// 该方法执行SQL语句的查询（有参数）
        /// </summary>
        /// <param name="procName">输入需要需要查询的SQL语句</param>
        /// <param name="param">不需添加</param>
        /// <param name="type">命令类型</param>
        /// <returns>返回查询内容</returns>
        public DataTable SQLChaXun(string procName, SqlParameter[] param, CommandType type = CommandType.Text)
        {
            dt = new DataTable();
            conn.Open();
            using (cmd = new SqlCommand(procName, conn))
            {
                cmd.Parameters.AddRange(param);
                cmd.CommandType = type;
                using (sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    dt.Load(sdr);
                }
            }
            return dt;
        }
        #endregion

        #region 该方法执行SQL语句的查询（无参数）
        /// <summary>
        /// 该方法执行SQL语句的查询（无参数）
        /// </summary>
        /// <param name="procName">输入需要需要查询的SQL语句</param>
        /// <param name="type">命令类型</param>
        /// <returns>返回查询内容</returns>
        public DataTable SQLChaXun(string procName, CommandType type = CommandType.Text)
        {
            dt = new DataTable();
            conn.Open();
            using (cmd = new SqlCommand(procName, conn))
            {
                cmd.CommandType = type;
                using (sdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                {
                    dt.Load(sdr);
                }
            }
            return dt;
        }
        #endregion

        #region 该方法查询第一行第一列

        /// <summary>
        /// 该方法查询第一行第一列
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public string count(string sql)
        {
            conn.Open();
            try
            {
                cmd = new SqlCommand(sql, conn);
                object obj = cmd.ExecuteScalar();
                if (obj != null)
                {
                    return obj.ToString();
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        #endregion
    }
}
