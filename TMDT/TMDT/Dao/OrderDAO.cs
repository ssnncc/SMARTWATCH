using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using ProjectSEM3.EF;

namespace ProjectSEM3.Dao
{
    public class OrderDAO
    {
        private SmartShopDbContext db = null;

        public OrderDAO()
        {
            db = new SmartShopDbContext();
        }

        /// <summary>
        /// xóa business
        /// xóa đơn hàng và sản phẩm của đơn hàng 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(long id)
        {
            try
            {
                var model = db.Orders.Find(id);
                
                db.Orders.Remove(model);//xóa các action
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }

        //gettAll
        public IEnumerable<Order> GetAllOrder(string searchString)
        {
            IQueryable<Order> orders = db.Orders.OrderByDescending(x => x.ShipCreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                orders = orders.Where(x => x.ShipName.Contains(searchString));
            }

            return orders;
        }

        //get order theo ngày 
        public IEnumerable<Order> ListOrdersDay(DateTime dateTime)
        {
            IQueryable<Order> orders = db.Orders.Where(x => x.ShipCreateDate.ToString("yyyy-MM-dd") == dateTime.ToString("yyyy-MM-dd"));
            return orders;
        }

        //detail order
        public Order Detail(long id)
        {
            var model = db.Orders.SingleOrDefault(x => x.ID == id);
            return model;
        }

        /// <summary>
        /// cập nhập lại tình trạng đã duyệt khi nhân viên click và xem chi tiết 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public void ChangeStatus(long id, int status)
        {
            var model = Detail(id);
            model.Status = status;
            db.SaveChanges();
        }

        //Insert order
        public long Create(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }
        /// <summary>
        /// Cập nhập lại trạng thái và tình trạng thanh toán của đơn hàng
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <param name="payment"></param>
        /// <returns></returns>
        public bool updateStatusOrder(long id, int status, int payment)
        {
            try
            {
                OrderDetailDAO orderDetailDao = new OrderDetailDAO();
                ProductDAO productDao = new ProductDAO();

                var order = Detail(id);

                if (order.PaymentID == 1)//nếu tính trạng là thanh toán online thì không cập nhập đc tình trạng thanh toán 
                {
                    payment = 1;
                }

                if (status == -1)//kiểm tra nếu là hủy
                {
                    if (status == order.Status)//nếu đã là hủy rồi thì không cần cập nhập lại số lượng sản phẩm
                    {
                        order.PaymentID = payment;
                        order.Status = status;
                    }
                    else//nếu chưa là hủy thì cập nhập lại số lượng
                    {
                        var orderDetail = orderDetailDao.GetDetailOrder(order.ID);
                        foreach (var item in orderDetail)
                        {
                            var product = productDao.ViewDetail(item.ProductID);
                            product.Quantity += item.Quantity;
                            new ProductDAO().Update(product);
                        }
                        order.PaymentID = payment;
                        order.Status = status;
                    }
                }
                else if (order.Status == -1)//nếu order đã hủy cập nhập lại tình trạng khác
                {
                    if (status != -1)//nếu tình trạng không trùng thì cập nhập lại số lượng sản phẩm
                    {
                        var orderDetail = orderDetailDao.GetDetailOrder(order.ID);
                        foreach (var item in orderDetail)
                        {
                            var product = productDao.ViewDetail(item.ProductID);
                            product.Quantity = product.Quantity - item.Quantity;
                            new ProductDAO().Update(product);
                        }
                        order.PaymentID = payment;
                        order.Status = status;
                    }
                }
                else
                {
                    order.PaymentID = payment;
                    order.Status = status;
                }

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