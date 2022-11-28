<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kalender.aspx.cs" Inherits="Stockschuetzenverein.Kalender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
            width: 519px;
        }
        .auto-style2 {
            width: 84px;
        }
        .auto-style3 {
            width: 519px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="calendar_1" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="1px" NextPrevFormat="FullMonth" OnSelectionChanged="calendar_1_SelectionChanged" VisibleDate="2022-11-14" EnableTheming="True" SelectedDate="11/14/2022 11:59:24" BorderWidth="1px"
              OnDayRender="calendar_1_DayRender" ShowGridLines="True" 
                >
                
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
            <br />

            <br />
            <asp:Panel ID="Panel" runat="server" Width="500px">
            <table>
                <tr> <td class="auto-style1"> Datum: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td></tr>
                <tr> <td class="auto-style3"> Name: <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td></tr>
                <tr> <td class="auto-style3"> Beschreibung: <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td></tr>
                  
                
                
            </table><br />
 <asp:Button ID="OKButton" runat="server" Text="Close" OnClick="OKButton_Click" />
</asp:Panel>
            <br />
            <br />

        </div>
    </form>
</body>
</html>
