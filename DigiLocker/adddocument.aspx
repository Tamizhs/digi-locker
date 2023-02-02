<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adddocument.aspx.cs" Inherits="adddocument" %>
<%@ Register Src="userleftmenu.ascx" TagName="userleftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>UPLOAD DOCUMENT</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 100%">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 630px">
                    <table width="100%">
                        <tr>
                            <td style="width: 6px" rowspan="1" valign="top">
                                &nbsp;<uc2:userleftmenu ID="Userleftmenu1" runat="server" />
                                </td>
                            <td rowspan="1" style="width: 6px" valign="top" align="center">
                                <table class="table table-striped table-bordered" style="width:50%">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="ADD DOCUMENT" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            <asp:Label ID="Label2" runat="server" Text="User ID"></asp:Label></td>
                                        <td style="height: 26px; width: 360px;">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        <td style="height: 26px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Id must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="User Name"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                ErrorMessage="Name must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Description"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox3" runat="server" Rows="5" TextMode="MultiLine" Width="300"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                ErrorMessage="Address must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                  
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label16" runat="server" Text="Document"></asp:Label></td>
                                        <td style="width: 360px; height: 23px">
                                            <asp:FileUpload ID="FileUpload2" runat="server" /></td>
                                        <td style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="width: 360px">
                                            <asp:Button ID="Button1" runat="server" Text="Save" Font-Bold="True" OnClick="Button1_Click" /></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [UserID], [UserName], [Address], [Phone], [Gender],  [EmailId], [ImageType],FilePath FROM [UsersList] Where UserId=0"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="True" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                          
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
