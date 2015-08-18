using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class SocialProf : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["login_name"]) == "")
        {
            Response.Redirect("register.aspx");
        }

        if (Convert.ToBoolean(Session["category_status"]))
        {
            int category = Convert.ToInt32(Session["category"]);

            if (category == 1)
                Response.Redirect("student_acad.aspx");
            else
                Response.Redirect("Teacher.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int ses_id = Convert.ToInt32(Session["login_name"]);
        if (!IsPostBack)
        {

            con.Open();
            String query = "select * from social_prof where reg_id='" + ses_id + "'";

            SqlCommand scmd = new SqlCommand(query, con);
            SqlDataReader sdr = scmd.ExecuteReader();
            if (sdr.Read())
            {
                txt_birthdate.Text = sdr.GetValue(1).ToString();
                //ddl_gender.SelectedValue = Convert.ToString(sdr.GetValue(2));
                ddl_gender.Items.FindByValue(sdr.GetValue(2).ToString().Trim()).Selected = true;
                //ddl_married.SelectedValue = Convert.ToString(sdr.GetValue(3));
                ddl_married.Items.FindByValue(sdr.GetValue(3).ToString().Trim()).Selected = true;
                txt_mob_no.Text = sdr.GetValue(4).ToString();
                txt_lang.Text = sdr.GetValue(5).ToString();
                txt_nationality.Text = sdr.GetValue(6).ToString();
                txt_hobbies.Text = sdr.GetValue(7).ToString();
                txt_aboutyourself.Text = sdr.GetValue(8).ToString();
            }
            con.Close();
        }
    }
    protected void next_but_Click(object sender, EventArgs e)
    {

        int ses_id = Convert.ToInt32(Session["login_name"]);

        //image save
        string fileExt = System.IO.Path.GetExtension(file_upload_profilepic.PostedFile.FileName).ToLower();
        string filename = ses_id + fileExt;

        if (fileExt == ".jpg")
        {
            string savePath = Request.PhysicalApplicationPath + "\\school\\profile_pics";
            string saveFile1 = Path.Combine(savePath, filename);
            file_upload_profilepic.SaveAs(saveFile1);

        }

        //insert or update detail

        con.Open();
        SqlCommand scmd;

        String str1 = "select social_status from regi_table where id='" + ses_id + "'";
        SqlCommand scmd1;
        scmd1 = new SqlCommand(str1, con);
        SqlDataReader sdr1 = scmd1.ExecuteReader();
        if (sdr1.Read())
        {
            String str3 = Convert.ToString(sdr1.GetValue(0));
            sdr1.Close();
            if (str3 == "True")    //insert
            {

                String str2 = "insert into social_prof(reg_id,birthdate,gender,maritalstatus,mobilenumber,languagesknown,nationality,hobbies,aboutyourself,profpic) values ('" + ses_id + "','" + txt_birthdate.Text + "','" + ddl_gender.SelectedValue + "','" + ddl_married.SelectedValue + "','" + txt_mob_no.Text + "','" + txt_lang.Text + "','" + txt_nationality.Text + "','" + txt_hobbies.Text + "','" + txt_aboutyourself.Text + "','" + filename + "')";

                scmd = new SqlCommand();
                scmd.CommandText = str2;
                scmd.CommandType = CommandType.Text;
                scmd.Connection = con;
                scmd.ExecuteNonQuery();

                String str5 = "update regi_table set social_status=0 where id='" + ses_id + "'";
                scmd = new SqlCommand(str5, con);
                scmd.ExecuteNonQuery();
                Response.Redirect("wall.aspx");


            }
            else   //update
            {
                string str4 = "update social_prof set birthdate='" + txt_birthdate.Text + "', gender='" + ddl_gender.SelectedValue + "',maritalstatus='" + ddl_married.SelectedValue + "' ,mobilenumber='" + txt_mob_no.Text + "',languagesknown='" + txt_lang.Text + "',nationality='" + txt_nationality.Text + "',hobbies='" + txt_hobbies.Text + "',aboutyourself='" + txt_aboutyourself.Text + "' where reg_id='" + ses_id + "' ";
                scmd = new SqlCommand(str4, con);
                scmd.Parameters.AddWithValue("@birthdate", txt_birthdate.Text);
                scmd.Parameters.AddWithValue("@mobilenumber", txt_mob_no.Text);
                scmd.Parameters.AddWithValue("@languagesknows", txt_lang.Text);
                scmd.Parameters.AddWithValue("@nationality", txt_nationality.Text);
                scmd.Parameters.AddWithValue("@hobbies", txt_hobbies.Text);
                scmd.Parameters.AddWithValue("@aboutyourself", txt_aboutyourself.Text);

                scmd.ExecuteNonQuery();
                next_but.Text = "Add";
                lbl_social_update.Text = "Success.";
                
            }
        }

        con.Close();

    }
    protected void ddl_married_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}