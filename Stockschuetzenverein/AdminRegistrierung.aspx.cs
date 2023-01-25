using DataBaseWrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stockschuetzenverein
{
    public partial class AdminRegistrierung : System.Web.UI.Page
    {
        static string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        DataBase db = new DataBase(connStrg);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text;
            string password = txt_password.Text;
            string email = txt_email.Text;            
            int isAdmin = 1;
            string salt = Passwort.CreateSalt();
            string hash = Passwort.CreatePasswordHash(password, salt);

            try
            {
                string sql = $"INSERT INTO ssv_user (Username,Password,Salt,Email,IsAdmin) VALUES ('{username}','{hash}','{salt}','{email}','{isAdmin}')";
                db.RunQuery(sql);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            
            
        }
    }
}