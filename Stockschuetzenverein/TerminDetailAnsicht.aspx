<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TerminDetailAnsicht.aspx.cs" Inherits="Stockschuetzenverein.TerminDetailAnsicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Design_TerminDetailAnsicht.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
</head>
<body>
    <form id="form1" runat="server">
        <div class ="returnButton">
            <asp:LinkButton ID="btn_return" runat="server" ForeColor="Black"><i class="material-icons">arrow_back</i></asp:LinkButton>
        </div>
        <div class ="taskbarRight">
            <asp:LinkButton ID="btn_addPictures" runat="server" ForeColor="Black"><i class="material-icons">add</i></asp:LinkButton>
            <asp:LinkButton ID="btn_editEntry" runat="server" ForeColor="Black"><i class="material-icons">edit</i></asp:LinkButton>
            <asp:LinkButton ID="btn_deleteEntry" runat="server" ForeColor="Black"><i class="material-icons">delete</i></asp:LinkButton>
        </div>
        <table class ="dataTable">
            <tr>
                <td>Name:</td>
                <td><asp:Label ID="lbl_entryName" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Datum:</td>
                <td><asp:Label ID="lbl_entryDateFrom" runat="server" Text="Label"></asp:Label></td>
                <td> - </td>
                <td><asp:Label ID="lbl_entryDateTo" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Uhrzeit:</td>
                <td><asp:Label ID="lbl_timefrom" runat="server" Text="Label"></asp:Label></td>
                <td> - </td>
                <td><asp:Label ID="lbl_timeto" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>Beschreibung:</td>
                <td><asp:Label ID="lbl_description" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
