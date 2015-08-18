<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="student_acad.aspx.cs" Inherits="student_acad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="main_resize">
            <div class="header">
                <div class="search">
                    <div class="clr">
                    </div>
                </div>
                <div class="clr">
                </div>
                <div>
                    <form name="acedemicProfile" method="post" action="#">
                    <table>
                        <tr>
                             <td>
                                <asp:label ID="lbl_academic_update" ForeColor="Green" Font-Bold="true" Font-Size="1.5em" runat="server">
                                </asp:label>
                            </td>
                        </tr>
                    </table>
                    <fieldset id="txt_10th">
                        <legend><b>Step 1 : Result Details</b></legend>
                        <table cellpadding="5px" cellspacing="5px">

                            <tr>
                                <td>
                                    <asp:Label ID="lbl_cpi" runat="server" Text="CPI"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_cpi" runat="server" CssClass="changeback"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_10thperc" runat="server" Text="10th percentage"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_10thperc" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_12thperc" runat="server" Text="12th percentage"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_12thperc" CssClass="changeback" runat="server" AutoCompleteType="None"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend><b>Step 2 : Board/University</b></legend>
                        <table cellpadding="5px" cellspacing="5px">
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_10thboard" runat="server" Text="10th_board"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_10thboard" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_12thboard" runat="server" Text="12th_board"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_12thboard" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_10thschool" runat="server" Text="10th-School"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_10thschool" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_12thschool" runat="server" Text="12th-School"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_12thschool" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_uni" runat="server" Text="University"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_uni" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_dep" runat="server" Text="Department"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl_dept" runat="server" OnSelectedIndexChanged="ddl_dept_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_sem" runat="server" Text="Semester-Year"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_semyear" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend><b>Step 3 : Your Skills</b></legend>
                        <table cellpadding="5px" cellspacing="5px">
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_lang" runat="server" Text="Languages"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_lang" CssClass="changeback" runat="server" ToolTip="Programming Languages"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_webskill" runat="server" Text="WebSkills"></asp:Label>
                                </td>
                                <td align="right">
                                    <asp:TextBox ID="txt_webskill" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_database" runat="server" Text="Databases"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_database" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset>
                        <legend><b>Step 4 : Your Achievements</b></legend>
                        <table cellpadding="5px" cellspacing="5px">
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_seminar" runat="server" Text="Seminar"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_seminar" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_pro" runat="server" Text="Project"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_pro" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lbl_awards" runat="server" Text="Awards"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_awards" CssClass="changeback" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <table>
                        <tr>
                            <td>
                                <asp:button ID="btn_academic_update" runat="server" CssClass="update_btn" 
                                    Text="ADD" onclick="Btn_Click">
                                </asp:button>
                            </td>
                           
                        </tr>
                    </table>
                    </form>
                </div>
</asp:Content>
