<%@ Page Language="C#" MasterPageFile="~/LearnerMaster.master" AutoEventWireup="true"
    CodeFile="FavouriteDetails.aspx.cs" Inherits="Learner_FavouriteDetails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <div id="divMainGrid" runat="server" visible="true">
        <div style="margin-left: 100px;">
            <h2 style="color: Black">
               Favourite Course Details
            </h2>
        </div>
        <div style="margin-left: 100px; margin-bottom: 30px; min-height: 250px;">
            <asp:GridView ID="grdvContents" runat="server" AutoGenerateColumns="false" DataKeyNames="Course_Content_id"
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
                                                        <%# Eval("Content_Name")%>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span style="margin-bottom: 10px; margin-top: 10px">
                                                        <%# Eval("course_name")%></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <span style="margin-bottom: 10px; margin-top: 10px">
                                                        <%# Eval("Description")%></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-style: italic; font-weight: bold; margin: 10px">
                                                    <%# Eval("First_Name")%>
                                                    <%# Eval("Last_Name")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="margin: 10px; width: 150px">
                                        <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click"
                                            CssClass="button" CommandArgument=' <%# Eval("Content_Path") %>' />
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
