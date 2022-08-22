using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Controllers
{
    [Authorize]
    public class ProfileController : Controller
    {
        private readonly VideojuegosPatoDataBase _db;

        public ProfileController(VideojuegosPatoDataBase db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult LikedProducts()
        {
            return View();
        }

        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
