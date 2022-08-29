using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public class CategoryService : ICategoryService
    {
        VideojuegosPatoDataBase _db = null;

        public CategoryService(VideojuegosPatoDataBase db)
        {
            _db=db;
        }
        public void Delete(string name)
        {
            _db.Database.ExecuteSqlRaw($"SP_DeleteCategories {name}");
        }

        public List<Category> GetCategories(string Name)
        {
            var categories = _db.categories.FromSqlRaw($"SP_ConsultCategories {Name}").ToList();
            return categories;
        }

        public void Insert(string Name)
        {
            _db.Database.ExecuteSqlRaw($"SP_InsertCategories {Name}");
        }

        public void Update(Category category)
        {
            _db.Database.ExecuteSqlRaw($"SP_ChangeCategories {category.ID},{category.Name}");
        }
    }
}
