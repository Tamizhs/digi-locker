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

public partial class adddocument : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Page.IsPostBack == false))
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }

            TextBox1.Text = Session["un"].ToString();
            TextBox2.Text = Session["username"].ToString();
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                SqlDataSource1.SelectCommand = "SELECT [SNo],EntryDate,UserId, [UserName], [Title], [FilePath] FROM [Documents] Where UserId='" + TextBox1.Text + "'";
                SqlDataSource1.DataBind();
                GridView1.DataBind();
           

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
            bool saved = false;
            string VoterID = "";
            string VoterName = "";
            string title = "";
            VoterID = TextBox1.Text;
            VoterName = TextBox2.Text;
            title = TextBox3.Text;
            cls.cmd.CommandText = "Select count(*) from Documents";
            int cnt = int.Parse(cls.cmd.ExecuteScalar().ToString())+1;
string ext="";
            if (FileUpload2.PostedFile != null)
            {
                string[] fn = FileUpload2.PostedFile.FileName.Split(new char[] { '\\' });
                fname = fn[fn.Length - 1];
                FileUpload2.PostedFile.SaveAs((Server.MapPath(".") + ("\\DocumentImages\\" + fname)));
                System.IO.FileInfo f = new System.IO.FileInfo(Server.MapPath(".") + ("\\DocumentImages\\" + fname));
                
          ext=      f.Extension;
                f.MoveTo (Server.MapPath(".") + "\\DocumentImages\\" + cnt.ToString() + ext);
                saved = true;
            }


            cls.cmd.CommandText = "insert into Documents ([SNo], [EntryDate],UserId,UserName, [Title], [FilePath]) values('" + cnt.ToString() + "','" + string.Format("{0:MM-dd-yyyy hh:mm:ss tt}",DateTime.Now) + "','" +  VoterID.Replace("'", "''") + "','" + VoterName.Replace("'", "''") + "','" + title.Replace("'", "''") + "','" + cnt + "" + ext + "')";
            cls.cmd.ExecuteNonQuery();

          

           if ((saved == true))
            {
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
        SqlDataSource1.SelectCommand = "SELECT [SNo],EntryDate,UserId, [UserName], [Title], [FilePath] FROM [Documents] Where UserId='" + TextBox1.Text + "'";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
        //  GridView2.DataBind();
    }
    
    int i;

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.Cells[5].Text != "")
                {
                    e.Row.Cells[5].Text = "<a href='DocumentImages/" + e.Row.Cells[5].Text + "'><img src='DocumentImages/" + e.Row.Cells[5].Text + "' width='100' height='100'/></a>";
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
