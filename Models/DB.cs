using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{
    public class DB
    {
        public string DBError = string.Empty;
        private static string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); // connection string
        SqlConnection sqlCon = new SqlConnection(constr);
        public DB()
        {
        }

        public bool ExecuteQuery(string query)
        {
            bool executed = false;
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; return false; }
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            executed = sqlCmd.ExecuteNonQuery() > 0;
            CloseConnection();
            return executed;
        }

        public bool DataExists(string query)
        {
            bool _exists = false;
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; return false; }
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            SqlDataReader sdr = sqlCmd.ExecuteReader();
            if (sdr.Read())
                _exists = true;
            sdr.Close();
            CloseConnection();
            return _exists;
        }

        public string ReadData(string strQuery)
        {
            string data = "";
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; return ""; }
            SqlCommand sqlCmd = new SqlCommand(strQuery, sqlCon);
            SqlDataReader sdr = sqlCmd.ExecuteReader();
            if(sdr.Read())
            {
                data = sdr.GetValue(0).ToString();
            }
            sdr.Close();
            CloseConnection();
            return data;
        }

        public DataTable ReadTable(string table)
        {
            DataTable thisTable = new DataTable(table);
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; return thisTable; }
            SqlCommand sqlCmd = new SqlCommand("SELECT * FROM " + table, sqlCon);
            thisTable.Load(sqlCmd.ExecuteReader());
            CloseConnection();
            return thisTable;
        }

        public DataTable ReadTable(string table, string customQuery)
        {
            DataTable thisTable = new DataTable(table);
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; return thisTable; }
            SqlCommand sqlCmd = new SqlCommand(customQuery, sqlCon);
            thisTable.Load(sqlCmd.ExecuteReader());
            CloseConnection();
            return thisTable;
        }

        public int GetLastID(string table)
        {
            int id = 0;
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; }
            string idQuery = "SELECT TOP 1 Id FROM " + table + " ORDER BY Id DESC;";
            using (SqlCommand findID = new SqlCommand(idQuery, sqlCon))
            {
                id = (int)findID.ExecuteScalar();
            }
            return id;
        }

        public void StopBatchExecution()
        {
            try
            {
                sqlCon.Close();
            }
            catch (Exception ex) { }
        }

        public int GetUserID(string table, string username)
        {
            int id = 0;
            try
            {
                sqlCon.Open();
            }
            catch (Exception ex) { DBError = ex.Message; }
            string idQuery = "Select Id FROM " + table + " WHERE Username = '" + username + "'";
            using (SqlCommand findID = new SqlCommand(idQuery, sqlCon))
            {
                id = (int)findID.ExecuteScalar();
            }
            return id;
        }

        public string IgnorDBNull(object obj)
        {
            try
            {
                return Convert.ToString(obj);
            }
            catch (Exception ex) { }
            return "";
        }

        public int IgnorIntCast(object obj)
        {
            try
            {
                return Convert.ToInt32(obj);
            }
            catch (Exception ex) { }
            return 0;
        }

        public string IgnorStringCastToInt(string str)
        {
            try
            {
                return Convert.ToInt32(str).ToString();
            }
            catch (Exception ex) { }
            return str;
        }

        public void CloseConnection()
        {
            try
            {
                sqlCon.Close();
            }
            catch (Exception ex) { }
        }
    }
}