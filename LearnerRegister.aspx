<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="LearnerRegister.aspx.cs"
    Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .tdFontCss
        {
            font-size: 14px;
            font-weight: bold;
            font-style: normal;
            color: Black !important;
        }
    </style>
    <table style="width: 100%" class="tdFontCss">
        <tr>
            <td style="height: 30px; width: 355px">
            </td>
            <td colspan="3">
                <h1 style="color: Black">
                    Online Learning Registration</h1>
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 355px">
            </td>
            <td style="height: 30px; width: 222px">
                I am
            </td>
            <td style="height: 30px; width: 383px">
                <asp:DropDownList ID="ddlRole" runat="server" ForeColor="Black" CssClass="textbox">
                    <asp:ListItem Value="0">Select User Type</asp:ListItem>
                    <asp:ListItem Value="2">Trainer</asp:ListItem>
                    <asp:ListItem Value="3">Learner</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" InitialValue="0"
                    ControlToValidate="ddlRole" ErrorMessage="Select User Type !"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 30px; width: 355px">
            </td>
        </tr>
        <tr>
            <td style="height: 39px; width: 355px">
            </td>
            <td style="width: 222px; height: 39px">
                First Name
            </td>
            <td style="height: 39px; width: 383px;">
                <asp:TextBox ID="TXTFirstName" placeholder="Enter Your First Name" runat="server"
                    CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TXTFirstName"
                    ErrorMessage="First Name is Required !" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 39px">
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 355px">
            </td>
            <td style="width: 222px; height: 30px">
                Last Name
            </td>
            <td style="height: 30px; width: 383px;">
                <asp:TextBox ID="txtLastName" placeholder="Enter Your Last Name" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Last Name is Required !" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 30px">
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 355px">
                &nbsp;
            </td>
            <td style="width: 222px; height: 30px">
                E-Mail / Login Id
            </td>
            <td style="height: 30px; width: 383px;">
                <asp:TextBox ID="TXTEmail" runat="server" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TXTEmail"
                    ErrorMessage="Email Id is Required!" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TXTEmail"
                    ErrorMessage="Email id format is incorrect!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
            <td style="height: 30px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 31px; width: 355px">
            </td>
            <td style="width: 222px; height: 31px">
                Password
            </td>
            <td style="height: 31px; width: 383px;">
                <asp:TextBox ID="TXTPassword" runat="server" TextMode="password" CssClass="textbox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TXTConfirmPassword"
                    ErrorMessage="Password is Required !"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 31px">
            </td>
        </tr>
        <tr>
            <td style="height: 31px; width: 355px">
                &nbsp;
            </td>
            <td style="width: 222px; height: 31px">
                Confirm Password
            </td>
            <td style="height: 31px; width: 383px;">
                <asp:TextBox ID="TXTConfirmPassword" runat="server" TextMode="password" CssClass="textbox"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TXTPassword"
                    ControlToValidate="TXTConfirmPassword" ErrorMessage="Password is not Matched !"></asp:CompareValidator>
            </td>
            <td style="height: 31px">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 355px">
            </td>
            <td style="width: 222px; height: 30px">
                Contact No
            </td>
            <td style="height: 30px; width: 383px;">
                <asp:TextBox ID="TXTContractNo" runat="server" CssClass="textbox" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TXTContractNo"
                    ErrorMessage="Contact No  is Required !"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TXTContractNo"
                    ErrorMessage="Enter correct Contact No" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
            <td style="height: 30px">
            </td>
        </tr>
        <tr>
            <td style="height: 31px; width: 355px">
            </td>
            <td style="width: 222px; height: 31px">
                Gender
            </td>
            <td style="height: 31px; width: 383px;">
                <asp:DropDownList ID="ddlGender" runat="server" ForeColor="Black" CssClass="textbox">
                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                    <asp:ListItem Value="O">Others</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlGender"
                    InitialValue="0" ErrorMessage="Gender is Required !"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 31px">
            </td>
        </tr>
        <tr>
            <td style="height: 30px; width: 355px">
            </td>
            <td style="width: 222px; height: 30px">
                About Yourself
            </td>
            <td style="height: 30px; width: 383px;">
                <asp:TextBox ID="TXTAboutYourself" runat="server" Height="56px" TextMode="MultiLine"
                    CssClass="textbox" Width="350px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TXTAboutYourself"
                    ErrorMessage="About Yourself is Required !"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 30px">
            </td>
        </tr>
        <tr>
            <td style="height: 15px; width: 355px">
            </td>
            <td style="width: 222px; height: 15px">
                <asp:Button ID="BTNSubmit" runat="server" BackColor="Orange" CssClass="button" Text="Submit"
                    OnClick="BTNSubmit_Click1" />
            </td>
            <td style="height: 15px; width: 383px;">
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="helvetic" Font-Size="15pt"
                    ForeColor="Blue"></asp:Label>
            </td>
            <td style="height: 15px">
            </td>
        </tr>
        <tr>
            <td style="width: 355px; height: 55px;">
            </td>
            <td style="width: 222px; height: 55px;">
                <asp:LinkButton ID="LinkButton7" runat="server" Font-Bold="True" Font-Names="helvetica"
                     Font-Size="10pt" OnClick="LinkButton7_Click" ValidationGroup="Login">Already Registered? LOGIN</asp:LinkButton>
            </td>
            <td style="height: 55px; width: 383px;">
            </td>
            <td style="height: 55px">
            </td>
        </tr>
        <tr>
            <td style="width: 355px">
                &nbsp;
            </td>
            <td style="width: 222px">
                &nbsp;
            </td>
            <td style="width: 383px">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
