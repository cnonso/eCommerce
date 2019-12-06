using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace eCommerceTemplate.Models
{

    /// <summary>
    /// Summary description for Admin
    /// </summary>
    public class User
    {
        private int _id;
        private string _name;
        private string _phone;
        private string _email;
        private string _username;
        private string _password;
        private string _usertype;
        private short _status;
        private int _logs;
        private DateTime _date_added;
        private string _image_url;
        private int _firm_id;
        private int _role_id;
        private bool _exists;

        public string ExecutionError = "";

        DB db = new DB();
        public User()
        {

        }

        public User(string user)
        {
            _username = user;
            DataTable userTable = db.ReadTable("Users", String.Format("SELECT * FROM Users WHERE Username='{0}'", _username));
            if (userTable.Rows.Count > 0)
            {
                _id = AppHandler.ToInt(userTable.Rows[0]["UserID"]);
                _name = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Name"]);
                _phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Phone"]);
                _email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Email"]);
                _username = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Username"]);
                _password = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Password"]);
                _usertype = AppHandler.IgnoreDBNullString(userTable.Rows[0]["UserType"]);
                _status = (short)AppHandler.ToInt(userTable.Rows[0]["Status"]);
                _logs = AppHandler.ToInt(userTable.Rows[0]["Logs"]);
                _date_added = AppHandler.ToDateTime(userTable.Rows[0]["DateAdded"].ToString());
                _firm_id = AppHandler.ToInt(userTable.Rows[0]["FirmID"]);
                _role_id = AppHandler.ToInt(userTable.Rows[0]["RoleID"]);
                _exists = true;

                //if (System.IO.File.Exists("~/Admin/Passports/" + _username + ".jpg"))
                //    _image_url = "~/Admin/Passports/" + _username + ".jpg";
                //else
                //    _image_url = "~/images/avater.png";
            }
        }

        public User(string user, string pswd)
        {
            _username = user;
            _password = pswd;
            db.DBError = "";
            ExecutionError = "";
            DataTable userTable = db.ReadTable("Users", String.Format("SELECT DISTINCT * FROM Users WHERE Username='{0}' AND Password='{1}'", _username, AppHandler.Sha1(_password)));
            if (userTable.Rows.Count > 0)
            {
                _id = AppHandler.ToInt(userTable.Rows[0]["UserID"]);
                _name = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Name"]);
                _phone = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Phone"]);
                _email = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Email"]);
                _username = AppHandler.IgnoreDBNullString(userTable.Rows[0]["Username"]);
                _usertype = AppHandler.IgnoreDBNullString(userTable.Rows[0]["UserType"]);
                _status = (short)AppHandler.ToInt(userTable.Rows[0]["Status"]);
                _logs = AppHandler.ToInt(userTable.Rows[0]["Logs"]);
                _date_added = AppHandler.ToDateTime(userTable.Rows[0]["DateAdded"].ToString());
                _firm_id = AppHandler.ToInt(userTable.Rows[0]["FirmID"]);
                _role_id = AppHandler.ToInt(userTable.Rows[0]["RoleID"]);
                _exists = true;
            }
            else if (db.DBError.Length > 0)
            {
                ExecutionError = db.DBError;
            }
        }
        //Methods
        public bool Add()
        {
            string strQuery = String.Format("INSERT INTO [Users]([Name],[Phone],[Email],[Username],[Password],[UserType],[Status],[Logs],[DateAdded]) " +
            "VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', 0, 0, '{6}')", _name, _phone, _email, _username, AppHandler.Sha1(_password), _usertype, _date_added);
            try
            {
                return db.ExecuteQuery(strQuery);
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
            }
            return false;
        }

        public bool ChangePassword(string pswd)
        {
            return db.ExecuteQuery("UPDATE Users SET Password='" + AppHandler.Sha1(pswd) + "' WHERE Username='" + _username + "'");
        }

        public bool DoLogin()
        {
            bool loggedIn = false;
            try
            {
                DataTable userTable = db.ReadTable("Users", String.Format("SELECT Name FROM Users WHERE Username='{0}' AND Password='{1}'", _username, AppHandler.Sha1(_password)));
                loggedIn = userTable.Rows.Count > 0;
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
            }
            return loggedIn;
        }

        public void UpdateLogin(string logType = "login")
        {
            string strQuery = String.Format("UPDATE [Users] SET [Status]=1, Logs=Logs+1 WHERE [Username]='{0}'", _username);
            if (logType != "login") strQuery = String.Format("UPDATE [Users] SET [Status]=0 WHERE [Username]='{0}'", _username);
            try
            {
                db.ExecuteQuery(strQuery);
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
            }
        }

        public bool Delete()
        {
            try
            {
                db.ExecuteQuery("DELETE FROM [Users] WHERE [Username]='" + _username + "'");
            }
            catch (Exception ex)
            {
                ExecutionError = ex.Message;
                return false;
            }
            return true;
        }

        //'Properties
        public int ID
        {
            get
            {
                return _id;
            }
        }

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }

        public string Phone
        {
            get
            {
                return _phone;
            }
            set
            {
                _phone = value;
            }
        }

        public string Email
        {
            get
            {
                return _email;
            }
            set
            {
                _email = value;
            }
        }

        public string Username
        {
            get
            {
                return _username;
            }
            set
            {
                _username = value;
            }
        }

        public string Password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
            }
        }

        public string UserType
        {
            get
            {
                return _usertype;
            }
            set
            {
                _usertype = value;
            }
        }

        public short Status
        {
            get
            {
                return _status;
            }
            set
            {
                _status = value;
            }
        }

        public int Logs
        {
            get
            {
                return _logs;
            }
            set
            {
                _logs = value;
            }
        }

        public DateTime DateAdded
        {
            get
            {
                return _date_added;
            }
            set
            {
                _date_added = value;
            }
        }

        public string ImageUrl
        {
            get
            {
                return _image_url;
            }
            set
            {
                _image_url = value;
            }
        }

        public bool Exists
        {
            get
            {
                return _exists;
            }
        }

        public int RoleID
        {
            get { return _role_id; }
            set { _role_id = value; }
        }

        public int FirmID
        {
            get { return _firm_id; }
            set { _firm_id = value; }
        }

        public UserRole Role
        {
            get
            {
                if (_role_id == 1)
                    return UserRole.Principal;
                else if (_role_id == 2)
                    return UserRole.Dean;
                else if (_role_id == 3)
                    return UserRole.VPAcademics;
                else if (_role_id == 4)
                    return UserRole.VPSpecialDuties;
                else if (_role_id == 5)
                    return UserRole.ExamOfficer;
                else if (_role_id == 6)
                    return UserRole.Teacher;
                else if (_role_id == 7)
                    return UserRole.Administration;
                else if (_role_id == 8)
                    return UserRole.Bursar;
                return UserRole.None;
            }
        }

        public enum UserRole
        {
            Principal,
            Dean,
            VPAcademics,
            VPSpecialDuties,
            ExamOfficer,
            Teacher,
            Administration,
            Bursar,
            None
        }
    }
}