<%@ Page Language="C#" MasterPageFile="~/LearnerMaster.master" AutoEventWireup="true"
    CodeFile="GenerateQuery.aspx.cs" Inherits="Learner_GenerateQuery" Title="Generate Query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 300px;">
        <table style="width: 60%">
            <tr>
                <td>
                    <asp:Image ID="imgAbout" runat="server" ImageUrl="~/images/contactus.jpg" />
                </td>
                <td>
                    <table style="color: Black">
                        <tr>
                            <td colspan="2">
                                <h1 align="left" style="color: Black">
                                    Generate Query
                                </h1>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Select Trainer"></asp:Label>
                                &nbsp;
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTrainer" runat="server" Height="30px" Width="142px" ValidationGroup="QueryLearner">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlTrainer"
                                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Name"></asp:Label>
                                &nbsp;
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Height="30px" Width="142px" ValidationGroup="QueryLearner"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Email Id"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Height="31px" Width="142px" ValidationGroup="QueryLearner"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail"
                                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="helvetica"
                                    Font-Size="12pt" Text="Contact No "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContact" runat="server" Height="31px" Width="148px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="helvetica" Font-Size="12pt"
                                    Text="Query"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQuery" runat="server" TextMode="MultiLine" Height="70px" Width="191px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"
                                    ValidationGroup="QueryLearner" CssClass="btnBlue" />
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
