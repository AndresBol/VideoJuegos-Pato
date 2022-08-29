using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public class AdvertisementService : IAdvertisementService
    {
        VideojuegosPatoDataBase _db = null;
        public AdvertisementService(VideojuegosPatoDataBase db)
        {
            _db = db;
        }
        public void Delete(int Id)
        {
            _db.Database.ExecuteSqlRaw($"SP_DeleteAdvertisements {Id}");
        }

        public List<Advertisement> GetAdvertisements(int Id)
        {
            var advertisements = _db.advertisements.FromSqlRaw($"SP_ConsultAdvertisements {Id}").ToList();
            return advertisements;
        }

        public void Insert(string ImageName)
        {
            _db.Database.ExecuteSqlRaw($"SP_InsertAdvertisements '{ImageName}'");
        }

        public void Update(Advertisement advertisement)
        {
            _db.Database.ExecuteSqlRaw($"SP_ChangeAdvertisements {advertisement.ID},'{advertisement.ImageName}'");
        }
    }
}
