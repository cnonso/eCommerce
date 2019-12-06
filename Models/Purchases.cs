using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Purchases
    { 
        public string DBError;
        DB db = new DB();
         
        /// <summary>
        /// Unique for Purchase Register
        /// </summary>
        private int _id;
        private int _productId;
        private string _productName;
        private double _qty;
        private string _unit;
        private double _unitCost;
        private string _companyId;
        private string _companyName;
        private double _amount;
        private string _journalNo;
        private string _pvNo;
        private string _purchaseStatus;
        private DateTime _date;
        private string _userType;
         
          

        /// <summary>
        /// Unique for Purchase Payments
        /// </summary>
        private string _paymentMode;
        private string _bank;
        private double _cashAtHand;
        private double _totalAmount;
        private double _summaryAmountPaid;
        private double _balance; 

        public Purchases()
        {
            //
            // TODO: Add constructor logic here
            //
        }
         
        public bool MakeEntry()
        {
            bool entryMade = false;

            double _qtyOnHand = double.Parse(new DB().ReadData("Select QtyOnHand from Products where ID = '" + _productId + "'"));
            double newQty = _qtyOnHand + _qty;
            string addToPurchasesQuery = @"INSERT INTO Purchases ([ProductID], [Product], [Qty], [Unit], [UnitCost], [CompanyID], [Company], [Amount], [JournalNo], [PVNo], [Date], [UserType], [PurchaseStatus])" +
                                    "VALUES('" + _productId + "','" + _productName + "','" + _qty + "','" + _unit + "','" + _unitCost + "','" + _companyId + "','" + _companyName + "','" + _amount + "','" + _journalNo + "','" + _pvNo + "','" + _date + "','" + _userType + "','" + _purchaseStatus + "');";

           
            string stockMovtQuery = @"INSERT INTO Products_Trans ([ProductID], [QtyonHand],  [In Flow], [Out Flow],[Description],  [Date], [Year])" +
                                    "VALUES('" + _productId + "','" + newQty + "','" + _qty + "','','New Stock - PVNo:[" + _pvNo + "]','" + _date + "','" + _date.Year + "');";

            //string updateStockQuery = "UPDATE Products SET [QtyonHand]='" + newQty + "' WHERE ID='" + _productId + "'";
            string updateStockQuery = "UPDATE Products SET [QtyonHand]='" + newQty + "', [Unit Cost]='" + _unitCost + "'  WHERE ID='" + _productId + "'";
            entryMade = db.ExecuteQuery(addToPurchasesQuery + updateStockQuery+ stockMovtQuery);
            return entryMade;
        }

        public bool PurchaseSummary()
        {
            bool registerPurchase = false;
            string addToPurchasesListingQuery = @"INSERT INTO Purchases_Listing ([CompanyID], [Company], [PVNo], [Total], [AmountPaid], [Balance], [JournalNo], [Date], [UserType])" +
                                    "VALUES('" + _companyId + "','" + _companyName + "','" + _pvNo + "','" + _totalAmount +"','" + _summaryAmountPaid + "','" + _balance + "','','" + _date + "','" + _userType + "');";

            registerPurchase = db.ExecuteQuery(addToPurchasesListingQuery);
            return registerPurchase;
        }

        //public bool SalesSummary()
        //{
        //    bool salesSummarised = false;
        //    string saleSummaryQuery = @"INSERT INTO Sales_Transactions ([Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [Total Amount], [Amount Paid], [Paid Later], [Balance], [Date],[UserType])" +
        //                            "VALUES('" + _companyName + "','" + _companyId + "','" + _pvNo + "','" + _summaryTotal + "','" + _summaryDiscount + "','" + _summaryTotalAmount + "','" + _summaryAmountPaid + "','" + _paidLater + "','" + _balance + "','" + _date + "','" + _userType + "');";

        //    string salesPaymentQuery = @"INSERT INTO Sales_Payment ([Customer Name], [CustomerID], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Details], [Date],[UserType])" +
        //                            "VALUES('" + _companyName + "','" + _companyId + "','" + _pvNo + "','" + _summaryTotalAmount + "','" + _cashAtHand + "','" + _bank + "','" + _paymentMode + "','" + _date + "','" + _userType + "')";
           
        //    salesSummarised = db.ExecuteQuery(saleSummaryQuery + salesPaymentQuery);
        //    return salesSummarised;
        //}

        //public bool RecordProductTransaction(string description)
        //{
        //    bool transactionRecorded = false;
        //     string productTransaction = @"INSERT INTO Products_Trans ([ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year])" +
        //                            "VALUES('" + ProductID + "','" + QtyOnHand + "','" + description + "','','" + OutFlow + "','" + Date + "','" + Date.Year + "')";

        //     transactionRecorded = db.ExecuteQuery(productTransaction);
        //    return transactionRecorded;
        //}
       

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
        public double UnitCost
        {
            get { return _unitCost; }
            set { _unitCost = value; }
        }

        public string CompanyID
        {
            get { return _companyId; }
            set { _companyId = value; }
        }

        public string CompanyName
        {
            get { return _companyName; }
            set { _companyName = value; }
        }

        public double Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }

        public string JournalNo
        {
            get { return _journalNo; }
            set { _journalNo = value; }
        }
        public string PVNo
        {
            get { return _pvNo; }
            set { _pvNo = value; }
        }

        public string PurchaseStatus
        {
            get { return _purchaseStatus; }
            set { _purchaseStatus = value; }
        }
        public DateTime Date
        {
            get { return _date; }
            set { _date = value; }
        }

        public string UserType
        {
            get { return _userType; }
            set { _userType = value; }
        }

        public double TotalAmount
        {
            get { return _totalAmount; }
            set { _totalAmount = value; }
        } 
        public double SummaryAmountPaid
        {
            get { return _summaryAmountPaid; }
            set { _summaryAmountPaid = value; }
        }

        public double Balance
        {
            get { return _balance; }
            set { _balance = value; }
        } 
        public string PaymentMode
        {
            get { return _paymentMode; }
            set { _paymentMode = value; }
        }
        public string Bank
        {
            get { return _bank; }
            set { _bank = value; }
        }

        public double CashAtHand
        {
            get { return _cashAtHand; }
            set { _cashAtHand = value; }
        }

      
    }
}