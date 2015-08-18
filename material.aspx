<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="material.aspx.cs" Inherits="material" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>SocialNet | Contact</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="main_resize">
            <!------------------wall div -->




            <div class="prof_pic_material">
            <h3>
                <asp:Label ID="lbl_username_material" runat="server" Font-Bold="true"></asp:Label></h3>
            <asp:Image ID="img_profile_pic_material" runat="server" Height="150px" Width="163px" />
           
            
        </div>
    












                       









            <!------------------wall div -->
            <div  class="download_material"><h3>Download / Upload Material :</h3></div>
                <div class="download_material1">
                    <form name="material_upload" method="post" action="#">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_subject" runat="server" Text="Subject :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_subject" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_title" runat="server" Text="Title :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_title" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_filename" runat="server" Text="File Name :"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="file_upload_material" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btn_upload" runat="server" Text="Upload " CssClass="update_btn" OnClick="next_but_Click" />
                                    </td>
                                    <td>
                                        <asp:label ID="lbl_tearcher_upload" runat="server" Font-Bold="true" Font-Size="1.5em" ForeColor="Green"></asp:label>
                                    </td>
                                </tr>

                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddl_subject1" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btn_show" runat="server" Text="show" CssClass="update_btn" OnClick="btn_show_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                    <asp:GridView ID="grdview_material" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="grdview_material_SelectedIndexChanged"
                        AllowPaging="true" PageSize="20" BackColor="white" OnPageIndexChanging="grdview_material_PageIndexChanging" BorderColor="black" BorderStyle="Solid" BorderWidth="1px">
                        <Columns>
                            <asp:TemplateField HeaderText="Source" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblsource" runat="server" Text='<%#bind("material_filename") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblsource" runat="server" Text='<%#Eval("material_filename") %>'>
                                    </asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_title" runat="server" Text='<%#Eval("material_title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="select" HeaderText="File Name" Text="Download">
                                <HeaderStyle Width="20%" BorderColor="#005CA1" Wrap="True" />
                                <ItemStyle Width="20%" Font-Underline="True" Wrap="True" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                    </form>
                </div>
    </body>
    </html>
</asp:Content>
