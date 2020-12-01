﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProjectSEM3.EF;

namespace ProjectSEM3.Models
{
    [Serializable]
    public class CartItem
    {
        public ProductModel ProductModel { get; set; }
        public int Quantity { get; set; }
    }
}