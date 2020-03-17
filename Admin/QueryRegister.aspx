<%@ Page Language="C#" MasterPageFile="~/adminMaster.master" AutoEventWireup="true"
    CodeFile="QueryRegister.aspx.cs" Inherits="Admin_QueryRegister" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin-left: 100px;">
        <h2 style="color: Black">
            Manage Query Register
        </h2>
    </div>
    <div style="margin-left: 100px; margin-bottom: 30px; min-height: 250px;">
        <asp:GridView ID="grdvLearner" runat="server" AutoGenerateColumns="false" DataKeyNames="Query_Id"
            EmptyDataText="No records has been added." Width="1150" PageSize="5" AllowPaging="true"
            OnRowUpdating="OnRowUpdating" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
            OnRowDeleting="OnRowDeleting" CssClass="grdvCss" OnPageIndexChanging="OnPaging">
            <Columns>
                <asp:TemplateField HeaderText="Questioner" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail_Id" runat="server" Text='<%# Eval("Email_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Questioner Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Questioner Contact_No" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblContact_No" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Query for" ItemStyle-Width="180">
                    <ItemTemplate>
                        <asp:Label ID="lblTrainer" runat="server" Text='<%# Eval("TrainerName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Query" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblQuery" runat="server" Text='<%# Eval("Query") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Solution" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblSolution" runat="server" Text='<%# Eval("Solution") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtSolution" runat="server" Text='<%# Eval("Solution") %>' Width="140"></asp:TextBox>
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
