using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;


public partial class contact : System.Web.UI.Page
{
    // SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {


        if (IsPostBack)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add("campuscorner12@gmail.com");
            mail.From = new MailAddress("campuscorner12@gmail.com");
            mail.Subject = "Contact Us Form";
            string Body = "Username <b>'" + txt_user_name.Text + "'</b><br />" + "User Email <b>'" + txt_user_email.Text + "'</b><br / >" + "Message <b>'" + txt_user_msg.Text  + "'</b>";
            mail.Body = Body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["SMTP"];
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FROMEMAIL"], ConfigurationManager.AppSettings["FROMPWD"]);
            smtp.EnableSsl = true;
            smtp.Send(mail);
            lbl_contact_success.Text = "Your message has been successfully sent.";
        }
        
        doblank();

    }
    protected void doblank()
    {
        txt_user_email.Text = "";
        txt_user_msg.Text = "";
        txt_user_name.Text = "";
    }
}
