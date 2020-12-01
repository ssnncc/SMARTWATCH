﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using ProjectSEM3.EF;

namespace ProjectSEM3.Dao
{
    public class SlideDAO
    {
        SmartShopDbContext db =null;

        public SlideDAO()
        {
            db = new SmartShopDbContext();
        }

        public IEnumerable<Slide> GetAll()
        {
            IQueryable<Slide> list = db.Slides.OrderByDescending(x => x.CreateDate);
            return list;
        }
        public IEnumerable<Slide> GetSlideView(long id)
        {
            IQueryable<Slide> list = db.Slides.Where(x=>x.Status == true).OrderByDescending(x => x.CreateDate).Take(4);
            return list;
        }

        public bool Create(Slide slide)
        {
            try
            {
                slide.CreateDate = DateTime.Now;
                slide.Status = true;
                db.Slides.Add(slide);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
            
        }

        public bool Edit(Slide slide)
        {
            try
            {
                var model = Detail(slide.ID);
                model.Image = slide.Image;
                model.Status = slide.Status;
                model.Description = slide.Description;
                model.TypeID = slide.TypeID;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        public Slide Detail(long id)
        {
            return db.Slides.SingleOrDefault(x => x.ID == id);
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
                var prod = db.Slides.Find(id);
               
                db.Slides.Remove(prod);
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
        /// <summary>
        /// xóa tạm
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool ChangeStatus(long id)
        {
            var slide = db.Slides.Find(id);
            slide.Status = !slide.Status;
            db.SaveChanges();
            return slide.Status;
        }
    }
}