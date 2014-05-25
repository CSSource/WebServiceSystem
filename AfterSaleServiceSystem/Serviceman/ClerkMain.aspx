<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="ClerkMain.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.ClerkMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户首页-售后管理系统</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:TextBox ID="TextBoxGUID" runat="server" Width="374px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="申领维修单" Style="width: 150px" Width="150px"
        OnClick="Button1_Click" />
    <asp:Label ID="LabelErr_Checked" runat="server" Font-Bold="True" Text="该维修单已经被申领了。" Visible="False"></asp:Label>
    <asp:Label ID="LabelErr_NoExist" runat="server" Font-Bold="True" Text="该维修单不存在。" Visible="False"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSourceRepairSheet" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByClerkid_State"
        TypeName="AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter"
        UpdateMethod="Update" OnSelecting="ObjectDataSourceRepairSheet_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="guid" Type="String" />
            <asp:Parameter Name="producttype" Type="String" />
            <asp:Parameter Name="productnumber" Type="String" />
            <asp:Parameter Name="repairstateid" Type="Int32" />
            <asp:Parameter Name="clerkid" Type="Int32" />
            <asp:Parameter Name="customid" Type="Int32" />
            <asp:Parameter Name="process" Type="Int32" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="clerkid" SessionField="UserId" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="StateMin" Type="Int32" />
            <asp:Parameter DefaultValue="5" Name="StateMax" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="guid" Type="String" />
            <asp:Parameter Name="producttype" Type="String" />
            <asp:Parameter Name="productnumber" Type="String" />
            <asp:Parameter Name="repairstateid" Type="Int32" />
            <asp:Parameter Name="clerkid" Type="Int32" />
            <asp:Parameter Name="customid" Type="Int32" />
            <asp:Parameter Name="process" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <p>
        &nbsp;</p>
    <p>
        <asp:ListView ID="ListViewRepairSheet" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSourceRepairSheet"
            EnableViewState="False" OnItemCreated="ListViewRepairSheet_ItemCreated" OnItemDataBound="ListViewRepairSheet_ItemDataBound">
            <ItemTemplate>
                <tr align="center">
                    <td>
                        <a href='/Serviceman/SheetDetail2.aspx?id=<%# Eval("id") %>'>
                            <asp:Label ID="guidLabel" runat="server" Text='<%# Eval("guid") %>' /></a>
                    </td>
                    <td>
                        <asp:Label ID="producttypeLabel" runat="server" Text='<%# Eval("producttype") %>' />
                    </td>
                    <td>
                        <asp:Label ID="productnumberLabel" runat="server" Text='<%# Eval("productnumber") %>' />
                    </td>
                    <td>
                        <asp:Label ID="repairstateidLabel" runat="server" Text='<%# Eval("repairstateid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="customidLabel" runat="server" Text='<%# Eval("customid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="processLabel" runat="server" Text='<%# Eval("process")+"%" %> ' />
                    </td>
                </tr>
            </ItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            没有维修单，请先申领。
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">
                                        Guid
                                    </th>
                                    <th runat="server">
                                        产品型号
                                    </th>
                                    <th runat="server">
                                        产品序列号
                                    </th>
                                    <th runat="server">
                                        维修状态
                                    </th>
                                    <th runat="server">
                                        客户公司
                                    </th>
                                    <th runat="server">
                                        维修进度
                                    </th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
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
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
