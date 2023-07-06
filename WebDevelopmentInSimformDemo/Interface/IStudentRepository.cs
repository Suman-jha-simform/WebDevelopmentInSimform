using WebDevelopmentInSimformDemo.Models;

namespace WebDevelopmentInSimformDemo.Interface
{
    public interface IStudentRepository
    {
        Task<string> AddStudentAsync(Student student);
        Task RemoveStudentAsync(Student student);
        Task UpdateStudentAsync(Student student);
        Task<IEnumerable<Student>> GetAllStudentAsync();
        Task<Student> GetStudentAsync(int id);
        Task<IEnumerable<Book>> GetBookAsync();
        Task<IEnumerable<Department>> GetDepartmentAsync();
    }
}
