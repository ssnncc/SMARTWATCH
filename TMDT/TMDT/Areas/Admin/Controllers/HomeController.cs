using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using ProjectSEM3.EF;
using ProjectSEM3.DAO;
using ProjectSEM3.Common;
using ProjectSEM3.Dao;
using ProjectSEM3.Models;

namespace ProjectSEM3.Areas.Admin.Controllers
{
   
    public class HomeController : Controller
    {
        // GET: Admin/Home
        SmartShopDbContext db = new SmartShopDbContext();
        
        public ActionResult Index()
        {
            
            ViewBag.CountUser = db.Users.Count();
            ViewBag.CountProduct = db.Products.Count();
            ViewBag.CountOrder = db.Orders.Count();
            ViewBag.CountContent = db.Contents.Count();
            ViewBag.CountUserAdmin = db.Users.Count(x => x.GroupUserID==2);
            ViewBag.Songuoitruycap = HttpContext.Application["Songuoitruycap"].ToString();
            // ViewBag.Songuoionline = HttpContext.Application["Songuoionline"].ToString();
            
            ViewBag.RevenueStatistics = RevenueStatistics();
            ViewBag.RevenueStatistics_Month1 = RevenueStatistics_Month(1, 2020);
            ViewBag.RevenueStatistics_Month7 = RevenueStatistics_Month(7,2020);
            ViewBag.RevenueStatistics_Month8 = RevenueStatistics_Month(8, 2020);
            ViewBag.RevenueStatistics_Month9 = RevenueStatistics_Month(9, 2020);
            ViewBag.RevenueStatistics_Month10 = RevenueStatistics_Month(10, 2020);
            ViewBag.ListOrder_Month_9 = ListOrder_Month(9,2020);
            return View();
        }

        public ActionResult NotificationAuthorize()
        {
            return View();
        }
        //Thống kê tổng doanh thu
        public decimal RevenueStatistics()
        {
            decimal totalrevenue = db.OrderDetails.Sum(n => n.Quantity*n.Price).Value;

            return totalrevenue;
        }

        //Thống kê doanh thu theo tháng
        public decimal RevenueStatistics_Month(int Month, int Year)
        {
            //In ra danh sách đơn hàng tương ứng
            var listDH = db.Orders.Where(n => n.ShipCreateDate.Month == Month && n.ShipCreateDate.Year == Year);
            decimal totalrevenue = 0;
            foreach(var item in listDH)
            {
                totalrevenue += item.OrderDetails.Sum(n => n.Quantity * n.Price).Value;
            }
            return totalrevenue;
        }
        //Thống kê sản phẩm không bán được
        //public IEnumerable<Product> ProductNotSale()
        //{

        //}

        //Thống kê số đơn hàng trong tháng 
        public int ListOrder_Month(int Month, int Year)
        {
            //In ra danh sách đơn hàng tương ứng
            var listDH = db.Orders.Where(n => n.ShipCreateDate.Month == Month && n.ShipCreateDate.Year == Year);
             int totalorder = 0;
            foreach (var item in listDH)
            {
                var order = item.OrderDetails.Sum(n => n.Quantity * n.Price).Value;
                totalorder += 1;
            }
            return totalorder;
        }
        


    }


}