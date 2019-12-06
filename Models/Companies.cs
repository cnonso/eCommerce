using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Companies
    {
        public string DBError;
        DB db = new DB();


        /// <summary>
        /// Companies Initializers
        /// </summary>
        private int _id;
        private string _companyName;
        private string _address;  
        private string _phoneNo; 
        private string _email; 
        private string _contactPerson;
        

        public Companies()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Companies(int id)
        {
            //_pt_id = id;
            //DataTable roomTable = db.ReadTable("Tbl_Bookable_Units", String.Format("SELECT * FROM Tbl_Bookable_Units WHERE UnitID='{0}'", _id));
            //if (roomTable.Rows.Count > 0)
            //{
            //    _room_no = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Room_No"].ToString());
            //    _pt_qtyOnHand = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["TypeCompany_Name"].ToString());
            //    _pt_description = Convert.ToDouble(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Base_Price"].ToString()));
            //    _pt_outFlow = Convert.ToInt32(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Bookable_Spaces"].ToString()));
            //}
        }

        public DataTable CompanyRecord(string company_Name)
        {
            return db.ReadTable("Company Record", String.Format("SELECT * FROM Company WHERE [Company_Name]='{0}'", company_Name));
        }

        public bool NewCompany()
        {
            bool entryMade = false;
            string addEntryQuery = @"INSERT INTO Company ([Company_Name], [Address], [Phone], [Email], [Contact_Person], [Status])" +
                                    "VALUES('" + _companyName + "','" + _address + "','" + _phoneNo + "','" + _email + "','" + _contactPerson + "','Active')";

            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }

        public bool Update(int company_id)
        {
            string query = "UPDATE Company SET [Company_Name] ='" + _companyName +
                            "', [Address] ='" + _address + 
                            "', [Phone] ='" + Phone + 
                            "', [Email] ='" + _email + 
                            "', [Contact_Person] ='" + _contactPerson +
                            "' WHERE [ID]='" + company_id + "'";
            return db.ExecuteQuery(query);
        }

        public bool Exists(string companyName)
        {
            return db.ReadData("SELECT ID FROM Company WHERE [Company_Name]='" + companyName + "'") != string.Empty;
        }

        public DataTable GetAllCompanys()
        {
            string query = "SELECT * FROM Company";
            return new DB().ReadTable("Companies", query);
        }

        //Properties
        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Company_Name
        {
            get { return _companyName; }
            set { _companyName = value; }
        }

        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }
         
        public string Phone
        {
            get { return _phoneNo; }
            set { _phoneNo = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        } 
        public string ContactPerson
        {
            get { return _contactPerson; }
            set { _contactPerson = value; }
        }
    }
}