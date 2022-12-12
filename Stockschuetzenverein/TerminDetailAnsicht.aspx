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
        <nav class="navbar bg-light">
            <div class="container-fluid">
                <asp:LinkButton CssClass="homeButton" ID="LinkButton1" runat="server" ForeColor="Black" CausesValidation="True"><i class="material-icons">home</i></asp:LinkButton>
                <div class="buttonRight">
                    <asp:LinkButton ID="btn_addPictures" runat="server" ForeColor="Black" CausesValidation="True"><i class="material-icons">add</i></asp:LinkButton>
                    <asp:LinkButton ID="btn_editEntry" runat="server" ForeColor="Black" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">edit</i></asp:LinkButton>
                    <asp:LinkButton ID="btn_deleteEntry" runat="server" ForeColor="Black"><i class="material-icons">delete</i></asp:LinkButton>
                </div>
            </div>
        </nav>
        <br />
        <div class="container text-center">
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
                        <asp:Button ID="btn_saveChanges" runat="server" Text="Save changes" type="button" class="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
