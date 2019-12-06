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
    public partial class Demo2 : System.Web.UI.Page
    {
        private static readonly Random getrandom = new Random();
        protected static string macAddr = getrandom.Next(100, 1000).ToString();
        //protected static string macAddr = (
        //        from nic in NetworkInterface.GetAllNetworkInterfaces()
        //        where nic.OperationalStatus == OperationalStatus.Up
        //        select nic.GetPhysicalAddress().ToString()
        //        ).FirstOrDefault();
        protected static string transaction_ID = "";
        protected static string listBuilder = "";
        protected static DataTable company_products = new DataTable("Company_Products");
        protected static DataTable shoppingCart;
        public static DataTable products;

        DB db = new DB();

        protected static DataTable cart = new DataTable("Cart");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try { InitializeCart(); }
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
                    }

                }
                LoadAllProducts();
            }
            LoadShoppingCart();
            //Companyy_DDL();
        }
        private void LoadAllProducts()
        {
            listBuilder = "";
            products = new DB().ReadTable("Products", "Select * from Products");
            if (products.Rows.Count > 0)
            {
                int t = 0;
                foreach (DataRow dr in products.Rows)
                {
                    ++t;
                    string productname = dr["Product_Name"].ToString();
                    string productid = dr["id"].ToString();
                    string addToCart = "<a title=\"Add " + productname + " to cart.\" class='btn btn-default add-to-cart' style='cursor:pointer' onclick2='alert()' onclick=\"AddToList('" + dr["ID"] + "','" + productname + "','" + dr["Selling_Price"] + "','" + dr["QtyonHand"] + "','" + dr["Product Code"] + "','" + dr["MinQty"] + "' )\"><i class=\"fa fa-shopping-cart\"></i> Add to cart</a> ";

                    listBuilder+= " <div class='col-sm-4'>" +
                                    "<div class='product-image-wrapper'>" +
                                         "<div class='single-products'>"+
                                        "<div class='productinfo text-center'>"+
                                            "<img src='images/home/"+productname+".jpg' alt='' />"+
                                            "<h2>₦" + dr["Selling_Price"] + "</h2>"+
                                            "<p"+productname+"</p>" +
                                              //"<a href = '#' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Add to cart</a>"+
                                              addToCart +
                                        "</div>" +
                                        "<div class='product-overlay'>"+
                                            "<div class='overlay-content'>"+
                                                  "<h2>₦" + dr["Selling_Price"] + "</h2>" +
                                                "<p>" +productname+"</p>"+
                                                // "<a href = '#' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Add to cart</a>"+
                                                addToCart +
                                            "</div>" +
                                        "</div>"+
                                    "</div>"+
                                    "<div style='display:none'"+
                                       "    <p id = '" + productid + "_existingQty'>" + dr["QtyonHand"] + "</p>" +
                                       "     <input type='number' style='width:100%' value='1'  step = 'any'  id='" + productid + "_qty' />" +
                                       "    <input type='number' style='width:100%' value='" + dr["Selling_Price"] + "' name='" + productid + "_selling_Price_' id= '" + productid + "_selling_Price_' />" +
                                        addToCart +
                                    "</div>" +
                                    "<div class='choose'>"+
                                        "<ul class='nav nav-pills nav-justified'>"+
                                            "<li><a href='#'><i class='fa fa-plus-square'></i>Add to wishlist</a></li>"+
                                            "<li><a href='#'><i class='fa fa-plus-square'></i>Add to compare</a></li>"+
                                        "</ul>"+
                                    "</div>"+
                                    "</div>" +
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
                cartRow["Unit"] = "";// lblUnit.Text;
                cartRow["Qty"] = qty;
                cartRow["QtyOnHand"] = stockQty;
                cartRow["PricePerUnit"] = pricePerUnit;
                //cartRow["UnitCost"] = lblUnitCost.Text;
                cartRow["Discount"] = discount;
                cartRow["SubTotal"] = subTotal;
                cartRow["PoS_MAC_Addr"] = macAddr;
                cartRow["Transaction_Id"] = transaction_ID;

                cart.Rows.Add(cartRow);
            }
            Session["Cart"] = cart;
            DataTable _cart = (DataTable)Session["Cart"];
            int rows = _cart.Rows.Count;
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
                        string remove = "<a style='cursor:pointer' title=\"Remove " + dr["ProductName"].ToString() + " from cart.\" onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\"><i class=\"fa fa-times\"></i></a> ";

                        cartListBuilder += "<tr>" +
                                        "    <td>" + dr["ProductName"] + "</td>" +
                                        "    <td> <input id = '" + dr["ProductID"] + "' type='number' step='any' class='form-control' value = '" + dr["Qty"] + "' onchange=\"UpdateItemCount('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\" /></td>" +
                                        //"    <td>" + "₦" + string.Format("{0:#,0.00}", int.Parse(dr["PricePerUnit"].ToString())) + "</td>" +
                                        "    <td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["SubTotal"].ToString())) + "</td>" +
                                        "    <td>" + remove + "</td>" +
                                        "</tr>";

                    }

                    lblTotalItemsInCart.Text = cart.Rows.Count.ToString();
                    double subTtl = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["SubTotal"].ToString()));
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