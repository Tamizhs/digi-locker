using Microsoft.VisualBasic;
using System;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

partial class newuser : System.Web.UI.Page
{
    protected void Button1_Click(object sender, System.EventArgs e)
    {


        //SqlTransaction tran = null;
        try
        {
            //Dim d As Date = DateTime.ParseExact(S2.Text, "dd/MM/yyyy", Nothing)

            //        Dim f As Date = DateTime.ParseExact(S9.Text, "dd/MM/yyyy", 
            //    Nothing)

            if (cls.con.State != ConnectionState.Open) cls.con.Open();

            int passwordmode = 0;
            if (RadioButton2.Checked)
                passwordmode = 0;
            else if (RadioButton1.Checked)
                passwordmode = 1;
            else if (RadioButton3.Checked)
                passwordmode = 2;
            else if (RadioButton4.Checked)
                passwordmode = 3;
            else if (RadioButton5.Checked)
                passwordmode = 4;
            else if (RadioButton6.Checked)
                passwordmode = 5;

            string dynamicpasswordtype = "0";
            if (passwordmode == 1)
            {
                dynamicpasswordtype = DropDownList1.SelectedItem.Text;
            }
            else
            {
                dynamicpasswordtype = "0";
            }
            int userdefinedfunctiontype = 0;
            if (passwordmode == 2)
            {
                userdefinedfunctiontype = DropDownList2.SelectedIndex + 1;
            }
            else
            {
                userdefinedfunctiontype = 0;

            }
            int securitydegreetype = 0;
            /*if (passwordmode == 3)
            {
                securitydegreetype = DropDownList3.SelectedIndex + 1;
            }
            else
            {
                securitydegreetype = 0;
            }*/

            /*if (RadioButton4.Checked)
            {

                if (securitydegreetype == 1)
                {
                    //Very High
                    String pd = TextBox5.Text;
                    char[] alpha = new char[26];
                    for (int i = 0; i < 26; i++)
                    {
                        alpha[i] = (char)(i + 65);
                    }
                    char[] digits = new char[10];
                    for (int i = 0; i < 10; i++)
                    {
                        digits[i] = (char)(i + 48);
                    }


                    string tmp = "";
                    bool tempsuccess = true;
                    for (int i = 0; i < pd.Length; i++)
                    {
                        tmp = pd[i].ToString();
                        if (tmp.IndexOfAny(alpha) >= 0 || tmp.IndexOfAny(digits) >= 0 || tmp == "_" || tmp == ".")
                        {
                            tempsuccess = tempsuccess & true;
                        }
                        else
                        {
                            tempsuccess = false;
                            break;
                        }
                    }
                    if (tempsuccess == false)
                    {
                        Label5.Text = "Password Weak.";
                        return;
                    }
                  

                }
                else if (securitydegreetype >= 2)
                {

                    int minlen = 0;
                    if (securitydegreetype == 2)
                        minlen = 10;
                    else if (securitydegreetype == 3)
                        minlen = 8;
                    else if (securitydegreetype == 4)
                        minlen = 6;
                    //High
                    String pd = TextBox5.Text;
                    char[] alpha = new char[26];
                    for (int i = 0; i < 26; i++)
                    {
                        alpha[i] = (char)(i + 65);
                    }
                    char[] digits = new char[10];
                    for (int i = 0; i < 10; i++)
                    {
                        digits[i] = (char)(i + 48);
                    }


                    string tmp = "";
                    bool tempsuccess = true;
                    for (int i = 0; i < pd.Length; i++)
                    {
                        tmp = pd[i].ToString();
                        if (tmp.IndexOfAny(alpha) >= 0 || tmp.IndexOfAny(digits) >= 0)
                        {
                            tempsuccess = tempsuccess & true;
                        }
                        else
                        {
                            tempsuccess = false;
                            break;
                        }
                    }
                    if (pd.Length < minlen)
                    {
                        tempsuccess = false;
                    }

                    if (tempsuccess == false)
                    {
                        Label5.Text = "Password Weak.";
                        return;
                    }
                }
            }*/
            cls.cmd.CommandText = "delete from users where userid='" + ddlUserId.SelectedItem.Value + "'";
            cls.cmd.ExecuteNonQuery();
            cls.cmd.CommandText = "insert into users ([UserId], [UserName], [PasswordMode], [DynamicPasswordType], [UserDefinedFunctionType], [SecurityDegreeType], Password,Locked,UnlockCode,XValue,AValue) values('" + ddlUserId.SelectedItem.Value  + "','" + TextBox2.Text + "'," + passwordmode + ",'" + dynamicpasswordtype + "'," + userdefinedfunctiontype + "," + securitydegreetype + ",'" + TextBox5.Text + "',0,'','" + txtX.Text + "','" + txtA.Text + "')";


            if (cls.cmd.ExecuteNonQuery() > 0)
            {

                if (passwordmode == 5)
                {
                    DataTable dt = (DataTable)Session["codebookdt"];
                    for (int i1 = 1; i1 <= 4; i1++)
                    {
                        for (int j1 = 1; j1 <= 10; j1++)
                        {

                            cls.cmd.CommandText = "Insert into CodeBooks(UserId,RowNo,ColNo,DataValue) Values('" + ddlUserId.SelectedItem.Value  + "'," + i1.ToString() + "," + j1.ToString() + "," + dt.Rows[i1 - 1][j1 - 1].ToString() + ")";
                            cls.cmd.ExecuteNonQuery();
                        }
                    }
                }
                //SMSSend(TextBox3.Text, pin.ToString());

                //MailSend(TextBox4.Text, "Security Code", "Your security code from user activation is " + pin + "<BR/>" + "Your Password is " + pass);
                Label5.Text = "User Registration Details Are Successfully Saved";
                //clear()

            }
            else
            {
                Label5.Text = "User Registration Details are Not Saved";
            }
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message;

        }
        finally
        {
            cls.con.Close();
        }
    }
    public static void SMSSend(string tomobileno, string messagebody)
    {
        String smsusername = "karthi90";
        String smspassword = "9431007";// "43184449";

        HttpWebRequest wreq = (HttpWebRequest)WebRequest.Create("http://india.timessms.com/http-api/receiverall.asp?username=" + smsusername + "&password=" + smspassword + "&sender=Demo&cdmasender=9047885085&to=" + tomobileno + "&message=" + messagebody);
        HttpWebResponse wresp = (HttpWebResponse)wreq.GetResponse();
        System.IO.StreamReader sr = new System.IO.StreamReader(wresp.GetResponseStream());
        sr.ReadToEnd();
        sr.Close();

    }
    public static string MailSend(string toaddress, string subject, string messagebody)
    {
        try
        {
            SmtpClient c = new SmtpClient();
            NetworkCredential net1 = new NetworkCredential("softpromstest@gmail.com", "qwert!@#$%");
            c.UseDefaultCredentials = false;
            c.Credentials = net1;
            c.EnableSsl = true;
            c.Host = "smtp.gmail.com";

            //  SqlDataReader r;

            MailMessage objMailMessage = new MailMessage();
            MailAddress fromaddr = new MailAddress("softpromstest@gmail.com");
            objMailMessage.From = fromaddr;
            objMailMessage.Subject = subject;
            objMailMessage.Body = messagebody;
            objMailMessage.IsBodyHtml = true;
            MailAddress toaddr = new MailAddress(toaddress);
            objMailMessage.To.Add(toaddr);
            c.Send(objMailMessage);

            return "Mail Sent";

        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }
    protected void Page_Load(object sender, System.EventArgs e)
    {

        if (Page.IsPostBack == false)
        {
            if (cls.con.State != ConnectionState.Open) cls.con.Open();
           /* cls.cmd.CommandText = "Select count(Userid) from Users";
            string did = "";
            if (object.ReferenceEquals(cls.cmd.ExecuteScalar(), DBNull.Value))
            {
                did = "U001";
            }
            else
            {
                did = "U00" + (int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1);
            }
            TextBox1.Text = did;*/
            cls.cmd.CommandText = "Select VoterId,VoterName from VotersList";
            SqlDataReader r1 = cls.cmd.ExecuteReader();
            ddlUserId.Items.Add("Select");
            ListItem li = null;
            while (r1.Read())
            {
                li = new ListItem();
                li.Text = r1[0].ToString() + ":" + r1[1].ToString();
                li.Value = r1[0].ToString();
                ddlUserId.Items.Add(li);//r1[0].ToString());
            }
            r1.Close();


            cls.cmd.CommandText = "Select PasswordType From DynamicPasswords";

            SqlDataReader r = cls.cmd.ExecuteReader();
            DropDownList1.Items.Add("Select");
            while (r.Read())
            {
                DropDownList1.Items.Add(r[0].ToString());
            }
            r.Close();

            DataTable dt = new DataTable();
            DataColumn dc1 = new DataColumn();
            DataColumn dc2 = new DataColumn();
            DataColumn dc3 = new DataColumn();
            DataColumn dc4 = new DataColumn();
            DataColumn dc5 = new DataColumn();
            DataColumn dc6 = new DataColumn();
            DataColumn dc7 = new DataColumn();
            DataColumn dc8 = new DataColumn();
            DataColumn dc9 = new DataColumn();
            DataColumn dc10 = new DataColumn();
            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);
            dt.Columns.Add(dc8);
            dt.Columns.Add(dc9);
            dt.Columns.Add(dc10);

            DataRow dr = null;
            System.Random rn = new Random();
            List<int> nos = new List<int>();
            int temp;
            TableCell tc = null;
            for (int i = 0; i < 4; i++)
            {

                TableRow tr = new TableRow();

                nos.Clear();
                dr = dt.NewRow();

                for (int j = 0; j < 10; j++)
                {
                    tc = new TableCell();

                    do
                    {
                        temp = rn.Next(0, 10);
                    } while (nos.Contains(temp));
                    nos.Add(temp);
                    dr[j] = temp;
                    tc.Text = temp.ToString();
                    tr.Cells.Add(tc);
                }
                Table3.Rows.Add(tr);
                dt.Rows.Add(dr);
            }
            Session["codebookdt"] = dt;
        }

        else
        {
            DataTable dt = (DataTable)Session["codebookdt"];
            TableCell tc = null;
            for (int i = 0; i < 4; i++)
            {

                TableRow tr = new TableRow();

                //nos.Clear();
               // dr = dt.NewRow();

                for (int j = 0; j < 10; j++)
                {
                    tc = new TableCell();
                    /*
                    do
                    {
                        temp = rn.Next(0, 10);
                    } while (nos.Contains(temp));
                    nos.Add(temp);
                    dr[j] = temp;*/
                    tc.Text = dt.Rows[i][j].ToString();
                    tr.Cells.Add(tc);
                }
                Table3.Rows.Add(tr);
                //dt.Rows.Add(dr);
            }
        }
    }

