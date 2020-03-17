<%@ Page Language="C#" MasterPageFile="~/LearnerMaster.master" AutoEventWireup="true"
    CodeFile="LearnerProfile.aspx.cs" Inherits="Learner_LearnerProfile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divUser" runat="server">
        <table style="min-height: 350px; width: 100%">
            <tr>
                <td style="width: 294px">
                </td>
                <td colspan="2">
                    <h2 style="color: Black">
                        Manage Profile
                    </h2>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
                <td align="right" style="width: 237px">
                    <div>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit Profile" OnClick="lnkEdit_Click"></asp:LinkButton>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">First Name</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblF_name" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Last Name</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblL_name" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">E-Mail / Login Id</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblEmail_id" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Contact No</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblContact_no" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Gender</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblGender" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">About Yourself</span>
                </td>
                <td style="width: 237px">
                    <asp:Label ID="lblAbout_urslf" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 294px">
                    &nbsp;
                </td>
                <td style="width: 256px">
                    &nbsp;
                </td>
                <td style="width: 237px">
                    &nbsp;
                </td>
                <td style="width: 288px">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="divEditUser" runat="server" visible="false">
        <table style="width: 100%">
            <tr>
                <td style="height: 30px; width: 355px">
                </td>
                <td colspan="3">
                    <h1 style="color: Black">
                        Edit User Details</h1>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
                <td>
                    <asp:LinkButton ID="lnkProfile" runat="server" Text="Back To Profile" OnClick="lnkProfile_Click"
                        ValidationGroup="Profile"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="height: 39px; width: 355px">
                    <asp:HiddenField ID="hdnUserId" runat="server" />
                </td>
                <td style="width: 222px; height: 39px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">First Name</span>
                </td>
                <td style="height: 39px; width: 383px;">
                    <asp:TextBox ID="TXTFirstName" placeholder="Enter Your First Name" runat="server"
                        ValidationGroup="EditProfile" CssClass="textbox"></asp:TextBox>
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
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Last Name</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="txtLastName" placeholder="Enter Your Last Name" runat="server" CssClass="textbox"
                        ValidationGroup="EditProfile"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName"
                        ErrorMessage="Last Name is Required !" Font-Bold="False" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 30px">
                </td>
            </tr>
            <tr>
                <td style="height: 31px; width: 355px">
                </td>
                <td style="width: 222px; height: 31px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Password</span>
                </td>
                <td style="height: 31px; width: 383px;">
                    <asp:TextBox ID="TXTPassword" runat="server" TextMode="password" CssClass="textbox"
                        ValidationGroup="EditProfile"></asp:TextBox>
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
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Confirm Password</span>
                </td>
                <td style="height: 31px; width: 383px;">
                    <asp:TextBox ID="TXTConfirmPassword" runat="server" TextMode="password" CssClass="textbox"
                        ValidationGroup="EditProfile"></asp:TextBox>
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
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Contact No</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="TXTContractNo" runat="server" CssClass="textbox" ValidationGroup="EditProfile"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TXTContractNo"
                        ErrorMessage="Contact No  is Required !"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 30px">
                </td>
            </tr>
            <tr>
                <td style="height: 31px; width: 355px">
                </td>
                <td style="width: 222px; height: 31px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Gender</span>
                </td>
                <td style="height: 31px; width: 383px;">
                    <asp:DropDownList ID="ddlGender" runat="server" ForeColor="Black" CssClass="textbox"
                        ValidationGroup="EditProfile">
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
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">About Yourself</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="TXTAboutYourself" runat="server" Height="56px" TextMode="MultiLine"
                        ValidationGroup="EditProfile" CssClass="textbox" Width="350px"></asp:TextBox>
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
                    <asp:Button ID="btnSubmit" runat="server" BackColor="Orange" CssClass="button" Text="Submit"
                        ValidationGroup="EditProfile" OnClick="btnSubmit_Click" />
                </td>
                <td style="height: 15px; width: 383px;">
                    <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Names="helvetic" Font-Size="15pt"
                        ForeColor="Blue"></asp:Label>
                </td>
                <td style="height: 15px">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
