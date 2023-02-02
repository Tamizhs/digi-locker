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

public partial class userLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {

    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {
        //   clsColorCode.textmessage = accno;
        // encaccno = clsColorCode.Encrypt();

        clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["otp"] == null)
        {
            return;
        }
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }

        string Password = "";
        EncryptMessage(ref Password, TextBox2.Text);

        cls.cmd.CommandText = "select count(*) from UsersList where UserId='" + TextBox1.Text + "' and Password='" + Password + "'";

        if (Convert.ToInt16(cls.cmd.ExecuteScalar().ToString()) > 0)
        {

            if (Session["otp"].ToString().Equals(TextBox3.Text))
            {
                cls.cmd.CommandText = "select userId from UsersList where UserId='" + TextBox1.Text + "' and Password='" + Password + "'";

                Session["un"] = cls.cmd.ExecuteScalar().ToString();
                Session["userid"] = cls.cmd.ExecuteScalar().ToString();
                cls.cmd.CommandText = "select username from UsersList where UserId='" + TextBox1.Text + "' and Password='" + Password + "'";

                Session["username"] = cls.cmd.ExecuteScalar().ToString();
                cls.con.Close();
                Response.Redirect("userlogin2.aspx");
            }
            else
            {
                Label4.Text = "Invalid OTP.";
            }
        }
        else
        {
            cls.con.Close();
            Label4.Text = "Invalid User Id./Password.";

        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }

        string ps = "";
        EncryptMessage(ref ps, TextBox2.Text);
        cls.cmd.CommandText = "select count(*) from UsersList where UserId='" + TextBox1.Text + "' and Password='" + ps + "'";
        int cnt = int.Parse(cls.cmd.ExecuteScalar().ToString());
        if(cnt==0)
        {
            Label4.Text = "Invalid User Id/Password";
            return;

        }

        cls.cmd.CommandText = "select EMailId from UsersList where UserId='" + TextBox1.Text + "' and Password='" + ps + "'";

        string emailid = cls.cmd.ExecuteScalar().ToString();
        Random rn = new Random();
        string otp = rn.Next(10001, 99999).ToString();
        try
        {
            Session["otp"] = otp.ToString();

            System.IO.StreamWriter sw = new System.IO.StreamWriter(Server.MapPath(".") + "\\opt.txt");
            sw.Write(otp);
            sw.Close();
            //cls.MailSend(emailid, "OTP", "Your OTP For User Login is " + otp.ToString());
        }
        catch (Exception ex)
        {
            Label4.Text = ex.Message;
        }

    }
}
