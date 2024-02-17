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

            string PageHTML = "";

            foreach (Global.Product item in Global.Storage.storage)
            {


                PageHTML += $"<a href=\"Details.aspx?product={item.id}\" >" +
                    $"<div class=\"card CustomCard cardSilver \" style=\"width: 18rem;\">\r\n  " +
                    $"<div class=\" \">" +
                    $"<img src=\"{item.images[0]}\" class=\"card-img-top CustomImage\" alt=\"...\">\r\n</div>  " +
                    $"<div class=\"card-body\">\r\n    " +
                    $"<h5 class=\"card-title\">{item.title}</h5>\r\n   " +
                    $"<p class=\"card-text\">{item.description} </p>\r\n    " +
                    $"<p>{item.price} €</p>" +
                    $" </div>\r\n" +
                    $"</div>" +
                    $"</a>";

            }

            Card.Text = PageHTML;
        }

        public void Button1_Click(object sender, EventArgs e)
        {
            if (Session["cart"] == null)
            {
                Session["cart"] = new List<int>();
                var list = (List<int>)Session["cart"];
                Global.Product pepe = Global.Storage.storage.Find(item => item.id == 1);
                list.Add(pepe.id);
                Session["cart"] = list;
            }
            else
            {
                var list = (List<int>)Session["cart"];
                Global.Product pepe = Global.Storage.storage.Find(item => item.id == 1);
                list.Add(pepe.id);
                Session["cart"] = list;
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            List<int> list = Session["cart"] as List<int>;
            Response.Write(Global.Storage.storage.Find(item => item.id == list[0]).title);

        }
    }
}