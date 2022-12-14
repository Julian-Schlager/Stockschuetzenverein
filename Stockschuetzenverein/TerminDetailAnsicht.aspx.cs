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
    public partial class TerminDetailAnsicht : System.Web.UI.Page
    {
        static string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        //string connStrg = WebConfigurationManager.ConnectionStrings["AppDbExt"].ConnectionString;
        DataBase db = new DataBase(connStrg);

        protected void Page_Load(object sender, EventArgs e)
        {

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