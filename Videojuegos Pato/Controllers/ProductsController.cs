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
        public IActionResult Insert(string name, string description, int categoryId, string tip, double price, int quantity, IFormFile image, string video)
        {
            if (image != null)
            {
                string fileName = image.FileName;
                if (_db.products.FirstOrDefault(x => x.ImageName == fileName) == null)
                {
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/media/ProductImages", fileName);

                    var stream = new FileStream(path, FileMode.Create);
                    image.CopyToAsync(stream);
                    _productService.Insert(name, description, categoryId, tip, price, quantity, fileName, video);
                }
                else
                {
                    Response.WriteAsync("<script>alert('Ya hay una imagen perteneciente a un VideoJuego con ese nombre de archivo')</script>");
                }
            }
            return Index();
        }

        [HttpPost]
        public IActionResult Edit(int id, string name, string description, int categoryId, string tip, double price, int quantity, IFormFile image, string video)
        {
            if (image != null)
            {
                string fileName = image.FileName;
                //que la imagen se cree solo si no existe en la base de datos ó si existe pero es del mismo advertisement
                //para evitar que la imagen tenga el mismo nombre que otros advertisement
                if (_db.products.FirstOrDefault(x => x.ImageName == fileName) == null || _db.products.Find(id).ImageName == fileName != null)
                {
                    //borrar anterior imagen
                    //System.IO.File.Delete("wwwroot/media/Advertisement/" + _db.advertisements.Find(id).ImageName);
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/media/ProductImages", fileName);
                    var stream = new FileStream(path, FileMode.Create);
                    image.CopyToAsync(stream);
                    var product = _db.products.Find(id);
                    _productService.Update(id, name, description, categoryId, tip, price, quantity, fileName, video);
                }
                else
                {
                    Response.WriteAsync("<script>alert('Ya existe una imagen perteneciente a un VideoJuego con ese nombre de archivo')</script>");
                }
            }
            return Index();
        }

        public IActionResult Delete(int id)
        {
            _productService.Delete(id);
            return Index();
        }
    }
}
