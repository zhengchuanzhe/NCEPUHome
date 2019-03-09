using System;
using System.Collections.Generic;
using System.Text;
using DAL;

namespace BLL
{
    /// <summary>
    /// 用户权限操作实体类
    /// </summary>
    public class UserRightsHandler
    {
        private UserRightsDAL userRightDal;
        public UserRightsHandler()
        {
            userRightDal = new UserRightsDAL();
        }

        /// <summary>
        /// 根据用户Id获取用户权限
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public List<int> GetRigtsCodeByUserId(string userId)
        {
            return userRightDal.GetRigtsCodeByUserId(userId);
        }

        /// <summary>
        /// 添加权限
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="rightsCode"></param>
        /// <returns></returns>
        public int AddRigts(string userId,string  rightsCode)
        {
            return userRightDal.AddRigts(userId, rightsCode);
        }
    }
}
