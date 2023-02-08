using DataBaseWrapper;
using System;
using System.Collections.Generic;
using System.Data;
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

            if(username == string.Empty || password == string.Empty)
            {
                lbl_error.Text = "Please enter Password and Username";
                lbl_error.Visible = true;
            }
            string sql = $"SELECT * FROM ssv_user WHERE Username LIKE('{username}')";
            DataTable dt = db.RunQuery(sql);
            List<string> list = new List<string>();

            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {

                    list.Add((string)dt.Rows[0][i]);

                }

                if (username == list[1])
                {
                    lbl_error.Text = "Username already used";
                    lbl_error.Visible = true;
                }
            }

            try
            {
                sql = $"INSERT INTO ssv_user (Username,Password,Salt,Email,IsAdmin) VALUES ('{username}','{hash}','{salt}','{email}','{isAdmin}')";
                db.RunQuery(sql);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }


            Response.Redirect("/AdminLogin.aspx");
        }
    }
}