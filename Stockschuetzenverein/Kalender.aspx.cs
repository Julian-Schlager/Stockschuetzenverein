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
using DataBaseWrapper;
using System.Globalization;

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
            //Label guteLabel = new Label();
            //guteLabel.Text = "<br>Hi was geht?";
            //Panel.Controls.Add(guteLabel);

            DataTable Ldt = new DataTable();
            Ldt.Columns.Add("Name");
            Ldt.Columns.Add("Zeit");
            Ldt.Rows.Add("Test", "11:55");
            FillPanelWithDate(Ldt);
            
            
            

            if (!IsPostBack)
            {
                System.Web.UI.WebControls.Calendar calendar = new System.Web.UI.WebControls.Calendar();
                //Try2Connect();
            }
             DataTable dt = GetAppointments();

        }

        private void FillPanelWithDate(DataTable NameAndTime)
        {
            LinkButton name = new LinkButton();
            Label time = new Label();
            foreach(DataRow Row in NameAndTime.Rows)
            {
                name.Text ="<br>" +  Row[0].ToString();
                //name.OnClientClick = "Response.Redirect(\"TerminDetailAnsicht.aspx\");";
                name.OnClientClick = "name.Text = time.Text";
                time.Text = " um " + Row[1].ToString();

                Panel.Controls.Add(name);
                Panel.Controls.Add(time);
            }
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
            calendar_1.Enabled = false;

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

        protected void btn_saveChanges_Click(object sender, EventArgs e)
        {
            DataBase db = new DataBase(connStrg);
            DateTime.TryParse(txt_dateFrom.Text,out DateTime dateFrom);
            DateTime.TryParse(txt_dateTo.Text,out DateTime dateTo);

            DateTime.TryParse(txt_timeFrom.Text, out DateTime TimeFrom);
            DateTime.TryParse(txt_timeTo.Text, out DateTime TimeTo);

            DateTime dateTimeFrom = new DateTime();
            DateTime dateTimeTo = new DateTime();

            string sqlCmd = $"Insert Into ssv_date Values(51,'{txt_entryName.Text}',{dateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss")},{dateTimeTo.ToString("yyyy-MM-dd HH:mm:ss")},{txt_description.Text},'1')";
            db.RunNonQuery(sqlCmd);
        }
    }
}