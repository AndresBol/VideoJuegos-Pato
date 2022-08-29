using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Controllers
{
    public class HomeController : Controller
    {
        private readonly VideojuegosPatoDataBase _db;

        public HomeController(VideojuegosPatoDataBase db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            return View();
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
            return View();
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