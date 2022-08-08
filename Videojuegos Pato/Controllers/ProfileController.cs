using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;

namespace Videojuegos_Pato.Controllers
{
    public class ProfileController : Controller
    {
        private readonly VideojuegosPatoDataBase _db;

        public ProfileController(VideojuegosPatoDataBase db)
        {
            _db = db;
        }

        public IActionResult Information()
        {
            return View();
        }

        public IActionResult LikedProducts()
        {
            return View();
        }
    }
}
