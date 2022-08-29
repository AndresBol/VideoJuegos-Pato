using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;
using Videojuegos_Pato.Data;
using Videojuegos_Pato.Service;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<VideojuegosPatoDataBase>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("VideojuegosPatoDataBase") ?? throw new InvalidOperationException("Connection string 'VideojuegosPatoContext' not found")));

// Add services to the container.
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
        .AddCookie(options =>
        {
            options.LoginPath = "/Home/Login";
            options.AccessDeniedPath = "/Profile/AccessDenied";
        });

builder.Services.AddAuthorization(options => {
    options.AddPolicy("AdminOnly",
        policy => policy.RequireClaim("Admin", "true"));
});

builder.Services.AddControllersWithViews();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IUserService, UserService >();
builder.Services.AddScoped<IAdvertisementService, AdvertisementService>();
builder.Services.AddScoped<IProductService, ProductService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
