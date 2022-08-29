using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public interface IAdvertisementService
    {
        List<Advertisement> GetAdvertisements(int Id);
        void Insert(string ImageName);
        void Update(Advertisement advertisement);
        void Delete(int Id);
    }
}
