using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace WebApp1.Models
{
    [Table("Role")]
    public partial class Role
    {
        [Key]
        public int RoleID { get; set; }

        public string? RoleName { get; set; }

        public virtual ICollection<Account> Accounts { get; set; } = new List<Account>();

    }
}
