<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userLogin2.aspx.cs" Inherits="userLogin2" %>
<%@ Register Src="userleftmenu.ascx" TagName="userleftmenu" TagPrefix="uc1" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc2" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<title>IMAGE PASSWORD</title>
<head id="Head1" runat="server">
    <link href="stylesheet.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" type="text/css" />
    
</head>
<body leftmargin="0" topmargin="0"> 
    <center><form id="form1" runat="server">  &nbsp;<uc2:header ID="Header1" runat="server" />
        <table  border="0" class="fullcontent" width="100%">
                   
                    <tr>
                        <td align="center">
                           
                            <table class="table table-striped table-bordered" style="width:50%">
                                            <tr>
                                                <td style="width: 100%; height: 25px" valign="middle">
                                                    &nbsp;<asp:Image ID="Image1" runat="server" Height="150px" ImageUrl="~/images/login2.png"
                                                        Width="150px" /></td>
                                                <td style="height: 25px; width: 100%;">
                                                    
                                                        <h3 align="center">
                                                            USER LOGIN (STEP 2)</h3>
                                                    
                                                   
                                                        
                                                            <table border="0" cellpadding="5" cellspacing="0" class="table table-striped table-bordered" style="width:50%">
                                                                <tr>
                                                                    <td style="width: 142px"  >
                                                                        <strong>User Id</strong></td>
                                                                    <td  >
                                                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="15" Width="146px" Enabled="False"
                                                                            ></asp:TextBox></td>
                                                                    <td >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Id Should Not Be Empty" ControlToValidate="TextBox1" Font-Bold="True"
                                                                         >*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <!--<tr>
                                                                    <td style="width: 142px">
                                                                        Finger Print</td>
                                                                    <td align="center">
                                                                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                                                    <td width="20">
                                                                    </td>
                                                                </tr>-->
                                                                 <tr>
                                                                    <td style="width: 142px">
                                                                        Face/Finger Print</td>
                                                                    <td align="center">
                                                                        <asp:FileUpload ID="FileUpload2" runat="server" /></td>
                                                                    <td width="20">
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td   align="center" style="width: 142px; height: 32px;">
                                                                        &nbsp;</td>
                                                                    <td style="width: 13px; height: 32px;" align="center"  >
                                                                        <asp:Button ID="Button1" runat="server" Text="Login" Font-Bold="True" Font-Size="12px" OnClick="Button1_Click" /></td>
                                                                    <td width="20" style="height: 32px"  >
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center"   colspan="3">
                                                                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
                                                                        <asp:ValidationSummary ID="ValidationSummary1" cssClass="errormessagebackcolor" runat="server"  ShowMessageBox="True" />
                                    </td>
                                                                </tr>
                                                            </table>
                                                          
                                                  
                                                    <!-- Text Contents End -->
                                                </td>
                                            </tr>
                                        </table>
                        
                            </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            &nbsp;</td>
                    </tr>
                </table>


    </form></center>        
    <title>User Login</title>
</body>
</html>
