using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;

namespace Videojuegos_Pato.Controllers
{
    public class CartController : Controller
    {
        private readonly VideojuegosPatoDataBase _db;

        public CartController(VideojuegosPatoDataBase db)
        {
            _db = db;
        }

        public IActionResult Products()
        {
            return View();
        }

        public IActionResult Checkout()
        {
            return View();
        }
    }
}
