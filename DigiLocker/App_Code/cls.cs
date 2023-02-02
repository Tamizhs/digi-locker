using System;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for cls
/// </summary>
public class cls
{
    public static SqlConnection con = new SqlConnection("Server=LAPTOP-INAPGOK8\\SQLEXPRESS;database=DigitalSecurity;Integrated Security=true");//user id=sa;password=");
    //public static SqlConnection con2 = new SqlConnection("Server=RECEPTION\\SQLEXPRESS2;database=digitalsecurity;Integrated Security=true");//user id=sa;password=");
    //Public con As New OleDbConnection("Server=.;database=OnFairness;user id=sa;password=") 
    public static SqlCommand cmd = new SqlCommand("", con);
    // public static SqlCommand cmd2 = new SqlCommand("", con2);
    public cls()
    {

        //
        // TODO: Add constructor logic here
        //
    }

    public static string MailSend(string toaddress, string subject, string messagebody)
    {
        try
        {
            SmtpClient c = new SmtpClient();
            //  NetworkCredential net1 = new NetworkCredential("softpromstest@gmail.com", "pfhpblaozpawjkuu");
            NetworkCredential net1 = new NetworkCredential("tamizhselviktm58@gmail.com", "yufmywxpzaciigkg");

            c.UseDefaultCredentials = false;
            c.Credentials = net1;
            c.EnableSsl = true;
            c.Host = "smtp.gmail.com";

            //  SqlDataReader r;

            MailMessage objMailMessage = new MailMessage();
            MailAddress fromaddr = new MailAddress("tamizhselviktm58@gmail.com");
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
    public static void SMSSend(string tomobileno, string messagebody)
    {
        String smsusername = "ishwaryanec";
        String smspassword = "27592345";// "43184449";

        try
        {
            HttpWebRequest wreq = (HttpWebRequest)WebRequest.Create("http://india.timessms.com/http-api/receiverall.asp?username=" + smsusername + "&password=" + smspassword + "&sender=Demo&cdmasender=9976104066&to=" + tomobileno + "&message=" + messagebody);
            HttpWebResponse wresp = (HttpWebResponse)wreq.GetResponse();
            System.IO.StreamReader sr = new System.IO.StreamReader(wresp.GetResponseStream());
            sr.ReadToEnd();
            sr.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
        }

    }
    public void Enable(ref Page f, bool mode)
    {
        foreach (Control x in f.Controls)
        {
            if ((x is TextBox))
            {
                ((TextBox)(x)).Enabled = mode;
            }
            else if ((x is DropDownList))
            {
                ((DropDownList)(x)).Enabled = mode;
            }
        }
    }
}
