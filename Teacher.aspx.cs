using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["login_name"]) == "" || Convert.ToInt32(Session["category"]) != 2)
        {
            Response.Redirect("register.aspx");
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {


        int ses_id = Convert.ToInt32(Session["login_name"]);
        con.Open();
        String query = "select * from teacher_academic where reg_id='" + ses_id + "'";

        SqlCommand scmd = new SqlCommand(query, con);
        SqlDataReader sdr = scmd.ExecuteReader();
        if (sdr.Read())
        {
            txt_degree.Text = sdr.GetValue(1).ToString();
            txt_clg.Text = sdr.GetValue(2).ToString();
            txt_uni.Text = sdr.GetValue(3).ToString();
            txt_project.Text = sdr.GetValue(4).ToString();
            txt_area_of_interest.Text = sdr.GetValue(5).ToString();
            txt_awards.Text = sdr.GetValue(6).ToString();
            ddl_dept.SelectedIndex = Convert.ToInt32(sdr.GetValue(7));



        }
        con.Close();
        if (!IsPostBack)
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

    protected void next_but_Click(object sender, EventArgs e)
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
            sdr1.Close();
            if (str3)
            {

                String str2 = "insert into teacher_academic(reg_id,degree,college_name,uni_name,projects,area_of_interest,awards,department) values('" + ses_id + "','" + txt_degree.Text + "','" + txt_clg.Text + "','" + txt_uni.Text + "','" + txt_project.Text + "','" + txt_area_of_interest.Text + "','" + txt_awards.Text + "','" + ddl_dept.SelectedValue + "')";

                scmd = new SqlCommand();
                scmd.CommandText = str2;
                scmd.CommandType = CommandType.Text;
                scmd.Connection = con;
                scmd.ExecuteNonQuery();

                String str5 = "update regi_table set category_status=0 where id='" + ses_id + "'";
                scmd = new SqlCommand(str5, con);
                scmd.ExecuteNonQuery();
                try
                {
                    Session["category_status"] = false;
                    Response.Redirect("wall.aspx");
                }
                catch (Exception ex)
                {
                    Response.Redirect("wall.aspx");
                }
                Response.Redirect("wall.aspx");


            }
            else
            {
                string str4 = "update teacher_academic set reg_id='" + ses_id + "',degree='" + txt_degree.Text + "', college_name='" + txt_clg.Text + "',uni_name='" + txt_uni.Text + "' ,projects='" + txt_project.Text + "',area_of_interest='" + txt_area_of_interest.Text + "',awards='" + txt_awards.Text + "',department='" + ddl_dept.SelectedValue + "' where reg_id='" + ses_id + "' ";
                scmd = new SqlCommand(str4, con);
                scmd.Parameters.Add("degree", txt_degree.Text);
                scmd.Parameters.Add("college_name", txt_clg.Text);
                scmd.Parameters.Add("uni_name", txt_uni.Text);
                scmd.Parameters.Add("projects", txt_project.Text);
                scmd.Parameters.Add("area_of_interest", txt_area_of_interest.Text);
                scmd.Parameters.Add("awards", txt_awards.Text);

                scmd.ExecuteNonQuery();
                try
                {
                    Session["category_status"] = false;
                    Response.Redirect("wall.aspx");
                }
                catch (Exception ex)
                {
                    Response.Redirect("wall.aspx");
                }
            }
        }
        Response.Redirect("wall.aspx");

        con.Close();


    }
}