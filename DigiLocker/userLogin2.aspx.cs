using System;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class userLogin2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["userid"].ToString() == ""))
        {
            Response.Redirect("userlogin.aspx");
            return;
        }
        if ((Page.IsPostBack == false))
        {
            TextBox1.Text = Session["userid"].ToString();
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
         
           /* cls.cmd.CommandText = "select B.CandidateId,A.CandidateName,C.PartyName from CandidatesList A,Candidate_ZoneDetails B,Parties C  Where C.PartyId=B.PartyId and A.CandidateId=B.CandidateId and B.ZoneId=" + Label2.Text;
            SqlDataReader r = cls.cmd.ExecuteReader();
            while (r.Read())
            {
                DropDownList1.Items.Add(r[0].ToString() + ":" + r[1].ToString() + ":" + r[2].ToString());
            }
            r.Close();*/
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }
  
     
        if (true)
        {
            try
            {
                string fn = (Server.MapPath(".") + ("\\TempImages\\"
                             + (DateTime.Now.Ticks + ".jpg")));
                 FileUpload2.PostedFile.SaveAs(fn);
                 //             Dim fn() As String = Split(FileUpload1.PostedFile.FileName, "\")
                 //            fname = fn(UBound(fn))
                 //           FileUpload1.PostedFile.SaveAs(Server.MapPath(".") & "\CandidateFingerPrintImages\" & fname)
                 System.IO.FileStream f = new System.IO.FileStream(fn, System.IO.FileMode.Open);

                System.IO.FileStream f0 = new System.IO.FileStream(Server.MapPath(".") + "\\FaceFingerPrintImages\\" + Session["un"].ToString() +".jpg", System.IO.FileMode.Open);
                 //cls.cmd.CommandText = "select DataLength(FingerPrintImage) From VotersList Where VoterId=" + Session["un"].ToString();

                 byte[] b1 = new byte[f0.Length];
                    f0.Read (b1,0,b1.Length);

                 byte[] b2 = new byte[f.Length];
                  f.Read (b2,0,b2.Length);
                  
                 /*cls.cmd.CommandText = "select FingerPrintImage From VotersList Where VoterId=" + Session["un"].ToString();
                 b1 = ((byte[])(cls.cmd.ExecuteScalar()));
                 f.Read(b2, 0, b2.Length);*/
                  bool found1;
                  found1 = true;
                  if (f.Length != f0.Length)
                  {
                      found1 = false;

                  }
                  else
                  {
                      for (int i = 0; (i <= (f.Length - 1)); i++)
                      {
                          if ((b1[i] != b2[i]))
                          {
                              found1 = false;
                              break;
                          }
                      }

                  }
                 f.Close();
                 f = null;
                 f0.Close();
                 f0 = null;


                if (found1)
                {

                 
                    //Label1.Text = "User Validated.";
                    Response.Redirect("adddocument.aspx");
                }
                else
                {
                    Label1.Text = "Image Not Matched";
                }
             //   f2.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                if ((cls.con.State != ConnectionState.Closed))
                {
                    cls.con.Close();
                }
            down:
                int t;
            }
        }

    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {
       // clsColorCode.textmessage = accno;
       // encaccno = clsColorCode.Encrypt();

      clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);
    }
    public string DecryptMessage(string encaccno)//ref byte[] key)
    {
        /*clsColorCode.outputcolors.Clear();
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
}
