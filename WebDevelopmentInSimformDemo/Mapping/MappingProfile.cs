using AutoMapper;
using WebDevelopmentInSimformDemo.Dto;
using WebDevelopmentInSimformDemo.Models;

namespace WebDevelopmentInSimformDemo.MappingProfile
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<StudentDto,  Student>()
                .ForMember(std=>std.Book, opt => opt.Ignore())
                .ForMember(std=>std.Department, opt => opt.Ignore());

            CreateMap<Student,StudentDto>();

            CreateMap<BookDto, Book>();
            CreateMap<Book, BookDto>();

            CreateMap<DepartmentDto, Department>();
            CreateMap<Department, DepartmentDto>();
        }
    }
}
