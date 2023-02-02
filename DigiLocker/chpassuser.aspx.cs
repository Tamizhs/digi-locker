using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class chpassuser: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    protected void Button1_Click(object sender, EventArgs e)
    {

      
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {
        //   clsColorCode.textmessage = accno;
        // encaccno = clsColorCode.Encrypt();

        clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
  try
        {
            if (cls.con.State != ConnectionState.Open) cls.con.Open();

            //String un = TextBox1.Text.Trim().Replace("'", "");
            //          un = un.Replace("--", "");
            //        un = un.Replace(";", "");
            string ps = TextBox2.Text.Trim().Replace("'", "");
            ps = ps.Replace("--", "");
            ps = ps.Replace(";", "");
            string ps1 = "";
            EncryptMessage(ref ps1, ps);


            string nps = TextBox3.Text.Trim().Replace("'", "");

            cls.cmd.CommandText = "Select Count(*) From usersList Where UserId='" + Session["un"].ToString() + "' and [Password]='" + ps1 + "'";

            if (int.Parse(cls.cmd.ExecuteScalar().ToString()) > 0)
            {
                string psnew = "";
                EncryptMessage(ref psnew, nps);


                cls.cmd.CommandText = "Update usersList Set [Password]='" + psnew.ToString() + "' Where UserId='" + Session["un"].ToString() + "'";
                cls.cmd.ExecuteNonQuery();

                Label1.Text = "Password Updated.";
            }
            else
            {
                Label1.Text = "Invalid User Id/Password.";
            }



        }
        catch (Exception ex)
        {
            Label1.Text = "Error!   " + ex.Message;
        }
        finally
        {
            cls.con.Close();
        }
    }
}
