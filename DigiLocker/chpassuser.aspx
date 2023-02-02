<%@ Page Language="C#" AutoEventWireup="false" CodeFile="chpassuser.aspx.cs" Inherits="chpassuser" %>
<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc2" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="stylesheet.css" rel="stylesheet" type="text/css" />
    <title>CHANGE PASSWORD</title>
    
</head>
<body leftmargin="0" topmargin="0"> 
    <center><form id="form1" runat="server">  <uc2:header ID="Header1" runat="server" />
        <table  border="0" class="fullcontent" width="100%">
                   
                    <tr>
                        <td align="center">
                           
                            <table width="500">
                                            <tr>
                                                <td style="height: 25px; width: 100%;">
                                                    
          
                                                    
                                                   
                                                        
                                                            <table class="table table-striped table-bordered" style="width:50%">
                                                                <tr>
                                                                    <td align="center" colspan="3">
                                                                        <hr align="center" color="#073a71" width="400" />
                                                                        <asp:Label ID="Label2" runat="server" CssClass="myhead" Text="CHANGE PASSWORD (User)"></asp:Label>
                                                                        <hr align="center" color="#073a71" width="400" />
                                                                      </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 141px" align="right"  >
                                                                        <strong>
                                                                        User Id</strong></td>
                                                                    <td align="center" >
                                                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="15" Width="100px"
                                                                            ></asp:TextBox></td>
                                                                    <td >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Id Should Not Be Empty" ControlToValidate="TextBox1" Font-Bold="True"
                                                                         >*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td style="width: 141px" align="right"  >
                                                                        <strong>Old
                                                                        Password</strong></td>
                                                                    <td align="center"  >
                                                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" MaxLength="15" Width="100px"
                                                                            ></asp:TextBox></td>
                                                                    <td width="20"  >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                                            ErrorMessage="Old Password Should Not Be Empty" Font-Bold="True">*</asp:RequiredFieldValidator></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 141px; height: 27px" align="right">
                                                                        New Password</td>
                                                                    <td align="center" style="height: 27px">
                                                                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="15" TextMode="Password" Width="100px"></asp:TextBox></td>
                                                                    <td style="height: 27px" width="20">
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                                            ErrorMessage="New Password Should Not Be Empty" Font-Bold="True">*</asp:RequiredFieldValidator></td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td   align="center" style="width: 141px">
                                                                        &nbsp;</td>
                                                                    <td align="center"  >
                                                                        <asp:Button ID="Button1" runat="server" Text="Change" Font-Bold="True" Font-Size="12px" OnClick="Button1_Click1" /></td>
                                                                    <td width="20"  >
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center"   colspan="3">
                                                                        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;<br />
                                                                        <asp:ValidationSummary ID="ValidationSummary1" cssClass="errormessagebackcolor" runat="server"  ShowMessageBox="True" ForeColor="" />
                                    </td>
                                                                </tr>
                                                            </table>
                                                          
                                                  
                                                    <!-- Text Contents End -->
                                                </td>
                                            </tr>
                                        </table>
                               
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            
                            </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            &nbsp;</td>
                    </tr>
                </table>


    </form></center>        
</body>
</html>
