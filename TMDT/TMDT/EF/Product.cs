using System.Web.Mvc;

namespace ProjectSEM3.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            //Prices = new HashSet<Price>();
            Sales = new HashSet<Sale>();
        }

        public long ID { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên (*)")]
        [Required(ErrorMessage = "Trường này không được rỗng!")]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Đường dẫn (*)")]
        [Required(ErrorMessage = "Trường này không được rỗng!")]
        public string MetaTitle { get; set; }

        [Column(TypeName = "ntext")]
        [AllowHtml]
        [Display(Name = "Mô tả (*)")]
        [Required(ErrorMessage = "Trường này không được rỗng!")]
        public string Description { get; set; }

        [StringLength(250)]
        [Display(Name = "Hình ảnh (*)")]
        [Required(ErrorMessage = "Trường này không được rỗng!")]
        public string Image { get; set; }

        [Column(TypeName = "xml")]
        public string MoreImage { get; set; }

        [Display(Name = "Số lượng (*)")]
        [Required(ErrorMessage = "Trường này không được rỗng!")]
        public int? Quantity { get; set; }

        [Display(Name = "Danh mục")]
        public long? ProductCategoryID { get; set; }

        public DateTime CreateDate { get; set; }

        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime? ModyfiedDate { get; set; }

        [StringLength(50)]
        public string ModyfiedBy { get; set; }

        [Display(Name = "Trạng thái)")]
        public bool Status { get; set; }


        [Display(Name = "NSX")]
        public long? ProducerID { get; set; }

        [StringLength(50)]
        [Display(Name = "Màu sắc")]
        public string Color { get; set; }

        [StringLength(50)]
        [Display(Name = "Loại dây")]
        public string Cord { get; set; }

        [StringLength(50)]
        [Display(Name = "Kích cỡ")]
        public string Size { get; set; }


        public decimal? Price { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        public virtual Producer Producer { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Sale> Sales { get; set; }
    }
}
