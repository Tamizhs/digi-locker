using System;
using System.Drawing;
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

public partial class adduser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Page.IsPostBack == false))
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "select coalesce(max(userid),0) from  userslist";
            if (cls.cmd.ExecuteScalar() == null)
            {
                TextBox1.Text = "1";
            }
            else
            {
                int sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
                TextBox1.Text = sno.ToString();
                TextBox1.Enabled = false;
            }
          
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
           
          
         string fname = "";
            bool saved=false;
            string VoterID = "";
            string VoterName = "";
            string Address = "";
            string Phone = "";
            string Gender = "";
          
            string Password = "";
          

            string emailid = "";
            string imagetype = DropDownList2.SelectedItem.Text;
            VoterID = TextBox1.Text;
            VoterName = TextBox2.Text;
            Address = TextBox3.Text;
            Phone = TextBox4.Text;
            Gender = DropDownList1.SelectedItem.Text;
            Password = TextBox5.Text;
            emailid = TextBox12.Text;
           // imagetype = TextBox4.Text;

           // EncryptMessage(ref VoterID, TextBox1.Text);
           // EncryptMessage(ref VoterName, TextBox2.Text);
          //  EncryptMessage(ref Address, TextBox3.Text);
          //  EncryptMessage(ref Phone, TextBox4.Text);
          //  EncryptMessage(ref Gender, DropDownList1.SelectedItem.Text);
          EncryptMessage(ref Password, TextBox5.Text);
           // EncryptMessage(ref emailid, TextBox12.Text);
           // EncryptMessage(ref imagetype, TextBox13.Text);

 
    cls.cmd.CommandText = "Select count(*) from UsersList Where UserName='" + VoterName.Replace("'","''") + "'";
    int cnt = int.Parse (cls.cmd.ExecuteScalar().ToString());
    if (cnt > 0)
    {
        lblMessage.Text = "User Name already found";
        return;
    }
    cls.cmd.CommandText = "insert into UsersList([UserID], [UserName], [Address], [Phone], [Gender], [Password], [EmailId], [ImageType],FilePath) values('" + VoterID.Replace("'", "''") + "','" + VoterName.Replace("'", "''") + "','" + Address.Replace("'", "''") + "','" + Phone.Replace("'", "''") + "','" + Gender.Replace("'", "''") + "','" + Password.Replace("'", "''") + "','" + emailid.Replace("'", "''") + "','" + imagetype.Replace("'", "''") + "','" + VoterID + ".jpg')";
            cls.cmd.ExecuteNonQuery();
           
            if (FileUpload2.PostedFile != null)
            {
                string[] fn = FileUpload2.PostedFile.FileName.Split(new char[] { '\\' });
                fname = fn[fn.Length - 1];
                FileUpload2.PostedFile.SaveAs((Server.MapPath(".") + ("\\FaceFingerPrintImages\\" + VoterID.ToString() + ".jpg")));
                

                saved = true;
            }
          
            if ((saved == true))
            {

                try
                {
                    clssendmail.MailSend(TextBox12.Text, "Confirmation", "You are added in user list with id : " + TextBox1.Text);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    return;
                }
                lblMessage.Text = "User Details Saved";
            }
            else
            {
                lblMessage.Text = "User Details Not Saved";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            cls.con.Close();
        }
        SqlDataSource1.SelectCommand = "SELECT [UserID], [UserName], [Address], [Phone], [Gender], [Password], [EmailId], [ImageType] FROM [UsersList] Where UserId='" + TextBox1.Text+ "'";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
        //  GridView2.DataBind();
    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {
     //   clsColorCode.textmessage = accno;
       // encaccno = clsColorCode.Encrypt();

        clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);

    }
    public string DecryptMessage(string encaccno)//ref byte[] key)
    {
/*
        clsColorCode.outputcolors.Clear();
        int r, g, b;
        for (int i = 0; i < encaccno.Length; i += 3)
        {
            r = ((int)encaccno[i]);
            g = ((int)encaccno[i + 1]);
            b = ((int)encaccno[i + 2]);

            clsColorCode.outputcolors.Add(Color.FromArgb(r, g, b));
        }
        return clsColorCode.Decrypt();
*/
       string accno = "";
       clsTripleDES des = new clsTripleDES();
        accno = des.Decrypt(encaccno);
       return accno;
    }
    int i;

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
             
                    if (e.Row.Cells[7].Text != "")
                    {
                        e.Row.Cells[7].Text ="<a href='FaceFingerPrintImages/" +e.Row.Cells[7].Text + "'><img src='FaceFingerPrintImages/" + e.Row.Cells[7].Text + "' width='100' height='100'/></a>";
                    }
              
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
