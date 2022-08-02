using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class Category
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public List<Product> Products { get; set; }
        [Required]
        public List<User> FavoritedByUsers { get; set; }

    }
}
