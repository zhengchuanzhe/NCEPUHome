using System;
using System.Collections.Generic;
using System.Text;
using Model;
using DAL;
using System.Data;

namespace BLL
{
    public class UserHandler
    {
        private UserDAL userDal;
        public UserHandler()
        {
            userDal = new UserDAL();
        }

        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int AddUser(UserModel userModel)
        {
            userModel.Password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userModel.Password, "MD5").ToLower(); 
            return userDal.AddUser(userModel);
        }

        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int UpdataUser(UserModel userModel)
        {
            userModel.Password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userModel.Password, "MD5").ToLower(); 
            return userDal.UpdataUser(userModel);
        }
        
        /// <summary>
        /// 根据用户ID获取用户信息
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public UserModel GetUserById(string userId)
        {
            return userDal.GetUserById(userId);
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>-1为错误</returns>
        public int DeleteUser(string userId)
        {
            return userDal.DeleteUser(userId);
        }
        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <returns></returns>
        public List<UserModel> GetUsers()
        {
            return userDal.GetUsers();
        }

        /// <summary>
        /// 获取用户DataTable
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="sum"></param>
        /// <returns></returns>
        public DataTable GetUsersData(int pageIndex, int pageSize, out int sum)
        {
            return userDal.GetUsersData(pageIndex, pageSize, out sum);
        }

        /// <summary>
        /// 根据用户名称获取用户数量
        /// </summary>
        /// <param name="userName"></param>
        /// <returns>-1为错误</returns>
        public int GetCountByUserName(string userName)
        {
            return userDal.GetCountByUserName(userName);
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="userModel"></param>
        /// <returns>用户id，-1代表错误</returns>
        public int UserLogin(UserModel userModel)
        {
            userModel.Password = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userModel.Password, "MD5").ToLower(); 
            return userDal.UserLogin(userModel);
        }
    }
}
