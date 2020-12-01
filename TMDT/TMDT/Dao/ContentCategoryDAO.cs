using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectSEM3.EF;

namespace ProjectSEM3.Dao
{
    public class ContentCategoryDao
    {
        private SmartShopDbContext db = null;
        public ContentCategoryDao()
        {
            db = new SmartShopDbContext();
        }
        /// <summary>
        /// Lấy tất cả các danh mục bài viết
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ContentCategory> GetAllContentCategory()
        {
            IQueryable<ContentCategory> lst = db.ContentCategories.Where(x=>x.Status == true);
            return lst;
        }
        /// <summary>
        /// Tìm kiếm danh mục bài viết
        /// </summary>
        /// <param name="searchString"></param>
        /// <returns></returns>
        public IEnumerable<ContentCategory> GetAll(string searchString)
        {
            IQueryable<ContentCategory> model = db.ContentCategories.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model;
        }
        /// <summary>
        /// Lấy tất cả danh mục bài viết có trong thùng rác.
        /// </summary>
        /// <param name="searchString"></param>
        /// <returns></returns>
        public IEnumerable<ContentCategory> GetAllRecycelBin(string searchString)
        {
            IQueryable<ContentCategory> model = db.ContentCategories.Where(x => x.Status == false).OrderByDescending(x => x.CreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model;
        }

        /// <summary>
        /// Thêm danh mục bài viết
        /// </summary>
        /// <param name="entities"></param>
        /// <returns></returns>
        public int Create(ContentCategory entities)
        {
            var check = db.ContentCategories.SingleOrDefault(x => x.Name == entities.Name);
            if (check == null)
            {
                entities.Status = true;
                entities.CreateDate = DateTime.Now;
                db.ContentCategories.Add(entities);
                db.SaveChanges();
                return 1;
            }
            else
            {
                return -1;
            }
        }
        /// <summary>
        /// Cập nhật danh mục bài viết
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public bool Update(ContentCategory entity)
        {
            try
            {
                var contenCategory = db.ContentCategories.Find(entity.ID);
                contenCategory.Name = entity.Name;
                contenCategory.MetaTitle = entity.MetaTitle;

                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// lấy thông tin view
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ContentCategory ViewDetail(long id)
        {
            var pro = db.ContentCategories.Find(id);
            return pro;
        }


        /// <summary>
        /// xóa tạm: bằng cách thay đổi trạng thái của status
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool ChangeStatus(long id)
        {
            var pro = ViewDetail(id);
            pro.Status = !pro.Status;
            db.SaveChanges();
            return true;
        }

        /// <summary>
        /// xóa tài khoản
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(long id)
        {
            //xóa sản phẩm trong database 
            //nếu thành công trả về true
            //nếu thất bại trả về false
            try
            {
                var prod = db.ContentCategories.Find(id);
                db.ContentCategories.Remove(prod);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

    }
}