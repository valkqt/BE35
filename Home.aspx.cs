using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE35
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HomeCards.DataSource = Global.Storage.storage;
            HomeCards.DataBind();
        }


        protected void AddToCart(object source, RepeaterCommandEventArgs e)
        {
            Global.Product product = Global.Storage.storage.Find(item => item.id == Int32.Parse(e.CommandArgument.ToString()));


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