using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Service
{
    public class UserService : IUserService
    {
        VideojuegosPatoDataBase _db = null;
        public UserService(VideojuegosPatoDataBase db)
        {
            _db = db;
        }
        public void Delete(int Id)
        {
            _db.Database.ExecuteSqlRaw($"SP_DeleteUsers {Id}");
        }

        public List<User> GetUsers(int Id)
        {
            var users = _db.users.FromSqlRaw($"SP_ConsultUsers {Id}").ToList();
            return users;
        }

        public void Insert(User user)
        {
            _db.users.Add(user);
            _db.SaveChanges();
        }

        public void Update(User user)
        {
            var getUser = _db.users.Find(user.ID);
            getUser.Name = user.Name;
            getUser.Password = user.Password;
            getUser.Email = user.Email;
            getUser.Admin = user.Admin;
            getUser.Cart = user.Cart;
            _db.SaveChanges();
        }
    }
}
