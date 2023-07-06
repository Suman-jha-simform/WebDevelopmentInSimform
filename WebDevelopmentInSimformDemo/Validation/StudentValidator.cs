using FluentValidation;
using WebDevelopmentInSimformDemo.Dto;

namespace WebDevelopmentInSimformDemo.Validation
{
    public class StudentValidator : AbstractValidator<StudentDto>
    {
        public StudentValidator()
        {
            RuleFor(s => s.Name).NotEmpty().WithMessage("Name cannot be empty").MinimumLength(2).MaximumLength(20).WithMessage("The name should be between 2 and 20 characters.");
            RuleFor(s => s.DepartmentId).NotEmpty().WithMessage("Select a appropriate department");
            RuleFor(s => s.BookId).NotEmpty().WithMessage("Select a appropriate book");
        }
    }
}
