using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

    public class clssendmail
    {
        public static StreamReader sr = null;

        public static SqlConnection con = new SqlConnection("server=RECEPTION\\SQLEXPRESS2;database=digitalsecurity;integrated security=true");

        //public static SqlConnection con = new SqlConnection("server=.;database=CrimeInformationSystem;User id=sa;password=sa123");
        public static SqlCommand cmd = new SqlCommand("", con);
        public static String message = "";

        public static String loggeduser = "";
        public static String loggedusertype = "";
        public static String key = "";
        public static int snoRawMessage = 0;
        public static string MailSend(string toaddress, string subject, string messagebody)
        {
            try
            {
                SmtpClient c = new SmtpClient();
                NetworkCredential net1 = new NetworkCredential("softpromstest@gmail.com", "qwertyui!@#$");
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
    }

