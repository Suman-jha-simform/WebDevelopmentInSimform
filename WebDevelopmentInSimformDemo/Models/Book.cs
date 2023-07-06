using System.ComponentModel.DataAnnotations;

namespace WebDevelopmentInSimformDemo.Models
{
    public class Book
    {
        [Key]
        public int BookId { get; set; }
        public string Name { get; set; } = string.Empty;
    }
}
