<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kalender.aspx.cs" Inherits="Stockschuetzenverein.Kalender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Import Stylesheets and Libaries -->
    <link rel="stylesheet" href="Design_Kalender.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Übersicht</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainNav">
            <div class="container-fluid">
                <a class="navbar-brand" href="#page-top">
                    <asp:LinkButton ID="btn_home" runat="server" class="btn btn-outline-light">SSV</asp:LinkButton></a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <asp:LinkButton CssClass="nav-item" ID="btn_addEntry" runat="server" ForeColor="White" CausesValidation="True" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">add</i></asp:LinkButton>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="d-flex">
            <!-- Calander -->
            <div class="p-2 flex-fill">
                <asp:Calendar ID="calendar_1" runat="server" BackColor="White" BorderColor="White" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth" OnVisibleMonthChanged="calendar_1_VisibleMonthChanged" OnSelectionChanged="calendar_1_SelectionChanged" VisibleDate="2022-12-14" EnableTheming="True" SelectedDate="11/14/2022 11:59:24" BorderWidth="1px"
                    OnDayRender="calendar_1_DayRender" ShowGridLines="True" Height="700px" Width="1350px">

                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" BorderStyle="None" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" BorderStyle="None" />
                    <OtherMonthDayStyle ForeColor="#999999" BorderStyle="None" />
                    <SelectedDayStyle BackColor="#CCCCCC" ForeColor="White" />
                    <TitleStyle BackColor="White" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" BorderStyle="None" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </div>
            <!-- List of all entries in a month -->
            <div class="p-2 flex-fill">
                <asp:Table ID="tbl_entries" runat="server" class="table">
                    <asp:TableHeaderRow runat="server">
                        <asp:TableHeaderCell Scope="Column" runat="server">Name</asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column" runat="server">Datum Von</asp:TableHeaderCell>
                        <asp:TableHeaderCell Scope="Column" runat="server">Datum Bis</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                    <asp:TableRow runat="server">
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>

        <!-- Modal Pop Up for adding entries -->
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
                            <asp:TextBox ID="txt_timeFrom" runat="server" type="text" class="form-control" placeholder="Uhrzeit Von" aria-label="Uhrzeit Von" aria-describedby="basic-addon1"></asp:TextBox>
                            <asp:TextBox ID="txt_timeTo" runat="server" type="text" class="form-control" placeholder="Uhrzeit Bis" aria-label="Uhrzeit Bis" aria-describedby="basic-addon1"></asp:TextBox>
                        </div>
                        <div class="input-group">
                            <asp:TextBox ID="txt_description" runat="server" type="text" class="form-control" placeholder="Termin Beschreibung" aria-label="Termin Beschreibung" aria-describedby="basic-addon1" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btn_saveChanges" runat="server" Text="Save changes" type="button" class="btn btn-primary" OnClick="btn_saveChanges_Click" />
                    </div>
                </div>
            </div>
        </div>
  

        
    </form>
</body>
</html>
