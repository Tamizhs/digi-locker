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

public partial class userleftmenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["un"] == null)
        {
            Response.Redirect("voterlogin.aspx");
        }
        else if (Session["un"].ToString() == "")
        {
            Response.Redirect("voterlogin.aspx");
        }
        Label1.Text = "Welcome, " + Session["un"].ToString();

    }
}
