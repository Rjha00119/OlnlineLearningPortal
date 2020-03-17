<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="Login.aspx.cs"
    Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="style12">
        <asp:Panel ID="Panel1" BackColor="white" runat="server" Height="380px" Style="margin-left: 374px"
            DefaultButton="btnLogin" Width="570px" Direction="LeftToRight">
            <table style="width: 100%; height: 322px">
                <tr>
                    <td style="width: 72px" class="style10">
                        &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Size="15pt" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style10" style="width: 72px">
                    </td>
                    <td style="width: 427px">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="15pt" Text="Username"
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 72px" class="style10">
                        &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:TextBox ID="txtUsername" runat="server" Height="31px" Width="241px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                            ErrorMessage="Enter Username !" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 72px" class="style10">
                        &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="15pt" Text="Password"
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 72px" class="style10">
                        &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:TextBox ID="txtPassword" runat="server" Height="27px" Width="239px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Enter Password !" ValidationGroup="Login"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 72px" class="style10">
                        &nbsp; &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:Button ID="btnLogin" runat="server" ValidationGroup="Login" CssClass="btnBlue"
                            Text="Login" OnClick="btnLogin_Click" />
                        &nbsp;
                        <asp:LinkButton ID="lnkRegister" runat="server" OnClick="lnkRegister_Click" CssClass="buttonGreen"
                            Font-Underline="false">New Register</asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 72px">
                        &nbsp;
                    </td>
                    <td style="width: 427px">
                        <asp:LinkButton ID="lnkForgetPwd" runat="server" Font-Bold="True" Font-Size="12pt"
                            Font-Underline="false" OnClick="lnkForgetPwd_Click">Forget Password?</asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </asp:Panel>
    </div>
</asp:Content>
