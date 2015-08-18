using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class material : System.Web.UI.Page
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
            lbl_username_material.Text = Convert.ToString(sdr.GetValue(0));
        }
        con.Close();

        if (!IsPostBack)
        {
            img_profile_pic_material.ImageUrl = "school/profile_pics/" + picname;

        }













        int category = Convert.ToInt32(Session["category"]);
        if (category == 1)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
        
        MultiView1.ActiveViewIndex = 0;
    }
        
        if (!IsPostBack)
        {
            con.Open();
            string str = "Select * from subject_table ";
            DataSet dset = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(str, con);
            sda.Fill(dset);
            ddl_subject.DataSource = dset;
            ddl_subject.DataTextField = dset.Tables[0].Columns[1].ToString();
            ddl_subject.DataValueField = dset.Tables[0].Columns[0].ToString();
            ddl_subject.DataBind();

            ddl_subject1.DataSource = dset;
            ddl_subject1.DataTextField = dset.Tables[0].Columns[1].ToString();
            ddl_subject1.DataValueField = dset.Tables[0].Columns[0].ToString();
            ddl_subject1.DataBind();

            con.Close();

            ddl_subject.Items.Insert(0, "Select Subject...");
            ddl_subject1.Items.Insert(0, "Select Subject...");
        }


    }
    protected void next_but_Click(object sender, EventArgs e)
    {
        int ses_id=Convert.ToInt32(Session["login_name"]);
        //material save
        string fileExt = System.IO.Path.GetExtension(file_upload_material.PostedFile.FileName).ToLower();
        string filename = ddl_subject.SelectedItem + "\\" + txt_title.Text + fileExt;
        string savePath = Request.PhysicalApplicationPath + "\\school\\material";
        string saveFile1 = Path.Combine(savePath, filename);
        file_upload_material.SaveAs(saveFile1);

        //insert to table
        con.Open();
        SqlCommand scmd;
        int a = 1;
        DataSet ds = new DataSet();
        String str = "select material_id from material_table";
        SqlDataAdapter sdr = new SqlDataAdapter(str, con);
        sdr.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            String str1 = "select max(material_id) from material_table";
            scmd = new SqlCommand(str1, con);
            SqlDataReader sdr1 = scmd.ExecuteReader();
            while (sdr1.Read())
            {
                a = Convert.ToInt32(sdr1.GetValue(0)) + 1;
            }
        }
        con.Close();
        con.Open();
        String str2 = "insert into material_table(material_id,material_title,material_filename,sub_id,reg_id) values('" + a + "','" + txt_title.Text + "','" + filename + "'," + ddl_subject.SelectedValue + ","+ses_id+")";
        scmd = new SqlCommand();
        scmd.CommandText = str2;
        scmd.CommandType = CommandType.Text;
        scmd.Connection = con;
        scmd.ExecuteNonQuery();

        lbl_tearcher_upload.Text = "Material has been uploaded Successfully.";

        con.Close();

        doblank();
    }
    protected void doblank()
    {
        ddl_subject.SelectedIndex = 0;
        txt_title.Text = "";
    }


    protected void btn_show_Click(object sender, EventArgs e)
    {

        fill();
    }

    protected void fill()
    {
        con.Open();
        String str = "select material_title,material_filename from material_table where sub_id=" + ddl_subject1.SelectedIndex + " ORDER BY material_id DESC";
        DataSet dset = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(str, con);
        sda.Fill(dset);
        grdview_material.DataSource = dset;
        grdview_material.DataBind();
        con.Close();

    }
    protected void grdview_material_SelectedIndexChanged(object sender, EventArgs e)
    {
        string file = Request.ApplicationPath + "/school/material/" + ((Label)grdview_material.SelectedRow.Cells[0].Controls[1]).Text;
        Response.Redirect(file);
    }
    protected void grdview_material_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdview_material.PageIndex = e.NewPageIndex;
        fill();
    }
    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {

    }
}