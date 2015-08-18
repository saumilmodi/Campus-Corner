using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Configuration;
public partial class register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void butt_joinus_Click(object sender, EventArgs e)
    {
        try
        {

            if (txt_confirm.Text.Equals(txt_pass.Text))
            {
                con.Open();
                SqlCommand scmd;
                int a = 1;
                DataSet ds = new DataSet();
                String str = "select id from regi_table";
                SqlDataAdapter sdr = new SqlDataAdapter(str, con);
                sdr.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    String str1 = "select max(id) from regi_table";
                    scmd = new SqlCommand(str1, con);
                    SqlDataReader sdr1 = scmd.ExecuteReader();
                    while (sdr1.Read())
                    {
                        a = Convert.ToInt32(sdr1.GetValue(0)) + 1;
                    }
                }
                con.Close();
                con.Open();
                String str2 = "insert into regi_table(id,first_name,last_name,email,password,category,category_status,social_status) values('" + a + "','" + txt_fname.Text + "','" + txt_lname.Text + "','" + txt_email.Text + "','" + txt_pass.Text + "','" + ddl_category.SelectedValue + "',1,1)";
                scmd = new SqlCommand();
                scmd.CommandText = str2;
                scmd.CommandType = CommandType.Text;
                scmd.Connection = con;
                scmd.ExecuteNonQuery();

                con.Close();
                lbl_success_msg.Visible = true;
                
                doblank();
            }
            else
            {

                Response.Redirect("register.aspx");
            }
        }
        catch (Exception ex)
        {
            lbl_forget_error.Visible = true;
        }

    }
    protected void doblank()
    {
        txt_fname.Text = "";
        txt_lname.Text = "";
        txt_email.Text = "";
        txt_pass.Text = "";
        txt_confirm.Text = "";
        ddl_category.SelectedIndex = 0;
    }


    protected void btn_login_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand scmd;
        String a;
        int b;


        String str = "select password,category,id,category_status from regi_table where email='" + txt_login_email.Text + "'";



        scmd = new SqlCommand(str, con);
        SqlDataReader sdr1 = scmd.ExecuteReader();
        if (sdr1.Read())
        {
            a = Convert.ToString(sdr1.GetValue(0));
            if (a == txt_login_password.Text)
            {
                b = Convert.ToInt32(sdr1.GetValue(1));
                Boolean cat_status = Convert.ToBoolean(sdr1.GetValue(3));
                //session
                int ses_id = Convert.ToInt32(sdr1.GetValue(2));

                Session["login_name"] = ses_id;

                con.Close();
                if (b == 1)//if student
                {
                    Session["category"] = 1;                    //**//
                    Session["category_status"] = cat_status;    //**//

                    if (!cat_status)
                        Response.Redirect("wall.aspx");
                    else
                        Response.Redirect("student_acad.aspx");
                }
                else
                {
                    Session["category"] = 2;
                    Session["category_status"] = cat_status;

                    if (!cat_status)
                        Response.Redirect("wall.aspx");
                    else
                        Response.Redirect("Teacher.aspx");
                }
            }
            else
            {


                lbl_message.Visible = true;
            }

        }
        else
        {


            lbl_wrongusername.Text ="The username or password you entered is incorrect";
        }

    }
    protected void btn_forget_password_Click(object sender, EventArgs e)
    {


        pnl_forget_password.Visible = true;

    }

    protected void btn_forget_password_mail_click(object sender, EventArgs e)
    {

        con.Open();
        string password;
        string query = "select password from regi_table where email='" + txt_forget_email.Text + "'";
        SqlCommand scmd = new SqlCommand(query, con);
        SqlDataReader sdr = scmd.ExecuteReader();

        if (sdr.Read())
        {
            password = Convert.ToString(sdr.GetValue(0));
            txt_mail_password.Text = password;
        }

        if (IsPostBack)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(txt_forget_email.Text);
            mail.From = new MailAddress("campuscorner12@gmail.com");
            mail.Subject = "Forgot Password";
            string Body = "Your Password: <b>'" + txt_mail_password.Text + "'</b>";
            mail.Body = Body;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = ConfigurationManager.AppSettings["SMTP"];
            smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FROMEMAIL"], ConfigurationManager.AppSettings["FROMPWD"]);
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
        txt_forget_email.Text = "";
        lbl_sent_password.Visible = true;
        con.Close();


    }
}