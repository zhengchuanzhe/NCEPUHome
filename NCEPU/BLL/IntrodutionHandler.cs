using System;
using System.Collections.Generic;
using System.Text;
using DAL;

namespace BLL
{
    /// <summary>
    /// 学校简介操作类
    /// </summary>
    public class IntrodutionHandler
    {
        private IntroductionDAL inDal;
        public IntrodutionHandler()
        {
            inDal = new IntroductionDAL();
        }

                /// <summary>
        /// 修改首页简介
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public int UpdateIntrodution(string content) 
        {
            return inDal.UpdateIntrodution(content);
        }

        /// <summary>
        /// 获取学校简介
        /// </summary>
        /// <returns></returns>
        public string GetIntrodution()
        {
            return inDal.GetIntrodution();
        }
    }
}
