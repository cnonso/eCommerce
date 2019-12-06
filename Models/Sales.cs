using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace eCommerceTemplate.Models
{
    public class Sales
    {
        private SqlConnection serverConnector = new SqlConnection();
        public string DBError;
        DB db = new DB();


        /// <summary>
        /// Products_Trans (_pt) Initializers
        /// </summary>
        private int _id;
        private int _productId;
        private double _qtyOnHand;
        private string _description;
        private double _outFlow;
        private DateTime _date;
        private string _year;

        /// <summary>
        /// Unique for Sales Register
        /// </summary>
        private string _productName;
        private double _qty;
        private string _unit;
        private double _amount;
        private double _unitCost;
        private double _profit;
        private double _unitPrice;
        private string _receiptNo;
        private double _discount;
        private double _total;

        /// <summary>
        /// Unique for Sales Summary [Sales Transaction]
        /// </summary>
        private string _customerName;
        private string _customerId;
        private double _summaryTotal;
        private double _summaryDiscount;
        private double _summaryTotalAmount;
        private double _summaryAmountPaid;
        private double _paidLater;
        private double _balance;
        private string _userType;

        public Sales()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public Sales(int id)
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

        public DataTable CartRecord(string transaction_Id)
        {
            return db.ReadTable("Cart Record", String.Format("SELECT * FROM Cart WHERE Transaction_Id='{0}'", transaction_Id));
        }

        public bool MakeEntry()
        {
            bool entryMade = false;
            string addEntryQuery = @"INSERT INTO Products_Trans ([ProductID], [QtyonHand], [Description], [Out Flow], [Date], [Year])" +
                                    "VALUES('" + _productId + "','" + _qtyOnHand + "','" + _description + "','" + _outFlow + "','" + _date + "','" + _year + "')";

            double newQty = _qtyOnHand - _outFlow;
            string updateStockQuery = "UPDATE Products SET [QtyonHand]='" + newQty + "' WHERE ID='" + _productId + "'";

            entryMade = db.ExecuteQuery(addEntryQuery + updateStockQuery);
            return entryMade;
        }

        public bool SalesRegister()
        {
            bool registerSale = false;
            string registerSaleQuery = @"INSERT INTO SalesRegister ([Product], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total],[Date])" +
                                    "VALUES('" + _productName + "','" + _qty + "','" + _productId + "','" + _unit + "','" + _unitPrice + "','" + _amount + "','" + _receiptNo + "','" + _unitCost + "','" + _profit + "','" + _discount + "','" + _total + "','" + _date + "')";

            registerSale = db.ExecuteQuery(registerSaleQuery);
            return registerSale;
        }

        public bool SalesSummary()
        {
            bool salesSummarised = false;
            string saleSummaryQuery = @"INSERT INTO Sales_Transactions ([Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [Total Amount], [Amount Paid], [Paid Later], [Balance], [Date],[UserType])" +
                                    "VALUES('" + _customerName + "','" + _customerId + "','" + _receiptNo + "','" + _summaryTotal + "','" + _summaryDiscount + "','" + _summaryTotalAmount + "','" + _summaryAmountPaid + "','" + _paidLater + "','" + _balance + "','" + _date + "','" + _userType + "')";

            salesSummarised = db.ExecuteQuery(saleSummaryQuery);
            return salesSummarised;
        }

        public DataTable GetAllSalesEntries()
        {
            string query = "SELECT * FROM Products_Trans";
            return ReadTable("Sales Entries", query);
        }


        public DataTable ReadTable(string tableName)
        {
            DataTable tableData = new DataTable(tableName);
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return tableData;
            }
            SqlCommand sqlCmd = new SqlCommand("SELECT * FROM " + tableName + "", serverConnector);
            tableData.Load(sqlCmd.ExecuteReader());
            serverConnector.Close();
            return tableData;
        }

        public DataTable ReadTable(string tableName, string customQuery)
        {
            DataTable tableData = new DataTable(tableName);
            try
            {
                serverConnector.Open();
            }
            catch (Exception ex)
            {
                DBError = ex.Message;
                return tableData;
            }
            SqlCommand sqlCmd = new SqlCommand(customQuery, serverConnector);
            tableData.Load(sqlCmd.ExecuteReader());
            serverConnector.Close();
            return tableData;
        }

        public DataTable RecordAnalysis()
        {
            string resultQuery = "SELECT * FROM Tbl_TransactionRecords";
            string[] columnHeader = { "No", "Room No.", "No. of Times Booked" };
            DataTable results = db.ReadTable("Results", resultQuery);
            DataTable analysis = new DataTable("Analysis");
            foreach (string ch in columnHeader)
                analysis.Columns.Add(ch);

            DataTable rmNos = results.DefaultView.ToTable(true, "Room_No");
            int t = 0;
            foreach (DataRow dr in rmNos.Rows)
            {
                DataRow analysisRow = analysis.NewRow();
                analysisRow["No"] = ++t;
                analysisRow["Room No."] = dr["Room_No"].ToString();
                analysisRow["No. of Times Booked"] = results.Select("TransactingStatus='Booked' AND Room_No='" + dr["Room_No"] + "'").Length;

                analysis.Rows.Add(analysisRow);
            }
            return analysis;
        }

        public DataTable TransactionsAnalysis()
        {
            string resultQuery = "SELECT bu.Room_No, bu.TransactingStatus, tr.Room_No, bu.Status FROM Tbl_Bookable_Units bu left join TransactionRecords tr ON bu.Room_No=tr.Room_No WHERE bd.Status <> 'Vacated'";
            string[] columnHeader = { "No", "Room No.", "No. of Times Booked" };
            DataTable results = db.ReadTable("Results", resultQuery);
            DataTable analysis = new DataTable("Analysis");
            foreach (string ch in columnHeader)
                analysis.Columns.Add(ch);

            DataTable rmNos = results.DefaultView.ToTable(true, "Room_No");
            int t = 0;
            foreach (DataRow dr in rmNos.Rows)
            {
                DataRow analysisRow = analysis.NewRow();
                analysisRow["No"] = ++t;
                analysisRow["Room No."] = dr["Room_No"].ToString();
                analysisRow["No. of Times Booked"] = results.Select("TransactingStatus='Booked' AND Room_No='" + dr["Room_No"] + "'").Length;

                analysis.Rows.Add(analysisRow);
            }
            return analysis;
        }

        //Properties
        public int ID
        {
            get { return _id; }
        }

        public int ProductID
        {
            get { return _productId; }
            set { _productId = value; }
        }

        public double QtyOnHand
        {
            get { return _qtyOnHand; }
            set { _qtyOnHand = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public double OutFlow
        {
            get { return _outFlow; }
            set { _outFlow = value; }
        }

        public DateTime Date
        {
            get { return _date; }
            set { _date = value; }
        }
        public string Year
        {
            get { return _year; }
            set { _year = value; }
        }

        public string ProductName
        {
            get { return _productName; }
            set { _productName = value; }
        }

        public double Qty
        {
            get { return _qty; }
            set { _qty = value; }
        }
        public string Unit
        {
            get { return _unit; }
            set { _unit = value; }
        }
        public double Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }
        public double UnitCost
        {
            get { return _unitCost; }
            set { _unitCost = value; }
        }
        public double Profit
        {
            get { return _profit; }
            set { _profit = value; }
        }

        /// <summary>
        /// Unique for Sales Register
        /// </summary>
        public double UnitPrice
        {
            get { return _unitPrice; }
            set { _unitPrice = value; }
        }
        public string ReceiptNo
        {
            get { return _receiptNo; }
            set { _receiptNo = value; }
        }
        public double Discount
        {
            get { return _discount; }
            set { _discount = value; }
        }
        public double Total
        {
            get { return _total; }
            set { _total = value; }
        }

        /// <summary>
        /// Unique for Sales Summary [Sales Transaction]
        /// </summary>
        public string CustomerName
        {
            get { return _customerName; }
            set { _customerName = value; }
        }
        public string CustomerID
        {
            get { return _customerId; }
            set { _customerId = value; }
        }
        public double SummaryTotal
        {
            get { return _summaryTotal; }
            set { _summaryTotal = value; }
        }
        public double SummaryDiscount
        {
            get { return _summaryDiscount; }
            set { _summaryDiscount = value; }
        }
        public double SummaryTotalAmount
        {
            get { return _summaryTotalAmount; }
            set { _summaryTotalAmount = value; }
        }
        public double SummaryAmountPaid
        {
            get { return _summaryAmountPaid; }
            set { _summaryAmountPaid = value; }
        }
        public double PaidLater
        {
            get { return _paidLater; }
            set { _paidLater = value; }
        }
        public double Balance
        {
            get { return _balance; }
            set { _balance = value; }
        }
        public string UserType
        {
            get { return _userType; }
            set { _userType = value; }
        }

        internal DataTable GetAllSales()
        {
            throw new NotImplementedException();
        }
    }
}