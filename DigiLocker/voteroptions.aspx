<%@ Page Language="C#" AutoEventWireup="true" CodeFile="voteroptions.aspx.cs" Inherits="Voteroptions" %>

<%@ Register Src="userleftmenu.ascx" TagName="userleftmenu" TagPrefix="uc2" %>



<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc4" %>
<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns='http://www.w3.org/1999/xhtml'>
<head id='head1' runat='server'><title>User Options</title><link rel='stylesheet' type='text/css' href='StyleSheet.css'/>
</head><body>
<form runat='Server' id='form1'>
<table width='100%' border='0'><tr><td colspan='2' style="height: 131px"> <uc1:header ID='Header1' runat='server'/></td><td style="height: 131px"></tr>
<tr><td valign='top' style="height: 423px">
    <uc2:userleftmenu ID="userleftmenu1" runat="server" />
    &nbsp;</td><td  valign='top' style="height: 423px">
        &nbsp;
</td></tr></table>
</form></body></html>


