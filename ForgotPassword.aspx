<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs"
    Inherits="ForgotPassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 100px;">
        <table style="width: 100%">
            <tr>
                <td style="width: 35%">
                    <asp:Image ID="imgAbout" runat="server" ImageUrl="~/images/ForgotPassword.png" Height="350px"
                        Width="400px" />
                </td>
                <td>
                    <table style="color: Black; width: 322px; height: 255px;">
                        <tr>
                            <td colspan="2">
                                <h1 align="left" style="color: Black">
                                    Forgot Password
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Email Id"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Height="31px" Width="145px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Contact No"></asp:Label>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtContact" runat="server" Height="29px" Width="146px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"
                                    CssClass="btnBlue" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
