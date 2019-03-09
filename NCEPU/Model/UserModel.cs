using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    /// <summary>
    /// 用户实体类
    /// </summary>
    public class UserModel
    {
        private int userId;
        /// <summary>
        /// 用户ID
        /// </summary>
        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private string userName;
        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        private string password;
        /// <summary>
        /// 密码
        /// </summary>
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private int type;
        /// <summary>
        /// 用户类型
        /// </summary>
        public int Type
        {
            get { return type; }
            set { type = value; }
        }
        private string mark;
        /// <summary>
        /// 备注
        /// </summary>
        public string Mark
        {
            get { return mark; }
            set { mark = value; }
        }
        private DateTime addTime;
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime
        {
            get { return addTime; }
            set { addTime = value; }
        }
    }
}
