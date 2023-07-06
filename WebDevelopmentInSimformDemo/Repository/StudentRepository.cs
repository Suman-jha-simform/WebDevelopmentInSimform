using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;
using WebDevelopmentInSimformDemo.Database;
using WebDevelopmentInSimformDemo.Interface;
using WebDevelopmentInSimformDemo.Models;

namespace WebDevelopmentInSimformDemo.Repository
{
    public class StudentRepository : IStudentRepository
    {
        private readonly ApplicationContext _context;

        public StudentRepository(ApplicationContext context)
        {
            _context = context;
        }
        public async Task<string> AddStudentAsync(Student student)
        {
            await _context.Students.AddAsync(student);
            await _context.SaveChangesAsync();
            return "Ok";
        }

        public async Task<IEnumerable<Student>> GetAllStudentAsync()
        {
            return await _context.Students.Include("Book").Include("Department").ToListAsync();
        }

        public async Task<IEnumerable<Book>> GetBookAsync()
        {
            return await _context.Books.ToListAsync();
        }

        public async Task<IEnumerable<Department>> GetDepartmentAsync()
        {
            return await _context.Departments.ToListAsync();
        }

        public async Task<Student> GetStudentAsync(int id)
        {
            return await _context.Students.Where(std => std.Id == id).FirstOrDefaultAsync() ?? new Student();
        }

        public async Task RemoveStudentAsync(Student student)
        {
           var studentToRemove = await GetStudentAsync(student.Id);
            if(studentToRemove != null)
            {
                 await _context.Students.Where(std=>std.Id == student.Id).ExecuteDeleteAsync();
            }
        }

        public async Task UpdateStudentAsync(Student student)
        {
            var studentToUpdate = await GetStudentAsync(student.Id);
            if(studentToUpdate != null)
            {
                await _context.Students.Where(std => std.Id == student.Id).ExecuteUpdateAsync(std => std.SetProperty(s => s.Name , s=>student.Name)
                .SetProperty(s => s.DepartmentId, s => student.DepartmentId)
                .SetProperty(s => s.BookId, s => student.BookId)
                );
            }
        }
    }
}
