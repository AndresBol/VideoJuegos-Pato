using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Videojuegos_Pato.Migrations
{
    public partial class AddCartstoProducts : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_products_carts_CartID",
                table: "products");

            migrationBuilder.DropIndex(
                name: "IX_products_CartID",
                table: "products");

            migrationBuilder.DropColumn(
                name: "CartID",
                table: "products");

            migrationBuilder.CreateTable(
                name: "CartProduct",
                columns: table => new
                {
                    CartsID = table.Column<int>(type: "int", nullable: false),
                    ProductsID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CartProduct", x => new { x.CartsID, x.ProductsID });
                    table.ForeignKey(
                        name: "FK_CartProduct_carts_CartsID",
                        column: x => x.CartsID,
                        principalTable: "carts",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CartProduct_products_ProductsID",
                        column: x => x.ProductsID,
                        principalTable: "products",
                        principalColumn: "ID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CartProduct_ProductsID",
                table: "CartProduct",
                column: "ProductsID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CartProduct");

            migrationBuilder.AddColumn<int>(
                name: "CartID",
                table: "products",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_products_CartID",
                table: "products",
                column: "CartID");

            migrationBuilder.AddForeignKey(
                name: "FK_products_carts_CartID",
                table: "products",
                column: "CartID",
                principalTable: "carts",
                principalColumn: "ID");
        }
    }
}
