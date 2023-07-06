using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using WebDevelopmentInSimformDemo.Models;
using WebDevelopmentInSimformDemo.Dto;

namespace WebDevelopmentInSimformDemo.Database
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options) { }
        public DbSet<Student> Students { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Department> Departments { get; set; }
        public DbSet<WebDevelopmentInSimformDemo.Dto.StudentDto> StudentDto { get; set; } = default!;
      

    }
}
