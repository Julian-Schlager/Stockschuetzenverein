using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Stockschuetzenverein
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_test_Click(object sender, EventArgs e)
        {
            string salt = Passwort.CreateSalt();
            string input = "test";
            string hash = Passwort.CreatePasswordHash(input, salt);
        }
    }
}