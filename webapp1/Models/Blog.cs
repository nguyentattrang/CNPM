using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace WebApp1.Models
{
    [Table("Blog")]
    public partial class Blog
    {
        [Key]
        public int BlogID { get; set; }

        public string? Title { get; set; }

        public string? Alias { get; set; }

        public string? Description { get; set; }

        public string? Detail { get; set; }

        public string? Image { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string? CreatedBy { get; set; }

        public int? AccountID { get; set; }

        public bool IsActive { get; set; }

        public virtual Account? Account { get; set; }
        public virtual ICollection<BlogComment> BlogComments { get; set; } = new List<BlogComment>();
    }
}
