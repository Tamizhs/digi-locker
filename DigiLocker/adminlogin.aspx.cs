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

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    protected void btn_save_Click(object sender, EventArgs e)
    {

        
       // clsColorCode.Encrypt();
      //string s= clsColorCode.Decrypt();
      //Response.Write(s);


        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }

        cls.cmd.CommandType = CommandType.Text;
            cls.cmd.CommandText = "select count(*) from admin where username='" + tb_userName.Text + "' and Password='" + tb_passWord.Text + "'";

        if (int.Parse(cls.cmd.ExecuteScalar().ToString()) ==1)
            {
                Session["un"] = tb_userName.Text;
                Session["username"] = tb_userName.Text;
                Session["ut"] = "admin";
                Session["usertype"] = "admin";
                cls.con.Close();
                Response.Redirect("adminoptions.aspx");
            }
            else
            {

                cls.con.Close();
                lbl_error.Text = "Invalid UserName/Password.";

            }
      
    }
}
