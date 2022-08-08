using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;

namespace Videojuegos_Pato.Controllers
{
    public class MaintenanceController : Controller
    {
        private readonly VideojuegosPatoDataBase _db;

        public MaintenanceController(VideojuegosPatoDataBase db)
        {
            _db = db;
        }

        public IActionResult Maintenance()
        {
            return View();
        }

        public IActionResult Users()
        {
            return View();
        }

        public IActionResult Products()
        {
            return View();
        }

        public IActionResult Categories()
        {
            return View();
        }

        public IActionResult Advertisements()
        {
            return View();
        }
    }
}
