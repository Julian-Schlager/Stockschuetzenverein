using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stockschuetzenverein
{
    public partial class Kalender : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Calendar calendar = new Calendar();
            }
                
        }
        protected void btn_terminAnlegen_Click(object sender, EventArgs e)
        {
            
            
            AddTermin(txt_terminBetreff.Text,calendar_1.SelectedDate);
        }
        void AddTermin(string terminText,DateTime datum)
        {
            calendar_1.SelectedDate = datum;
            
            

            


        }

        protected void calendar_1_SelectionChanged(object sender, EventArgs e)
        {

        }

        
    }
}