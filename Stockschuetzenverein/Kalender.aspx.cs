using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

namespace Stockschuetzenverein
{
    public partial class Kalender : System.Web.UI.Page
    {
        DataTable AppointmentList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Calendar calendar = new Calendar();
            }
            AppointmentList = GetAppointments();

           
            
            

        }
        
        void AddTermin(string terminText,DateTime datum)
        {
            


        }
        private DataTable GetAppointments()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Date");
            dt.Columns.Add("Desc");
            dt.Rows.Add("01/November/2022", "party time");
            dt.Rows.Add("23/November/2022", "fuck swp");
         


            return dt;
        }

        protected void calendar_1_SelectionChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "openWin", "window.open('Kalender.aspx','_blank');", true);
        }
        protected void calendar_1_DayRender(object sender, DayRenderEventArgs e)
        {
            DataTable dt = GetAppointments();

            foreach(DataRow row in dt.Rows)
            {
                if(Convert.ToDateTime(e.Day.Date) == Convert.ToDateTime(row["Date"]))
                {
                    e.Cell.Controls.Add(new Label { Text = "<br/" });
                    e.Cell.Controls.Add(new Label { Text = row["Desc"].ToString() });
                }
            }

            
        }


    }
}