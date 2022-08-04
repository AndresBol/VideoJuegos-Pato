using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Models;

namespace Videojuegos_Pato.Data
{
    public class VideojuegosPatoDataBase : DbContext
    {
        public VideojuegosPatoDataBase(DbContextOptions<VideojuegosPatoDataBase> options) : base(options)
        {

        }
        public DbSet<Advertisement> advertisements { get; set; }
        public DbSet<Cart> carts { get; set; }
        public DbSet<Category> categories { get; set; }
        public DbSet<Product> products { get; set; }
        public DbSet<User> users { get; set; }

    }
}
