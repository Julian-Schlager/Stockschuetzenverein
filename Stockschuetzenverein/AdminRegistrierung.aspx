<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRegistrierung.aspx.cs" Inherits="Stockschuetzenverein.AdminRegistrierung" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Design_Kalender.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Admin Registrierung</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="position-absolute top-50 start-50 translate-middle">
                <div class="w-100" style="background-color: #4771c4;">
                    <div class="w-75" style="background-color: #ffffff;">
                        <p class="h2">Admin Account Registrierung</p>
                        <br />
                        <label>Username</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
                        </div>
                        <label>Passwort</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <label>Email</label>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                        </div>
                        <br />
                        <asp:Label ID="lbl_error" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                        <asp:Button type="button" class="btn btn-primary" ID="btn_reg" runat="server" Text="Registrierung" OnClick="btn_reg_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
