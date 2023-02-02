using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class viewusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
   
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
       try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                    if (e.Row.Cells[7].Text != "")
                    {
                        e.Row.Cells[7].Text ="<img src='FaceFingerPrintImages/" + e.Row.Cells[7].Text + "' width='100' height='100'/>";
                    }
                
            }
        }
        catch (Exception ex)
        {
        }
    
    }
}
