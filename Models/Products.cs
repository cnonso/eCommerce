using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Products
    { 
        public string DBError;
        DB db = new DB();


        /// <summary>
        /// Products Initializers
        /// </summary>
        private int _id;
        private string _productName;
        private string _category;
        private float _sellingPrice;
        private double _qtyOnHand;
        private string _unit;
        private float _unitCost;
        private float _lastPurchasePrice;
        private string _productCode;
        private double _minQty;
        private double _pcsPerCarton;
        private string _company;
        private string _companyId;
        

        public Products()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Products(int id)
        {
            //_pt_id = id;
            //DataTable roomTable = db.ReadTable("Tbl_Bookable_Units", String.Format("SELECT * FROM Tbl_Bookable_Units WHERE UnitID='{0}'", _id));
            //if (roomTable.Rows.Count > 0)
            //{
            //    _room_no = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Room_No"].ToString());
            //    _pt_qtyOnHand = AppHandler.IgnoreDBNullString(roomTable.Rows[0]["TypeProduct_Name"].ToString());
            //    _pt_description = Convert.ToDouble(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Base_Price"].ToString()));
            //    _pt_outFlow = Convert.ToInt32(AppHandler.IgnoreDBNullString(roomTable.Rows[0]["Bookable_Spaces"].ToString()));
            //}
        }

        public DataTable ProductRecord(string product_Code)
        {
            return db.ReadTable("Product Record", String.Format("SELECT * FROM Products WHERE [Product Code]='{0}'", product_Code));
        }

        public bool NewProduct()
        {
            bool entryMade = false;
            string _userType = "";// Views.ASCX.ItemSetupAndListing.userType;

            string addEntryQuery = @"INSERT INTO Products ([Product_Name], [Category], [Selling_Price], [QtyOnHand], [Unit],[Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton])" +
                                   "OUTPUT INSERTED.ID, '" + _qtyOnHand + "', '" + _qtyOnHand + "', '', 'New Stock - PVNo:[Openning Stock]', '" + DateTime.Now + "', '" + DateTime.Now.Year + "' INTO Products_Trans ([ProductID], [QtyonHand],  [In Flow], [Out Flow],[Description],  [Date], [Year]) " +
                "VALUES('" + _productName + "','" + _category + "','" + _sellingPrice + "','" + _qtyOnHand + "','" + _unit + "','" + _unitCost + "','" + _lastPurchasePrice + "','" + _productCode + "','" + _minQty + "','" + _company + "','" + _pcsPerCarton + "')";


            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }
        public bool NewProduct(string warehouseID, string lowerBound, string midBound, string upperbound)
        {
            bool entryMade = false;
            string _userType = "";// Views.ASCX.ItemSetupAndListing.userType; 
            string addEntryQuery = @"INSERT INTO [WarehouseProducts] ([Product_Name], [Category], [Selling_Price], [QtyOnHand], [Unit],[Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], WAREHOUSEID,UpperBound,MidBound,LowerBound)" +
                                   "OUTPUT INSERTED.ID, '" + _qtyOnHand + "', '" + _qtyOnHand + "', '', 'Initializing New Stock', '" + DateTime.Now + "', '" + DateTime.Now.Year + "','" + warehouseID + "' INTO Warehouse_Products_Trans ([ProductID], [QtyonHand],  [In Flow], [Out Flow],[Description],  [Date], [Year], WAREHOUSEID) " +
                "VALUES('" + _productName + "','" + _category + "','" + _sellingPrice + "','" + _qtyOnHand + "','" + _unit + "','" + _unitCost + "','" + _lastPurchasePrice + "','" + _productCode + "','" + _minQty + "','" + _company + "','" + _pcsPerCarton + "','"+warehouseID+ "','" + upperbound + "','" + midBound + "','" + lowerBound + "')";


            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }

        public bool NewRetailProduct(float updatedQty)
        {
            bool entryMade = false;
            //string addEntryQuery = @"INSERT INTO Products ([Product_Name], [Category], [Selling_Price], [QtyOnHand], [Unit],[Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton])" +
            //                        "VALUES('" + _productName + "','" + _category + "','" + _sellingPrice + "','" + _qtyOnHand + "','" + _unit + "','" + _unitCost + "','" + _lastPurchasePrice + "','" + _productCode + "','" + _minQty + "','" + _company + "','" + _pcsPerCarton + "');";

            string addEntryQuery = @"INSERT INTO Products ([Product_Name], [Category], [Selling_Price], [QtyOnHand], [Unit],[Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton])" +
                                  "OUTPUT INSERTED.ID, '" + _qtyOnHand + "', '" + _qtyOnHand + "', '', 'New Stock - PVNo:[Openning Stock]', '" + DateTime.Now + "', '" + DateTime.Now.Year + "' INTO Products_Trans ([ProductID], [QtyonHand],  [In Flow], [Out Flow],[Description],  [Date], [Year]) " +
                "VALUES('" + _productName + "','" + _category + "','" + _sellingPrice + "','" + _qtyOnHand + "','" + _unit + "','" + _unitCost + "','" + _lastPurchasePrice + "','" + _productCode + "','" + _minQty + "','" + _company + "','" + _pcsPerCarton + "');";


            string updateProductQuery = "Update Products set [QtyOnHand] = '" + updatedQty + "' where ID = '" + _id + "'";
            entryMade = db.ExecuteQuery(addEntryQuery + updateProductQuery);
            return entryMade;
        }

        public bool Update(int product_id)
        {
            string query = "UPDATE WarehouseProducts SET [Product_Name] ='" + _productName +
                            "', [Category] ='" + _category +
                            "', [Selling_Price] ='" + Selling_Price +
                           // "', [QtyOnHand] ='" + QtyOnHand +
                            "', [Unit] ='" + Unit +
                            "', [Unit Cost] ='" + UnitCost +
                            "', [LastPurchasedPrice] ='" + _lastPurchasePrice +
                            "', [Product Code] ='" + _productCode +
                            "', [MinQty] ='" + _minQty +
                            "', [PCsPerCarton] ='" + _pcsPerCarton +
                            "', [Company] ='" + _company +
                            "' WHERE [ID]='" + product_id + "'";
            return db.ExecuteQuery(query);
        }

        public bool Exists(string productCode)
        {
            return db.ReadData("SELECT Product_Name FROM Products WHERE [Product Code]='" + productCode + "'") != string.Empty;
        }

        public DataTable GetAllProducts()
        {
            string query = "SELECT * FROM Products";
            return new DB().ReadTable("Products", query);
        }

        //Properties
        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Product_Name
        {
            get { return _productName; }
            set { _productName = value; }
        }

        public string Category
        {
            get { return _category; }
            set { _category = value; }
        }

        public float Selling_Price
        {
            get { return _sellingPrice; }
            set { _sellingPrice = value; }
        }

        public double QtyOnHand
        {
            get { return _qtyOnHand; }
            set { _qtyOnHand = value; }
        }

        public string Unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        public float UnitCost
        {
            get { return _unitCost; }
            set { _unitCost = value; }
        }
        public float LastPurchasePrice
        {
            get { return _lastPurchasePrice; }
            set { _lastPurchasePrice = value; }
        }
        public string ProductCode
        {
            get { return _productCode; }
            set { _productCode = value; }
        }
        public double PCsPerCarton
        {
            get { return _pcsPerCarton; }
            set { _pcsPerCarton = value; }
        }

        public double MinQty
        {
            get { return _minQty; }
            set { _minQty = value; }
        }
        public string Company
        {
            get { return _company; }
            set { _company = value; }
        }

        public string CompanyID
        {
            get { return _companyId; }
            set { _companyId = value; }
        }
    }
}