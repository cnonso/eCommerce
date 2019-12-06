using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public static string totalItemsInCart = "0";
        public static string pageTitle = "Home";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadShoppingCart();
        }
        protected void LoadShoppingCart()
        { 
            try
            {
                DataTable cart = (DataTable)Session["Cart"];
                if (cart.Rows.Count > 0)
                {
                    totalItemsInCart = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == "").Sum(row => double.Parse(row["Qty"].ToString())).ToString(); 
                }
                else
                {
                    totalItemsInCart = "0";
                }
            }
            catch (Exception ex)
            { 
            } 
        }

    }
}