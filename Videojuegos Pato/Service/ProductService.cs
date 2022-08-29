using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public class ProductService : IProductService
    {
        VideojuegosPatoDataBase _db = null;
        public ProductService(VideojuegosPatoDataBase db)
        {
            _db = db;
        }
        public void Delete(int Id)
        {
            _db.Database.ExecuteSqlRaw($"SP_DeleteProducts {Id}");
        }

        public List<Product> GetProducts(int Id)
        {
            var products = _db.products.FromSqlRaw($"SP_ConsultProducts {Id}").ToList();
            return products;
        }

        public void Insert(string Name, string Description, int CategoryId, string Tip, double Price, int Quantity, string ImageName, string Video)
        {
            _db.Database.ExecuteSqlRaw($"SP_InsertProducts {Name},'{Description}',{CategoryId},'{ImageName}','{Tip}','{Video}','{Price}',{Quantity}");
        }

        public void Update(int Id, string Name, string Description, int CategoryId, string Tip, double Price, int Quantity, string ImageName, string Video)
        {
            _db.Database.ExecuteSqlRaw($"SP_ChangeProducts {Id},{Name},'{Description}',{CategoryId},'{ImageName}','{Tip}',{Video},'{Price}',{Quantity}");
        }
    }
}
