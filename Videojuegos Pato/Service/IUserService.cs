using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public interface IUserService
    {
        List<User> GetUsers(int Id);
        void Insert(User user);
        void Update(User user);
        void Delete(int Id);
    }
}
