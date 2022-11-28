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
using System.Web.Configuration;
using System.Data.Odbc;

namespace Stockschuetzenverein
{
    public partial class Kalender : System.Web.UI.Page
    {
        // Datenbankdaten, alles auf mein Nacken Jungs - Lugas
        string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        //string connStrg = WebConfigurationManager.ConnectionStrings["AppDbExt"].ConnectionString;

       
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Panel.Visible = false;
            OKButton.Visible = false;

            // Ein kleiner test für dynamisches Label und Tabelle
            Label guteLabel = new Label();
            guteLabel.Text = "<br>Hi was geht?";
            

            Panel.Controls.Add(guteLabel);
            
            
            

            if (!IsPostBack)
            {
                Calendar calendar = new Calendar();
                //Try2Connect();
            }
             DataTable dt = GetAppointments();

        }

        private void Try2Connect()
        {

            OdbcConnection conn = new OdbcConnection(connStrg);
            try
            {
                conn.Open();
                //lbConnection.Text = "db connection ok";
            }
            catch (Exception ex)
            {
                //lbConnection.Text = "cannot connect to database: " + ex.Message;
            }
            finally
            {
                conn.Close();
            }
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
            dt.Rows.Add("23/November/2022", "I luv swp");
            


            return dt;
        }

        protected void calendar_1_SelectionChanged(object sender, EventArgs e)
        {
            Panel.Visible = true;
            if(Panel.Visible == true)
            {
                calendar_1.Enabled = false;
            }
            OKButton.Visible = true;
        }
        protected void calendar_1_DayRender(object sender, DayRenderEventArgs e)
        {

            //DataTable dt = GetAppointments();

            //foreach(DataRow row in dt.Rows)
            //{
            //    if(Convert.ToDateTime(e.Day.Date) == Convert.ToDateTime(row["Date"]))
            //    {
            //        e.Cell.Controls.Add(new Label { Text = "<br/" });
            //        e.Cell.Controls.Add(new Label { Text = row["Desc"].ToString() });
            //    }
            //}

            
        }

        protected void OKButton_Click(object sender, EventArgs e)
        {
            Panel.Visible = false;
            OKButton.Visible = false;
            calendar_1.Enabled = true;
        }
    }
}