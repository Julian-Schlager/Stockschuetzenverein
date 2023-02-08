<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TerminDetailAnsicht.aspx.cs" Inherits="Stockschuetzenverein.TerminDetailAnsicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Import Stylesheets and Libaries -->
    <title>Detail</title>
    <link href="Design_TerminDetailAnsicht.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainNav">
            <div class="container-fluid">
                <a class="navbar-brand" href="#page-top">
                    <asp:LinkButton ID="btn_home" runat="server" class="btn btn-dark" OnClick="btn_home_Click"><i class="material-icons fs-3">home</i></asp:LinkButton>
                </a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <asp:Button ID="btn_logInOut" runat="server" Text="" class="btn btn-dark fs-5 me-3" OnClick="btn_logInOut_Click" />
                        <asp:LinkButton CssClass="nav-item me-2 mt-2" ID="btn_addPictures" Enabled="false" runat="server" ForeColor="White" CausesValidation="True"><i class="material-icons">photo</i></asp:LinkButton>
                        <asp:LinkButton CssClass="nav-item me-2 mt-2" ID="btn_editEntry" Enabled="false" runat="server" ForeColor="White" OnClick="btn_editEntry_Click" UseSubmitBehavior="false"><i class="material-icons">edit</i></asp:LinkButton>
                        <asp:LinkButton CssClass="nav-item me-2 mt-2" ID="btn_deleteEntry" Enabled="false" runat="server" ForeColor="White" OnClick="btn_deleteEntry_Click"><i class="material-icons">delete</i></asp:LinkButton>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Modal Pop Up for adding entries -->
        <div class="modal" id="editEntryModal" tabindex="-1" aria-labelledby="lbl_editEntryModal" aria-hidden="true">
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
                        <asp:Button ID="btn_saveChanges" runat="server" Text="Save changes" type="button" class="btn btn-primary" OnClick="btn_saveChanges_Click" data-bs-dismiss="modal" />
                    </div>
                </div>
            </div>
        </div>
        <div class="RadioStyle">
            <asp:RadioButtonList ID="rblTermine" runat="server" RepeatLayout="Flow">
            </asp:RadioButtonList>
        </div>

    </form>
</body>
</html>
