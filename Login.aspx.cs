using eCommerceTemplate.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eCommerceTemplate
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Site1.pageTitle = "Login";
        }

     
        protected void LoginButton_Click(object sender, EventArgs e)
        { 

            User user = new User(UserName.Text, Password.Text);

            if (user.ExecutionError.Length > 0)
                FailureText.Text = "Error! Your Internet connection is very poor.";
            else if (user.Exists)
            {
                Session["firmID"] = user.FirmID;
                user = new User(UserName.Text);
                if (user.UserType == "Admin" || user.UserType == "Super Admin")
                {
                    System.IO.File.WriteAllText(Server.MapPath("~/Sessions/username.sess"), user.Username);
                    user.UpdateLogin();
                    Session["username"] = user.Username;
                    Session["SalesOfficer"] = user.Name;
                    Session["UserType"] = user.UserType;
                    Session["StaffID"] = user.ID;

                    Session["WarehouseID"] = 1;

                    Session.Timeout = 1440;
                    string redirect = Request.QueryString["redirect"] != null ? "?task=" + Request.QueryString["redirect"] : "";
                    redirect = redirect == "?task=home" || redirect == "?task=dashboard" || redirect == "?task=profit" || redirect == "?task=daily sales" ? "" : redirect;
                    Response.Redirect("~/Views/warehousestore.aspx");
                }
                else
                {
                    if (user.UserType == "Show Room Admin")
                    {
                        System.IO.File.WriteAllText(Server.MapPath("~/Sessions/staff.sess"), user.Username);
                        DateTime dt = DateTime.Now;
                        dt.AddHours(24);
                        Response.Cookies["users"]["sales"] = user.Username;
                        Response.Cookies["users"].Expires = dt;
                        Response.Cookies["users"]["time"] = DateTime.Now.Ticks.ToString();
                        user.UpdateLogin();
                        Session["username"] = user.Username;
                        Session["SalesOfficer"] = user.Name;
                        Session["UserType"] = user.UserType;
                        Session["StaffID"] = user.ID;

                        string warehouseID = "0";
                        try
                        {
                            warehouseID = user.UserType.Split(' ')[1];
                            Session["WarehouseID"] = warehouseID;
                        }
                        catch { warehouseID = "0"; }
                        Session.Timeout = 1440;
                        string redirect = Request.QueryString["redirect"] != null ? "?task=" + Request.QueryString["redirect"] : "?task=daily sales";
                        //redirect = redirect == "?task=daily sales" ? "" : redirect;

                        Response.Redirect("~/Views/warehousestore.aspx");
                    }
                    else if (user.UserType.StartsWith("Warehouse"))
                    {
                        System.IO.File.WriteAllText(Server.MapPath("~/Sessions/staff.sess"), user.Username);
                        DateTime dt = DateTime.Now;
                        dt.AddHours(24);
                        Response.Cookies["users"]["sales"] = user.Username;
                        Response.Cookies["users"].Expires = dt;
                        Response.Cookies["users"]["time"] = DateTime.Now.Ticks.ToString();
                        user.UpdateLogin();
                        Session["username"] = user.Username;
                        Session["SalesOfficer"] = user.Name;
                        Session["UserType"] = user.UserType;
                        Session["StaffID"] = user.ID;

                        string warehouseID = "0";
                        try
                        {
                            warehouseID = user.UserType.Split(' ')[1];
                            Session["WarehouseID"] = warehouseID;
                        }
                        catch { warehouseID = "0"; }
                        Session.Timeout = 1440;
                        string redirect = Request.QueryString["redirect"] != null ? "?task=" + Request.QueryString["redirect"] : "?task=warehouse racking schematic";
                        //redirect = redirect == "?task=daily sales" ? "" : redirect;

                        Response.Redirect("~/Views/warehousestore.aspx");
                    }
                    else
                        FailureText.Text = "Access denied! You are not a registered staff.";
                }
            }
            else
                FailureText.Text = "Invalid username or password. ";
        }

        private void DeleteTempFiles()
        {
            string tempPath = "Temp/";
            System.IO.FileInfo[] files = new System.IO.DirectoryInfo(Server.MapPath(tempPath)).GetFiles();
            if (files.Length > 0)
            {
                foreach (System.IO.FileInfo fi in files)
                {
                    long interval = (DateTime.Now.Ticks - fi.CreationTime.Ticks) / 10000000;
                    if (interval / 3600 > 1)
                        fi.Delete();
                }
            }
        }
    }
}