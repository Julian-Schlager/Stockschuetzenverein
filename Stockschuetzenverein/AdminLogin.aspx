<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Stockschuetzenverein.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Design_Kalender.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <title>Admin Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="position-absolute top-50 start-50 translate-middle">
            <div class="w-100" style="background-color: #4771c4;">
                <div class="w-75" style="background-color: #ffffff;">
                    <p class="h2">Admin Account Login</p>
                    <br />
                    <label>Username</label>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
                    </div>
                    <label>Passwort</label>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
                    </div>
                    <br />
                        <asp:Label ID="lbl_error" runat="server" Text="Label" Visible="false"></asp:Label>
                        <br />
                    <asp:Button type="button" class="btn btn-primary" ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
