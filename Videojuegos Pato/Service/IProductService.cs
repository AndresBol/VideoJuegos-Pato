using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public interface IProductService
    {
        List<Product> GetProducts(int Id);
        void Insert(string Name, string Description, int CategoryId, string Tip, double Price, int Quantity, string ImageName, string Video);
        void Update(int Id, string Name, string Description, int CategoryId, string Tip, double Price, int Quantity, string ImageName, string Video);
        void Delete(int Id);
    }
}
