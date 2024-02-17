using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE35
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int productId = Int32.Parse(Request.QueryString["product"]);
            Global.Product product = Global.Storage.storage.Find(elem => elem.id == productId);
            title.Text = product.title;
            brand.Text = product.brand;
            price.Text = product.price.ToString() + " €";
            description.Text = "Product Description: " + product.description;
            category.Text = "Category: " + product.category;
            rating.Text = "User Rating: " + product.rating.ToString();
            stock.Text = "In Stock: " + product.stock.ToString();
            ProductPicture.ImageUrl = product.images[0];
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            int productId = Int32.Parse(Request.QueryString["product"]);
            Global.Product product = Global.Storage.storage.Find(item => item.id == productId);


            if (Session["cart"] == null)
            {
                Session["cart"] = new List<Global.Product>();
            }

            var list = (List<Global.Product>)Session["cart"];

            if (list.Contains(product))
            {
                list.Find(elem => elem.id == product.id).quantity += 1;
            }
            else
            {
                list.Add(product);
            }
            Session["cart"] = list;
        }

    }
}
