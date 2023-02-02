<%@ Page Language="C#" AutoEventWireup="false" CodeFile="viewusers.aspx.cs" Inherits="viewusers" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>View Users Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
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
                <td>
                    <table class="table table-striped table-bordered" style="width:100%">
                        <tr>
                            <td style="width: 6px" rowspan="1" valign="top">
                                &nbsp;<uc2:leftmenu ID="Leftmenu2" runat="server" />
                            </td>
                            <td rowspan="1" style="width: 6px" valign="top">
                                <table style="width: 90%">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="VIEW USERS" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label>
                                            </td>
                                    </tr>
                                </table>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="True" Width="100%" AllowPaging="True" AllowSorting="True" DataKeyNames="UserId" OnRowDataBound="GridView1_RowDataBound">
                    </asp:GridView>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [UserID], [UserName], [Address], [Phone], [Gender],  [EmailId], [ImageType],FilePath FROM UsersList"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="height: 17px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
