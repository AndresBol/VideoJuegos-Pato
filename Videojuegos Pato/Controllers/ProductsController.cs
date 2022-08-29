using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Dynamic;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;
using Videojuegos_Pato.Service;

namespace Videojuegos_Pato.Controllers
{
    [Authorize(Policy = "AdminOnly")]
    public class ProductsController : Controller
    {
        ICategoryService _categoryService = null;
        IProductService _productService = null;
        private readonly VideojuegosPatoDataBase _db;

        public ProductsController(VideojuegosPatoDataBase db, IProductService productService, ICategoryService categoryService)
        {
            _db = db;
            _productService = productService;
            _categoryService = categoryService;
        }
        public IActionResult Index()
        {
            dynamic productsAndCategories = new ExpandoObject();
            productsAndCategories.products = _productService.GetProducts(0);
            productsAndCategories.categories = _categoryService.GetCategories("");

            return View("Index", productsAndCategories);
        }

        [HttpPost]
        public IActionResult Index(int? id)
        {
            id ??= 0;
            dynamic productsAndCategories = new ExpandoObject();
            productsAndCategories.products = _productService.GetProducts((int)id);
            productsAndCategories.categories = _categoryService.GetCategories("");
            return View(productsAndCategories);
        }

        [HttpPost]
        public IActionResult Insert(string name, string description, int categoryId, string tip, double price, int quantity, string imageName, string video)
        {

            _productService.Insert(name, description, categoryId, tip, price, quantity, imageName, video);
            return Index();
        }

        [HttpPost]
        public IActionResult Edit(int id, string name, string description, int categoryId, string tip, double price, int quantity, string imageName, string video)
        {
            _productService.Update(id, name, description, categoryId, tip, price, quantity, imageName, video);
            return Index();
        }

        public IActionResult Delete(int id)
        {
            _productService.Delete(id);
            return Index();
        }
    }
}
