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
        static string connStrg = WebConfigurationManager.ConnectionStrings["AppDbInt"].ConnectionString;
        //string connStrg = WebConfigurationManager.ConnectionStrings["AppDbExt"].ConnectionString;
        DataBase db = new DataBase(connStrg);

        protected void Page_Load(object sender, EventArgs e)
        {   

            if (!IsPostBack)
            {
                System.Web.UI.WebControls.Calendar calendar = new System.Web.UI.WebControls.Calendar();
                FillTable();
                //Try2Connect();
                //DataTable dataTable = new DataTable();
                //string sqlcmd = $"SELECT Name FROM ssv_date WHERE Month(DateFrom) = {calendar_1.SelectMonthText};";
                //dataTable = db.RunQuery(sqlcmd);

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
            //Panel.Visible = true;
            //calendar_1.Enabled = false;

            //OKButton.Visible = true;
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
            //Panel.Visible = false;
            //OKButton.Visible = false;
            //calendar_1.Enabled = true;
        }

        protected void btn_saveChanges_Click(object sender, EventArgs e)
        {
            
            DateTime.TryParse($"{txt_dateFrom.Text} {txt_timeFrom.Text}",out DateTime dateTimeFrom);
            DateTime.TryParse($"{txt_dateTo.Text} {txt_timeTo.Text}",out DateTime dateTimeTo);

            int id;
            string sqlcmd = "SELECT MAX(DateID) FROM ssv_date;";
            id = int.Parse((db.RunQueryScalar(sqlcmd).ToString())) + 1;

            string sqlCmd = $"Insert Into ssv_date Values({id},'{txt_entryName.Text}','{dateTimeFrom.ToString("yyyy-MM-dd HH:mm:ss")}','{dateTimeTo.ToString("yyyy-MM-dd HH:mm:ss")}','{txt_description.Text}','101')";
            db.RunNonQuery(sqlCmd);
        }

        private void FillTable()
        {
            string sql = $"Select Name,DateFrom,DateTo From ssv_date Where Month(DateFrom) = 2";
            DataTable dt = db.RunQuery(sql);
            TableRow row = null;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                row = new TableRow();

                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    TableCell cell = new TableCell();

                    if(dt.Rows[i][j].GetType() == typeof(DateTime))
                    {
                        
                    }

                    cell.Text = dt.Rows[i][j].ToString();

                    row.Cells.Add(cell);
                }

                tbl_entries.Rows.Add(row);

            }

        }
    }
}