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
                <asp:LinkButton ID="btn_addPictures" runat="server" ForeColor="Black"><i class="material-icons">add</i></asp:LinkButton>
                <asp:LinkButton ID="btn_editEntry" runat="server" ForeColor="Black"><i class="material-icons">edit</i></asp:LinkButton>
                <asp:LinkButton ID="btn_deleteEntry" runat="server" ForeColor="Black"><i class="material-icons">delete</i></asp:LinkButton>
            </div>
        </div>
        <br />
        <div class="table">
            <table>
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:Label ID="lbl_entryName" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Datum:</td>
                    <td>
                        <asp:Label ID="lbl_entryDateFrom" runat="server" Text="Label"></asp:Label></td>
                    <td>- </td>
                    <td>
                        <asp:Label ID="lbl_entryDateTo" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Uhrzeit:</td>
                    <td>
                        <asp:Label ID="lbl_timefrom" runat="server" Text="Label"></asp:Label></td>
                    <td>- </td>
                    <td>
                        <asp:Label ID="lbl_timeto" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Beschreibung:</td>
                    <td>
                        <asp:Label ID="lbl_description" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
            <br />
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Launch demo modal
            </button>

            <!-- Modal -->
            <div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
