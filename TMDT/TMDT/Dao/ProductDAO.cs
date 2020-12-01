using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Hosting;
using System.Xml.Linq;
using Microsoft.Ajax.Utilities;
using ProjectSEM3.EF;
using ProjectSEM3.Models;

namespace ProjectSEM3.Dao
{
    //Lớp DAO này sau đó giao tiếp với hệ thống lưu trữ,
    //hệ quản trị CSDL như thực hiện các công việc liên quan đến lưu trữ và truy vấn dữ liệu (tìm kiếm, thêm, xóa, sửa,…).
    public class ProductDAO
    {
        private SmartShopDbContext db = null;

        public ProductDAO()
        {
            db = new SmartShopDbContext();
        }

        // lấy danh sách sản phẩm
        public IEnumerable<Product> GetAllProducts(string searchString)
        {
            IQueryable<Product> model = db.Products.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate);
            //OrderByDescending:	Sắp xếp sản phẩm theo trường được chỉ định (ngày) giảm dần
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
                //Trả về giá trị cho biết liệu một chuỗi con được chỉ định có xuất hiện trong chuỗi này hay không.
            }
            return model;
        }

        public IEnumerable<Product> GetAllRecycelBin(string searchString)
        {
            IQueryable<Product> model = db.Products.Where(x => x.Status == false).OrderByDescending(x => x.CreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }
            return model;
        }
        // Thêm sản phẩm mới và có kiểm tra sản phẩm mới đã tồn tại hay chưa
        public long Create(Product product)
        {
            var check = db.Products.SingleOrDefault(x => x.Name == product.Name);
            if (check == null)
            {

                if (product.Image == null)
                {
                    product.Image = "/Data/images/Product/product_default.png";
                }
                product.Status = true;
                product.CreateDate = DateTime.Now;
                db.Products.Add(product);
                db.SaveChanges();
                return product.ID;
            }
            else
            {
                return -1;
            }

        }
       
        // chỉnh sửa thông tin sản phẩm
        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.ID);
                product.Name = entity.Name;
                product.ProducerID = entity.ProducerID;
                product.Image = entity.Image;
                product.Status = entity.Status;
                product.ModyfiedDate = DateTime.Now;
                product.ProductCategoryID = entity.ProductCategoryID;
                product.Description = entity.Description;
                product.Quantity = entity.Quantity;
                product.Color = entity.Color;
                product.Size = entity.Size;
                product.Cord = entity.Cord;
                product.Price = entity.Price;
                if (entity.MoreImage != null)
                {
                    product.MoreImage = entity.MoreImage;
                }
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        // lấy thông tin sản phẩm
        public Product ViewDetail(long id)
        {
            var pro = db.Products.Find(id);
            return pro;
        }
        // xóa tạm
        public bool ChangeStatus(long id)
        {
            try
            {
                var pro = ViewDetail(id);
                pro.Status = !pro.Status;
                db.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                // Join the list to a single string.
                var fullErrorMessage = string.Join("; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
            return true;
        }

        /// <summary>
        /// xóa sản phẩm
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
                var prod = db.Products.Find(id);
                var images = "";
                images = prod.MoreImage;
                var sale = new SaleDAO().GetAll("").Where(x => x.ProductID == prod.ID);
            
                //xóa các giá khuyến mãi đã đặt cho sản phẩm đó
                foreach (var item in sale)
                {
                    new SaleDAO().Delete(item.ID);
                }

                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        String url = element.Value;

                        if (System.IO.File.Exists(HostingEnvironment.MapPath(@"~/") + url))
                        {
                            File.Delete(HostingEnvironment.MapPath(@"~/") + url);
                        }
                    }
                }
                prod.MoreImage = null;
                db.Products.Remove(prod);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;
            }

        }

        //Lấy tất cả các sản phẩm mới
        public IEnumerable<ProductModel> getProductNew(int top)
        {
            var products = (
                      from p in db.Products.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate)
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.Image,
                          MetaTitle = p.MetaTitle,
                          Quantity = p.Quantity,
                          CreateDate = p.CreateDate,
                          MoreImage = p.MoreImage,
                          Color=p.Color,
                          Cord=p.Cord,
                          Size=p.Size,
                          Price=p.Price,
                          //OrderByDescending:Sắp xếp bộ sưu tập dựa trên các trường được chỉ định theo thứ tự giảm dần. Chỉ hợp lệ trong cú pháp phương thức.                     
                          Sale =
                              ((from s in db.Sales
                                where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                                orderby s.ID descending
                                select new
                                {
                                    s.Price
                                }).Take(1).FirstOrDefault().Price)
                      }).ToList();

            foreach (var item in products)
            {
                var images = "";
                images = item.MoreImage;
                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        var product = products.First(x => x.ID == item.ID).MoreImage = element.Value;
                    }
                }
            }
            var model = products.Take(top);
            return model;
        }

        // lấy danh sach sản phẩm cùng loại danh mục
        public IEnumerable<ProductModel> ProductsRelated(int top)
        {
            var product = ViewDetail(top);
            var products = (
                      from p in db.Products.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate)
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.Image,
                          MetaTitle = p.MetaTitle,
                          Quantity = p.Quantity,
                          MoreImage = p.MoreImage,
                          CreateDate = p.CreateDate,
                          ProductCategory = p.ProductCategoryID.ToString(),
                          Color = p.Color,
                          Cord = p.Cord,
                          Size = p.Size,
                          Price=p.Price,
                         
                          Sale =
                              ((from s in db.Sales
                                where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                                orderby s.ID descending
                                select new
                                {
                                    s.Price
                                }).Take(1).FirstOrDefault().Price)
                      }).ToList();

            foreach (var item in products)
            {
                var images = "";
                images = item.MoreImage;
                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        products.First(x => x.ID == item.ID).MoreImage = element.Value;
                    }
                }
            }

            var model = products.Where(x => x.ID != top && x.ProductCategory == product.ProductCategoryID.ToString()).Take(8);
            return model;
        }

        // lấy danh sach tất cả sản phẩm có trong database
        public IEnumerable<ProductModel> getAllProductClient(ref int totalRecord, int pageIndex, int pageSize)
        {
            var products = (
                      from p in db.Products.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate)
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.Image,
                          MetaTitle = p.MetaTitle,
                          MoreImage = p.MoreImage,
                          Quantity = p.Quantity,
                          CreateDate = p.CreateDate,
                          Description = p.Description,
                          Color = p.Color,
                          Cord = p.Cord,
                          Size = p.Size,
                          Price=p.Price,
                         
                          Sale =
                              ((from s in db.Sales
                                where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                                orderby s.ID descending
                                select new
                                {
                                    s.Price
                                }).Take(1).FirstOrDefault().Price)
                      }).ToList();

            foreach (var item in products)
            {
                var images = "";
                images = item.MoreImage;
                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        var product = products.First(x => x.ID == item.ID).MoreImage = element.Value;
                    }
                }
            }
            totalRecord = products.Count();//lấy tổng số lượng sản phẩm 
            var model = products.Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model;
        }

        // lấy danh danh sách sản phẩm theo thương hiệu sản xuất

        public IEnumerable<ProductModel> getAllProductProducer(ref int totalRecord, int pageIndex, int pageSize, int id, int cateId)
        {
            var pd = (
                from p in
                    db.Products.Where(x => x.Status == true && x.ProducerID == id && x.ProductCategoryID == cateId)
                        .OrderByDescending(x => x.CreateDate)
                select new ProductModel()
                {
                    ID = p.ID,
                    Name = p.Name,
                    Image = p.Image,
                    MetaTitle = p.MetaTitle,
                    MoreImage = p.MoreImage,
                    Quantity = p.Quantity,
                    CreateDate = p.CreateDate,
                    Description = p.Description,
                    Color = p.Color,
                    Cord = p.Cord,
                    Size = p.Size,
                    Price=p.Price,
                    
                    Sale =
                        ((from s in db.Sales
                          where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                          orderby s.ID descending
                          select new
                          {
                              s.Price
                          }).Take(1).FirstOrDefault().Price)
                }).ToList();

            foreach (var item in pd)
            {
                var images = "";
                images = item.MoreImage;
                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        var product = pd.First(x => x.ID == item.ID).MoreImage = element.Value;
                    }
                }
            }

            totalRecord = pd.Count(); //lấy tổng số lượng sản phẩm 
            var models = pd.Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return models;

        }


        
        
        // lấy danh sách sản phẩm hiện đang được giảm giá 
       
        public IEnumerable<ProductModel> getProductSale()
        {
            var products = (
                      from p in db.Products.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate)
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.Image,
                          MetaTitle = p.MetaTitle,
                          MoreImage = p.MoreImage,
                          CreateDate = p.CreateDate,
                          Quantity = p.Quantity,
                          Color = p.Color,
                          Cord = p.Cord,
                          Size = p.Size,
                          Price= p.Price,
                         
                          Sale =
                              ((from s in db.Sales
                                where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                                orderby s.ID descending
                                select new
                                {
                                    s.Price
                                }).Take(1).FirstOrDefault().Price)
                      }).ToList();
            var model = products.Where(x => x.Sale != null).Take(8);
            //lấy ra nhiều hình ảnh của sản phẩm
            foreach (var item in products)
            {
                var images = "";
                images = item.MoreImage;
                if (images != null)
                {
                    XElement xImages = XElement.Parse(images);
                    foreach (XElement element in xImages.Elements())
                    {
                        var product = products.First(x => x.ID == item.ID).MoreImage = element.Value;
                    }
                }
            }
            return model;
        }

        //Chi tiết
        public ProductModel producrDetail(long id)
        {
            var products =
                      from p in db.Products
                      select new ProductModel()
                      {
                          ID = p.ID,
                          Name = p.Name,
                          Image = p.Image,
                          MetaTitle = p.MetaTitle,
                          Description = p.Description,
                          Quantity = p.Quantity,
                          MoreImage = p.MoreImage,
                          Producer = p.Producer.Name,
                          ProductCategory = p.ProductCategory.Name,
                          Color = p.Color,
                          Cord = p.Cord,
                          Size = p.Size,
                          Price= p.Price,
                          
                          Sale =
                              ((from s in db.Sales
                                where s.ProductID == p.ID && s.EndDate >= DateTime.Now
                                orderby s.ID descending
                                select new
                                {
                                    s.Price
                                }).Take(1).FirstOrDefault().Price)
                      };

            var model = products.SingleOrDefault(x => x.ID == id);
            return model;
        }
    }
}