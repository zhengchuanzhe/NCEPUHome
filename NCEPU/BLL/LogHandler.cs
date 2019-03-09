using System;
using System.Collections.Generic;
using System.Text;
using DAL;

namespace BLL
{
    public class LogHandler
    {
        private LogDAL logDal;
        public LogHandler()
        {
            logDal = new LogDAL();
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
            return logDal.AddLog(logContent,ipAddress,OPUserId,isError);
        }
    }
}
