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
           for(int i = 0; i < rblTermine.Items.Count; i++)
            {
                rblTermine.Items[i].Text = $"{dt.Rows[i].ItemArray[1]} <br> {dt.Rows[i].ItemArray[2]} - {dt.Rows[i].ItemArray[3]} <br> {dt.Rows[i].ItemArray[4]}";
            }
            
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
    }
}