<p align="center">
  <img src="Videojuegos Pato/wwwroot/media/VideojuegosPato/Isotipo.webp" alt="Videojuegos Pato Logo" width="150"/>
</p>

<h1 align="center">Videojuegos Pato</h1>

<p align="center">
  A full-stack video game e-commerce web application with product catalog, user authentication, shopping cart, and admin management, built with ASP.NET Core MVC and SQL Server.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/C%23-.NET%206.0-purple?logo=dotnet&logoColor=white" alt="C#"/>
  <img src="https://img.shields.io/badge/SQL%20Server-blue?logo=microsoftsqlserver&logoColor=white" alt="SQL Server"/>
  <img src="https://img.shields.io/badge/Entity%20Framework%20Core-6.0.7-blueviolet?logo=dotnet&logoColor=white" alt="EF Core"/>
  <img src="https://img.shields.io/badge/Bootstrap-5-7952B3?logo=bootstrap&logoColor=white" alt="Bootstrap"/>
  <img src="https://img.shields.io/badge/IDE-Visual%20Studio-blueviolet?logo=visualstudio&logoColor=white" alt="Visual Studio"/>
</p>

---

## About

Videojuegos Pato is a web-based video game store that allows customers to browse a game catalog, manage their profiles, and shop for titles across multiple genres. Administrators have access to full CRUD management panels for products, categories, users, and promotional advertisements. The application uses cookie-based authentication with role-based access control and a service layer backed by SQL Server stored procedures.

## Features

- **User authentication**: Cookie-based login system with claims-based identity
- **Role-based access control**:
  - **Customer**: Browse catalog, manage profile, like products, select favorite categories
  - **Admin**: Full access to maintenance panels for products, categories, users, and advertisements
- **Product catalog**: Browse 10+ game categories (Acción, Aventura, RPG, Deportes, Estrategia, Simulación, Terror, Carreras, Puzzle, Plataformas) with detailed product pages
- **Image upload system**: Product images and advertisement banners uploaded and served from the server
- **Advertisement carousel**: Dynamic homepage banner rotation managed by admins
- **Shopping cart**: Per-user cart with many-to-many product relationships
- **User profiles**: View account details, liked products, and favorite categories
- **Responsive UI**: Bootstrap 5 grid with adaptive layouts (mobile to desktop) and responsive logo switching
- **CRUD admin panels**: Full management for products, categories, users, and advertisements with search and filtering
- **YouTube integration**: Embedded video links and gameplay tips per product
- **Stored procedures**: All core data operations routed through SQL Server stored procedures

## Tech Stack

| Layer       | Technology                                           |
| ----------- | ---------------------------------------------------- |
| Language    | C# (.NET 6.0)                                        |
| Framework   | ASP.NET Core MVC                                     |
| Database    | Microsoft SQL Server                                 |
| ORM         | Entity Framework Core 6.0.7                          |
| Data Access | Stored Procedures via `FromSqlRaw` / `ExecuteSqlRaw` |
| Frontend    | Bootstrap 5, jQuery, Bootstrap Icons                 |
| Auth        | Cookie Authentication + Claims                       |
| IDE         | Visual Studio                                        |

## Architecture

The project follows the ASP.NET Core MVC pattern with a dedicated service layer for business logic and data access:

```
Videojuegos Pato/
├── Controllers/             # HTTP request handling (8 controllers)
│   ├── HomeController       # Public: homepage, catalog, login, signup
│   ├── ProfileController    # Authenticated: user profile, liked products
│   ├── CartController       # Authenticated: shopping cart, checkout
│   ├── CategoriesController # Admin: category CRUD
│   ├── ProductsController   # Admin: product CRUD with image upload
│   ├── UsersController      # Admin: user management
│   ├── AdvertisementsController  # Admin: banner management
│   └── MaintenanceController    # Admin: dashboard
├── Models/                  # Domain entities (User, Product, Category, Cart, Advertisement)
├── Service/                 # Business logic layer
│   ├── I*Service.cs         # Service interfaces (4 contracts)
│   └── *Service.cs          # Implementations with stored procedure calls
├── Data/                    # EF Core DbContext configuration
├── Views/                   # Razor views organized by controller
│   ├── Home/                # Public pages (Index, Catalog, Login, Signup, Product, Contact)
│   ├── Profile/             # User profile views
│   ├── Cart/                # Shopping cart views
│   ├── Shared/              # Layout, error page, validation scripts
│   └── [Admin views]/       # Categories, Products, Users, Advertisements, Maintenance
├── Migrations/              # EF Core database migrations
└── wwwroot/                 # Static assets (CSS, JS, images, media)
```

## Database Schema

The SQL Server database (`VideojuegosPatoDataBase`) includes the following tables:

**Core entities:** `users` · `products` · `categories` · `carts` · `advertisements`

**Join tables (many-to-many):** `ProductUser` (liked products) · `CategoryUser` (favorite categories) · `CartProduct` (cart items)

**Relationships:**

| Relationship       | Type         | Description                          |
| ------------------ | ------------ | ------------------------------------ |
| User <-> Cart      | One-to-One   | Each user has a personal cart        |
| User <-> Product   | Many-to-Many | Users can like multiple products     |
| User <-> Category  | Many-to-Many | Users select favorite categories     |
| Cart <-> Product   | Many-to-Many | Carts contain multiple products      |
| Category → Product | One-to-Many  | Products belong to a single category |

The full creation script with seed data (12 games, 10 categories, 11 users, 5 advertisements) is available in [`db_query.sql`](db_query.sql).

## Prerequisites

- Visual Studio 2022 with ASP.NET and web development workload
- Microsoft SQL Server (LocalDB or full instance)
- .NET 6.0 SDK

## Getting Started

1. **Clone the repository**

   ```bash
   git clone https://github.com/AndresBol/VideoJuegos-Pato.git
   ```

2. **Set up the database**
   - Open SQL Server Management Studio
   - Execute the script [`db_query.sql`](db_query.sql) to create the database, tables, stored procedures, and seed data

3. **Configure the connection**
   - Update the connection string in `appsettings.json` if needed:
     ```json
     {
       "ConnectionStrings": {
         "VideojuegosPatoDataBase": "Server=.;Database=VideojuegosPatoDataBase;Trusted_Connection=True;"
       }
     }
     ```

4. **Restore NuGet packages**
   - Open `Videojuegos Pato.sln` in Visual Studio
   - Right-click the solution → Restore NuGet Packages

5. **Build and run**
   - Build the solution
   - Run, the app launches at `https://localhost` with the homepage

## Default Accounts

| Role     | Email             | Password  |
| -------- | ----------------- | --------- |
| Admin    | carlos@correo.com | Admin123! |
| Customer | maria@correo.com  | Pass456!  |

## Author

- **Andrés Bolaños**

---

<p align="center">
  <sub>Built with ASP.NET Core MVC as a personal project - 2022</sub>
</p>
