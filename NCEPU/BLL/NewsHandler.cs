using System;
using System.Collections.Generic;
using System.Text;
using Model;
using DAL;
using System.Data;

namespace BLL
{
    public class NewsHandler
    {
        private NewsDAL newsDal;
        public NewsHandler()
        {
            newsDal = new NewsDAL();
        }

        /// <summary>
        /// 获取最新新闻
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        public DataTable GetNewNews(int num)
        {
            return newsDal.GetNewNews(num);
        }

        /// <summary>
        /// 添加新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int AddNews(NewsModel newsModel)
        {
            return newsDal.AddNews(newsModel);
        }
        /// <summary>
        /// 删除新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int DeleteNews(string newsId)
        {
            return newsDal.DeleteNews(newsId);
        }

        /// <summary>
        /// 跟新新闻
        /// </summary>
        /// <param name="newsModel"></param>
        /// <returns></returns>
        public int UpdateNews(NewsModel newsModel)
        {
            return newsDal.UpdateNews(newsModel);
        }
        /// <summary>
        /// 根据新闻ID获取新闻内容
        /// </summary>
        /// <param name="newsId"></param>
        /// <returns></returns>
        public NewsModel GetNewsById(string newsId)
        {
            return newsDal.GetNewsById(newsId);
        }

        /// <summary>
        /// 获取新闻列表
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageSiz"></param>
        /// <param name="sum"></param>
        /// <returns></returns>
        public DataTable GetNewsList(int pageIndex, int pageSiz, out int sum)
        {
            return newsDal.GetNewsList(pageIndex, pageSiz, out sum);
        }
    }
}
