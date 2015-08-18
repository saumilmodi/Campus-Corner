using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Text;


public partial class _cv : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Database.mdf;Integrated Security=True;User Instance=True");
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["login_name"]) == "")
        {
            Response.Redirect("register.aspx");
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            int ses_id = Convert.ToInt32(Session["login_name"]);
            DataSet dset = new DataSet();
            string str = "SELECT regi_table.first_name,regi_table.last_name,social_prof.mobilenumber,regi_table.email,stud_academic.dept,stud_academic.cpi,stud_academic.twelth_board,stud_academic.twelth_per,stud_academic.tenth_board,stud_academic.tenth_per,social_prof.birthdate,social_prof.gender,social_prof.maritalstatus,social_prof.nationality,social_prof.languagesknown,social_prof.hobbies,stud_academic.lang,stud_academic.web_skill,stud_academic.project,stud_academic.database_known,stud_academic.seminar from regi_table INNER JOIN social_prof ON regi_table.id = social_prof.reg_id INNER JOIN stud_academic ON regi_table.id = stud_academic.reg_id where regi_table.id= '" + ses_id + "'";
            SqlDataAdapter sda = new SqlDataAdapter(str, con);
            sda.Fill(dset);
            GridView1.DataSource = dset;
            GridView1.DataBind();
            con.Close();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.ContentType = "application/msword";
            string strFileName = "EmployeeReport_Id." + "JaydeeID" + ".doc";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "inline;filename=" + strFileName);


            StringBuilder strHTMLContent = new StringBuilder();

            strHTMLContent.Append("<table cellspacing='10'>".ToString());
            strHTMLContent.Append("<tr><td style='text-align:center'><table align='center' style='font-size: 14px' width='100%'>".ToString());

            strHTMLContent.Append("<tr><td style='font-size: 16px; font-weight: bold; font-variant: small-caps; text-decoration: underline;text-align: center'>".ToString());

            strHTMLContent.Append("CURRICULUM VITAE</td></tr><tr><td style='text-align: center'>" + GridView1.Rows[0].Cells[0].Text + " " + GridView1.Rows[0].Cells[1].Text + "</td></tr><tr><td style='text-align: center'>(M) " + GridView1.Rows[0].Cells[2].Text+"</td></tr><tr><td style='text-align: center'>" +  GridView1.Rows[0].Cells[3].Text+"</td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; text-decoration: underline; font-weight: bold'>Career Objective:</td></tr><tr style='font: 12px'><td>".ToString());
            strHTMLContent.Append("I want to build a career with leading corporate of hi-tech atmosphere with committed and dedicated people, which will help me to explore myself fully and realize my potential, willingness to work in a creative and challenging atmosphere.</td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Academic Performance:<br /><br /></td></tr><tr><td>".ToString());
            strHTMLContent.Append("<table border='1' cellpadding='1' cellspacing='0' width='500'><tr><th>Degree /Certificate</th><th>University /Board</th><th>Year of Passing</th><th>CPI/Percentage</th></tr>".ToString());
            strHTMLContent.Append("<tr><td>B.E. Computer Engineering</td><td>Gujarat Technological University</td><td>June 2013</td><td>CPI : " + GridView1.Rows[0].Cells[5].Text + "</td></tr>".ToString());
            strHTMLContent.Append("<tr><td>HSC &ndash; 12th</td><td>" + GridView1.Rows[0].Cells[6].Text + "</td><td width='100'>March &rsquo;09</td><td>" + GridView1.Rows[0].Cells[7].Text + "(PCM)</td></tr><tr><td>SSC &ndash; 10th</td><td>" + GridView1.Rows[0].Cells[8].Text + "</td><td>March &rsquo;07</td><td>" + GridView1.Rows[0].Cells[9].Text + "</td></tr></table></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Computer Skills:<br /></td></tr><tr><td><ul><li>Languages : " + GridView1.Rows[0].Cells[16].Text + "</li></ul></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Project:</td></tr><tr><td><ul><li>" + GridView1.Rows[0].Cells[18].Text + ".</li></ul></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Hobbies:</td></tr><tr><td><ul><li>" + GridView1.Rows[0].Cells[15].Text + "</li></ul></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Seminar Attended:</td></tr><tr><td><ul><li>" + GridView1.Rows[0].Cells[20].Text + ".</li></ul></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr> <td style='font-size: 14px; font-weight: bold; text-decoration: underline'>Personal Details:<br /><br /></td></tr><tr><td><table width='100%' cellpadding='0' cellspacing='0'><tr><td style='width: 125px'>Name</td><td>:</td><td>" + GridView1.Rows[0].Cells[0].Text + " " + GridView1.Rows[0].Cells[1].Text + "</td></tr><tr><td style='width: 125px'>Date of Birth</td><td>:</td><td>" + GridView1.Rows[0].Cells[10].Text + "</td></tr><tr><tr><td style='width: 125px'>Nationality</td><td>:</td><td>" + GridView1.Rows[0].Cells[13].Text + "</td></tr><td style='width: 125px'>Languages Known</td><td>:</td><td>" + GridView1.Rows[0].Cells[14].Text + "</td></tr></table></td></tr></table></td></tr>".ToString());
            strHTMLContent.Append("<tr><td><table width='100%'><tr><td>I hereby declare that information given above is true and to the best of my knowledge.</td></tr><tr><td style='font-weight: bold; text-align: right'>" + GridView1.Rows[0].Cells[0].Text + " " + GridView1.Rows[0].Cells[1].Text + "</td></tr>".ToString());
            strHTMLContent.Append("</table></td></tr></table>".ToString());
            HttpContext.Current.Response.Write(strHTMLContent);
            HttpContext.Current.Response.End();
            HttpContext.Current.Response.Flush();
            //        string strBody = "<html><body><b><div align='center'><u>CURRICULUM VITAE</u><br></b>" +
            //               " <b>" + GridView1.Rows[0].Cells[0].Text +" " +GridView1.Rows[0].Cells[1].Text + "<br> (M) " + GridView1.Rows[0].Cells[2].Text +
            //               "<br><u>" + GridView1.Rows[0].Cells[3].Text  + "</u></b></div><br><br><br><b><u>Career Objective:</u></b><br><br>I want to build my career with leading corporate of hi-tech atmosphere with and dedicated people, which will help me to realize my potential. I am willingness to work in a creative and challenging atmosphere.<br><br>" +
            //               "<b><u>Academic Performance:</u></b><br><br><table border='1'><tr><th>Degree/Certificate</th><th>University/Board</th><th>CPI/Percentage</th></tr><tr>"+
            //             " <tr><td> B.E" + GridView1.Rows[0].Cells[4].Text + "<br></td><td>Gujarat Technological University - Vishwakarma Govt. Engg. College,Gandhinagar </td><td>" + GridView1.Rows[0].Cells[5].Text + "</td><tr><td>HSC - 12</td><td>" + GridView1.Rows[0].Cells[6].Text + "</td><td>" + GridView1.Rows[0].Cells[7].Text + "</td><tr><td>SSC - 10</td><td>" + GridView1.Rows[0].Cells[8].Text + "</td><td>" + GridView1.Rows[0].Cells[9].Text + "</td></table><br><b>Personal Inforamation :</b><br><br> &nbsp;&nbsp;&nbsp;&nbsp; Full Name :" + GridView1.Rows[0].Cells[0].Text + " " + GridView1.Rows[0].Cells[1].Text + "<br><br> &nbsp;&nbsp;&nbsp;&nbsp;Date OF Birth :" + GridView1.Rows[0].Cells[10].Text + "<br><br> &nbsp;&nbsp;&nbsp;&nbsp;Gender :" + GridView1.Rows[0].Cells[11].Text + "<br><br> &nbsp;&nbsp;&nbsp;&nbsp;Nationality :" + GridView1.Rows[0].Cells[13].Text + "<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;Languages Known :" + GridView1.Rows[0].Cells[14].Text + "<br><br> &nbsp;&nbsp;&nbsp;&nbsp;Hobbies :" + GridView1.Rows[0].Cells[15].Text + "<br><br><b> Technical Skills :</b><br><br> &nbsp;&nbsp;&nbsp;&nbsp;Languages Known :" + GridView1.Rows[0].Cells[16].Text + "<br><br> &nbsp;&nbsp;&nbsp;&nbsp;Web Technologies :" + GridView1.Rows[0].Cells[17].Text + "<br><br>&nbsp;&nbsp;&nbsp;&nbsp; Database :" + GridView1.Rows[0].Cells[18].Text + "<br><br><br>Declartation <br><br>&nbsp;&nbsp;&nbsp;&nbsp;I hereby declare that the above-mentioned information is true to the best of my knowledge.<br><div algin='center'>" + GridView1.Rows[0].Cells[0].Text + " " + GridView1.Rows[0].Cells[1].Text + "<br></div>"

            //+"</body></html>";

            //string fileName = "Resume.doc";
            //// You can add whatever you want to add as the HTML and it will be generated as Ms Word docs
            //Response.AppendHeader("Content-Type", "application/msword");
            //Response.AppendHeader("Content-disposition", "attachment; filename=" + fileName);
            //Response.Write(strBody);
        }
        catch (Exception emsg)
        {
            Console.WriteLine(emsg);
        }

        // var Doc = new Document(PageSize.A4, 50, 50, 25, 25);
        // PdfWriter.GetInstance(Doc, Response.OutputStream);
        // Doc.Open();

        // iTextSharp.text.Table cv = new iTextSharp.text.Table(1);
        // cv.Border = 0;
        // cv.AddCell("Curriculum Vitae");
        // Doc.Add(cv);

        // iTextSharp.text.Table name = new iTextSharp.text.Table(2, 2);
        // name.Border = 0;
        // name.Cellpadding = 5;
        // name.Cellspacing = 5;
        // name.AddCell(GridView1.Rows[0].Cells[2].Text + "  " + GridView1.Rows[0].Cells[3].Text);
        // name.AddCell(GridView1.Rows[0].Cells[2].Text);
        // name.AddCell(GridView1.Rows[0].Cells[2].Text);
        // name.AddCell(GridView1.Rows[0].Cells[2].Text);
        // Doc.Add(name);

        // iTextSharp.text.Table address = new iTextSharp.text.Table(2,2);
        // address.Border = 0;
        // address.AddCell("Address :");
        // address.AddCell("");
        // address.AddCell("> 102, Shalibhadra appartment opposite dipawali society paldi");
        // address.AddCell("");
        // Doc.Add(address);

        //  iTextSharp.text.Table objective = new iTextSharp.text.Table(2,2);
        //objective.Border = 0;

        //objective.AddCell("Objective :");
        //objective.AddCell("");

        // objective.AddCell("  > Pursue career as a professional in the field of  Computer Engineering and Looking for a position involving Development of company services and products using my skills in an environment where I can make a difference and be part of a team ");
        // objective.AddCell("");
        // Doc.Add(objective);

        // iTextSharp.text.Table academic = new iTextSharp.text.Table(1);
        // academic.Border = 0;
        // academic.AddCell("Academic Qualification :");
        // Doc.Add(academic);

        // iTextSharp.text.Table clg_result = new iTextSharp.text.Table(7, 5);
        // clg_result.Border = 0;

        // clg_result.AddCell("Serial No");
        // clg_result.AddCell("Examination");
        // clg_result.AddCell("SPI");
        // clg_result.AddCell("CPI");
        // clg_result.AddCell("Passing Year");

        // Doc.Add(clg_result);



        // Doc.Close();
        // Response.ContentType = "application/pdf";
        // Response.AddHeader("content-disposition", "attachment; filename=CV.pdf");
        // Response.End();

    }
}