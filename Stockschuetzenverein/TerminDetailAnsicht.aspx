<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TerminDetailAnsicht.aspx.cs" Inherits="Stockschuetzenverein.TerminDetailAnsicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design_TerminDetailAnsicht.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="buttons">
            <div class="returnButton">
                <asp:LinkButton ID="btn_return" runat="server" ForeColor="Black" OnClick="btn_return_Click"><i class="material-icons">arrow_back</i></asp:LinkButton>
            </div>
            <div class="buttonsRight">
                <asp:LinkButton ID="btn_addPictures" runat="server" ForeColor="Black" CausesValidation="True"><i class="material-icons">add</i></asp:LinkButton>
                <asp:LinkButton ID="btn_editEntry" runat="server" ForeColor="Black" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">edit</i></asp:LinkButton>
                <asp:LinkButton ID="btn_deleteEntry" runat="server" ForeColor="Black"><i class="material-icons">delete</i></asp:LinkButton>
            </div>
        </div>
        <br />
        <div>
            
        </div>

        <!-- Modal -->
        <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Termin Bearbeiten</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Termin Name" aria-label="Termin Name" aria-describedby="basic-addon1" value="Test" />
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Datum Von" aria-label="Datum Von" aria-describedby="basic-addon1" />
                            <input type="text" class="form-control" placeholder="Datum Bis" aria-label="Datum Bis" aria-describedby="basic-addon1" />
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Uhrzeit Von" aria-label="Uhrzeit Von" aria-describedby="basic-addon1" />
                            <input type="text" class="form-control" placeholder="Uhrzeit Bis" aria-label="Uhrzeit Bis" aria-describedby="basic-addon1" />
                        </div>
                        <div class="input-group">
                            <textarea type="text" class="form-control" placeholder="Termin Beschreibung" aria-label="Termin Beschreibung" aria-describedby="basic-addon1"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
