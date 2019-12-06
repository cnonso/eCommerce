using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate.Views
{
    public partial class Details : System.Web.UI.Page
    {
        protected static string productName = "";
        protected static string productImage = "";
        protected static string productPrice = "";
        protected static string productid = "";
        protected static double qtyOnHand = 0;
        protected static DataTable cart = new DataTable("Cart");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString == null)
                Response.Redirect("../404.aspx");

            productid = Request.QueryString["pid"];
            ProductDetail(productid);
            LoadShoppingCart();
            if (!IsPostBack)
            {
                try
                {
                    if (Session["Cart"] == null)
                        InitializeCart();
                    else
                    {
                        cart = (DataTable)Session["Cart"];
                    }
                    //InitializeCart();
                }
                catch (Exception ex)
                {
                    string msg = ex.Message;
                    if (Session["Cart"] == null)
                        cart.Clear();
                    else
                    {
                        DataTable _cart = (DataTable)Session["Cart"];
                        int rows = _cart.Rows.Count;
                        cart = (DataTable)Session["Cart"];
                        lblCartQty.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == "").Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                    }

                }
            }

        }
        protected void ProductDetail(string productId)
        {
            DataTable product = new Models.DB().ReadTable("Product Table", "select * from products where id= '" + productId + "'");
            if (product.Rows.Count > 0)
            {
                productName = product.Rows[0]["product_name"].ToString();
                productImage = "../images/" + productName + ".png";
                productPrice = "₦" + string.Format("{0:#,0.00}", double.Parse(product.Rows[0]["Selling_Price"].ToString()));
                qtyOnHand = double.Parse(product.Rows[0]["QtyonHand"].ToString());
            }
            else
            {
                Response.Redirect("../404.aspx");
            }
        }
        protected void LoadShoppingCart()
        {
            try
            {
                DataTable cart = (DataTable)Session["Cart"];
                if (cart.Rows.Count > 0)
                {
                    lblCartQty.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == "").Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                }
                else
                {
                    lblCartQty.Text = "0";
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            DateTime tranxnDate = DateTime.Now;
            string productID = productid;
            double discount = 0.0;
            string productname = productName;
            double qty = double.Parse(txtQty.Text);
            double pricePerUnit = double.Parse(productPrice.Replace("₦", string.Empty));

            double subTotal = (pricePerUnit * qty) - discount;

            double stockQty = qtyOnHand;
            string productUnit = "unit";// txtUnit.Text;
            if (stockQty == 0)
            {
                lblReport.Text = "Stock is empty!";
                return;
            }

            if (qty > stockQty)
            {
                lblReport.Text = "Not enough in stock; Only " + stockQty + " " + productUnit + "(s) available.";
                return;
            }

            int n = 0;
            if (CartContainsProduct(productID))
            {
                DataRow drow = cart.Select("ProductID='" + productID + "'")[0];
                int cartRowIndex = cart.Rows.IndexOf(drow);

                double oldCartQty = double.Parse(cart.Rows[cartRowIndex]["Qty"].ToString());
                double oldDiscount = double.Parse(cart.Rows[cartRowIndex]["Discount"].ToString());
                double oldSubTotal = double.Parse(cart.Rows[cartRowIndex]["SubTotal"].ToString());

                double newCartQty = oldCartQty + qty;
                if (newCartQty > stockQty)
                {
                    lblReport.Text = "Not enough in stock; Only " + stockQty + " " + productUnit + "(s) available.";
                    return;
                }
                double newDiscount = oldDiscount + discount;
                double newSubTotal = (pricePerUnit * newCartQty) - newDiscount;

                //lblReport.Text = "";
                DataRow updateRow = cart.Rows[cartRowIndex];
                updateRow["Qty"] = newCartQty;
                updateRow["Discount"] = newDiscount;
                updateRow["SubTotal"] = newSubTotal;
            }
            else
            {
                //lblReport.Text = "";
                DataRow cartRow = cart.NewRow();
                cartRow["ID"] = ++n;
                cartRow["TransactionDate"] = tranxnDate;
                cartRow["ProductID"] = productID;
                cartRow["ProductName"] = productname;
                cartRow["Unit"] = "";// lblUnit.Text;
                cartRow["Qty"] = qty;
                cartRow["QtyOnHand"] = stockQty;
                cartRow["PricePerUnit"] = pricePerUnit;
                //cartRow["UnitCost"] = lblUnitCost.Text;
                cartRow["Discount"] = discount;
                cartRow["SubTotal"] = subTotal;
                cartRow["PoS_MAC_Addr"] = "";
                cartRow["Transaction_Id"] = "";

                cart.Rows.Add(cartRow);
            }
            Session["Cart"] = cart;
            DataTable _cart = (DataTable)Session["Cart"];
            int rows = _cart.Rows.Count;

            //display = "display:block";
            //alertType = "alert-success";
            //alert = productName + " added to cart.";
            string xx = "   <div class='alert alert-success alert-dismissable' style='display:block'>" +
                                          "<button  id='dismissBtn' type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>" +
                                        "<p><i class='icon fa fa-info'></i>" + productname + " Added to cart</p>" + 
                                    "</div>";
            Literal2.Text = xx;
            LoadShoppingCart();

        }


        protected void InitializeCart()
        {
            cart.Columns.Add(new DataColumn("ID", typeof(int)));
            cart.Columns.Add(new DataColumn("TransactionDate", typeof(DateTime)));
            cart.Columns.Add(new DataColumn("ProductID", typeof(string)));
            cart.Columns.Add(new DataColumn("ProductName", typeof(string)));
            cart.Columns.Add(new DataColumn("Category", typeof(string)));
            cart.Columns.Add(new DataColumn("Unit", typeof(string)));
            cart.Columns.Add(new DataColumn("Qty", typeof(double)));
            cart.Columns.Add(new DataColumn("QtyOnHand", typeof(double)));
            cart.Columns.Add(new DataColumn("PricePerUnit", typeof(double)));
            cart.Columns.Add(new DataColumn("UnitCost", typeof(double)));
            cart.Columns.Add(new DataColumn("Discount", typeof(double)));
            cart.Columns.Add(new DataColumn("SubTotal", typeof(double)));
            cart.Columns.Add(new DataColumn("PoS_MAC_Addr", typeof(string)));
            cart.Columns.Add(new DataColumn("Transaction_Id", typeof(string)));
        }
        public bool CartContainsProduct(string product_ID)
        {
            return cart.Select("ProductID='" + product_ID + "' AND Transaction_Id=''").Length != 0;
        }
    }
}