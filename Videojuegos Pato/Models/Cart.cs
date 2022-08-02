using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class Cart
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public List<Product> Products { get; set; }
        [Required]
        public User User { get; set; }
    }
}
