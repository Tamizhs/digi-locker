<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogin.aspx.cs" Inherits="userLogin" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>LOGIN</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="css/all.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="css/all.css" rel="stylesheet" />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <table style="width: 722px">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <br />
                    <table class="table table-striped table-bordered" style="width:50%">
                        <tr>
                            <td align="center" colspan="1" rowspan="11" style="width: 244px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/key copy.jpg" /></td>
                            <td colspan="3" align="center">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14pt" Text="USER LOGIN"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Label8" runat="server" Text="STEP 1"></asp:Label></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="User Id."></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="150px" ValidationGroup="u" ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="Username must not be empty" ValidationGroup="u">*</asp:RequiredFieldValidator></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                            <td style="height: 26px">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px" ValidationGroup="u"></asp:TextBox>&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="Password must not be empty" ValidationGroup="u">*</asp:RequiredFieldValidator></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 26px">
                                <asp:Label ID="Label6" runat="server" ForeColor="Blue" Text="1. OTP requires User Id. and Password"></asp:Label>
                                <asp:Button ID="Button2" runat="server" Text="Send OTP" Width="96px" Height="31px" OnClick="Button2_Click" ValidationGroup="u" /></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                           
                            <td style="height: 26px" align="center" colspan="2">
                                </td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 26px" colspan="2">
                                <asp:Label ID="Label9" runat="server" Text="STEP 2"></asp:Label></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <asp:Label ID="Label3" runat="server" Text="OTP"></asp:Label></td>
                            <td style="height: 26px">
                                <asp:TextBox ID="TextBox3" runat="server" Width="150px" ValidationGroup="a"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                    ErrorMessage="OTP must not be empty" ValidationGroup="a">*</asp:RequiredFieldValidator></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="Label7" runat="server" ForeColor="Blue" Text="2. Login requires User Id., Password and OTP"></asp:Label>
                                <asp:Button ID="Button1" runat="server" Text="Login" Width="96px" Height="31px" OnClick="Button1_Click" ValidationGroup="a" /></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3" style="height: 18px">
                                <asp:Label ID="Label4" runat="server" Text="-" Width="280px" ForeColor="Red"></asp:Label><br />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    
    
    </div>
    </form>
    </center>
</body>
</html>