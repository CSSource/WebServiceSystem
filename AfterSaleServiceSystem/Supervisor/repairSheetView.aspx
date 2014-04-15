<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="repairSheetView.aspx.cs"
    MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.repairSheetView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>维修单列表</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<p>  按维修人员筛选
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="ObjectDataSource1" DataTextField="username" 
        DataValueField="id" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
        AutoPostBack="True">
    </asp:DropDownList>
    按客户公司筛选
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectDataSource_custom" DataTextField="company" 
        DataValueField="id" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
    </asp:DropDownList>
    按维修状态筛选
    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectDataSource_repairstate" DataTextField="description" 
        DataValueField="id" onselectedindexchanged="DropDownList3_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource_repairstate" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="AfterSaleServiceSystem.DAL.dsRepairStateTableAdapters.tb_repairstateTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource_custom" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="AfterSaleServiceSystem.DAL.dsCustomerTableAdapters.tb_customTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="zipcode" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="telareacode" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="telextension" Type="String" />
            <asp:Parameter Name="mobilephone" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="qq" Type="String" />
            <asp:Parameter Name="additional" Type="String" />
            <asp:Parameter Name="msn" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="company" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="zipcode" Type="String" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="telareacode" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="telextension" Type="String" />
            <asp:Parameter Name="mobilephone" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="qq" Type="String" />
            <asp:Parameter Name="additional" Type="String" />
            <asp:Parameter Name="msn" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="AfterSaleServiceSystem.DAL.dsClerkTableAdapters.tb_clerkTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="realname" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="entrytime" Type="DateTime" />
            <asp:Parameter Name="lastlogintime" Type="DateTime" />
            <asp:Parameter Name="isonjob" Type="Boolean" />
            <asp:Parameter Name="mobilephone" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="teleareacode" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="zipcode" Type="String" />
            <asp:Parameter Name="headpic" Type="String" />
            <asp:Parameter Name="nickname" Type="String" />
            <asp:Parameter Name="authorityid" Type="Int32" />
            <asp:Parameter Name="additional" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="realname" Type="String" />
            <asp:Parameter Name="age" Type="Int32" />
            <asp:Parameter Name="sex" Type="String" />
            <asp:Parameter Name="entrytime" Type="DateTime" />
            <asp:Parameter Name="lastlogintime" Type="DateTime" />
            <asp:Parameter Name="isonjob" Type="Boolean" />
            <asp:Parameter Name="mobilephone" Type="String" />
            <asp:Parameter Name="telephone" Type="String" />
            <asp:Parameter Name="teleareacode" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="zipcode" Type="String" />
            <asp:Parameter Name="headpic" Type="String" />
            <asp:Parameter Name="nickname" Type="String" />
            <asp:Parameter Name="authorityid" Type="Int32" />
            <asp:Parameter Name="additional" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server">
    </asp:LinqDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseAsssConnectionString %>"
         
        SelectCommand="SELECT tb_repairsheet.id, tb_repairsheet.guid, tb_repairsheet.producttype, tb_repairsheet.productnumber, tb_repairsheet.repairstateid, tb_repairsheet.clerkid, tb_repairsheet.customid, tb_repairsheet.process, tb_clerk.username, tb_repairstate.description, tb_custom.company FROM tb_repairsheet LEFT JOIN tb_custom ON tb_repairsheet.id = tb_custom.id LEFT JOIN tb_repairstate ON tb_repairsheet.id = tb_repairstate.id LEFT JOIN tb_clerk ON tb_repairsheet.clerkid = tb_clerk.id">

           </asp:SqlDataSource>
</p>
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
         
        SelectCommand="SELECT tb_repairsheet.id, tb_repairsheet.guid, tb_repairsheet.producttype, tb_repairsheet.productnumber, tb_repairsheet.repairstateid, tb_repairsheet.clerkid, tb_repairsheet.customid, tb_repairsheet.process, tb_clerk.username, tb_repairstate.description, tb_custom.company FROM tb_repairsheet LEFT JOIN tb_custom ON tb_repairsheet.customid = tb_custom.id LEFT JOIN tb_repairstate ON tb_repairsheet.repairstateid = tb_repairstate.id LEFT JOIN tb_clerk ON tb_repairsheet.clerkid = tb_clerk.id">

           </asp:SqlDataSource>
</asp:Content>
