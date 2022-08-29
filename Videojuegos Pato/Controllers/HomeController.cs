using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Dynamic;
using System.Security.Claims;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;
using Videojuegos_Pato.Service;

namespace Videojuegos_Pato.Controllers
{
    public class HomeController : Controller
    {
        IAdvertisementService _advertisementService = null;
        IProductService _productService = null;
        private readonly VideojuegosPatoDataBase _db;

        public HomeController(VideojuegosPatoDataBase db, IAdvertisementService advertisementService, IProductService productService)
        {
            _db = db;
            _advertisementService = advertisementService;
            _productService = productService;
        }

        public IActionResult Index()
        {
            dynamic productsAndAdvertisements = new ExpandoObject();
            productsAndAdvertisements.products = _productService.GetProducts(0);
            productsAndAdvertisements.advertisements = _advertisementService.GetAdvertisements(0);
            return View(productsAndAdvertisements);
        }

        public IActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Signup(User userModel)
        {
            userModel.Cart = new Cart();
            userModel.Admin = false;
            //if (ModelState.IsValid)
            {
                if (_db.users.FirstOrDefault(x => x.Email == userModel.Email) != null)
                {
                    return View();
                }
                _db.users.Add(userModel);
                ModelState.Clear();
            }
            _db.SaveChanges();
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string email, string password, string ReturnUrl)
        {
            if (_db.users.FirstOrDefault(x => x.Email == email) != null && _db.users.FirstOrDefault(x => x.Password == password) != null)
            {
                string username = _db.users.FirstOrDefault(x => x.Email == email).Name;
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, username),
                    new Claim(ClaimTypes.Email, email),
                };
                if (_db.users.FirstOrDefault(x => x.Email == email).Admin)
                {
                    claims.Add(new Claim("Admin", "true"));
                }

                var claimsIdentity = new ClaimsIdentity(claims, "Login");

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                return Redirect(ReturnUrl == null ? "/Profile" : ReturnUrl);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index");
        }

        public IActionResult Catalog()
        {
            List<Product> products = _productService.GetProducts(0);
            return View("Catalog", products);
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult Product()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}