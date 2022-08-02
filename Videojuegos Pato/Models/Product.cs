using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class Product
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public Category Category { get; set; }
        [Required]
        public string ImageName { get; set; }
        [Required]
        public string Tip { get; set; }
        [Required]
        public string Video { get; set; }
        [Required]
        public double Price { get; set; }
        [Required]
        public int Quantity { get; set; }
        [Required]
        public List<User> LikedByUsers { get; set; }

    }
}
