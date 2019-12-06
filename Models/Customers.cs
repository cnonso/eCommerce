using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Customers
    {
               private SqlConnection serverConnector = new SqlConnection();
        public string DBError;
        DB db = new DB();


        /// <summary>
        /// Customers (_cus) Initializers
        /// </summary>
        private int _id;
        private string _name;
        private string _phoneNo;
        private string _address;
        private double _credit;
        private string _status;
        private string _registeringStaffID;
        

        public Customers()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Customers(int id)
        {
            //_pt_id = id;
            //DataTable roomTable = db.ReadTable("Tbl_Bookable_Units", String.Format("SELECT * FROM Tbl_Bookable_Units WHERE UnitID='{0}'", _id));
            //if (roomTable.Rows.Count > 0)
            //{
            //    _room_no = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Room_No"].ToString());
            //    _pt_qtyOnHand = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["TypeName"].ToString());
            //    _pt_description = Convert.ToDouble(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Base_Price"].ToString()));
            //    _pt_outFlow = Convert.ToInt32(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Bookable_Spaces"].ToString()));
            //}
        }

        public DataTable CustomerRecord(string customer_PhoneNo)
        {
            return db.ReadTable("Customer Record", String.Format("SELECT * FROM Customers WHERE PhoneNo='{0}'", customer_PhoneNo));
        }

        public bool NewCustomer()
        {
            bool entryMade = false;
            string addEntryQuery = @"INSERT INTO Customers ([Name], [PhoneNo], [Address], [Credit], [Status],[RegisteringStaffID])" +
                                    "VALUES('" + _name + "','" + _phoneNo + "','" + _address + "','" + _credit + "','" + _status + "','" + _registeringStaffID + "')";

            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }

        public bool Update(int customer_id)
        {
            string query = "UPDATE Customers SET [Name] ='" + Name +
                            "', [PhoneNo] ='" + PhoneNo +
                            "', [Address] ='" + Address +
                            "', [Status] ='" + Status +
                            "' WHERE [ID]='" + customer_id + "'";
            return db.ExecuteQuery(query);
        }

        public bool Exists(string phoneNo)
        {
            return db.ReadData("SELECT Name FROM Customers WHERE PhoneNo='" + phoneNo + "'") != string.Empty;
        }

        public DataTable GetAllCustomers()
        {
            string query = "SELECT * FROM Customers";
            return new DB().ReadTable("Customers", query);
        }

        //Properties
        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }

        public string PhoneNo
        {
            get { return _phoneNo; }
            set { _phoneNo = value; }
        }

        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }

        public double Credit
        {
            get { return _credit; }
            set { _credit = value; }
        }

        public string Status
        {
            get { return _status; }
            set { _status = value; }
        }
        public string RegisteringStaffID
        {
            get { return _registeringStaffID; }
            set { _registeringStaffID = value; }
        }
    }
}