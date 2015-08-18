<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 177px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html>
    <head>
        <title>Register</title>
    </head>
    <body>
        <div class="main">
            <div class="main_resize">
                <div class="article">
                    <h2 align="right">
                        <span>Register</span> Here</h2>
                    <div class="clr">
                    </div>
                    <div id="login">
                        <fieldset>
                            <legend><b>Login</b></legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_email" runat="server" Text="Email"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="changeback" ID="txt_login_email" runat="server" ValidationGroup="login"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_login_email" runat="server" ControlToValidate="txt_login_email"
                                            ErrorMessage="Enter Email Address" ForeColor="Red" SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_password" runat="server" Text="Password"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_login_password" CssClass="changeback" runat="server" TextMode="Password"
                                            ValidationGroup="login"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_login_pass" runat="server" ControlToValidate="txt_login_password"
                                            ErrorMessage="Please Enter Password" ForeColor="Red" SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login"
                                            ValidationGroup="login" Class="update_btn" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btn_froget_password" Text="Forgot Password?" OnClick="btn_forget_password_Click"
                                            Class="update_btn" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_message" runat="server" Text="Username/password don't match" Visible="False"
                                            ForeColor="Red"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_wrongusername" runat="server" ForeColor="Red" 
                                            ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <asp:Panel ID="pnl_forget_password" Visible="false" runat="server">
                            <fieldset>
                                <legend><b>Forget Password</b></legend>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_confirm_email" runat="server" Text="Please enter your email address"
                                                ForeColor="black"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_forget_email" CssClass="changeback" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btn_forget_password_mail" runat="server" Text="Submit" CssClass="update_btn"
                                                OnClick="btn_forget_password_mail_click" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_mail_password" runat="server" Visible="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_sent_password" Text="Your password has been sent to your email id"
                                                runat="server" Visible="false" ForeColor="green"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </asp:Panel>
                    </div>
                    <div class="formclass">
                        <fieldset>
                            <legend><b>Join Us</b> </legend>
                            <form id="form1" name="form1" action="#">
                            <table>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="lbl_name" runat="server" Text="First Name"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_lastname" runat="server" Text="Last Name" Style="padding-left: 10px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:TextBox ID="txt_fname" runat="server" Width="150px" ValidationGroup="register"
                                            ToolTip="First Name" CssClass="changeback"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_lname" runat="server" CssClass="changeback" Width="150px" ValidationGroup="register"
                                            ToolTip="Lastname"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:RequiredFieldValidator ID="validator_fname" runat="server" ControlToValidate="txt_fname"
                                            ErrorMessage="Please Enter First Name" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="register">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_lname" runat="server" ControlToValidate="txt_lname"
                                            ErrorMessage="Please Enter Last Name" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="register">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:TextBox ID="txt_email" runat="server" CssClass="changeback" ValidationGroup="register"
                                            Width="150px" ToolTip="Email"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_req_email" runat="server" ControlToValidate="txt_email"
                                            ErrorMessage="Please Enter Email address" ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="register">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_forget_error" Text="Email id already exists" Visible="false" runat="server"
                                            ForeColor="red">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:RegularExpressionValidator ID="validator_email" runat="server" ControlToValidate="txt_email"
                                            ErrorMessage="Enter proper email address" ForeColor="Red" SetFocusOnError="True"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label2" runat="server" Text="Password" CssClass="changeback"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:TextBox ID="txt_pass" runat="server" Width="150px" TextMode="Password" CssClass="changeback"
                                            ValidationGroup="register" ToolTip="1 uppercase  1lowercase   1nonalpha  minimum 8 characters"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="validator_pattern" runat="server" ControlToValidate="txt_pass"
                                            ErrorMessage="Password should contain 1 uppercase,1 lowercase,1 non-alpha character and minimum 8 characters."
                                            ForeColor="Red" ValidationExpression="((?=.*[^a-zA-Z])(?=.*[a-z])(?=.*[A-Z])(?!\s).{8,})"
                                            ValidationGroup="register"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:RequiredFieldValidator ID="validator_password" runat="server" ControlToValidate="txt_pass"
                                            ErrorMessage="Please Enter Password" ForeColor="Red" ValidationGroup="register">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:TextBox ID="txt_confirm" runat="server" TextMode="Password" CssClass="changeback"
                                            ValidationGroup="register" ToolTip="Confirm Password"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_conf_pass" runat="server" ControlToValidate="txt_confirm"
                                            ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True"
                                            ValidationGroup="register">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CompareValidator ID="comparePassword" runat="server" ControlToCompare="txt_pass"
                                            ControlToValidate="txt_confirm" ErrorMessage="Your Passwords do not match." ForeColor="red"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="cat_lbl" runat="server" Text="Category"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:DropDownList ID="ddl_category" runat="server" ValidationGroup="register">
                                            <asp:ListItem Value="0">Please Select Category...</asp:ListItem>
                                            <asp:ListItem Value="1">Student</asp:ListItem>
                                            <asp:ListItem Value="2">Teacher</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Button ID="butt_joinus" runat="server" Text="Join us" OnClick="butt_joinus_Click"
                                            ValidationGroup="register" Class="update_btn" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1">
                                        <asp:Label ID="lbl_success_msg" Text="You are successfully registered." runat="server"
                                            Visible="false" ForeColor="green" Font-Size="1.5em"></asp:Label>
                                    </td>
                                    <td class="style1">
                                        <asp:Label ID="lbl_login_msg" Text="Please Login to continue." runat="server" Visible="false"
                                            ForeColor="green" Font-Size="1.5em"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            </form>
                        </fieldset>
                    </div>
                    <div class="demo">
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
        </div>
    </body>
    </html>
</asp:Content>
