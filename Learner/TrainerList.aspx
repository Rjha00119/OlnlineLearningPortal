<%@ Page Language="C#" MasterPageFile="~/LearnerMaster.master" AutoEventWireup="true"
    CodeFile="TrainerList.aspx.cs" Inherits="Learner_TrainerList" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h2 style="color: Black">
            Trainer Details
        </h2>
    </div>
    <br />
    <div>
        <asp:GridView ID="grdvTrainer" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Id"
            EmptyDataText="No records has been added." Width="1050" PageSize="5" AllowPaging="true"
            OnPageIndexChanging="OnPaging">
            <Columns>
                <asp:TemplateField HeaderText="Email Id" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblEmail_Id" runat="server" Text='<%# Eval("Email_Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblFirst_Name" runat="server" Text='<%# Eval("First_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last_Name" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblLast_Name" runat="server" Text='<%# Eval("Last_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact_No" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblContact_No" runat="server" Text='<%# Eval("Contact_No") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
