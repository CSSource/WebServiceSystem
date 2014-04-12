<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="SheetDetail.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.SheetDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>维修单-售后管理系统</title>
    <style type="text/css">
        .style1
        {
            width: 326px;
        }
        .style2
        {
            width: 545px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table style="height: 206px; width: 824px; margin-right: 0px">
        <tr>
            <td class="style1">
                <asp:FormView ID="FormViewProduct" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_Sheet">
                    <ItemTemplate>
                        guid:
                        <br />
                        <asp:Label ID="guidLabel" runat="server" Text='<%# Bind("guid") %>' />
                        <br />
                        产品型号:
                        <br />
                        <asp:Label ID="producttypeLabel" runat="server" Text='<%# Bind("producttype") %>' />
                        <br />
                        产品序列号:
                        <br />
                        <asp:Label ID="productnumberLabel" runat="server" Text='<%# Bind("productnumber") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
            </td>
            <td class="style2">
                <asp:FormView ID="FormViewCustom" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_Custom"
                    EmptyDataText="没有客户信息">
                    <ItemTemplate>
                        公司名称:
                        <asp:Label ID="companyLabel" runat="server" Text='<%# Bind("company") %>' />
                        <br />
                        公司地址:
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                        <br />
                        邮政编码:
                        <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Bind("zipcode") %>' />
                        <br />
                        联系人姓名:
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                        <br />
                        电话号码:
                        <asp:Label ID="telareacodeLabel" runat="server" Text='<%# Bind("telareacode") %>' />
                        -
                        <asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' />
                        -
                        <asp:Label ID="telextensionLabel" runat="server" Text='<%# Bind("telextension") %>' />
                        <br />
                        手机号码:
                        <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Bind("mobilephone") %>' />
                        <br />
                        email:
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                        <br />
                        msn:
                        <asp:Label ID="msnLabel" runat="server" Text='<%# Bind("msn") %>' />
                        <br />
                        qq:
                        <asp:Label ID="qqLabel" runat="server" Text='<%# Bind("qq") %>' />
                        <br />
                        备注:
                        <asp:Label ID="additionalLabel" runat="server" Text='<%# Bind("additional") %>' />
                        <br />
                    </ItemTemplate>
                </asp:FormView>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource_Sheet" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByid"
        TypeName="AfterSaleServiceSystem.DAL.dsRepairSheetTableAdapters.tb_repairsheetTableAdapter"
        UpdateMethod="Update">
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
            <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int64" />
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
    <asp:ObjectDataSource ID="ObjectDataSource_Custom" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySheetid"
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
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="Sheeetid" QueryStringField="id"
                Type="Int64" />
        </SelectParameters>
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
    <asp:ObjectDataSource ID="ObjectDataSourceLogs" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySheetid"
        TypeName="AfterSaleServiceSystem.DAL.dsLogsTableAdapters.tb_logsTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="logdata" Type="String" />
            <asp:Parameter Name="logtime" Type="DateTime" />
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="Sheeetid" QueryStringField="id"
                Type="Int64" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="logdata" Type="String" />
            <asp:Parameter Name="logtime" Type="DateTime" />
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceRepairState" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AfterSaleServiceSystem.DAL.dsRepairStateTableAdapters.tb_repairstateTableAdapter">
    </asp:ObjectDataSource>
    <asp:FormView ID="FormViewSheetInfo" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_Sheet"
        OnDataBound="FormViewSheetInfo_DataBound" 
        onitemupdating="FormViewSheetInfo_ItemUpdating">
        <EditItemTemplate>
            <asp:HiddenField ID="idHiddenField" runat="server" Value='<%# Eval("id") %>' />
            <asp:HiddenField ID="guidHiddenField" runat="server" Value='<%# Bind("guid") %>' />
            <asp:HiddenField ID="producttypeHiddenField" runat="server" Value='<%# Bind("producttype") %>' />
            <asp:HiddenField ID="productnumberHiddenField" runat="server" Value='<%# Bind("productnumber") %>' />
            <asp:HiddenField ID="clerkidHiddenField" runat="server" Value='<%# Bind("clerkid") %>' />
            <asp:HiddenField ID="customidHiddenField" runat="server" Value='<%# Bind("customid") %>' />
            维修状态:
            <asp:DropDownList ID="repairstateDropDownList" runat="server" DataSourceID="ObjectDataSourceRepairState"
                DataTextField="description" DataValueField="id" SelectedValue='<%# Bind("repairstateid") %>'>
            </asp:DropDownList>
            维修进度:
            <asp:DropDownList ID="processDropDownList" runat="server" SelectedValue='<%# Bind("process") %>'>
                <asp:ListItem Value="0">0%</asp:ListItem>
                <asp:ListItem Value="10">10%</asp:ListItem>
                <asp:ListItem Value="20">20%</asp:ListItem>
                <asp:ListItem Value="30">30%</asp:ListItem>
                <asp:ListItem Value="40">40%</asp:ListItem>
                <asp:ListItem Value="50">50%</asp:ListItem>
                <asp:ListItem Value="60">60%</asp:ListItem>
                <asp:ListItem Value="70">70%</asp:ListItem>
                <asp:ListItem Value="80">80%</asp:ListItem>
                <asp:ListItem Value="90">90%</asp:ListItem>
                <asp:ListItem Value="100">100%</asp:ListItem>
            </asp:DropDownList>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="保存" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <ItemTemplate>
            维修状态:
            <asp:Label ID="repairstateidLabel" runat="server" Text='<%# Bind("repairstateid") %>' />
            维修进度:
            <asp:Label ID="processLabel" runat="server" Text='<%# Bind("process") %>' />%
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="修改" />
        </ItemTemplate>
    </asp:FormView>
    <p>
        <b>日志记录：</b></p>
    <hr />
    <br />
    <br />
    <asp:ListView ID="ListViewLogs" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSourceLogs"
        InsertItemPosition="LastItem" OnItemInserting="ListViewLogs_ItemInserting" OnItemUpdating="ListViewLogs_ItemUpdating">
        <ItemTemplate>
            <span style=""><b>
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                由
                <asp:Label ID="LabelClerk" runat="server" Text='<%# Eval("clerkid") %>' />
                更新于
                <asp:Label ID="LabelTimeSpan" runat="server" Text='<%# Eval("logtime") %>' />
                之前： </b>
                <hr />
                <br />
                <asp:Label ID="logdataLabel" runat="server" Text='<%# Eval("logdata") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="修改" />
                <br />
                <br />
            </span>
        </ItemTemplate>
        <EmptyDataTemplate>
            <span>没有日志信息.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style=""><b>更新： </b>
                <br />
                <hr />
                说明:
                <br />
                <asp:TextBox ID="logdataTextBox" runat="server" Text='<%# Bind("logdata") %>' Width="700px"
                    Height="300px" TextMode="MultiLine" />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="提交" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清空" />
                <br />
                <br />
            </span>
        </InsertItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span id="itemPlaceholder" runat="server" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <EditItemTemplate>
            <span style="">
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("repairsheetid") %>' />
                <b>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                    由
                    <asp:Label ID="LabelClerk" runat="server" Text='<%# Bind("clerkid") %>' />
                    更新于
                    <asp:Label ID="LabelTimeSpan" runat="server" Text='<%# Bind("logtime") %>' />
                    之前： </b>
                <hr />
                <br />
                <asp:TextBox ID="logdataTextBox" runat="server" Text='<%# Bind("logdata") %>' Width="700px"
                    Height="300px" TextMode="MultiLine" />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="保存" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                <br />
                <br />
            </span>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <span style="">id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                logdata:
                <asp:Label ID="logdataLabel" runat="server" Text='<%# Eval("logdata") %>' />
                <br />
                logtime:
                <asp:Label ID="logtimeLabel" runat="server" Text='<%# Eval("logtime") %>' />
                <br />
                clerkid:
                <asp:Label ID="clerkidLabel" runat="server" Text='<%# Eval("clerkid") %>' />
                <br />
                repairsheetid:
                <asp:Label ID="repairsheetidLabel" runat="server" Text='<%# Eval("repairsheetid") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <p>
        &nbsp;</p>
</asp:Content>
