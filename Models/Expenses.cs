using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Expenses
    {
        public string DBError;
        DB db = new DB();
         
        /// <summary>
        /// Chart of Expenses
        /// </summary>
        private int _expenseId;
        private DateTime _date;
        private string _pvNo;
        private int _vendorId;
        private string _vendor;
        private string _account;
        private float _amount;
        private string _description;
        private string _modeofPayment;
        private string _checqueNo;
        private string _paymentAccount;
        public Expenses()
        {
            //
            // TODO: Add constructor logic here
            //
        }
         
        public bool New()
        {
            bool entryMade = false;
            string addEntryQuery = @"INSERT INTO Expenses ([Date], [PVNo], [VendorID], [Vendor],[Account], [Amount], [Description], [ModeOfPayment], [ChequeNo], [PaymentAccount])" +
                                    "VALUES('" + _date + "','" + _pvNo + "','" + _vendorId + "','" + _vendor + "','" + _account + "','" + _amount + "','" + _description + "','" + _modeofPayment + "','" + _checqueNo + "','" + _paymentAccount + "')";

            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }

        public bool Update()
        {
            string query = "UPDATE Expenses SET [PVNo] ='" + _pvNo +
                            "', [VendorID] ='" + _vendorId +
                            "', [Vendor] ='" + _vendor +
                            "', [Account] ='" + _account +
                            "', [Amount] ='" + _amount +
                            "', [Description] ='" + _description +
                            "', [ModeOfPayment] ='" + _modeofPayment +
                            "', [ChequeNo] ='" + _checqueNo +
                            "', [PaymentAccount] ='" + _paymentAccount +
                            "' WHERE [ExpenseId]='" + _expenseId + "'";
            return db.ExecuteQuery(query);
        }

        public bool Exists(string pvNo)
        {
            return db.ReadData("SELECT Date FROM Expenses WHERE [PVNo]='" + pvNo + "'") != string.Empty;
        }

        public int ExpenseId
        {
            get { return _expenseId; }
            set { _expenseId = value; }
        }

        public DateTime Date
        {
            get { return _date; }
            set { _date = value; }
        }
        public string PVNo
        {
            get { return _pvNo; }
            set { _pvNo = value; }
        }
        public int VendorID
        {
            get { return _vendorId; }
            set { _vendorId = value; }
        }
        public string Vendor
        {
            get { return _vendor; }
            set { _vendor = value; }
        }

        public string Account
        {
            get { return _account; }
            set { _account = value; }
        }
        public float Amount
        {
            get { return _amount; }
            set { _amount = value; }
        }
        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }
        public string ModeOfPayment
        {
            get { return _modeofPayment; }
            set { _modeofPayment = value; }
        }

        public string ChequeNo
        {
            get { return _checqueNo; }
            set { _checqueNo = value; }
        }
        public string PaymentAccount
        {
            get { return _paymentAccount; }
            set { _paymentAccount = value; }
        }
    }
}