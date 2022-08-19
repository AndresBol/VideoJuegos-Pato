using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class User
    {
        [Required]
        public int ID { get; set; }
        [Required(ErrorMessage = "Porfavor ingrese su nombre")]
        [Display(Name = "Nombre")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Porfavor ingrese su contraseña")]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required(ErrorMessage = "Porfavor ingrese su email")]
        [Display(Name = "Email")]
        [EmailAddress(ErrorMessage = "Porfavor ingrese un email valido")]
        public string Email { get; set; }
        [Required]
        public bool Admin { get; set; }
        [Required]
        public Cart Cart { get; set; }
        [Required]
        public List<Product> LikedProducts { get; set; }
        [Required]
        public List<Category> FavoriteCategories { get; set; }
    }
}
