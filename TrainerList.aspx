<%@ Page Language="C#" MasterPageFile="~/index.master" AutoEventWireup="true" CodeFile="TrainerList.aspx.cs"
    Inherits="TrainerList" Title="Trainer List Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divMainGrid" runat="server" visible="true">
        <div style="margin-left: 150px;">
            <h2 style="color: Black">
                Trainer Details
            </h2>
        </div>
        <div style="margin-left: 150px; margin-bottom:30px;">
            <asp:GridView ID="grdvContents" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Id"
                EmptyDataText="No records has been added." Width="1050px" PageSize="5" AllowPaging="true"
                OnPageIndexChanging="OnPaging">
                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                <Columns>
                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td align="left">
                                        <div style="text-align: center; margin-right: 100px;">
                                            <asp:Image ID="imgContentIcon" runat="server" ImageUrl=' <%# Eval("ImageIcon") %>'
                                                Width="100px" Height="100px" />
                                        </div>
                                    </td>
                                    <td style="width: 500px">
                                        <table>
                                            <tr>
                                                <td>
                                                    <span style="margin-bottom: 10px; margin-top: 10px; font-size: 18px; font-weight: bolder;
                                                        height: 30px !important">
                                                        <%# Eval("First_Name")%>
                                                        <%# Eval("Last_Name")%>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span style="margin-bottom: 10px; margin-top: 10px; height: 30px !important">
                                                       
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span style="margin-bottom: 10px; margin-top: 10px">
                                                        <%# Eval("About_user")%></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="margin: 10px; width: 150px">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" Height="34px"
                    HorizontalAlign="Center" />
                <RowStyle ForeColor="#000066" Height="30px" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
