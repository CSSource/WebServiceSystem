﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customListvew.aspx.cs"
    MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.customListvew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>客户信息表</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolderContent">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" DataKeyNames="id"
        InsertItemPosition="LastItem">
        <ItemTemplate>
            <tr style="background-color: #FFFBD6; color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="companyLabel" runat="server" Text='<%# Eval("company") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="telareacodeLabel" runat="server" Text='<%# Eval("telareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telextensionLabel" runat="server" Text='<%# Eval("telextension") %>' />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="qqLabel" runat="server" Text='<%# Eval("qq") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
                </td>
                <td>
                    <asp:Label ID="msnLabel" runat="server" Text='<%# Eval("msn") %>' />
                </td>
                <td>
                    <asp:Label ID="faxLabel" runat="server" Text='<%# Eval("fax") %>' />
                </td>
                <td>
                    <asp:Label ID="agentLabel" runat="server" Text='<%# Eval("agent") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2; color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="companyLabel" runat="server" Text='<%# Eval("company") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="telareacodeLabel" runat="server" Text='<%# Eval("telareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telextensionLabel" runat="server" Text='<%# Eval("telextension") %>' />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="qqLabel" runat="server" Text='<%# Eval("qq") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
                </td>
                <td>
                    <asp:Label ID="msnLabel" runat="server" Text='<%# Eval("msn") %>' />
                </td>
                <td>
                    <asp:Label ID="faxLabel" runat="server" Text='<%# Eval("fax") %>' />
                </td>
                <td>
                    <asp:Label ID="agentLabel" runat="server" Text='<%# Eval("agent") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        No data was returned.
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:TextBox ID="companyTextBox" runat="server" Text='<%# Bind("company") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telareacodeTextBox" runat="server" Text='<%# Bind("telareacode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telextensionTextBox" runat="server" Text='<%# Bind("telextension") %>' />
                </td>
                <td>
                    <asp:TextBox ID="mobilephoneTextBox" runat="server" Text='<%# Bind("mobilephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="qqTextBox" runat="server" Text='<%# Bind("qq") %>' />
                </td>
                <td>
                    <asp:TextBox ID="additionalTextBox" runat="server" Text='<%# Bind("additional") %>' />
                </td>
                <td>
                    <asp:TextBox ID="msnTextBox" runat="server" Text='<%# Bind("msn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="faxTextBox" runat="server" Text='<%# Bind("fax") %>' />
                </td>
                <td>
                    <asp:TextBox ID="agentTextBox" runat="server" Text='<%# Bind("agent") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;
                            border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;
                            font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <th runat="server">
                                </th>
                                <th runat="server">
                                    id
                                </th>
                                <th runat="server">
                                    公司
                                </th>
                                <th runat="server">
                                    地址
                                </th>
                                <th runat="server">
                                    邮编
                                </th>
                                <th runat="server">
                                    联系人
                                </th>
                                <th runat="server">
                                    区号
                                </th>
                                <th runat="server">
                                    电话
                                </th>
                                <th runat="server">
                                    分机号
                                </th>
                                <th runat="server">
                                    手机
                                </th>
                                <th runat="server">
                                    email
                                </th>
                                <th runat="server">
                                    qq
                                </th>
                                <th runat="server">
                                    additional
                                </th>
                                <th runat="server">
                                    msn
                                </th>
                                <th id="Th1" runat="server">
                                    传真
                                </th>
                                <th id="Th2" runat="server">
                                    代理商
                                </th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;
                        color: #333333;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66; color: #000080;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="companyTextBox" runat="server" Text='<%# Bind("company") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telareacodeTextBox" runat="server" Text='<%# Bind("telareacode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telextensionTextBox" runat="server" Text='<%# Bind("telextension") %>' />
                </td>
                <td>
                    <asp:TextBox ID="mobilephoneTextBox" runat="server" Text='<%# Bind("mobilephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                </td>
                <td>
                    <asp:TextBox ID="qqTextBox" runat="server" Text='<%# Bind("qq") %>' />
                </td>
                <td>
                    <asp:TextBox ID="additionalTextBox" runat="server" Text='<%# Bind("additional") %>' />
                </td>
                <td>
                    <asp:TextBox ID="msnTextBox" runat="server" Text='<%# Bind("msn") %>' />
                </td>
                <td>
                    <asp:TextBox ID="faxTextBox" runat="server" Text='<%# Bind("fax") %>' />
                </td>
                <td>
                    <asp:TextBox ID="agentTextBox" runat="server" Text='<%# Bind("agent") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="companyLabel" runat="server" Text='<%# Eval("company") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                </td>
                <td>
                    <asp:Label ID="telareacodeLabel" runat="server" Text='<%# Eval("telareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telextensionLabel" runat="server" Text='<%# Eval("telextension") %>' />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </td>
                <td>
                    <asp:Label ID="qqLabel" runat="server" Text='<%# Eval("qq") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
                </td>
                <td>
                    <asp:Label ID="msnLabel" runat="server" Text='<%# Eval("msn") %>' />
                </td>
                <td>
                    <asp:Label ID="faxLabel" runat="server" Text='<%# Eval("fax") %>' />
                </td>
                <td>
                    <asp:Label ID="agentLabel" runat="server" Text='<%# Eval("agent") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
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
            <asp:Parameter Name="fax" Type="String" />
            <asp:Parameter Name="agent" Type="String" />
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
            <asp:Parameter Name="fax" Type="String" />
            <asp:Parameter Name="agent" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
