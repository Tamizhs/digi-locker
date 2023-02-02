<%@ Page Language="C#" AutoEventWireup="false" CodeFile="adminoptions.aspx.cs" Inherits="adminoptions" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc3" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Administrator Options</title><link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body leftmargin="0" topmargin="0" bgcolor="">
    <form id="form1" runat="server">
    <div>  <uc1:header ID="Header1" runat="server" />
    <center>
    <table width="100%" >
   
    <tr>
   
    <td style="height: 275px">
    
        <table align="center" class="table table-striped table-bordered" style="width:50%">
            <tr>
                <td align="left" colspan="1" rowspan="3" valign="top" style="width:10%">
                    <uc3:leftmenu ID="leftmenu1" runat="server" />
                </td>
            </tr>
           
        </table>
     
    
    
    
    </td>
    </tr>
    </table>
        </center>
    </div>

    </form>
</body>
</html>
