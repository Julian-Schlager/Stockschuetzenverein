<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kalender.aspx.cs" Inherits="Stockschuetzenverein.Kalender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Design_Kalender.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title></title>
    <style type="text/css">
        .auto-style4 {
            height: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="buttonRight">
                <asp:LinkButton ID="btn_addEntry" runat="server" ForeColor="Black" CausesValidation="True" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">add</i></asp:LinkButton>
            </div>
        <div>
            <div class="calendar">

                <asp:Calendar ID="calendar_1" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="1px" NextPrevFormat="FullMonth" OnSelectionChanged="calendar_1_SelectionChanged" VisibleDate="2022-11-14" EnableTheming="True" SelectedDate="11/14/2022 11:59:24" BorderWidth="1px"
                    OnDayRender="calendar_1_DayRender" ShowGridLines="True">

                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderColor="Black" BorderWidth="4px" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </div>

            <br />

            <asp:Panel ID="Panel" runat="server" Width="500px">
                <table class="auto-style4">
                    <%-- <tr> <td class="auto-style1"> Datum: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td></tr>
                <tr> <td class="auto-style3"> Name: <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    </td></tr>
                <tr> <td class="auto-style3"> Beschreibung: <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </td></tr>--%>
                </table>
                <br />
                <asp:Button ID="OKButton" runat="server" Text="Close" OnClick="OKButton_Click" />
            </asp:Panel>

            <br />
            <br />
            <br />
        </div>
        <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Termin Bearbeiten</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_entryName" runat="server" type="text" class="form-control" placeholder="Termin Name" aria-label="Termin Name" aria-describedby="basic-addon1"></asp:TextBox>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_dateFrom" runat="server" type="text" class="form-control" placeholder="Datum Von" aria-label="Datum Von" aria-describedby="basic-addon1"></asp:TextBox>
                            <asp:TextBox ID="txt_dateTo" runat="server" type="text" class="form-control" placeholder="Datum Bis" aria-label="Datum Bis" aria-describedby="basic-addon1"></asp:TextBox>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_timeFrom" runat="server" type="text" class="form-control" placeholder="Uhrzeit Von" aria-label="Uhrzeit Von" aria-describedby="basic-addon1" ></asp:TextBox>
                            <asp:TextBox ID="txt_timeTo" runat="server" type="text" class="form-control" placeholder="Uhrzeit Bis" aria-label="Uhrzeit Bis" aria-describedby="basic-addon1" ></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txt_description" runat="server" type="text" class="form-control" placeholder="Termin Beschreibung" aria-label="Termin Beschreibung" aria-describedby="basic-addon1" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btn_saveChanges" runat="server" Text="Save changes" type="button" class="btn btn-primary" OnClick="btn_saveChanges_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
