<%@ Control Language="C#" AutoEventWireup="false" CodeFile="userleftmenu.ascx.cs" Inherits="userleftmenu" %>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<asp:Menu ID="Menu1" runat="server" BackColor="#D6F2FD" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
    <StaticSelectedStyle BackColor="#1C5E55" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
    <DynamicMenuStyle BackColor="#E3EAEB" />
    <DynamicSelectedStyle BackColor="#1C5E55" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    <Items>
        <asp:MenuItem NavigateUrl="viewusersbyuser.aspx" Text="View Profile" Value="View Parties" >
        </asp:MenuItem>
         <asp:MenuItem NavigateUrl="adddocument.aspx" Text="Add Document" Value="Add Document" >
        </asp:MenuItem>
       
        <asp:MenuItem NavigateUrl="chpassuser.aspx" Text="Change Password" Value="Change Password" ></asp:MenuItem>
        <asp:MenuItem NavigateUrl="userlogout.aspx" Text="Logout" Value="Logout" >
        </asp:MenuItem>
    </Items>
</asp:Menu>
