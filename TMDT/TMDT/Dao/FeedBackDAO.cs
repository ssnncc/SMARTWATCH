using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectSEM3.EF;

namespace ProjectSEM3.Dao
{
    public class FeedBackDAO
    {
        private SmartShopDbContext db = null;
        public FeedBackDAO()
        {
            db = new SmartShopDbContext();
        }

        public IEnumerable<FeedBack> GetAll(string searchString)
        {
            IQueryable<FeedBack> lst = db.FeedBacks.OrderBy(x => x.CreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                lst = lst.Where(x => x.Email.Contains(searchString));
            }
            return lst;
        }

        public FeedBack ViewDetail(long id)
        {
            var model = db.FeedBacks.Find(id);
            model.Status = true;
            return model;
        }

        public bool Insert(FeedBack back)
        {
            try
            {
                back.Status = false;
                db.FeedBacks.Add(back);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        /// <summary>
        /// xóa tài khoản
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(long id)
        {
            //xóa phản hồi trong database 
            //nếu thành công trả về true
            //nếu thất bại trả về false
            try
            {
                var prod = db.FeedBacks.Find(id);

                db.FeedBacks.Remove(prod);
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                var message = e.Message;
                return false;
                throw;
            }
        }
    }
}