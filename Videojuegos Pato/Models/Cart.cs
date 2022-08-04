using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Videojuegos_Pato.Models
{
    public class Cart
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public List<Product> Products { get; set; }
    }
}
