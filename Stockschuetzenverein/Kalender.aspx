<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kalender.aspx.cs" Inherits="Stockschuetzenverein.Kalender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Calendar ID="calendar_1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Comic Sans MS" Font-Size="12pt" ForeColor="Black" Height="343px" NextPrevFormat="FullMonth" OnSelectionChanged="calendar_1_SelectionChanged" VisibleDate="2022-11-14" Width="771px" EnableTheming="True" SelectedDate="11/14/2022 11:59:24">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                <DayStyle BackColor="#CCCCCC" />
                <NextPrevStyle Font-Bold="True" Font-Size="12pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                <TodayDayStyle BackColor="#999999" ForeColor="White" />
            </asp:Calendar>
            <br />
            <br />
            <asp:Label ID="lbl_terminBetreff" runat="server" Text="Terminbetreff: "></asp:Label>
            <asp:TextBox ID="txt_terminBetreff" runat="server"  Width="440px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btn_terminAnlegen" runat="server" OnClick="btn_terminAnlegen_Click" Text="Termin anlegen" />
        </div>
    </form>
</body>
</html>
