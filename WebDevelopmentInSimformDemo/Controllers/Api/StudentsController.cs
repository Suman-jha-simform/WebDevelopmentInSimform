using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WebDevelopmentInSimformDemo.Dto;
using WebDevelopmentInSimformDemo.Interface;
using WebDevelopmentInSimformDemo.Models;

namespace WebDevelopmentInSimformDemo.Controllers.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private readonly IStudentRepository _studentRepository;
        private readonly IMapper _mapper;

        public StudentsController(IStudentRepository studentRepository, IMapper mapper)
        {
            _studentRepository = studentRepository;
            _mapper = mapper;
        }

        // GET: api/Students
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StudentDto>>> GetStudentsAsync()
        {
            var studentList = await _studentRepository.GetAllStudentAsync();
          if (studentList == null)
          {
              return NotFound("There is no student present.");
          }
            return Ok(_mapper.Map<IEnumerable<StudentDto>>(studentList));
        }

        // GET: api/Students/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StudentDto>> GetStudentAsync(int id)
        {
            var student = await _studentRepository.GetStudentAsync(id);
            if(student.Id == 0 && student.Name == "" && student.DepartmentId == 0 && student.BookId == 0 )
            {
                return NotFound("Student with this id does not exist.");
            }

            return Ok(_mapper.Map<StudentDto>(student));
        }

        [HttpGet("Books")]
        public async Task<ActionResult<IEnumerable<BookDto>>> GetBooksAsync()
        {
            var books = await _studentRepository.GetBookAsync();
            return Ok(_mapper.Map<IEnumerable<BookDto>>(books));
        }

        [HttpGet("Departments")]
        public async Task<ActionResult<IEnumerable<BookDto>>> GetDepartmentsAsync()
        {
            var departments = await _studentRepository.GetDepartmentAsync();
            return Ok(_mapper.Map<IEnumerable<DepartmentDto>>(departments));
        }

        // PUT: api/Students/5
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateStudentAsync(int id, [FromBody]StudentDto studentdto)
        {
           
            if (id != studentdto.Id)
            {
                return BadRequest("Student Id and provided Id does not match.");
            }
            await _studentRepository.UpdateStudentAsync(_mapper.Map<Student>(studentdto));
            return Ok();
        }

        // POST: api/Students
        [HttpPost]
        public async Task<ActionResult<Student>> AddStudentAsync([FromBody]StudentDto studentdto)
        {
            var result = await _studentRepository.AddStudentAsync(_mapper.Map<Student>(studentdto));
            if(result == "Ok")
            {
                return Ok("Student added successfully");
            }
            else
            {
                return Problem(result);
            }
        }

        // DELETE: api/Students/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStudentAsync(int id)
        {
            var student = await _studentRepository.GetStudentAsync(id);
            if(student  == null)
            {
                return NotFound("Student with this id does not exist.");
            }
            await _studentRepository.RemoveStudentAsync(_mapper.Map<Student>(student)); 
            return Ok("Student has been deleted successfully.");
        }
    }
}
