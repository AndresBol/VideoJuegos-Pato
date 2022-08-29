using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;
using Videojuegos_Pato.Service;

namespace Videojuegos_Pato.Controllers
{
    [Authorize(Policy = "AdminOnly")]
    public class UsersController : Controller
    {

        IUserService _userService = null;
        private readonly VideojuegosPatoDataBase _db;

        public UsersController(VideojuegosPatoDataBase db, IUserService userService)
        {
            _db = db;
            _userService = userService;
        }
        public IActionResult Index()
        {
            List<User> users = _userService.GetUsers(0);

            return View("Index", users);
        }

        [HttpPost]
        public IActionResult Index(int? id)
        {
            id ??= 0;
            List<User> users = _userService.GetUsers((int)id);
            return View(users);
        }

        [HttpPost]
        public IActionResult Insert(User user)
        {
            user.Cart = new Cart();
            _userService.Insert(user);
            return Index();
        }

        [HttpPost]
        public IActionResult Edit(int id, string name, string password, string email, bool admin)
        {
            var user = _db.users.Find(id);
            user.Name = name;
            user.Password = password;
            user.Email = email;
            user.Admin = admin;
            _userService.Update(user);
            return Index();
        }

        public IActionResult Delete(int id)
        {
            _userService.Delete(id);
            return Index();
        }
    }
}
