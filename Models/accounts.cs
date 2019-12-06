using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class Accounts
    {
        public string DBError;
        DB db = new DB();
         
        /// <summary>
        /// Chart of Accounts
        /// </summary>
        private int _accountId;
        private string _accountNo;
        private string _accountName;
        private string _accountType;
        private string _parentAccount;
        private string _normalBalance;
        public Accounts()
        {
            //
            // TODO: Add constructor logic here
            //
        }
         
        public bool New()
        {
            bool entryMade = false;
            string addEntryQuery = @"INSERT INTO ChartofAccounts ([AccountNo], [AccountName], [AccountType],[ParentAccount], [NormalBalance])" +
                                    "VALUES('" + _accountNo + "','" + _accountName + "','" + _accountType + "','" + _parentAccount + "','" + _normalBalance + "')";

            entryMade = db.ExecuteQuery(addEntryQuery);
            return entryMade;
        }

        public bool Update()
        {
            string query = "UPDATE ChartOfAccounts SET [AccountNo] ='" + _accountNo +
                            "', [AccountName] ='" + _accountName +
                            "', [AccountType] ='" + _accountType +
                            "', [ParentAccount] ='" + _parentAccount +
                            "', [NormalBalance] ='" + _normalBalance +
                            "' WHERE [AccountID]='" + _accountId + "'";
            return db.ExecuteQuery(query);
        }

        public bool Exists(string accountNo)
        {
            return db.ReadData("SELECT AccountName FROM ChartOfAccounts WHERE [AccountNo]='" + accountNo + "'") != string.Empty;
        }

        public int AccountID
        {
            get { return _accountId; }
            set { _accountId = value; }
        }

        public string AccountNo
        {
            get { return _accountNo; }
            set { _accountNo = value; }
        }

        public string AccountName
        {
            get { return _accountName; }
            set { _accountName = value; }
        }

        public string AccountType
        {
            get { return _accountType; }
            set { _accountType = value; }
        }
        
        public string NormalBalance
        {
            get { return _normalBalance; }
            set { _normalBalance = value; }
        }
        public string ParentAccount
        {
            get { return _parentAccount; }
            set { _parentAccount = value; }
        }
      
    }
}