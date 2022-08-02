using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class User
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
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
