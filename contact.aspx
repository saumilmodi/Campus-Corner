<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<title>Contact Us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html>
    <head>
        <title>Contact Use</title>
    </head>
    </html>
    <div class="main">
        <div class="main_resize">
            <div class="header">
                <div class="content">
                    <div class="content_bg">
                        <div class="mainbar">
                        </div>
                    </div>
                    <div class="article">
                        <h2>
                            <span>Contact</span></h2>
                        <%-- <div class="clr"></div>--%>
                       
                      
                        <div class="article">
                            <h2>
                                <span>Send us</span> mail</h2>
                            <div class="clr">
                            </div>
                            <form action="#" method="post" id="sendemail">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_user_name" runat="server" Text="Name(Required):">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_user_name" runat="server">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_req_name" runat="server" ControlToValidate="txt_user_name"
                                            ErrorMessage="Please Enter your name" ForeColor="Red" SetFocusOnError="True">
                                           
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_user_email" runat="server" Text="Email(Required):">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_user_email" runat="server">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="validator_email" runat="server" ControlToValidate="txt_user_name"
                                            ErrorMessage="Please Enter your Email" ForeColor="Red" SetFocusOnError="True">
                                           
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="validator_email_epression" runat="server" ControlToValidate="txt_user_email"
                                            ErrorMessage="Enter proper email address" ForeColor="Red" SetFocusOnError="True"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_user_msg" runat="server" Text="Message:">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_user_msg" Height="100px" Width="300px" runat="server" TextMode="MultiLine"
                                            Style="resize: none">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btn_submit" Text="Submit" runat="server" CssClass="update_btn" OnClick="btn_submit_Click" />
                                    </td>
                                </tr>
                            </table>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lbl_contact_success" ForeColor="Green" runat="server" Font-Size="1.5em"
                                            Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            </form>
                            <div class="demo">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </html>
</asp:Content>
