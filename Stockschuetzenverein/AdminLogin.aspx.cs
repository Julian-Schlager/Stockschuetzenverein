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
    public partial class AdminLogin : System.Web.UI.Page
    {
        static string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        DataBase db = new DataBase(connStrg);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text;
            string password = txt_password.Text;

            string sql = $"SELECT * FROM ssv_user WHERE Username LIKE('{username}')";
            DataTable dt = db.RunQuery(sql);
            List<string> list = new List<string>();

            if(dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    list.Add(dt.Rows[0][i].ToString());
                }
            }
            else
            {
                lbl_error.Text = "Wrong Username or Password. Please Try again. ";
            }

            string newHash = Passwort.CreatePasswordHash(password, list[3]);

            if(username == list[1] && newHash == list[2])
            {
                Response.Redirect("/Kalender.aspx");
            }
            else
            {
                lbl_error.Text = "Wrong Username or Password. Please Try again.";
                lbl_error.Visible = true;
            }
        }
    }
}