using System.Text;
using FluentValidation.Results;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using WebDevelopmentInSimformDemo.Dto;
using WebDevelopmentInSimformDemo.Validation;

namespace WebDevelopmentInSimformDemo.Controllers
{
    public class StudentController : Controller
    {
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        private readonly StudentValidator _validationRules;
        private readonly string url;

        public StudentController(HttpClient httpClient, IConfiguration configuration, StudentValidator validationRules)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _validationRules = new StudentValidator();
            url = _configuration.GetValue<string>("Paths:ApiUrl")!;
        }

        public async Task<IActionResult> Index()
        {
            List<StudentDto>? studentList = new List<StudentDto>();

            using (var response = await _httpClient.GetAsync(url))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if(response.IsSuccessStatusCode)
                {
                    studentList = JsonConvert.DeserializeObject<List<StudentDto>>(apiResponse);
                }
            }
            return View(studentList);
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            List<BookDto>? bookList;
            List<DepartmentDto>? departmentList;
            using (var response = await _httpClient.GetAsync(url+"/Books"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    bookList = JsonConvert.DeserializeObject<List<BookDto>>(apiResponse);
                    ViewData["BookId"] = new SelectList(bookList, "BookId", "Name", "Select Book");
                }
            }

            using (var response = await _httpClient.GetAsync(url + "/Departments"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    departmentList = JsonConvert.DeserializeObject<List<DepartmentDto>>(apiResponse);
                    ViewData["DeptId"] = new SelectList(departmentList, "DeptId", "Name", "Select Department");
                }
            }

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(StudentDto studentDto)
        {
            ValidationResult result = _validationRules.Validate(studentDto);
            if(result.IsValid)
            {
                var json = new StringContent(JsonConvert.SerializeObject(studentDto), Encoding.UTF8, "application/json");
                using (var response = await _httpClient.PostAsync(url, json))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index", "Student");
                    }
                }
            }

            List<BookDto>? bookList;
            List<DepartmentDto>? departmentList;
            using (var response = await _httpClient.GetAsync(url + "/Books"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    bookList = JsonConvert.DeserializeObject<List<BookDto>>(apiResponse);
                    ViewData["BookId"] = new SelectList(bookList, "BookId", "Name", "Select Book");
                }
            }

            using (var response = await _httpClient.GetAsync(url + "/Departments"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    departmentList = JsonConvert.DeserializeObject<List<DepartmentDto>>(apiResponse);
                    ViewData["DeptId"] = new SelectList(departmentList, "DeptId", "Name", "Select Department");
                }
            }

            foreach(var error in result.Errors)
            {
                ModelState.AddModelError("", error.ErrorMessage);
            }
            return View(studentDto);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            List<BookDto>? bookList;
            List<DepartmentDto>? departmentList;
            using (var response = await _httpClient.GetAsync(url + "/Books"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    bookList = JsonConvert.DeserializeObject<List<BookDto>>(apiResponse);
                    ViewData["BookId"] = new SelectList(bookList, "BookId", "Name", "Select Book");
                }
            }

            using (var response = await _httpClient.GetAsync(url + "/Departments"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode)
                {
                    departmentList = JsonConvert.DeserializeObject<List<DepartmentDto>>(apiResponse);
                    ViewData["DeptId"] = new SelectList(departmentList, "DeptId", "Name", "Select Department");
                }
            }


            using (var response = await _httpClient.GetAsync(url+$"/{id}"))
            {
                string apiResponse = await response.Content.ReadAsStringAsync();
                var student = JsonConvert.DeserializeObject<StudentDto>(apiResponse);
                return View(student);
            }
        }

        [HttpPost]
        public async Task<IActionResult> Edit(StudentDto studentDto)
        {
            ValidationResult result = _validationRules.Validate(studentDto);
            if (result.IsValid)
            {
                var json = new StringContent(JsonConvert.SerializeObject(studentDto), Encoding.UTF8, "application/json");
                using (var response = await _httpClient.PutAsync(url + $"/{studentDto.Id}", json))
                {
                    if (response.IsSuccessStatusCode)
                    {
                        return RedirectToAction("Index", "Student");
                    }
                }
            }
            return View(studentDto);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            using (var response = await _httpClient.DeleteAsync(url + $"/{id}"))
            {
                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index", "Student");
                }
            }
            return View();
        }

    }
}
