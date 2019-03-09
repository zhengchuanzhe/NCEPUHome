using System;
using System.Collections.Generic;
using System.Text;
using DAL;

namespace BLL
{
    public class URLHandler
    {
        private URLDAL urlDal;
        public URLHandler()
        {
            urlDal = new URLDAL();
        }


        /// <summary>
        /// 获取URL
        /// </summary>
        /// <returns></returns>
        public string GetURL()
        {
            return urlDal.GetURL();
        }
        /// <summary>
        /// 修改URL
        /// </summary>
        /// <param name="URL"></param>
        /// <returns></returns>
        public int UpdateURL(string URL)
        {
            return urlDal.UpdateURL(URL);
        }

    }
}
