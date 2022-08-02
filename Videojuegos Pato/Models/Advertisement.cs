using System.ComponentModel.DataAnnotations;

namespace Videojuegos_Pato.Models
{
    public class Advertisement
    {
        [Required]
        public int ID { get; set; }
        [Required]
        public string ImageName { get; set; }
    }
}
