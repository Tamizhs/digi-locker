using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class viewusersbyuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlDataSource1.SelectCommand = "SELECT [UserID], [UserName], [Address], [Phone], [Gender],  [EmailId], [ImageType],FilePath FROM UsersList where UserID='" + Session["un"].ToString() + "'";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.Cells[7].Text != "")
                {
                    e.Row.Cells[7].Text = "<img src='FaceFingerPrintImages/" + e.Row.Cells[7].Text + "' width='100' height='100'/>";
                }

            }
        }
        catch (Exception ex)
        {
        }

    }
}
