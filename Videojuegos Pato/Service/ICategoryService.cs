using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public interface ICategoryService
    {
        List<Category> GetCategories(string Name);
        void Insert(string Name);
        void Update(Category category);
        void Delete(string name);
    }
}
