<%@ Page Language="C#" MasterPageFile="~/TrainerMaster.master" AutoEventWireup="true"
    CodeFile="TrainerManageContent.aspx.cs" Inherits="Trainer_TrainerManageContent"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divMainGrid" runat="server" visible="true">
        <div style="margin-left: 100px;">
            <h2 style="color: Black">
                Manage Content
            </h2>
        </div>
        <div style="margin-left: 100px; margin-bottom: 5px;">
            <asp:LinkButton ID="lnkAddNew" runat="server" Text="Add New Content" OnClick="lnkAddNew_Click"></asp:LinkButton>
        </div>
        <div style="margin-left: 100px; margin-bottom: 30px; min-height: 250px;">
            <asp:GridView ID="grdvCourse" runat="server" AutoGenerateColumns="false" DataKeyNames="Course_Content_id"
                EmptyDataText="No records has been added." Width="1150" PageSize="5" AllowPaging="true"
                OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" OnRowEditing="OnRowEditing"
                OnRowCancelingEdit="OnRowCancelingEdit" CssClass="grdvCss" OnPageIndexChanging="OnPaging">
                <Columns>
                    <asp:TemplateField HeaderText="Document By" ItemStyle-Width="250">
                        <ItemTemplate>
                            <asp:Label ID="lbl" runat="server" Text='<%# Eval("Email_Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="250">
                        <ItemTemplate>
                            <asp:Label ID="lblCourse_Name" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Content Name" ItemStyle-Width="250">
                        <ItemTemplate>
                            <asp:Label ID="lblContent_Name" runat="server" Text='<%# Eval("Content_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContent_Name" runat="server" Text='<%# Eval("Content_Name") %>'
                                Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" ItemStyle-Width="250">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>'
                                Width="250" Height="50"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Files" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload" Text="Download" runat="server" OnClick="lnkDownload_Click"
                                ToolTip='<%# Eval("Content_Name") %>' CommandArgument='<%# Eval("Content_Path") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuEditFile" runat="server" />
                            <asp:Label ID="UploadStatusLabelGrid" runat="server" Font-Bold="True" Font-Names="helvetic"
                                ForeColor="Red"></asp:Label>
                            <asp:HiddenField ID="hdnPath" runat="server" Value='<%# Eval("Content_Path") %>' />
                           
                            &nbsp;
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is File Approved" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblApproved" Text='<%# Eval("IsApproved") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:HiddenField ID="hdnIsApproved" runat="server" Value='<%# Eval("IsApproved") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true"
                        ItemStyle-Width="150" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="34px"
                    HorizontalAlign="Center" />
                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                <RowStyle ForeColor="#000066" Height="30px" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
    <div id="divAddNew" runat="server" visible="false">
        <table style="width: 100%">
            <tr>
                <td style="height: 30px; width: 355px">
                </td>
                <td colspan="3">
                    <h1 style="color: Black">
                        Add New Content</h1>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
                <td>
                    <div>
                        <asp:LinkButton ID="lnkAllCourse" runat="server" Text="View All Course" OnClick="lnkAllCourse_Click"></asp:LinkButton>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 30px; width: 355px">
                </td>
                <td style="height: 30px; width: 222px">
                    <span style="color: rgb(51, 51, 51); font-family: &quot; helvetica neue&quot; , helvetica, arial, sans-serif;
                        font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;
                        font-weight: 700; letter-spacing: normal; orphans: 2; text-align: right; text-indent: 0px;
                        text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                        background-color: rgb(241, 241, 241); text-decoration-style: initial; text-decoration-color: initial;
                        display: inline !important; float: none;">Select Course</span>
                </td>
                <td style="height: 30px; width: 383px">
                    <asp:DropDownList ID="ddlCourse" runat="server" ForeColor="Black" CssClass="textbox">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" InitialValue="0"
                        ControlToValidate="ddlCourse" ErrorMessage="Select Course!"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 30px; width: 355px">
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
                        display: inline !important; float: none;">Content Name</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="txtContentName" placeholder="Enter Your Content" runat="server"
                        CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContentName"
                        ValidationGroup="Course" ErrorMessage="Content is Required !" Font-Bold="False"
                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 30px">
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
                        display: inline !important; float: none;">Description</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="txtDescription" runat="server" Height="56px" TextMode="MultiLine"
                        CssClass="textbox" Width="350px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtDescription"
                        ValidationGroup="Course" ErrorMessage="Description is Required !"></asp:RequiredFieldValidator>
                </td>
                <td style="height: 30px">
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
                        display: inline !important; float: none;">Upload Content</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:FileUpload ID="flpUploadContent" runat="server" />
                    
                </td>
                <td style="height: 30px">
                    <asp:Label ID="UploadStatusLabel" runat="server" Font-Bold="True" Font-Names="helvetic"
                        Font-Size="15pt" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 15px; width: 355px">
                </td>
                <td style="width: 222px; height: 15px">
                    <asp:Button ID="btnSubmit" runat="server" BackColor="Orange" CssClass="button" Text="Submit"
                        ValidationGroup="Course" OnClick="btnSubmit_Click" />
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
