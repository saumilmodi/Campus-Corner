<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="profileSearch.aspx.cs" Inherits="profileSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="prof_pic">
            <div class="whatever">
                <h2>
                    <asp:Label ID="lbl_show_name" Visible="true" runat="server" CssClass="profile_name_header"></asp:Label></h2>
            </div>
            <asp:Image ID="search_image" runat="server" Height="150px" Width="163px" />
           
            <div class="side">
                <div class="side_nav">
                    <ul>
                       
                        <li>
                            <asp:Button ID="social_button" Text="Social Profile" runat="server" CssClass="button"
                                OnClick="search_social_profile" />
                        </li>
                        <li>
                            <asp:Button ID="search_academic_prof" Class="button" runat="server" Text="Academic Profile"
                                CssClass="button" OnClick="search_academic_prof_Click" />
                            <!--<a href="student_acad.aspx">Academic  Profile</a>-->
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="whatever">
        <asp:Label ID="lbl_show_name" Visible="true" runat="server" CssClass="profile_name_header"></asp:Label>
    </div>--%>
    <asp:Panel ID="pnl_show_posts" runat="server" Visible="false">
        <asp:GridView ID="gv_show_posts" runat="server" AutoGenerateColumns="false" Style="margin-right: 178px"
            BorderStyle="None" GridLines="None" PageSize="20" AllowPaging="true">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Table ID="Table1" runat="server">
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                           <a href="<%# "profileSearch.aspx?ID=" + Eval("profile_id")%>" class="profile_link">
                                            <%#Eval("profile_name") %>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Style="padding-right: 10px; vertical-align: top">
                                    <asp:Image ID="img_profpic" Height="50px" Width="50px" runat="server" ImageUrl='<%# Eval("profpic","school/profile_pics/{0}") %>' />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <%--<div runat="server"  ID="txt_status_detail"  style="border:0px;background-color:#78bbe6;min-height:100px;width:500px;color:black;overflow:visible;">'<%#Eval("status_detail") %>'</div>--%>
                                    <asp:TextBox ID="txt_status_detail" runat="server" Enabled="false" ReadOnly="True"
                                        Width="400px" TextMode="MultiLine" Text='<%#Eval("status_detail") %>' Style="border: 0px;
                                        background-color: #78bbe6; min-height: 100px; overflow: auto; border-radius: 5px 5px 5px 5px;
                                        resize: none;"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="profileArea" runat="server" Visible="false">
        <div class="notification">
            <div class="main">
                <div class="academicDiv">
                    <form name="acedemicProfile" method="post" action="#">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_degree" runat="server" Text="Degree">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_degree" Enabled="false" runat="server" CssClass="profileView"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_area_of_interest" runat="server" Text="Area of interest"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_area_of_interest" Enabled="false" CssClass="profileView"
                                    runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_uni" runat="server" Text="University"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_uni" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_dep" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_dept" Enabled="false" CssClass="profileView" runat="server">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_pro" runat="server" Text="Project"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_pro" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_awards" runat="server" Text="Awards Achieved"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_awards" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_cpi" runat="server" Text="CPI" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_cpi" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_10thperc" runat="server" Text="10th percentage" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_10thperc" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_12thperc" runat="server" Text="12th percentage" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_12thperc" Enabled="false" CssClass="profileView" runat="server"
                                    AutoCompleteType="None" Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_10thboard" runat="server" Text="10th_board" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_10thboard" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_12thboard" runat="server" Text="12th_board" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_12thboard" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_10thschool" runat="server" Text="10th-School" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_10thschool" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_12thschool" runat="server" Text="12th-School" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_12thschool" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_sem" runat="server" Text="Semester-Year" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_semyear" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_lang" runat="server" Text="Languages" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_lang" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_webskill" runat="server" Text="WebSkills" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_webskill" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_database" runat="server" Text="Database-Known" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_database" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_search_seminar" runat="server" Text="Seminar" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_search_seminar" Enabled="false" CssClass="profileView" runat="server"
                                    Visible="False"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="social_profile_panel" runat="server" Visible="false">
        <div class="socialDiv">
            <form action="#">
            <div class="demo1">
                <table cellspacing="15px">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_birthdate" runat="server" Text="Birthdate :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_birthdate" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_gender" runat="server" Text="Gender :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_gender" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_maritalstatus" runat="server" Text="Marital Status :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_marital" Enabled="false" CssClass="profileView" runat="server">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_mobilenumber" runat="server" Text="Mobile Number :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_mob_no" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_languagesknown" runat="server" Text="Languages Known :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_language" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_nationality" runat="server" Text="Nationality :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_nationality" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_hobbies" runat="server" Text="Hobbies :"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_search_hobbies" Enabled="false" CssClass="profileView" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_search_aboutyourself" runat="server" Text="About yourself :"></asp:Label>
                            <td>
                                <asp:TextBox ID="txt_search_aboutyourself" Enabled="false" CssClass="profileView"
                                    runat="server" Height="40" TextMode="MultiLine"></asp:TextBox>
                            </td>
                    </tr>
                </table>
            </div>
            </form>
        </div>
    </asp:Panel>
    <div class="demo">
    </div>
</asp:Content>
