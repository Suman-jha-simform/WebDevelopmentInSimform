using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebDevelopmentInSimformDemo.Models
{
    public class Student
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;    

        [ForeignKey("DepartmentId")]
        public int DepartmentId { get; set; }
        public virtual Department? Department { get; set; }

        [ForeignKey("BookId")]
        public int BookId { get; set; }
        public virtual Book? Book { get; set; }
    }
}
