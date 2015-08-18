<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="Teacher.aspx.cs" Inherits="Default2" %>

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
                <div>
                    <form name="acedemicProfile" method="post" action="#">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_degree" runat="server" Text="Degree :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_degree" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_clg" runat="server" Text="College Name :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_clg" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_uni" runat="server" Text="University Name :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_uni" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_project" runat="server" Text="Projects :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_project" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_area_of_interest" runat="server" Text="Area of Interest :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_area_of_interest" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_awards" runat="server" Text="Awards :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_awards" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Department :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_dept" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <tr>
                                <td>
                                    <asp:Button ID="next_but" runat="server" CssClass="update_btn" Text="Next >>" OnClick="next_but_Click" />
                                </td>
                            </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
