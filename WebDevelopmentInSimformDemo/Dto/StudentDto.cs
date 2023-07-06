using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using WebDevelopmentInSimformDemo.Models;

namespace WebDevelopmentInSimformDemo.Dto
{
    public class StudentDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;

        [Display(Name="Department")]
        public int DepartmentId { get; set; }
        public virtual Department? Department { get; set; }

        [Display(Name = "Book")]
        public int BookId { get; set; }
        public virtual Book? Book { get; set; }
    }
}
