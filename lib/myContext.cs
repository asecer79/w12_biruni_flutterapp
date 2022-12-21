using Microsoft.EntityFrameworkCore;

namespace WebApi.Biruni.ApiService.DataAccess
{
    public class MyDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("data source=.;initial catalog=SchoolDb;user id=sa;password=xxx;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=True;");
        }


        public DbSet<Student>? Students { get; set; }

    }
}
