using System;
using System.Collections.Generic;
using System.Text;

namespace Model
{
    /// <summary>
    /// 新闻实体类
    /// </summary>
    public class NewsModel
    {
        private int newsId;
        /// <summary>
        /// 新闻ID
        /// </summary>
        public int NewsId
        {
            get { return newsId; }
            set { newsId = value; }
        }
        private string newsTitle;
        /// <summary>
        /// 新闻标题
        /// </summary>
        public string NewsTitle
        {
            get { return newsTitle; }
            set { newsTitle = value; }
        }
        private int newsType;
        /// <summary>
        /// 新闻类型（1为新闻，2为文件，3为链接）
        /// </summary>
        public int NewsType
        {
            get { return newsType; }
            set { newsType = value; }
        }
        private string newsContent;
        /// <summary>
        /// 新闻内容或文件地址或者链接地址
        /// </summary>
        public string NewsContent
        {
            get { return newsContent; }
            set { newsContent = value; }
        }
        private int addUserId;
        /// <summary>
        /// 添加用户ID
        /// </summary>
        public int AddUserId
        {
            get { return addUserId; }
            set { addUserId = value; }
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

        private string addUserName;
        /// <summary>
        /// 添加者名字
        /// </summary>
        public string AddUserName
        {
            get { return addUserName; }
            set { addUserName = value; }
        }
    }
}
