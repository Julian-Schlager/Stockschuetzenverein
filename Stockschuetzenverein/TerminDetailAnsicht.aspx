<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TerminDetailAnsicht.aspx.cs" Inherits="Stockschuetzenverein.TerminDetailAnsicht" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="returnButton">
            <asp:Button ID="btn_return" runat="server" Text="Zurück zum Kalender" />
        </div>
        <div class ="taskbarRight">
            <asp:Button ID="btn_addPictures" runat="server" Text="Fotos Hinzufügen"/>
            <asp:Button ID="btn_editEntry" runat="server" Text="Fotos Hinzufügen"/>
            <asp:Button ID="btn_deleteEntry" runat="server" Text="Fotos Hinzufügen"/>
        </div>
        <table>
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
                <td>Beschreibung:</td>
                <td><asp:Label ID="lbl_description" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>
    </form>
</body>
</html>
