using eCommerceTemplate.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate
{
    public partial class Default : System.Web.UI.Page
    {
        private static readonly Random getrandom = new Random();
        protected static string macAddr = getrandom.Next(100, 1000).ToString();
        protected static string transaction_ID = "";
        protected static string listBuilder = "";
        protected static DataTable company_products = new DataTable("Company_Products");
        protected static DataTable shoppingCart;
        public static DataTable products;

        protected string alert = "";
        protected string alertType = "";
        protected string display = "";

        DB db = new DB();

        protected static DataTable cart = new DataTable("Cart");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try {
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
                        lblTotalItemsInCart.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                        lblCartQty.Text = lblTotalItemsInCart.Text;

                    }

                }
                LoadAllProducts();
                display = "display:none";
            }
            LoadShoppingCart();
            //Companyy_DDL();
        }
        private void LoadAllProducts()
        {
            listBuilder = "";
            products = new DB().ReadTable("Products", "Select * from Products where saletype = 'retail' ORDER BY NEWID () ");
            if (products.Rows.Count > 0)
            {
                int t = 0;
                foreach (DataRow dr in products.Rows)
                {
                    ++t;
                    string productname = dr["Product_Name"].ToString();
                    string productid = dr["id"].ToString();
                    string addToCart = "<a title=\"Add " + productname + " to cart.\" class='btn btn-default add-to-cart' style='cursor:pointer' onclick2='alert()' onclick=\"AddToList('" + dr["ID"] + "','" + productname + "','" + dr["Selling_Price"] + "','" + dr["QtyonHand"] + "','" + dr["Product Code"] + "','" + dr["MinQty"] + "','" + dr["Category"] + "' )\"><i class=\"fa fa-shopping-cart\"></i> Add to cart</a> ";
                     
                        listBuilder += "<div class='col-sm-6 col-lg-4 text-center item mb-4'>" +
                                           //"<span class='tag'>Wholesale</span>" +
                                           // "<a href='shop-single.html'><img src='images/product_01.png' alt='Image'></a>" +
                                           "<a onclick='Detail('" + dr["ID"] + "')' href='../Views/Details.aspx?pid=" + productid + "'><img src='images/" + productname + ".png' alt='Image'></a>" +
                                           "<h3 class='text-dark'><a onclick='Detail('" + dr["ID"] + "')' href='../Views/Details.aspx?pid=" + productid + "'>" + productname + "</a></h3>" +
                                              "<small style='margin-top:-10px'>" + dr["Category"] + "</small>" +
                                             "<p class='price'>₦" + dr["Selling_Price"] + "</p>" +
                                             "<a style='color:black' class='btn btn-primary btn-sm' onclick=\"AddToList('" + dr["ID"] + "','" + productname + "','" + dr["Selling_Price"] + "','" + dr["QtyonHand"] + "','" + dr["Product Code"] + "','" + dr["MinQty"] + "' ); document.getElementById('timer').click()\"><i class='icon-shopping-cart'></i> Add to cart </a> " +
                                            " <a class='btn btn-outline-primary btn-sm' onclick='Detail('" + dr["ID"] + "')' href='../Views/Details.aspx?pid=" + productid + "'>Detail</a>" +

                                        "</div>" +
                                           "<div style='display:none'" +
                                           "    <p id = '" + productid + "_existingQty'>" + dr["QtyonHand"] + "</p>" +
                                           "     <input type='number' style='width:100%' value='1'  step = 'any'  id='" + productid + "_qty' />" +
                                           "    <input type='number' style='width:100%' value='" + dr["Selling_Price"] + "' name='" + productid + "_selling_Price_' id= '" + productid + "_selling_Price_' />" +
                                            addToCart +
                                        "</div>";
                    
                    //listBuilder += "<tr>" +
                    //                "    <td>" + t + "</td>" +
                    //                "    <td>" + dr["Company"] + "</td>" +
                    //                "    <td>" + productname + "</td>" +
                    //                "    <td><p id = '" + productid + "_existingQty'>" + dr["QtyonHand"] + "</p></td>" +
                    //                "    <td> <input type='number' style='width:100%' value='1'  step = 'any'  id='" + productid + "_qty' /> </td>" +
                    //                "    <td> <input type='number' style='width:100%' value='" + dr["Selling_Price"] + "' name='" + productid + "_selling_Price_' id= '" + productid + "_selling_Price_' /> </td>" +
                    //                "    <td>" + addToCart + "</td>" +
                    //                "</tr>";
                }

            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            DateTime tranxnDate = DateTime.Now;
            string productID = txtProductID.Text;
            double discount = 0.0;
            string productName = txtProductName.Text;
            double qty = double.Parse(txtQty.Text);
            string[] price_ = new string[] { "50", "100" };// txtProductPrice.Text.Split('₦');
            //double pricePerUnit = double.Parse(price_[1]);
            double pricePerUnit = double.Parse(txtSellingPrice.Text);
            string category = txtCategory.Text;

            double subTotal = (pricePerUnit * qty) - discount;

            double stockQty = double.Parse(txtQtyOnHand.Text);
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
                cartRow["ProductName"] = productName;
                cartRow["Category"] = productName;
                cartRow["Unit"] = "";// lblUnit.Text;
                cartRow["Qty"] = qty;
                cartRow["QtyOnHand"] = stockQty;
                cartRow["PricePerUnit"] = pricePerUnit;
                //cartRow["UnitCost"] = lblUnitCost.Text;
                cartRow["Discount"] = discount;
                cartRow["SubTotal"] = subTotal;
                cartRow["PoS_MAC_Addr"] = macAddr;
                cartRow["Transaction_Id"] = transaction_ID;
                cartRow["SaleType"] = "Retail";

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
                                        "<p><i class='icon fa fa-info'></i>" + productName + " Added to cart</p>" +
                                    "</div>";
            Literal2.Text = xx;
            LoadShoppingCart();

        }

        protected static string cartListBuilder = "";
        protected void LoadShoppingCart()
        {
            cartListBuilder = "";
            try
            {
                DataTable cart = (DataTable)Session["Cart"];
                if (cart.Rows.Count > 0)
                {
                    int t = 0;
                    foreach (DataRow dr in cart.Rows)
                    {
                        ++t;
                        string remove = "<a style='cursor:pointer' title=\"Remove " + dr["ProductName"].ToString() + " from cart.\" onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\"><i class=\"fa fa-times\"></i>Remove</a> ";

                        cartListBuilder += "<tr>" +
                                        "    <td>" + dr["ProductName"] + "</td>" +
                                        "    <td> <input id = '" + dr["ProductID"] + "' type='number' step='any' class='form-control' value = '" + dr["Qty"] + "' onchange=\"UpdateItemCount('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\" /></td>" +
                                        //"    <td>" + "₦" + string.Format("{0:#,0.00}", int.Parse(dr["PricePerUnit"].ToString())) + "</td>" +
                                        "    <td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["SubTotal"].ToString())) + "</td>" +
                                        "    <td>" + remove + "</td>" +
                                        "</tr>";

                    }

                    lblTotalItemsInCart.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                    lblCartQty.Text = lblTotalItemsInCart.Text;
                    double subTtl = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["SubTotal"].ToString()));
                    lblTotalPrice.Text = "₦" + string.Format("{0:#,0.00}", subTtl);
                }
                else
                {
                    lblTotalItemsInCart.Text = "Empty";
                    lblCartQty.Text = lblTotalItemsInCart.Text;
                    double subTtl = 0;
                    lblTotalPrice.Text = "₦" + string.Format("{0:#,0.00}", subTtl);
                }
            }
            catch (Exception ex)
            {
                cartListBuilder = "Empty. " + ex.Message;
            }
            Literal1.Text = cartListBuilder;
        }
        private void ClearShoppingCart()
        {
            //db.ExecuteQuery("delete from Cart where Transaction_Id = '" + transaction_ID + "'");
            cart.Clear();
            lblTotalItemsInCart.Text = "Empty";
            lblTotalPrice.Text = " ₦0.00";
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
            cart.Columns.Add(new DataColumn("SaleType", typeof(string)));
        }

        public bool CartContainsProduct(string product_ID)
        {
            return cart.Select("ProductID='" + product_ID + "' AND Transaction_Id='" + transaction_ID + "'").Length != 0;
        }



        protected void ClearTransactionForm()
        {
            //DDLCompany.SelectedIndex = 0;
            //DDLCompanyProducts.SelectedIndex = 0;
            //txtQty.Text = string.Empty;
            //txtProductPrice.Text = string.Empty;
            //txtDiscountPrice.Text = string.Empty;
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            string cartItemID = cartItem_ID.Text;
            DataRow drow = cart.Select("ProductID='" + cartItemID + "'")[0];
            int cartRowIndex = cart.Rows.IndexOf(drow);

            cart.Rows.RemoveAt(cartRowIndex);
            LoadShoppingCart();
        }

        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            string cartItemID = cartItem_ID.Text;
            DataRow drow = cart.Select("ProductID='" + cartItemID + "'")[0];
            int cartRowIndex = cart.Rows.IndexOf(drow);

            DataRow updateRow = cart.Rows[cartRowIndex];
            updateRow["Qty"] = cartItemNewQty.Text;
            updateRow["SubTotal"] = double.Parse(cartItemNewQty.Text) * double.Parse(updateRow["PricePerUnit"].ToString());

            LoadShoppingCart();
        }
    }
}