    protected void Button3_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("default.aspx");
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {

        TOGGLECONTROLS();
        //DropDownList1.Enabled = RadioButton1.Checked;
        //DropDownList3.Enabled = RadioButton3.Checked;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cls.cmd);
        cls.cmd.CommandText = "Select * From DynamicPasswords Where PasswordType='" + DropDownList1.SelectedItem.Text + "'";
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {

        TOGGLECONTROLS();

    }
    void TOGGLECONTROLS()
    {
        TextBox5.Enabled = RadioButton2.Checked | RadioButton4.Checked;
        DropDownList1.Enabled = RadioButton1.Checked;
        DropDownList2.Enabled = RadioButton3.Checked;
        DropDownList3.Enabled = RadioButton4.Checked;
        Image1.Visible = RadioButton5.Checked;
        Image2.Visible = RadioButton5.Checked;
    }
    protected void RadioButton3_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void RadioButton5_CheckedChanged(object sender, EventArgs e)
    {
        TOGGLECONTROLS();

        if (RadioButton5.Checked)
        {
            String num = "";
            System.Random rn = new Random();

            for (int i = 0; i < 7; i++)
            {
                num += rn.Next(1, 8).ToString();
            }
            Label1.Text = num;
        }

    }
    protected void RadioButton4_CheckedChanged(object sender, EventArgs e)
    {
        TOGGLECONTROLS();
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex >= 7)
        {
            txtX.Enabled = true;
        }
        else
        {
            txtX.Enabled = false;
            txtA.Enabled = false;
            txtX.Text = "0";
            txtA.Text = "0";
        }
        if (DropDownList2.SelectedIndex == 12)
        {
            txtA.Enabled = true;
        }
        else if (DropDownList2.SelectedIndex == 13)
        {
            txtA.Enabled = true;
        }
        else if (DropDownList2.SelectedIndex == 14)
        {
            txtA.Enabled = true;
        }
        else if (DropDownList2.SelectedIndex == 16)
        {
            txtA.Enabled = true;
            txtX.Enabled = true;
        }
        else
        {
            txtA.Enabled = false;
            txtA.Text = "0";
        }

    }
    protected void ddlUserId_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox2.Text = ddlUserId.SelectedItem.Text.Split(new char[]{':'})[1];
    }
}