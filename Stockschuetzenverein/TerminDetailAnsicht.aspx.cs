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
    public partial class TerminDetailAnsicht : System.Web.UI.Page
    {
        static string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        //string connStrg = WebConfigurationManager.ConnectionStrings["AppDbExt"].ConnectionString;
        DataBase db = new DataBase(connStrg);

        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.Parse(Request.QueryString["datum"]);
            string sqlcmd = $"SELECT * FROM ssv_date WHERE DATE(DateFrom) LIKE '{dateTime.ToString("yyyy-MM-dd")}';";
            DataTable dt = db.RunQuery(sqlcmd);
            rblTermine.DataSource = dt;
            rblTermine.DataValueField = dt.Columns[0].ColumnName;
            rblTermine.DataBind();
            for (int i = 0; i < rblTermine.Items.Count; i++)
            {
                DateTime dateFrom = Convert.ToDateTime(dt.Rows[i].ItemArray[2]);
                DateTime dateTo = Convert.ToDateTime(dt.Rows[i].ItemArray[3]);
                rblTermine.Items[i].Text = $"{dt.Rows[i].ItemArray[1]} <br/> {dateFrom.ToString("dd-MM-yyyy")} - {dateTo.ToString("dd-MM-yyyyy")} <br>" +
                    $" {dateFrom.ToString("H:mm")} - {dateTo.ToString("H:mm")} <br/>{dt.Rows[i].ItemArray[4]} <br/> <br/>";
            }
            if (UserManager.IsLoggedIn)
            {
                btn_addPictures.Enabled = true;
                btn_deleteEntry.Enabled = true;
                btn_editEntry.Enabled = true;
            }
            if (UserManager.IsLoggedIn) btn_logInOut.Text = "Logout";
            else if (UserManager.IsLoggedIn == false) btn_logInOut.Text = "Login";
        }

        protected void btn_editEntry_Click(object sender, EventArgs e)
        {
            string sqlcmd = $"SELECT * FROM ssv_date WHERE DateID = {rblTermine.SelectedValue};";
        }

        protected void btn_home_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Kalender.aspx");
        }

        protected void btn_saveChanges_Click(object sender, EventArgs e)
        {
            string sqlCmd = "";
            db.RunNonQuery(sqlCmd);
        }

        protected void btn_deleteEntry_Click(object sender, EventArgs e)
        {

            if (rblTermine.SelectedIndex != -1)
            {
                string sqlcmd = $"DELETE FROM ssv_date WHERE DateID = {rblTermine.SelectedValue}";
                db.RunNonQuery(sqlcmd);
            }
        }

        protected void btn_logInOut_Click(object sender, EventArgs e)
        {
            if (UserManager.IsLoggedIn)
            {
                UserManager.IsLoggedIn = false;
                Response.Redirect("/Kalender.aspx");
            }
            else if (UserManager.IsLoggedIn == false)
            {
                Response.Redirect("/AdminLogin.aspx");
            }
        }
    }
}