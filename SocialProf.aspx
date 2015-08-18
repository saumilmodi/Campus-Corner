<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true"
    CodeFile="SocialProf.aspx.cs" Inherits="SocialProf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>SocialNet | Contact</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript" src="js/cufon-yui.js"></script>
        <script type="text/javascript" src="js/arial.js"></script>
        <script type="text/javascript" src="js/cuf_run.js"></script>
    </head>
    <body>
        <div class="main">
            <div class="main_resize">
                <div class="social_demo">
                
                
                    <form name="SocialProfile" method="post" action="#">
                    <table cellpadding="8px">
                        <tr>
                            <td>
                                <asp:Label ID="lbl_birthdate" runat="server" Text="Birthdate :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_birthdate" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_gender" runat="server" Text="Gender :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_gender" runat="server">
                                    <asp:ListItem Value="0">Select Your Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_maritalstatus" runat="server" Text="Marital Status :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_married" runat="server" 
                                    onselectedindexchanged="ddl_married_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Marital Status</asp:ListItem>
                                    <asp:ListItem Value="Married">Married</asp:ListItem>
                                    <asp:ListItem Value="Unmarried">Unmarried</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_mobilenumber" runat="server" Text="Mobile Number :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_mob_no" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_languagesknown" runat="server" Text="Languages Known :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_lang" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_nationality" runat="server" Text="Nationality :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_nationality" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_hobbies" runat="server" Text="Hobbies :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_hobbies" CssClass="changeback" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_aboutyourself" runat="server" Text="About yourself :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txt_aboutyourself" CssClass="changeback" runat="server" Height="40"
                                    Style="margin-bottom: 11px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_profilepic" runat="server" Text="Profile Picture :"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="file_upload_profilepic" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="next_but" runat="server" CssClass="update_btn" Text="Finish" OnClick="next_but_Click" />
                            </td>
                        </tr>
                        
                    
                     <tr>
                            <td>
                                <asp:Label ID="lbl_social_update" runat="server" ForeColor="Green" Font-Bold="true" Font-Size="1.5em"></asp:Label>
                            </td>
                        </tr>
                   
                </div>
            </div>
    </body>
    </html>
</asp:Content>
