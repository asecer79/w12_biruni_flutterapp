using Microsoft.AspNetCore.Mvc;
using WebApi.Biruni.ApiService.DataAccess;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebApi.Biruni.ApiService.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class StudentsController : ControllerBase
    {
        private MyDbContext? db;
        public StudentsController()
        {
           db = new MyDbContext();
        }
        [HttpGet]
        public List<Student> GetList()
        {
            var data = db.Students.ToList();

            return data;
        }

        [HttpGet("{id}")]
        public Student Get(int id)
        {
            var record = db.Students.FirstOrDefault(p => p.Id == id);
            return record;
        }

        // POST api/<StudentsController>
        [HttpPost]
        public string Insert(Student student)
        {
            db.Students.Add(student);
            db.SaveChanges();
            return "Insert Success";
        }

        // PUT api/<StudentsController>/5
        [HttpPut]
        public string Update(Student student)
        {
            db.Students.Update(student);
            db.SaveChanges();
            return "Update Success";
        }

        // DELETE api/<StudentsController>/5
        [HttpDelete]
        public string Delete(Student student)
        {
            db.Students.Remove(student);
            db.SaveChanges();
            return "Delete Success";
        }
    }
}
