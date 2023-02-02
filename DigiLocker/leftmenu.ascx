<%@ Control Language="C#" AutoEventWireup="true" CodeFile="leftmenu.ascx.cs" Inherits="leftmenu" %>
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
       
        
        <asp:MenuItem NavigateUrl="viewusers.aspx" Text="View Users" Value="" ></asp:MenuItem>
      
      
         
        <asp:MenuItem NavigateUrl="changepassadmin.aspx" Text="Change Password" Value="" ></asp:MenuItem>
        
        <asp:MenuItem NavigateUrl="admin_logout.aspx" Text="Logout" Value="Logout" >
        </asp:MenuItem>
    </Items>
</asp:Menu>
&nbsp;
