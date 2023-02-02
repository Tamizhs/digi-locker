<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>
<html>
<head>
<title>Login</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" >
 <form id="form1" runat="server">
  <table width="100%" border="0" >
        <tr>
            <td colspan="1">
                <uc1:header ID="Header1" runat="server" />
            </td>
        </tr>
        <tr >
            <td align="center">
                <br />
                <br />
                <table  class="table table-striped table-bordered" style="width:50%">
                    <tr>
                        <td colspan="1" rowspan="6" style="text-align: center">
                            <asp:Image ID="Image1" runat="server" Height="161px" ImageUrl="~/images/login1.png"
                                Width="217px" /></td>
                        <td colspan="2" style="text-align: center">
                            <br />
                     
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14pt" Style="position: relative"
                                Text="ADMINISTRATOR LOGIN"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 121px" align="right">
                            <asp:Label ID="Label1" runat="server" Text="USER NAME"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="tb_userName" runat="server" Width="130px" Font-Bold="True"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="height: 15px; width: 121px;" align="right">
                            <asp:Label ID="Label2" runat="server" Text="PASSWORD"></asp:Label></td>
                        <td style="height: 15px">
                            <asp:TextBox ID="tb_passWord" runat="server" TextMode="Password" Width="130px" Font-Bold="True"></asp:TextBox></td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" style="height: 15px" align="center">
                            &nbsp;<asp:Button ID="btnLogin" runat="server" OnClick="btn_save_Click" Text="Login" Font-Bold="True" /></td>
                    </tr>
                    <tr>
                        <td style="height: 15px" colspan="2">
                            </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:Label ID="lbl_error" runat="server" Text="-" ForeColor="Red"></asp:Label><br />
                <br />
            </td>
        </tr>
        <tr>
            <td style="height: 44px">
            </td>
        </tr>
    </table>
</form>

</body>

</html>
