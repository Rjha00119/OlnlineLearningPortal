<%@ Page Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true"
    CodeFile="ManageCourse.aspx.cs" Inherits="Admin_ManageCourse" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divMainGrid" runat="server" visible="true">
        <div style="margin-left: 100px;">
            <h2 style="color: Black">
                Manage Courses
            </h2>
        </div>
        <div style="margin-left: 100px; margin-bottom: 5px;">
            <asp:LinkButton ID="lnkAddNew" runat="server" Text="Add New Course" OnClick="lnkAddNew_Click"></asp:LinkButton>
        </div>
        <div style="margin-left: 100px; margin-bottom: 30px; min-height: 250px;">
            <asp:GridView ID="grdvCourse" runat="server" AutoGenerateColumns="false" DataKeyNames="course_id"
                EmptyDataText="No records has been added." Width="1150" PageSize="5" AllowPaging="true"
                OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" OnRowEditing="OnRowEditing"
                OnRowCancelingEdit="OnRowCancelingEdit" CssClass="grdvCss" OnPageIndexChanging="OnPaging">
                <Columns>
                    <asp:TemplateField HeaderText="Course Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblCourse_name" runat="server" Text='<%# Eval("course_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcourse_name" runat="server" Text='<%# Eval("course_name") %>'
                                Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Description") %>'
                                Width="140"></asp:TextBox>
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
        <table class="style8" style="width: 100%">
            <tr>
                <td style="height: 30px; width: 355px">
                </td>
                <td colspan="3">
                    <h1 style="color: Black">
                        Add New Course</h1>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                </td>
                <td>
                    <div>
                        <asp:LinkButton ID="lnkAllCourse" runat="server" Text="<- View All Course" OnClick="lnkAllCourse_Click"></asp:LinkButton>
                    </div>
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
                        display: inline !important; float: none;">Course Name</span>
                </td>
                <td style="height: 30px; width: 383px;">
                    <asp:TextBox ID="txtCourseName" placeholder="Enter Your Course" runat="server" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCourseName"
                        ValidationGroup="Course" ErrorMessage="Course is Required !" Font-Bold="False"
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
