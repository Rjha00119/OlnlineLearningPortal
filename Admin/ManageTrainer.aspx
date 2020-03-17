<%@ Page Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true"
    CodeFile="ManageTrainer.aspx.cs" Inherits="Admin_ManageTrainer" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 100px;">
        <h2 style="color: Black">
            Manage Trainer Details
        </h2>
    </div>
    <div style="margin-left: 100px; margin-bottom: 30px; min-height: 250px;">
        <asp:GridView ID="grdvTrainer" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Id"
            EmptyDataText="No records has been added." Width="1150" PageSize="5" AllowPaging="true"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" OnRowEditing="OnRowEditing"
            OnRowCancelingEdit="OnRowCancelingEdit" CssClass="grdvCss" OnPageIndexChanging="OnPaging">
            <Columns>
                <asp:TemplateField HeaderText="Email Id" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail_Id" runat="server" Text='<%# Eval("Email_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Role_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblrole_name" runat="server" Text='<%# Eval("role_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblFirst_Name" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFirst_Name" runat="server" Text='<%# Eval("First_Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblLast_Name" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLast_Name" runat="server" Text='<%# Eval("Last_Name") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact_No" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblContact_No" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtContact_No" runat="server" Text='<%# Eval("Contact_No") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Approved By" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblApproved_By" runat="server" Text='<%# Eval("Approved_By") %>'></asp:Label>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsApproved" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblIsApproved" runat="server" Text='<%# Eval("Approval_Flag_Status") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkIsApproved" runat="server" Checked='<%# Eval("Approval_Flag") %>'></asp:CheckBox>
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
</asp:Content>
