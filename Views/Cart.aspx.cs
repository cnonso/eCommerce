using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate.Views
{
    public partial class Cart : System.Web.UI.Page
    {
        protected static string transaction_ID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    DataTable cart = (DataTable)Session["Cart"];
                    lblCartQty.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                    //lblCartQty.Text = lblTotalItemsInCart.Text; 
                }
                catch
                {
                    Response.Redirect("../500.aspx");
                }
            }
            LoadShoppingCart();
            Site1.pageTitle = "Cart";
        }
        protected static string cartListBuilder = "";
        protected void LoadShoppingCart()
        {
            cartListBuilder = "";
            try
            {
                DataTable cart = (DataTable)Session["Cart"];
                string priceSection = "";
                if (cart.Rows.Count > 0)
                {
                    int t = 0;
                    foreach (DataRow dr in cart.Rows)
                    {
                        ++t;
                        double qtyPlus = double.Parse(dr["Qty"].ToString()) + 1;
                        double qtyMinus = double.Parse(dr["Qty"].ToString()) - 1;

                        string saleType = dr["SaleType"].ToString();

                        string remove = "<a class='btn btn-primary height-auto btn-sm'  style='cursor:pointer' title=\"Remove " + dr["ProductName"].ToString() + " from cart.\" onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\">X</a> ";
                        string rem = "<a href='#' class='btn btn-primary height-auto btn-sm' onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\">X</a>";

                        if (saleType == "Wholesale")
                        {
                            cartListBuilder += " <tr>" +
                                                "<td class='product-thumbnail'>" + 
                                                    "<img src='../images/" + dr["ProductName"] + ".png' alt='Image' class='img-fluid'>" +
                                                      "<span class='btn btn-sm btn-danger'>Wholesale</span>" +
                                                "</td>" +
                                                "<td class='product-name'>" +
                                                  "<h2 class='h5 text-black'>" + dr["ProductName"] + "</h2>" +
                                                "</td>" +
                                                "<td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["PricePerUnit"].ToString())) + "</td>" +
                                                "<td style='width:20%'>" +
                                                  "<div class='input-group mb-3' style='max-width: 220px;'>" +
                                                    "<div class='input-group-prepend' >" +
                                                      "<button class='btn btn-outline-primary js-btn-minus' type='button' onclick=\"Decrease('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\">&minus;</button>" +
                                                    "</div>" +
                                                    "<input  id = '" + dr["ProductID"] + "' type='number' class='form-control text-center' value='" + dr["Qty"] + "' placeholder=''  onchange=\"UpdateItemCount('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\"" +
                                                      "aria-label='Example text with button addon' aria-describedby='button-addon1'>" +
                                                    "<div class='input-group-append'>" +
                                                      "<button class='btn btn-outline-primary js-btn-plus' type='button' onclick=\"Increase('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\">&plus;</button>" +
                                                    "</div>" +
                                                  "</div>" +
                                                "</td>" +
                                                "<td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["SubTotal"].ToString())) + "</td>" +
                                                "<td>" + remove + "</a></td>" +
                                              "</tr>";
                        }
                        else
                        {
                            cartListBuilder += " <tr>" +
                                                "<td class='product-thumbnail'>" +

                                                    "<img src='../images/" + dr["ProductName"] + ".png' alt='Image' class='img-fluid'>" +
                                                      "<span class='btn btn-sm btn-info'>Retail</span>" +
                                                "</td>" +
                                                "<td class='product-name'>" +
                                                  "<h2 class='h5 text-black'>" + dr["ProductName"] + "</h2>" +
                                                "</td>" +
                                                "<td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["PricePerUnit"].ToString())) + "</td>" +
                                                "<td style='width:20%'>" +
                                                  "<div class='input-group mb-3' style='max-width: 220px;'>" +
                                                    "<div class='input-group-prepend' >" +
                                                      "<button class='btn btn-outline-primary js-btn-minus' type='button' onclick=\"Decrease('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\">&minus;</button>" +
                                                    "</div>" +
                                                    "<input  id = '" + dr["ProductID"] + "' type='number' class='form-control text-center' value='" + dr["Qty"] + "' placeholder=''  onchange=\"UpdateItemCount('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\"" +
                                                      "aria-label='Example text with button addon' aria-describedby='button-addon1'>" +
                                                    "<div class='input-group-append'>" +
                                                      "<button class='btn btn-outline-primary js-btn-plus' type='button' onclick=\"Increase('" + dr["ProductID"] + "','" + dr["QtyOnHand"] + "')\">&plus;</button>" +
                                                    "</div>" +
                                                  "</div>" +
                                                "</td>" +
                                                "<td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["SubTotal"].ToString())) + "</td>" +
                                                "<td>" + remove + "</a></td>" +
                                              "</tr>";
                        }

                    }

                    lblCartQty.Text = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                    double subTtl = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["SubTotal"].ToString()));
                    lblSubTotalPrice.Text = lblTotalPrice.Text = "₦" + string.Format("{0:#,0.00}", subTtl);
                    string subTototalPrice = "₦" + string.Format("{0:#,0.00}", subTtl);
                    priceSection = @"<div class='row mb-3'>" +
                                        "<div class='col-md-6'>" +
                                            "<span class='text-black'>Subtotal</span>" +
                                        "</div>" +
                                        "<div class='col-md-6 text-right'>" +
                                            "<strong class='text-black'>" +
                                                subTototalPrice +
                                            "</strong>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='row mb-5'>" +
                                        "<div class='col-md-6'>" +
                                            "<span class='text-black'>Total</span>" +
                                        "</div>" +
                                        "<div class='col-md-6 text-right'>" +
                                            "<strong class='text-black'>" +
                                                subTototalPrice +
                                        "</div>" +
                                    "</div>";
                    Literal2.Text = priceSection;
                }
                else
                {
                    string subTototalPrice = "₦" + string.Format("{0:#,0.00}", 0);
                    priceSection = @"<div class='row mb-3'>" +
                                        "<div class='col-md-6'>" +
                                            "<span class='text-black'>Subtotal</span>" +
                                        "</div>" +
                                        "<div class='col-md-6 text-right'>" +
                                            "<strong class='text-black'>" +
                                                subTototalPrice +
                                            "</strong>" +
                                        "</div>" +
                                    "</div>" +
                                    "<div class='row mb-5'>" +
                                        "<div class='col-md-6'>" +
                                            "<span class='text-black'>Total</span>" +
                                        "</div>" +
                                        "<div class='col-md-6 text-right'>" +
                                            "<strong class='text-black'>" +
                                                subTototalPrice +
                                        "</div>" +
                                    "</div>";
                    Literal2.Text = priceSection;

                    lblCartQty.Text = "0";
                    double subTtl = 0;
                    lblSubTotalPrice.Text = lblTotalPrice.Text = "₦" + string.Format("{0:#,0.00}", subTtl);
                }
            }
            catch (Exception ex)
            {
                //cartListBuilder = "Cart is Empty. " + ex.Message;
                cartListBuilder = "Cart is Empty. ";
            }
            Literal1.Text = cartListBuilder;
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Views/CheckOut.aspx");
        }

        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            DataTable cart = (DataTable)Session["Cart"];
            string cartItemID = cartItem_ID.Text;
            DataRow drow = cart.Select("ProductID='" + cartItemID + "'")[0];
            int cartRowIndex = cart.Rows.IndexOf(drow);

            DataRow updateRow = cart.Rows[cartRowIndex];
            updateRow["Qty"] = cartItemNewQty.Text;
            updateRow["SubTotal"] = double.Parse(cartItemNewQty.Text) * double.Parse(updateRow["PricePerUnit"].ToString());

            LoadShoppingCart();
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            DataTable cart = (DataTable)Session["Cart"];
            string cartItemID = cartItem_ID.Text;
            DataRow drow = cart.Select("ProductID='" + cartItemID + "'")[0];
            int cartRowIndex = cart.Rows.IndexOf(drow);

            cart.Rows.RemoveAt(cartRowIndex);
            LoadShoppingCart();
        }
    }
}