using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;
using Videojuegos_Pato.Service;

namespace Videojuegos_Pato.Controllers
{
    [Authorize(Policy = "AdminOnly")]
    public class CategoriesController : Controller
    {
        ICategoryService _categoryService = null;
        private readonly VideojuegosPatoDataBase _db;

        public CategoriesController(VideojuegosPatoDataBase db, ICategoryService categoryService)
        {
            _db = db;
            _categoryService = categoryService;
        }

        public IActionResult Index()
        {
            List<Category> categories = _categoryService.GetCategories("");

            return View("Index", categories);
        }

        [HttpPost]
        public IActionResult Index(string name)
        {
            List<Category> categories = _categoryService.GetCategories(name);

            return View(categories);
        }

        [HttpPost]
        public IActionResult Insert(string name)
        {
            _categoryService.Insert(name);
            return Index();
        }

        [HttpPost]
        public IActionResult Edit(int id, string name)
        {
            var category = _db.categories.Find(id);
            category.Name = name;
            _categoryService.Update(category);
            return Index();
        }

        public IActionResult Delete(string name)
        {
            _categoryService.Delete(name);
            return Index();
        }
    }
}
