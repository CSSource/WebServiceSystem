<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="repairSheetView.aspx.cs"
    MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.repairSheetView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>维修单列表</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <tr align="center">
                <td>
                    <a href='/Serviceman/SheetDetail.aspx?id=<%# Eval("id") %>'>
                        <asp:Label ID="guidLabel" runat="server" Text='<%# Eval("guid") %>' /></a>
                </td>
                <td>
                    <asp:Label ID="producttypeLabel" runat="server" Text='<%# Eval("producttype") %>' />
                </td>
                <td>
                    <asp:Label ID="productnumberLabel" runat="server" Text='<%# Eval("productnumber") %>' />
                </td>
                <td>
                    <asp:Label ID="repairstateidLabel" runat="server" Text='<%# Eval("description") %>' />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="customidLabel" runat="server" Text='<%# Eval("company") %>' />
                </td>
                <td>
                    <asp:Label ID="processLabel" runat="server" Text='<%# Eval("process")+"%" %> ' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table1" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">
                                    Guid
                                </th>
                                <th id="Th2" runat="server">
                                    产品型号
                                </th>
                                <th id="Th3" runat="server">
                                    产品序列号
                                </th>
                                <th id="Th4" runat="server">
                                    维修状态
                                </th>
                                <th id="Th5" runat="server">
                                    维修人员
                                </th>
                                <th id="Th6" runat="server">
                                    客户公司
                                </th>
                                <th id="Th7" runat="server">
                                    维修进度
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="True" ShowLastPageButton="False"
                                    ShowNextPageButton="False" ShowPreviousPageButton="True" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="False" ShowLastPageButton="True"
                                    ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseAsssConnectionString %>"
        
        SelectCommand="SELECT tb_repairsheet.id, tb_repairsheet.guid, tb_repairsheet.producttype, tb_repairsheet.productnumber, tb_repairsheet.repairstateid, tb_repairsheet.clerkid, tb_repairsheet.customid, tb_repairsheet.process, tb_clerk.username, tb_repairstate.description, tb_custom.company FROM tb_repairsheet LEFT JOIN tb_custom ON tb_repairsheet.id = tb_custom.id LEFT JOIN tb_repairstate ON tb_repairsheet.id = tb_repairstate.id LEFT JOIN tb_clerk ON tb_repairsheet.clerkid = tb_clerk.id">
    </asp:SqlDataSource>
</asp:Content>
