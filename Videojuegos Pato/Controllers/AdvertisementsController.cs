using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Models;
using Videojuegos_Pato.Service;

namespace Videojuegos_Pato.Controllers
{
    [Authorize(Policy = "AdminOnly")]
    public class AdvertisementsController : Controller
    {
        IAdvertisementService _advertisementService = null;
        private readonly VideojuegosPatoDataBase _db;
        private readonly Microsoft.AspNetCore.Hosting.IHostingEnvironment _hostingEnvironment;

        public AdvertisementsController(VideojuegosPatoDataBase db, IAdvertisementService advertisementService, Microsoft.AspNetCore.Hosting.IHostingEnvironment hostingEnvironment)
        {
            _db = db;
            _advertisementService = advertisementService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            List<Advertisement> advertisements = _advertisementService.GetAdvertisements(0);

            return View("Index", advertisements);
        }

        [HttpPost]
        public IActionResult Index(int id)
        {
            if (id == null)
            {
                id = 0;
            }
            List<Advertisement> advertisements = _advertisementService.GetAdvertisements(id);
            return View(advertisements);
        }

        [HttpPost]
        public IActionResult Insert(IFormFile image)
        {
            if (image != null)
            {
                string fileName = image.FileName;
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/media/Advertisement", fileName);

                var stream = new FileStream(path, FileMode.Create);
                image.CopyToAsync(stream);
                _advertisementService.Insert(fileName);
            }
            return Index();
        }

        [HttpPost]
        public IActionResult Edit(int id, IFormFile image)
        {
            if (image != null)
            {
                string fileName = image.FileName;
                //que la imagen se cree solo si no existe en la base de datos ó si existe pero es del mismo advertisement
                //para evitar que la imagen tenga el mismo nombre que otros advertisement
                if (_db.advertisements.FirstOrDefault(x => x.ImageName == fileName) == null || _db.advertisements.Find(id).ImageName == fileName != null)
                {
                    //borrar anterior imagen
                    //System.IO.File.Delete("wwwroot/media/Advertisement/" + _db.advertisements.Find(id).ImageName);
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/media/Advertisement", fileName);
                    var stream = new FileStream(path, FileMode.Create);
                    image.CopyToAsync(stream);
                    var advertisement = _db.advertisements.Find(id);
                    advertisement.ImageName = fileName;
                    _advertisementService.Update(advertisement);
                }
                else
                {
                    Response.WriteAsync("<script>alert('Ya existe otro Anuncio con ese nombre de archivo')</script>");
                }
            }
            return Index();
        }

        public IActionResult Delete(int id)
        {
            //System.IO.File.Delete("wwwroot/media/Advertisement/" + _db.advertisements.Find(id).ImageName);
            _advertisementService.Delete(id);
            return Index();
        }
    }
}
