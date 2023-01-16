<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kalender.aspx.cs" Inherits="Stockschuetzenverein.Kalender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Import Stylesheets and Libaries -->
    <link rel="stylesheet" href="Design_Kalender.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="fonts/icomoon/style.css" />
    <link href='fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
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
                <div class="content">
                    <div id='calendar'></div>
                </div>
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
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Termin erstellen</h1>
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

        <div>
            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>

            <script src='fullcalendar/packages/core/main.js'></script>
            <script src='fullcalendar/packages/interaction/main.js'></script>
            <script src='fullcalendar/packages/daygrid/main.js'></script>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var calendarEl = document.getElementById('calendar');

                    var calendar = new FullCalendar.Calendar(calendarEl, {
                        plugins: ['interaction', 'dayGrid'],
                        defaultDate: new Date,
                        editable: false,
                        eventLimit: true, // allow "more" link when too many events
                        events: [
                            {
                                title: 'All Day Event',
                                url: "TerminDetailAnsicht.aspx",
                                start: '2023-01-20'
                            }
                        ]
                    });

                    calendar.render();
                });

            </script>

            <script src="js/main.js"></script>
        </div>
    </form>
</body>
</html>
