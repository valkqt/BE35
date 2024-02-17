using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BE35
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var list = Session["cart"] as List<Global.Product>;

            if (list != null && list.Count() > 0)
            {
                CartCards.DataSource = list;
                CartCards.DataBind();
                Total.Text = "Total: " + list.Aggregate(0, (double total, Global.Product next) => total += (next.price * next.quantity)).ToString() + " €";

            }
            else
            {
                EmptyCart.Text = "Add something to start shopping";
            }
        }

        protected void Clear_Cart(object sender, EventArgs e)
        {
            var list = Session["cart"] as List<Global.Product>;
            list.Clear();
            Session["cart"] = list;
            Response.Redirect("~/Cart.aspx");
        }


        protected void Remove_Item(object source, RepeaterCommandEventArgs e)
        {
            var list = Session["cart"] as List<Global.Product>;
            list.Remove(list.Find(elem => elem.id == Int32.Parse(e.CommandArgument.ToString())));
            Response.Redirect("~/Cart.aspx");
        }
    }
}