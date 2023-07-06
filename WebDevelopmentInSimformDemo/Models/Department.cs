using System.ComponentModel.DataAnnotations;

namespace WebDevelopmentInSimformDemo.Models
{
    public class Department
    {
        [Key]
        public int DeptId { get; set; }
        public string Name { get; set; } = string.Empty;

    }
}
