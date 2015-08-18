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


public partial class wall : System.Web.UI.Page
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

        con.Open();
        int ses_id = Convert.ToInt32(Session["login_name"]);
        string picname = ses_id + ".jpg";
        string query = "select first_name+ ' '+last_name as name from regi_table where id=" + ses_id;
        SqlCommand scmd = new SqlCommand(query, con);
        SqlDataReader sdr = scmd.ExecuteReader();
        if (sdr.Read())
        {
            lbl_username.Text = Convert.ToString(sdr.GetValue(0));
        }
        con.Close();

        if (!IsPostBack)
        {
            img_profile_pic.ImageUrl = "school/profile_pics/" + picname;

        }

        fill();


    }
    protected void btn_changepic_Click(object sender, EventArgs e)
    {
        int ses_id = Convert.ToInt32(Session["login_name"]);
        string fileExt = System.IO.Path.GetExtension(fileupload_profilepic.PostedFile.FileName).ToLower();

        if (fileExt == ".jpg" || fileExt == ".png" || fileExt == ".jpeg")
        {
            string filename = ses_id + fileExt;
            string savePath = Request.PhysicalApplicationPath + "\\school\\profile_pics";
            string saveFile1 = Path.Combine(savePath, filename);
            fileupload_profilepic.SaveAs(saveFile1);

        }
    }
    protected void btn_status_Click(object sender, EventArgs e)
    {


        con.Open();
        SqlCommand scmd;
        int a = 1;
        DataSet ds = new DataSet();
        String str = "select status_id from status_table";
        SqlDataAdapter sdr = new SqlDataAdapter(str, con);
        sdr.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            String str1 = "select max(status_id) from status_table";
            scmd = new SqlCommand(str1, con);
            SqlDataReader sdr1 = scmd.ExecuteReader();
            while (sdr1.Read())
            {
                a = Convert.ToInt32(sdr1.GetValue(0)) + 1;
            }
        }
        con.Close();
        int ses_id = Convert.ToInt32(Session["login_name"]);
        con.Open();
        String str2 = "insert into status_table(status_id,reg_id,status_detail) values('" + a + "','" + ses_id + "','" + txt_status.Text + "')";
        scmd = new SqlCommand();
        scmd.CommandText = str2;
        scmd.CommandType = CommandType.Text;
        scmd.Connection = con;
        scmd.ExecuteNonQuery(); 
        con.Close();
        fill();
        Response.Redirect("wall.aspx");



        doblank();



    }


    protected void doblank()
    {
        txt_status.Text = "";

    }

    protected void fill()
    {
        con.Open();
        String str = "select regi_table.id as profile_id,status_id,social_prof.profpic,regi_table.first_name+ ' '+regi_table.last_name as profile_name,status_table.status_detail from status_table inner join social_prof on status_table.reg_id=social_prof.reg_id inner join regi_table on status_table.reg_id=regi_table.id ORDER BY status_id DESC ";
        DataSet dset = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(str, con);
        sda.Fill(dset);
        GridView1.DataSource = dset;
        GridView1.DataBind();
        con.Close();

    }

    protected void btn_academic_prof_Click(object sender, EventArgs e)
    {
        int category = Convert.ToInt32(Session["category"]);
        if (category == 1)
            Response.Redirect("student_acad.aspx");
        else
            Response.Redirect("Teacher.aspx");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        fill();
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        pnlProfileList.Visible = true;
        con.Open();
        notificationPanel.Visible = false;
        postPanel.Visible = false;

        DataTable dt = new DataTable();
        String str = "SELECT id,first_name + ' '+ last_name as name, profpic FROM regi_table rt LEFT JOIN social_prof sp ON sp.reg_id = rt.id WHERE first_name+ ' ' +last_name LIKE '%" + txtSearch.Text + "%' OR last_name+ ' ' +first_name LIKE '%" + txtSearch.Text + "%' ";
        SqlCommand scmd = new SqlCommand(str, con);
        SqlDataAdapter sda = new SqlDataAdapter(str, con);

        sda.Fill(dt);
        SqlDataReader sdr = scmd.ExecuteReader();

        if (!sdr.Read())
        {

            lbl_no_user.Text = "No search found.";


        }
        //string strName = txtSearch.Text;
        //profile objProfile  = new profile();
        //objProfile.Name = strName;
        //DataTable dtProfileList = objProfile.SearchByName();
        gvProfiles.DataSource = dt;
        gvProfiles.DataBind();
    }

}
