﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BotDetect.Web.Mvc;
using Facebook;
using ProjectSEM3.Areas.Admin.Models;
using ProjectSEM3.DAO;
using ProjectSEM3.Common;
using ProjectSEM3.Dao;
using ProjectSEM3.EF;
using ProjectSEM3.Models;

namespace ProjectSEM3.Controllers
{

    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var model = new SlideDAO().GetSlideView(1);
            ViewBag.slide = model;
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        /// <summary>
        /// Đăng kí tài khoản client
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Register(User user)
        {
            if (ModelState.IsValid)
            {
                var encrypt = Encryptor.Encrypt(user.Password);
                user.Password = encrypt;
                var db = new UserDAO();
                var dao = db.Create(user);

                if (dao == 1)
                {
                    //nếu đăng kí thành công thì sẽ tự động đăg nhập 
                    TempData["Success"] = "Thêm tài khoản thành công";
                    Login(user.Username, Decryptor.Decrypt(user.Password)); //gọi hàm login 
                    return RedirectToAction("Index", "Home");
                }
                else if (dao == 0)
                {
                    TempData["Error"] = "Email này đã tồn tại";
                    return View();
                }
                else if (dao == -1)
                {
                    TempData["Error"] = "Tài khoản này đã tồn tại";
                    return View("Register");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm tài khoản thất bại");
                }

            }
            return View();
        }

        /// <summary>
        /// Đăng nhập bằng tài khoản khách hàng
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var pass = Encryptor.Encrypt(password);//Giải mã password
            var model = new UserDAO().LoginClient(username, pass);
            var user = new UserDAO().GetUserString(username);
            if (model == -1)
            {
                TempData["Error"] = "Tài khoản không tồn tại";
                return View("Register");
            }
            else if (model == 0)
            {
                TempData["Error"] = "Tài khoản bị tạm khóa";
                return View("Register");
            }
            else if (model == 2)
            {
                TempData["Error"] = "Mật khẩu không tồn tại";
                return View("Register");
            }
            else if (model == 1)
            {
                Session["UsernameMember"] = username;
                Session["UsernameMemberID"] = user.ID;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                TempData["Error"] = "Đăng nhập thất bại";
                return View("Register");
            }

        }
        /// <summary>
        /// Quên mật khẩu
        /// </summary>
        /// <returns></returns>
        public ActionResult ForgotPassword()
        {
            return View();
        }
        /// <summary>
        /// Quên mật khẩu
        /// </summary>
        /// <param name="email">tham số email để gưi mail pass</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ForgotPassword(string email)
        {
            if (ModelState.IsValid)
            {
                var check = new UserDAO().find(email);
                if (check != null)
                {
                    var newpass = new UserDAO().CreatePassword(10);
                    var creat = new UserDAO().UpdatePass(email, Encryptor.Encrypt(newpass));
                    if (creat)
                    {
                        EmailTool emailTool = new EmailTool();
                        emailTool.SendMail(GetParent(email, newpass));
                        TempData["Success"] = "Đã lấy lại mật khẩu thành công ,chung tôi đã gửi một email chứa mật khẩu tới tài khoản của bạn!";
                        return View();
                    }

                }
            }
            TempData["Error"] = "Lấy lại mật khẩu không thành công!";

            return View();
        }

        /// <summary>
        /// đổi mật khẩu
        /// </summary>
        /// <returns></returns>
        public ActionResult ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [CaptchaValidation("CaptchaCode", "registerCaptcha", "Mã xác nhập không đúng!")]
        public ActionResult ChangePassword(UserModel userModel)
        {

            UserDAO db = new UserDAO();

            if (ModelState.IsValid)
            {
                var user = db.GetUserString(userModel.Username);
                if (user != null)
                {
                    if (Encryptor.Encrypt(userModel.NewPassword) == user.Password)
                    {
                        TempData["Error"] = "Mật khẩu không được giống mật khẩu hiện tại";
                        return View();
                    }
                    else if (Decryptor.Decrypt(user.Password) == userModel.Password)//nếu đúng pass của tài khoản mới cập nhập
                    {
                        db.UpdatePass(user.Email, Encryptor.Encrypt(userModel.NewPassword));//Hàm cập nhập mật khẩu
                        TempData["Success"] = "Đổi mật khẩu thành công";
                        return View();
                    }
                    else
                    {
                        TempData["Error"] = "Mật khẩu cũ không tồn tại";
                        return View();
                    }
                }
            }
            TempData["Error"] = "Đổi mật khẩu thất bại";
            return View();
        }

        public ActionResult Logout()
        {
            Session["UsernameMember"] = null;
            TempData["Error"] = null;
            TempData["Success"] = null;
            return RedirectToAction("Index", "Home");
        }

        
        //load menu top;
        [ChildActionOnly]
        public ActionResult TopMenu()
        {
            ProducerDao db = new ProducerDao();
            var model = db.GetAll("");
            return PartialView(model);
        }

        /// <summary>
        /// cấu hình nội dung email
        /// </summary>
        /// <param name="e"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public EmailModel GetParent(string e, string pass)
        {
            string sub = "[Thông báo] Bạn đã lấy lại mật khẩu cho tài khoản";
            string bo = @"";
            bo += "Mật khẩu mới tài khoản của bạn là : <span style='color:red;'>" + pass + "</p>";
            EmailModel email = new EmailModel(e, sub, bo);
            return email;
        }

        [ChildActionOnly]
        public ActionResult Blog()
        {
            var model = new ContentDAO().GetAllContents("").Take(2);
            return PartialView("Blog", model);
        }
    }
}