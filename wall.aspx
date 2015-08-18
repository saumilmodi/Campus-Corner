<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="wall.aspx.cs" Inherits="wall" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <div class="prof_pic">
            <h3>
                <asp:Label ID="lbl_username" runat="server" Font-Bold="true"></asp:Label></h3>
            <asp:Image ID="img_profile_pic" runat="server" Height="150px" Width="163px" />
            <asp:FileUpload ID="fileupload_profilepic" runat="server" Height="29px" Width="90px" />
            <asp:Button ID="btn_changepic" runat="server" Text="Update" Class="update_btn" OnClick="btn_changepic_Click" />
            <div class="side">
                <div class="side_nav">
                    <ul>
                        <li><a href="SocialProf.aspx" class="social_link">&nbsp; &nbsp; Social Profile &nbsp;
                            &nbsp; </a></li>
                        <li>
                            <asp:Button ID="btn_academic_prof" Class="button" runat="server" Text="Academic Profile"
                                OnClick="btn_academic_prof_Click" CssClass="button" />
                            <!--<a href="student_acad.aspx">Academic  Profile</a>-->
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="searchBox">
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" Class="btnSearch" Style="height: 25px"
                OnClick="btnSearch_Click" /><br/>
        <asp:Label ID="lbl_no_user" ForeColor="Green" runat="server" Font-Bold="true" Font-Size="1.5em  "></asp:Label>
        </div>
        
        

        <asp:Panel ID="pnlProfileList" runat="server" Visible="false" BorderColor="BlueViolet">
            <div class="profileList">
                <asp:GridView ID="gvProfiles" runat="server" AutoGenerateColumns="false" GridLines="None"
                    PageSize="20" Width="400px"  AllowPaging="true" BorderWidth="1px" BorderStyle="Solid" BorderColor="black">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="imgProfPic" Height="50px" Width="50px" runat="server" ImageUrl='<%# Eval("profpic","school/profile_pics/{0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="<%# "profileSearch.aspx?ID=" + Eval("id")%> " class="profile_link">
                                    <%#Eval("name")%>
                                </a>
                                <%-- <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("name") %>'></asp:Label>&nbsp;--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>
        <div class="hbg">
            <asp:Panel ID="postPanel" runat="server">
                <form id="status_form" class="f">
                <label>
                    <b>Update your status here</b></label><br />
                <asp:TextBox ID="txt_status" runat="server" Height="100px" TextMode="MultiLine" Width="500px"
                    Style="resize: none;"></asp:TextBox>
                <div class="post_btn">
                    <asp:Button ID="btn_status" runat="server" CssClass="update_btn" Text="Post" OnClick="btn_status_Click" />
                </div>
                </form>
            </asp:Panel>
        </div>
        <div class="notification">
            <asp:Panel ID="notificationPanel" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Style="margin-right: 178px"
                    BorderStyle="None" GridLines="None" PageSize="20" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging">
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
        </div>
    </div>
    <div class="clr">
    </div>
</asp:Content>
