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
    </form>
</body>
</html>
