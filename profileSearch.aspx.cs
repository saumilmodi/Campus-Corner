using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using System.Data.Common;
using campusDAL;

using System.Collections.Specialized;
using System.Web;
public partial class profileSearch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        pnl_show_posts.Visible = true;
        con.Open();
        String str = Request.QueryString["ID"];
        int userid = Convert.ToInt32(str);
        string picname = userid + ".jpg";
        search_image.ImageUrl = "school/profile_pics/" + picname;

        String statusCheck = "select first_name+ ' '+last_name AS profile_name  from regi_table where id='" + userid + "'";
        SqlCommand command = new SqlCommand(statusCheck, con);

        SqlDataReader dataread = command.ExecuteReader();
        if (dataread.Read())
        {
            lbl_show_name.Text = Convert.ToString(dataread.GetValue(0));
            lbl_show_name.Visible = true;
        }
        con.Close();

        fill_gridview();

    }
    protected void fill_gridview()
    {
        con.Open();
         String str1 = Request.QueryString["ID"];
         int userid = Convert.ToInt32(str1);
       
        String str = "select regi_table.id as profile_id,status_id,social_prof.profpic,regi_table.first_name+ ' '+regi_table.last_name as profile_name,status_table.status_detail from status_table inner join social_prof on status_table.reg_id=social_prof.reg_id inner join regi_table on status_table.reg_id=regi_table.id  where regi_table.id=" +userid;
        DataSet dset = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(str, con);
        sda.Fill(dset);
        gv_show_posts.DataSource = dset;
        gv_show_posts.DataBind();
        con.Close();

    }

    protected void search_academic_prof_Click(object sender, EventArgs e)
    {
        con.Open();
        int categoryCheck;
        String str = Request.QueryString["ID"];
        int userid = Convert.ToInt32(str);








        String statusCheck = "select category from regi_table where id='" + userid + "'";
        SqlCommand command = new SqlCommand(statusCheck, con);

        SqlDataReader dataread = command.ExecuteReader();
        if (dataread.Read())
        {
            categoryCheck = Convert.ToInt32(dataread.GetValue(0));
            con.Close();
            if (categoryCheck == 1)   //if student
            {
                con.Open();
                profileArea.Visible = true;
                pnl_show_posts.Visible = false;
                social_profile_panel.Visible = false;
                String query = "select * from stud_academic where reg_id=" + userid;
                //String query = "select * from social_prof where reg_id=" +str;

                SqlCommand scmdq = new SqlCommand(query, con);
                SqlDataReader sdr1 = scmdq.ExecuteReader();
                if (sdr1.Read())
                {
                    lbl_search_area_of_interest.Visible = false;
                    txt_search_area_of_interest.Visible = false;
                    lbl_search_degree.Visible = false;
                    txt_search_degree.Visible = false;
                    lbl_search_cpi.Visible = true;
                    txt_search_cpi.Visible = true;
                    txt_search_cpi.Text = sdr1.GetValue(1).ToString();
                    lbl_search_10thperc.Visible = true;
                    txt_search_10thperc.Visible = true;

                    txt_search_10thperc.Text = sdr1.GetValue(2).ToString();
                    lbl_search_12thperc.Visible = true;
                    txt_search_12thperc.Visible = true;
                    txt_search_12thperc.Text = sdr1.GetValue(3).ToString();

                    lbl_search_10thboard.Visible = true;
                    txt_search_10thboard.Visible = true;
                    txt_search_10thboard.Text = sdr1.GetValue(4).ToString();
                    lbl_search_12thboard.Visible = true;
                    txt_search_12thboard.Visible = true;
                    txt_search_12thboard.Text = sdr1.GetValue(5).ToString();

                    lbl_search_10thschool.Visible = true;
                    txt_search_10thschool.Visible = true;
                    txt_search_10thschool.Text = sdr1.GetValue(6).ToString();
                    lbl_search_12thschool.Visible = true;
                    txt_search_12thschool.Visible = true;
                    txt_search_12thschool.Text = sdr1.GetValue(7).ToString();


                    lbl_search_uni.Visible = true;
                    txt_search_uni.Visible = true;
                    txt_search_uni.Text = sdr1.GetValue(8).ToString();



                    //ddl_search_dept.Visible = true;
                    //ddl_search_dept.Text = ddl_search_dept.SelectedValue;
                    //ddl_search_dept.Text = sdr1.GetValue(9).ToString();


                    lbl_search_sem.Visible = true;
                    txt_search_semyear.Visible = true;
                    txt_search_semyear.Text = sdr1.GetValue(10).ToString();


                    lbl_search_lang.Visible = true;
                    txt_search_lang.Visible = true;
                    txt_search_lang.Text = sdr1.GetValue(11).ToString();


                    lbl_search_webskill.Visible = true;
                    txt_search_webskill.Visible = true;
                    txt_search_webskill.Text = sdr1.GetValue(12).ToString();


                    lbl_search_database.Visible = true;
                    txt_search_database.Visible = true;
                    txt_search_database.Text = sdr1.GetValue(13).ToString();


                    lbl_search_seminar.Visible = true;
                    txt_search_seminar.Visible = true;
                    txt_search_seminar.Text = sdr1.GetValue(14).ToString();


                    lbl_search_pro.Visible = true;
                    txt_search_pro.Visible = true;
                    txt_search_pro.Text = sdr1.GetValue(15).ToString();


                    lbl_search_awards.Visible = true;
                    txt_search_awards.Visible = true;
                    txt_search_awards.Text = sdr1.GetValue(16).ToString();


                    String student_dropdown_query = "select dep_name from department_table where dep_id=" + Convert.ToString(sdr1.GetValue(9));
                    con.Close();
                    con.Open();

                    SqlCommand studentcmd = new SqlCommand(student_dropdown_query, con);
                    SqlDataReader sdr2 = studentcmd.ExecuteReader();
                    if (sdr2.Read())
                    {
                        txt_search_dept.Text = Convert.ToString(sdr2.GetValue(0));
                    }

                    con.Close();
                }
            }
            else                    //teacher
            {
                con.Open();
                social_profile_panel.Visible = false;
                profileArea.Visible = true;
                pnl_show_posts.Visible = false;
                String teacher_query = "select * from teacher_academic where reg_id=" + userid;
                SqlCommand cmd = new SqlCommand(teacher_query, con);
                SqlDataReader dreader = cmd.ExecuteReader();
                if (dreader.Read())
                {
                    txt_search_degree.Text = Convert.ToString(dreader.GetValue(1));
                    txt_search_uni.Text = Convert.ToString(dreader.GetValue(3));
                    txt_search_pro.Text = Convert.ToString(dreader.GetValue(4));
                    txt_search_area_of_interest.Text = Convert.ToString(dreader.GetValue(5));
                    txt_search_awards.Text = Convert.ToString(dreader.GetValue(6));
                    String dropdown_query = "select dep_name from department_table where dep_id=" + Convert.ToString(dreader.GetValue(7));
                    con.Close();

                    con.Open();

                    SqlCommand cmd1 = new SqlCommand(dropdown_query, con);
                    SqlDataReader dreader1 = cmd1.ExecuteReader();
                    if (dreader1.Read())
                    {
                        txt_search_dept.Text = Convert.ToString(dreader1.GetValue(0));
                    }

                    con.Close();
                }

            }



           
        }


    }
    protected void search_social_profile(object sender, EventArgs e)
    {
        profileArea.Visible = false;
        social_profile_panel.Visible = true;
        pnl_show_posts.Visible = false;
        con.Open();
        int categoryCheck;
        String str = Request.QueryString["ID"];
        int userid = Convert.ToInt32(str);
        String statusCheck = "select category from regi_table where id='" + userid + "'";
        SqlCommand command = new SqlCommand(statusCheck, con);

        SqlDataReader dataread = command.ExecuteReader();
        if (dataread.Read())
        {
            categoryCheck = Convert.ToInt32(dataread.GetValue(0));
            con.Close();
            if (categoryCheck == 1)   //if student
            {
                string student_social_query = "select * from social_prof where reg_id=" + userid;
                con.Open();
                SqlCommand scmdq = new SqlCommand(student_social_query, con);
                SqlDataReader sdr1 = scmdq.ExecuteReader();
                if (sdr1.Read())
                {
                    txt_search_aboutyourself.Text = Convert.ToString(sdr1.GetValue(8));
                    txt_search_birthdate.Text = Convert.ToString(sdr1.GetValue(1));
                    txt_search_mob_no.Text = Convert.ToString(sdr1.GetValue(4));
                    txt_search_language.Text = Convert.ToString(sdr1.GetValue(5));
                    txt_search_nationality.Text = Convert.ToString(sdr1.GetValue(6));
                    txt_search_hobbies.Text = Convert.ToString(sdr1.GetValue(7));
                   
                    txt_search_gender.Text = Convert.ToString(sdr1.GetValue(2));
                    txt_search_marital.Text = Convert.ToString(sdr1.GetValue(3));
                }

            }
        }
    }
}

