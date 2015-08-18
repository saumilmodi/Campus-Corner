using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class student_acad : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["login_name"]) == "" || Convert.ToInt32(Session["category"]) != 1)
        {
            Response.Redirect("register.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {


        int ses_id = Convert.ToInt32(Session["login_name"]);
        if (!IsPostBack)
        {
            con.Open();
            String query = "select * from stud_academic where reg_id='" + ses_id + "'";

            SqlCommand scmd = new SqlCommand(query, con);
            SqlDataReader sdr = scmd.ExecuteReader();
            if (sdr.Read())
            {
                txt_cpi.Text = sdr.GetValue(1).ToString();
                txt_10thperc.Text = sdr.GetValue(2).ToString();
                txt_12thperc.Text = sdr.GetValue(3).ToString();
                txt_10thboard.Text = sdr.GetValue(4).ToString();
                txt_12thboard.Text = sdr.GetValue(5).ToString();
                txt_10thschool.Text = sdr.GetValue(6).ToString();
                txt_12thschool.Text = sdr.GetValue(7).ToString();
                txt_uni.Text = sdr.GetValue(8).ToString();
                ddl_dept.SelectedIndex = Convert.ToInt32(sdr.GetValue(9));
                txt_semyear.Text = sdr.GetValue(10).ToString();
                txt_lang.Text = sdr.GetValue(11).ToString();
                txt_webskill.Text = sdr.GetValue(12).ToString();
                txt_database.Text = sdr.GetValue(13).ToString();
                txt_seminar.Text = sdr.GetValue(14).ToString();
                txt_pro.Text = sdr.GetValue(15).ToString();
                txt_awards.Text = sdr.GetValue(16).ToString();


            }
            con.Close();
        }
        if (!IsPostBack) //dynamically fill drop down
        {
            con.Open();
            string str = "Select * from department_table ";
            DataSet dset = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(str, con);
            sda.Fill(dset);
            ddl_dept.DataSource = dset;
            ddl_dept.DataTextField = dset.Tables[0].Columns[1].ToString();
            ddl_dept.DataValueField = dset.Tables[0].Columns[0].ToString();
            ddl_dept.DataBind();
            con.Close();

            ddl_dept.Items.Insert(0, "Select Department...");
        }
    }
    protected void Btn_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand scmd;
        int ses_id = Convert.ToInt32(Session["login_name"]);
        String str1 = "select category_status from regi_table where id='" + ses_id + "'";
        SqlCommand scmd1;
        scmd1 = new SqlCommand(str1, con);
        SqlDataReader sdr1 = scmd1.ExecuteReader();
        if (sdr1.Read())
        {
            Boolean str3 = Convert.ToBoolean(sdr1.GetValue(0));
            con.Close();
            if (str3) //if category_status is true,then insert
            {
                con.Open();

                String str2 = "insert into stud_academic(reg_id,cpi,tenth_per,twelth_per,tenth_board,twelth_board,tenth_school,twelth_school,university,dept,sem_year,lang,web_skill,database_known,seminar,project,awards_achieved) values('" + ses_id + "','" + txt_cpi.Text + "','" + txt_10thperc.Text + "','" + txt_12thperc.Text + "','" + txt_10thboard.Text + "','" + txt_12thboard.Text + "','" + txt_10thschool.Text + "','" + txt_12thschool.Text + "','" + txt_uni.Text + "','" + ddl_dept.SelectedValue + "'," + txt_semyear.Text + ",'" + txt_lang.Text + "','" + txt_webskill.Text + "','" + txt_database.Text + "','" + txt_seminar.Text + "','" + txt_pro.Text + "','" + txt_awards.Text + "')";

                scmd = new SqlCommand();
                scmd.CommandText = str2;
                scmd.CommandType = CommandType.Text;
                scmd.Connection = con;
                scmd.ExecuteNonQuery();

                String str5 = "update regi_table set category_status=0 where id='" + ses_id + "'";
                scmd = new SqlCommand(str5, con);
                scmd.ExecuteNonQuery();
                con.Close();
                try
                {
                    Session["category_status"] = false;
                    Response.Redirect("SocialProf.aspx");
                }
                catch (Exception ex)
                {
                    Response.Redirect("SocialProf.aspx");
                }
            }
            else
            {
                con.Open();
                SqlCommand scmd2;
                try
                {


                    string str4 = "update stud_academic set reg_id='" + ses_id + "',cpi='" + txt_cpi.Text + "', tenth_per='" + txt_10thperc.Text + "',twelth_per='" + txt_12thperc.Text + "' ,tenth_board='" + txt_10thboard.Text + "',twelth_board='" + txt_12thboard.Text + "',tenth_school='" + txt_10thschool.Text + "',twelth_school='" + txt_12thschool.Text + "',university='" + txt_uni.Text + "',dept='" + ddl_dept.SelectedValue + "' ,sem_year=" + txt_semyear.Text + ",lang='" + txt_lang.Text + "',web_skill='" + txt_webskill.Text + "',database_known='" + txt_database.Text + "',seminar='" + txt_seminar.Text + "',project='" + txt_pro.Text + "',awards_achieved='" + txt_awards.Text + "' where reg_id='" + ses_id + "' ";
                    scmd2 = new SqlCommand(str4, con);
                    scmd2.Parameters.AddWithValue("cpi", txt_cpi.Text);
                    scmd2.Parameters.AddWithValue("@tenth_per", txt_10thperc.Text);
                    scmd2.Parameters.AddWithValue("@twelth_per", txt_12thperc.Text);
                    scmd2.Parameters.AddWithValue("@tenth_board", txt_10thboard.Text);
                    scmd2.Parameters.AddWithValue("@twelth_board", txt_12thboard.Text);
                    scmd2.Parameters.AddWithValue("@tenth_school", txt_10thschool.Text);
                    scmd2.Parameters.AddWithValue("@twelth_school", txt_12thschool.Text);
                    scmd2.Parameters.AddWithValue("@university", txt_uni.Text);
                    scmd2.Parameters.AddWithValue("@sem_year", txt_semyear.Text);
                    scmd2.Parameters.AddWithValue("@lang", txt_lang.Text);
                    scmd2.Parameters.AddWithValue("@web_skill", txt_webskill.Text);
                    scmd2.Parameters.AddWithValue("@database_known", txt_database.Text);
                    scmd2.Parameters.AddWithValue("@seminar", txt_seminar.Text);
                    scmd2.Parameters.AddWithValue("@project", txt_pro.Text);
                    scmd2.Parameters.AddWithValue("@awards_achieved", txt_awards.Text);

                    scmd2.ExecuteNonQuery();
                    lbl_academic_update.Text = "Successfully Updated.";
                    con.Close();
                   // Response.Redirect("SocialProf.aspx");

                }
                catch (Exception ex)
                {
                    Response.Redirect("SocialProf.aspx");

                }

            }
        }

        con.Close();
    }
    protected void ddl_dept_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_academic_update_Click(object sender, EventArgs e)
    {
        
        lbl_academic_update.Text = "Successfully Updated.";
       
    }
}