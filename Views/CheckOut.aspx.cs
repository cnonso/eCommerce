using eCommerceTemplate.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate.Views
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected static string cartListBuilder = "";
        protected static string transaction_ID = "";
        DataTable cart = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    cart = (DataTable)Session["Cart"];
                    LoadShoppingCart();
                    Site1.totalItemsInCart = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();

                }
                catch
                {
                    Response.Redirect("../Views/Store.aspx");
                }
            }
            //LoadShoppingCart();
        }
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
                        string remove = "<a class='btn btn-primary height-auto btn-sm'  style='cursor:pointer' title=\"Remove " + dr["ProductName"].ToString() + " from cart.\" onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\">X</a> ";
                        string rem = "<a href='#' class='btn btn-primary height-auto btn-sm' onclick=\"RemoveFromCart('" + dr["ProductID"] + "')\">X</a>";
                        cartListBuilder += " <tr>" +
                                           "<td> " + dr["ProductName"] + " <strong class='mx-2'>x</strong> " + dr["Qty"] + "</td>" +
                                            "<td>" + "₦" + string.Format("{0:#,0.00}", double.Parse(dr["SubTotal"].ToString())) + "</td>" +
                                        "</tr>";

                    }

                    Site1.totalItemsInCart = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["Qty"].ToString())).ToString();
                    double subTtl = cart.AsEnumerable().Where(row => row["Transaction_Id"].ToString() == transaction_ID).Sum(row => double.Parse(row["SubTotal"].ToString()));
                    lblSubTotalPrice.Text = lblTotalPrice.Text = "₦" + string.Format("{0:#,0.00}", subTtl);

                }
                else
                {

                    Site1.totalItemsInCart = "0";
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

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            DailySalesEntry dse = new DailySalesEntry();
            DB db = new DB();
            //lblReport.Text = ""; 
            if (txtFirstname.Text.Trim() == string.Empty || txtLastname.Text.Trim() == string.Empty)
            {
                lblReport.Text = "Customer name is required.";
                return;
            }
            Customers cst = new Customers();
            cst.Name = txtFirstname.Text + " " + txtLastname.Text;
            cst.PhoneNo = txtPhone.Text;
            cst.Address = txtAddress.Text;
            cst.Credit = 0;
            cst.RegisteringStaffID = "eCommerce Site";//Session["StaffID"].ToString();
            cst.Status = "Active";

            try
            {
                double summaryAmountPaid = double.Parse(lblTotalPrice.Text.Replace("₦", string.Empty).Replace(",", string.Empty));
                dse.SummaryAmountPaid = summaryAmountPaid;
            }
            catch { dse.SummaryAmountPaid = 0; }
            //dse.SummaryDiscount = double.Parse(txtFinalDiscount.Text);
            double finalDiscount = 0;
            double vatAmount = 0;
            if (cst.Name.Trim() == string.Empty || cst.PhoneNo.Trim() == string.Empty || dse.SummaryAmountPaid < 0.00)
            {
                lblReport.Text = "Fill in all required fields";
                lblReport.ForeColor = Color.Red;
                return;
            }

            //if (cst.Exists(cst.PhoneNo))
            //{
            //    lblReport.Text = "Customer already exists";
            //    lblReport.ForeColor = Color.Red;
            //    return;
            //}
            //else cst.NewCustomer();
            cst.NewCustomer();

            //string receiptNo = GenerateReceiptNo();
            string receiptNo = (int.Parse(db.ReadData("select ReceiptNo from ReceiptNoWeb")) + 1).ToString();
            DataTable productDetail = new DataTable();

            string executableQueries = "";
            DataTable addedProducts = new DataTable();
            try
            {
                DataTable cart = (DataTable)Session["Cart"];
                addedProducts = cart;
            }
            catch
            {
                Response.Redirect("../500.aspx");
            }

            Session["AddedProducts"] = addedProducts;
            foreach (DataRow row in addedProducts.Rows)
            {
                string productid = row["ProductID"].ToString();
                productDetail = new DB().ReadTable("", "select * from products where id = '" + productid + "'");

                dse.ProductID = int.Parse(productid);
                dse.QtyOnHand = double.Parse(productDetail.Rows[0]["QtyonHand"].ToString());
                dse.OutFlow = dse.Qty = double.Parse(row["Qty"].ToString());
                dse.ProductName = row["ProductName"].ToString().Replace("'", "").Replace("\"", "``");
                dse.ReceiptNo = receiptNo;
                dse.Description = "Sales - ReceiptNo[" + receiptNo + "]";
                dse.Unit = productDetail.Rows[0]["Unit"].ToString();
                dse.UnitCost = double.Parse(productDetail.Rows[0]["Unit Cost"].ToString());
                dse.UnitPrice = double.Parse(productDetail.Rows[0]["Selling_Price"].ToString());
                //dse.UnitPrice = double.Parse(Request.Form[row + "_selling_Price_k"].ToString());
                dse.Amount = dse.Qty * dse.UnitPrice;
                dse.Profit = (dse.UnitPrice - dse.UnitCost) * dse.Qty;
                //try { dse.Discount = double.Parse(Request.Form[row + "_discount_input"].ToString()); }
                //catch { dse.Discount = 0; }
                dse.Discount = 0;
                dse.Total = dse.Amount - dse.Discount;
                dse.Date = DateTime.Now.AddHours(9);
                dse.Year = DateTime.Now.Year.ToString();
                dse.UserType = "eCommerce Site";// Session["SalesOfficer"].ToString();

                dse.SummaryTotal += dse.Total;
                //dse.SummaryDiscount += dse.Discount;
                double newQty = dse.QtyOnHand - dse.OutFlow;
                string addEntryQuery = @"INSERT INTO Products_Trans ([ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year])" +
                                        "VALUES('" + dse.ProductID + "','" + newQty + "','" + dse.Description + "','','" + dse.OutFlow + "','" + dse.Date + "','" + dse.Date.Year + "');";

                string updateStockQuery = "UPDATE Products SET [QtyonHand]='" + newQty + "' WHERE ID='" + dse.ProductID + "';";

                string registerSaleQuery = @"INSERT INTO SalesRegister ( [ReceiptNo], [Product], [Qty], [ProductID], [Unit], [UnitPrice], [Amount],[UnitCost], [Profit], [Discount], [Total],[Date]) SELECT(ReceiptNo+1) ,'" + dse.ProductName + "','" + dse.Qty + "','" + dse.ProductID + "','" + dse.Unit + "','" + dse.UnitPrice + "','" + dse.Amount + "','" + dse.UnitCost + "','" + dse.Profit + "','" + dse.Discount + "','" + dse.Total + "','" + dse.Date + "' from ReceiptNoWeb;";


                executableQueries += (addEntryQuery + updateStockQuery + registerSaleQuery);

                //dse.MakeEntry();
                //dse.SalesRegister();
            }

            string staffID = "";// Session["StaffID"].ToString();
            dse.CustomerName = txtFirstname.Text + " " + txtLastname.Text;
            dse.CustomerID = db.ReadData("SELECT TOP (1) ID FROM Customers Where RegisteringStaffID = '" + staffID + "' ORDER BY ID DESC");

            dse.PaymentMode = "Credit/Debit Card"; //ddlPaymetMode.SelectedItem.Value.ToUpper();
            dse.SummaryDiscount = finalDiscount;
            dse.SummaryTotalAmount = dse.SummaryTotal - finalDiscount + vatAmount;
            if (dse.PaymentMode.ToUpper() != "CASH")
                dse.Bank = dse.SummaryTotalAmount;
            else
            {
                dse.Bank = 0;
                dse.CashAtHand = dse.SummaryAmountPaid;
            }
            dse.Balance = dse.SummaryTotalAmount - dse.SummaryAmountPaid;
            //double credit = double.Parse(db.ReadData("select credit from customers where id = '" + dse.CustomerID + "'"));
            //double credit = double.Parse(db.ReadData("select credit from customers where id = '" + 0 + "'"));
            double credit = 0;
            double newCredit = dse.Balance + credit;
            //executableQueries += "Update Customers set credit = '" + newCredit + "'where id = '" + dse.CustomerID + "'";
            executableQueries += "Update Customers set credit = '" + newCredit + "'where id = '" + 0 + "'";
            //db.ExecuteQuery("Update Customers set credit = '" + newCredit + "'where id = '" + dse.CustomerID + "'");

            string saleSummaryQuery = @"INSERT INTO Sales_Transactions ([ReceiptNo], [Customer Name], [CustomerID], [Total], [Discount],[VAT], [Total Amount], [Amount Paid], [Paid Later],[Cash Paid], [Bank A], [Bank B], [Bank C], [Balance], [Date],[UserType]) SELECT (ReceiptNo+1) ,'" + dse.CustomerName + "','" + dse.CustomerID + "','" + dse.SummaryTotal + "','" + dse.SummaryDiscount + "','" + vatAmount + "','" + dse.SummaryTotalAmount + "','" + dse.SummaryAmountPaid + "','" + dse.PaidLater + "','" + 0 + "','" + 0 + "','" + 0 + "','" + 0 + "','" + dse.Balance + "','" + dse.Date + "','" + dse.UserType + "' from ReceiptNoWeb;";
            string salesPaymentQuery = @"INSERT INTO Sales_Payment ( [ReceiptNo], [Customer Name], [CustomerID], [Amount], [Cash At Hand], [Bank], [Details], [Date],[UserType],[Cash Paid], [Bank A], [Bank B], [Bank C]) SELECT(ReceiptNo+1) ,'" + dse.CustomerName + "','" + dse.CustomerID + "','" + dse.SummaryTotalAmount + "','" + dse.CashAtHand + "','" + dse.Bank + "','" + dse.PaymentMode + "','" + dse.Date + "','" + dse.UserType + "','" + double.Parse(lblTotalPrice.Text.Replace("₦", string.Empty).Replace(",", string.Empty)) + "','" + 0 + "','" + 0 + "','" + 0 + "' from ReceiptNoWeb;";

            executableQueries += (saleSummaryQuery + salesPaymentQuery);

            //dse.SalesSummary();


            executableQueries += "update ReceiptNoWeb set ReceiptNo = (ReceiptNo+1);";

            Session["Receipt_No"] = receiptNo;
            //db.ExecuteQuery("update ReceiptNoWeb set ReceiptNo = '" + receiptNo + "'");

            if (db.ExecuteQuery(executableQueries))
            {
                //Response.Write("<script>window.open('../../Reports/Receipt.aspx?rno=" + AppHandler.Encrypt(receiptNo) + "', '_blank', 'height=900,width=1200')</script>");
                //Page_Load(this, e);
                Session["Cart"] = null;
                Response.Redirect("../Views/ThankYou.aspx");
            }
        }


    }
}