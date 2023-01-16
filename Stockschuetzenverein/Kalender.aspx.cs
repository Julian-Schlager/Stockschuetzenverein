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
                // Kalender erstellen und zum heutigen Datum einstellen
                System.Web.UI.WebControls.Calendar calendar = new System.Web.UI.WebControls.Calendar();
                calendar_1.SelectedDate = DateTime.Today;
                FillTable(calendar_1.SelectedDate);
            }
            // Tabelle füllen bei jeden Postback weil sonst die Tabelle verschwindet
            else FillTable(Convert.ToDateTime(ViewState["date"]));
        }



        // Wenn ein anderer Monat ausgewählt wird, soll die Tabelle die jeweilige Termine anzeigen die im Monat sind.
        protected void calendar_1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            if (e.PreviousDate.Month != e.NewDate.Month) FillTable(e.NewDate);
        }

        // Termin erstellen
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


        // Tabelle die rechts neben den Kalnder ist ne, ja die aufüllen und den Datum speichern damit .... schau einfach bei PageLoad
        private void FillTable(DateTime date)
        {
            ViewState["date"] = date;
            string sql = $"Select Name,DateFrom,DateTo From ssv_date Where Month(DateFrom) = {date.Month} AND YEAR(DateFrom) = {date.Year}";
            DataTable dt = db.RunQuery(sql);
            TableRow row = null;
            // Tabelle leeren
            if (Page.IsPostBack)
            {
                for (int i = 1; i < tbl_entries.Rows.Count; i++)
                {
                    tbl_entries.Rows.RemoveAt(i);
                    i--;
                }
            }
            // und die neue daten einfügen
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                row = new TableRow();

                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    TableCell cell = new TableCell();

                    cell.Text = dt.Rows[i][j].ToString();

                    row.Cells.Add(cell);
                }
                tbl_entries.Rows.Add(row);
            }
        }

        protected void calendar_1_SelectionChanged(object sender, EventArgs e)
        {
            // Hier bitte eine Pop Up für die 🦼
            Response.Redirect("TerminDetailAnsicht.aspx?test={JA}");
        }



        // Home Button der theoritsch useless ist.
        protected void btn_homeButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Kalender.aspx");
        }

       
    }
}