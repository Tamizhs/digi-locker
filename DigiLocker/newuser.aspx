<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newuser.aspx.cs" Inherits="newuser" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>User Registration Page</title>
   <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="1" cellpadding="4" cellspacing="0">
            <tr>
                <td colspan="6" style="height: 20px">
                    <uc1:Header ID="Header1" runat="server" /></td>
            </tr>
            <tr>
                <td style="height: 350px" valign="top">
                    <uc2:leftmenu ID="Leftmenu1" runat="server" />
       
                
                </td>
                <td colspan="5" style="height: 350px;">
               <table border="1" cellpadding="5" cellspacing="0" id="TABLE1" onclick="return TABLE1_onclick()" >
                                                                <tr>
                                                                    <td colspan="3" style="height: 21px" align="center">
                                                                        &nbsp;<asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="16pt" Text="USER REGISTRATION"></asp:Label><br />
                                                                        <br />
                                                                        <asp:ValidationSummary ID="ValidationSummary1" cssClass="errormessagebackcolor" runat="server" ShowMessageBox="True" />
                                                                    </td>

                                                                </tr>
                   <tr>
                       <td style="width: 193px; height: 21px">
                           <asp:Label ID="Label10" runat="server"  Text="User ID" Width="72px"></asp:Label>
                       </td>
                       <td style="width: 178px; height: 21px"><asp:DropDownList ID="ddlUserId" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserId_SelectedIndexChanged" Width="181px">
                       </asp:DropDownList></td>
                       <td style="height: 21px; width: 13px;">
                           </td>
                   </tr>
                              
           
            <tr>
                <td style="width: 193px; height: 21px;"  >
                    <asp:Label ID="Label15" runat="server" Text="User Name"></asp:Label></td>
                <td style="width: 178px; height: 21px;"  >
                    <asp:TextBox ID="TextBox2" runat="server" Width="176px" MaxLength="50"></asp:TextBox></td>
                <td style="height: 21px; width: 13px;"  >
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox2"
                        ErrorMessage="User Name Should Not be Empty" Style="position: relative; left: -1px; top: 0px;">*</asp:RequiredFieldValidator></td>
            </tr>
                   <tr>
                       <td style="height: 21px">
                           <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" GroupName="a"
                               OnCheckedChanged="RadioButton2_CheckedChanged" Text="Do not use Virtual/Dynamic Password" /></td>
                       <td colspan="1" style="height: 21px">
                           <asp:TextBox ID="TextBox5" runat="server" MaxLength="50" Width="176px" TextMode="Password"></asp:TextBox></td>
                       <td style="width: 13px; height: 21px">
                       </td>
                   </tr>
             <tr>
                <td style="width: 193px; height: 21px;"  >
                    <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" GroupName="a"
                        OnCheckedChanged="RadioButton1_CheckedChanged" Text="Dynamic Password Type" />
                </td>
                <td style="width: 178px; height: 21px;"  >
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="181px">
                    </asp:DropDownList></td>
                <td style="height: 21px; width: 13px;"  >
                    &nbsp;</td>
            </tr>
                   <tr>
                       <td align="center" colspan="3" style="height: 26px">
                           <asp:GridView ID="GridView1" runat="server">
                           </asp:GridView>
                       </td>
                   </tr>
            <tr>
                <td style="width: 193px; height: 26px;"  >
                    <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" GroupName="a"
                        OnCheckedChanged="RadioButton1_CheckedChanged" Text="User Defined Function" /></td>
                <td style="width: 178px; height: 26px;"  >
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                        <asp:ListItem>Date of Month</asp:ListItem>
                        <asp:ListItem>Date of Month * 2</asp:ListItem>
                        <asp:ListItem>Date of Month * 3</asp:ListItem>
                        <asp:ListItem>Date of Month * 10</asp:ListItem>
                        <asp:ListItem>Square of Date of Month</asp:ListItem>
                        <asp:ListItem>Cube of Date of Month</asp:ListItem>
                        <asp:ListItem>Square Root of Date of Month</asp:ListItem>
                        <asp:ListItem>Flip one bit in password</asp:ListItem>
                        <asp:ListItem>Flip one digit in password</asp:ListItem>
                        <asp:ListItem>Add one to each odd digit and minus one in each even digit</asp:ListItem>
                        <asp:ListItem>The ﬁrst digit of the password is tripled</asp:ListItem>
                        <asp:ListItem>Reversing even bits of the real password</asp:ListItem>
                        <asp:ListItem>A secret function x+a, where a is a constant, and x is the fixed password</asp:ListItem>
                        <asp:ListItem>A secret function x-a, where a is a constant, and x is the fixed password</asp:ListItem>
                        <asp:ListItem>A secret function x*a, where a is a constant, and x is the fixed password</asp:ListItem>
                        <asp:ListItem>add an additional constant digit in second place</asp:ListItem>
                        <asp:ListItem>A secret linear function x*a mod 13</asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:Label ID="Label4" runat="server" Text="Enter digits only"></asp:Label><br />
                    <asp:Label ID="Label6" runat="server" Text="XValue"></asp:Label>
                    <asp:TextBox ID="txtX" runat="server" MaxLength="50" Width="176px">0</asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="AValue"></asp:Label>
                    <asp:TextBox ID="txtA" runat="server" MaxLength="50" Width="176px">0</asp:TextBox></td>
                <td style="height: 26px; width: 13px;"  >
                    </td>
            </tr>
                                                            <!--  <tr>
                                                                  <td style="width: 193px; height: 26px"><asp:RadioButton ID="RadioButton4" runat="server" AutoPostBack="True" GroupName="a"
                        OnCheckedChanged="RadioButton4_CheckedChanged" Text="Security Degree" /></td>
                                                                  <td style="width: 178px; height: 26px"><asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                      <asp:ListItem>Very High [Alphabet and Number  and  underscore]</asp:ListItem>
                                                                      <asp:ListItem>High [Alphabet and Number Min. 10 characters]</asp:ListItem>
                                                                      <asp:ListItem>Medium [Alphabet and Number Min. 8 characters]</asp:ListItem>
                                                                      <asp:ListItem>Low [Alphabet and Number Min. 6 characters]</asp:ListItem>
                                                                  </asp:DropDownList></td>
                                                                  <td style="height: 26px; width: 13px;">
                                                                      </td>
                                                              </tr>-->
                                                              <tr>
                                                                  <td style="height: 26px"><asp:RadioButton ID="RadioButton5" runat="server" AutoPostBack="True" GroupName="a"
                        OnCheckedChanged="RadioButton5_CheckedChanged" Text="Use Reference Switching" /></td>
                                                                  <td colspan="1" style="height: 26px">
                                                                      <asp:Label ID="Label1" runat="server" Text="If server shows 1234567 then password is DMXGACY"></asp:Label></td>
                                                                  <td style="height: 26px; width: 13px;">
                    </td>
                                                              </tr>
                   <tr>
                       <td colspan="3" style="height: 21px">
                           <asp:Image ID="Image2" runat="server" Height="30px" ImageUrl="~/images/codebookformula.JPG"
                               Visible="False" Width="327px" /><br />
                           <asp:Image ID="Image1" runat="server" Height="273px" ImageUrl="~/images/codebook.JPG"
                               Visible="False" Width="327px" />
                       </td>
                   </tr>
                   <tr>
                       <td style="width: 193px; height: 21px">
                           <asp:RadioButton ID="RadioButton6" runat="server" AutoPostBack="True" GroupName="a"
                        OnCheckedChanged="RadioButton5_CheckedChanged" Text="Use Code Book" /></td>
                       <td style="width: 178px; height: 21px">
                           <asp:Label ID="Label2" runat="server" Text="If server show abcd, then password would be r(0,a), r(1,b), r(2,c), r(3,d)"></asp:Label></td>
                       <td style="width: 13px; height: 21px">
                       </td>
                   </tr>
                   <tr>
                       <td style="width: 193px; height: 21px">
                           <asp:Image ID="Image3" runat="server" Height="129px" ImageUrl="~/images/codebook1.JPG"
                               Visible="False" Width="244px" /></td>
                       <td style="width: 178px; height: 21px">
                           <asp:Table ID="Table2" runat="server" BorderStyle="Solid" Caption="CODE BOOK DATA"
                               CellPadding="1" CellSpacing="1" Visible="False">
                               <asp:TableRow runat="server">
                                   <asp:TableCell runat="server">5</asp:TableCell>
                                   <asp:TableCell runat="server">6</asp:TableCell>
                                   <asp:TableCell runat="server">7</asp:TableCell>
                                   <asp:TableCell runat="server">8</asp:TableCell>
                                   <asp:TableCell ID="TableCell1" runat="server">1</asp:TableCell>
                                   <asp:TableCell ID="TableCell2" runat="server">2</asp:TableCell>
                                   <asp:TableCell ID="TableCell3" runat="server">3</asp:TableCell>
                                   <asp:TableCell ID="TableCell4" runat="server">4</asp:TableCell>
                                   <asp:TableCell ID="TableCell5" runat="server">0</asp:TableCell>
                                   <asp:TableCell ID="TableCell6" runat="server">9</asp:TableCell>

                               </asp:TableRow>
                               <asp:TableRow ID="TableRow1" runat="server">
                                   <asp:TableCell ID="TableCell7" runat="server">0</asp:TableCell>
                                   <asp:TableCell ID="TableCell8" runat="server">1</asp:TableCell>
                                   <asp:TableCell ID="TableCell9" runat="server">2</asp:TableCell>
                                   <asp:TableCell ID="TableCell10" runat="server">3</asp:TableCell>
                                   <asp:TableCell ID="TableCell11" runat="server">4</asp:TableCell>
                                   <asp:TableCell ID="TableCell12" runat="server">5</asp:TableCell>
                                   <asp:TableCell ID="TableCell13" runat="server">6</asp:TableCell>
                                   <asp:TableCell ID="TableCell14" runat="server">7</asp:TableCell>
                                   <asp:TableCell ID="TableCell15" runat="server">8</asp:TableCell>
                                   <asp:TableCell ID="TableCell16" runat="server">9</asp:TableCell>

                               </asp:TableRow>
                                 <asp:TableRow ID="TableRow2" runat="server">
                                   <asp:TableCell ID="TableCell17" runat="server">9</asp:TableCell>
                                   <asp:TableCell ID="TableCell18" runat="server">8</asp:TableCell>
                                   <asp:TableCell ID="TableCell19" runat="server">7</asp:TableCell>
                                   <asp:TableCell ID="TableCell20" runat="server">6</asp:TableCell>
                                   <asp:TableCell ID="TableCell21" runat="server">5</asp:TableCell>
                                   <asp:TableCell ID="TableCell22" runat="server">4</asp:TableCell>
                                   <asp:TableCell ID="TableCell23" runat="server">3</asp:TableCell>
                                   <asp:TableCell ID="TableCell24" runat="server">2</asp:TableCell>
                                   <asp:TableCell ID="TableCell25" runat="server">1</asp:TableCell>
                                   <asp:TableCell ID="TableCell26" runat="server">0</asp:TableCell>

                               </asp:TableRow>
                                 <asp:TableRow ID="TableRow3" runat="server">
                                   <asp:TableCell ID="TableCell27" runat="server">5</asp:TableCell>
                                   <asp:TableCell ID="TableCell28" runat="server">6</asp:TableCell>
                                   <asp:TableCell ID="TableCell29" runat="server">7</asp:TableCell>
                                   <asp:TableCell ID="TableCell30" runat="server">8</asp:TableCell>
                                   <asp:TableCell ID="TableCell31" runat="server">1</asp:TableCell>
                                   <asp:TableCell ID="TableCell32" runat="server">2</asp:TableCell>
                                   <asp:TableCell ID="TableCell33" runat="server">3</asp:TableCell>
                                   <asp:TableCell ID="TableCell34" runat="server">4</asp:TableCell>
                                   <asp:TableCell ID="TableCell35" runat="server">0</asp:TableCell>
                                   <asp:TableCell ID="TableCell36" runat="server">9</asp:TableCell>

                               </asp:TableRow>
                           </asp:Table>
                           <asp:Table ID="Table3" runat="server" BorderStyle="Solid" BorderWidth="2px" Caption="CODE BOOK"
                               CellPadding="1" CellSpacing="1" ForeColor="Red">
                           </asp:Table>
                       </td>
                       <td style="width: 13px; height: 21px">
                       </td>
                   </tr>
                                                      <!--        <tr>
                                                                  <td style="width: 193px; height: 21px">
                                                                      <asp:Label ID="Label3" runat="server" Text="Mobile"></asp:Label></td>
                                                                  <td style="width: 178px; height: 21px">
                                                                      <asp:TextBox ID="TextBox3" runat="server" MaxLength="20" Width="176px"></asp:TextBox></td>
                                                                  <td style="height: 21px; width: 13px;">
                                                             </td>
                                                              </tr>
           
            <tr>
                <td style="width: 193px; height: 21px"  >
                    <asp:Label ID="Label9" runat="server" Text="E-Mail ID"></asp:Label></td>
                <td style="width: 178px; height: 21px"  >
                    <asp:TextBox ID="TextBox4" runat="server" MaxLength="50" Width="176px"></asp:TextBox></td>
                <td style="height: 21px; width: 13px;"  >
                    &nbsp;
                   </td>
            </tr>-->
            <tr>
                <td style="width: 193px"  >
                    &nbsp;<asp:Button ID="Button3" runat="server" Text="Back" Font-Bold="True" Font-Italic="False" CausesValidation="False" /></td>
                <td style="width: 178px" align="center"  >
                    <asp:Button ID="Button1" runat="server" Text="Register" Font-Bold="True" Font-Italic="False" OnClick="Button1_Click" />
                    </td>
                <td style="width: 13px"  >
                    &nbsp;</td>
            </tr>
                                                                <tr>
                                                                    <td align="center" colspan="3">
                                                                        <asp:Label ID="lblTempId" runat="server" Font-Bold="True" Font-Size="14pt" ForeColor="White"
                                                                            Width="100%"></asp:Label>
                    <asp:Label ID="Label5" runat="server" ForeColor="Red" Width="100%"></asp:Label></td>
                                                                </tr>
        </table>
                </td>
            </tr>
        </table>
    </DIV>
    </form>
</body>
</html>