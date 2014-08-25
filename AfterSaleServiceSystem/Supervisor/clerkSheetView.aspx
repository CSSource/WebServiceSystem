<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clerkSheetView.aspx.cs"
    MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.clerkSheetView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>管理员首页</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_clerk"
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
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                </td>
                <td>
                    <asp:Label ID="realnameLabel" runat="server" Text='<%# Eval("realname") %>' />
                </td>
                <td>
                    <asp:Label ID="ageLabel" runat="server" Text='<%# Eval("age") %>' />
                </td>
                <td>
                    <asp:Label ID="sexLabel" runat="server" Text='<%# Eval("sex") %>' />
                </td>
                <td>
                    <asp:Label ID="entrytimeLabel" runat="server" Text='<%# Eval("entrytime") %>' />
                </td>
                <td>
                    <asp:Label ID="lastlogintimeLabel" runat="server" Text='<%# Eval("lastlogintime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="isonjobCheckBox" runat="server" Checked='<%# Eval("isonjob").ToString().ToLower() == "true" ? true : false %>'
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="teleareacodeLabel" runat="server" Text='<%# Eval("teleareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="headpicLabel" runat="server" Text='<%# Eval("headpic") %>' />
                </td>
                <td>
                    <asp:Label ID="nicknameLabel" runat="server" Text='<%# Eval("nickname") %>' />
                </td>
                <td>
                    <asp:Label ID="authorityidLabel" runat="server" Text='<%# Eval("authorityid") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
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
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                </td>
                <td>
                    <asp:Label ID="realnameLabel" runat="server" Text='<%# Eval("realname") %>' />
                </td>
                <td>
                    <asp:Label ID="ageLabel" runat="server" Text='<%# Eval("age") %>' />
                </td>
                <td>
                    <asp:Label ID="sexLabel" runat="server" Text='<%# Eval("sex") %>' />
                </td>
                <td>
                    <asp:Label ID="entrytimeLabel" runat="server" Text='<%# Eval("entrytime") %>' />
                </td>
                <td>
                    <asp:Label ID="lastlogintimeLabel" runat="server" Text='<%# Eval("lastlogintime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="isonjobCheckBox" runat="server" Checked='<%# Eval("isonjob").ToString().ToLower() == "true" ? true : false %>'
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="teleareacodeLabel" runat="server" Text='<%# Eval("teleareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="headpicLabel" runat="server" Text='<%# Eval("headpic") %>' />
                </td>
                <td>
                    <asp:Label ID="nicknameLabel" runat="server" Text='<%# Eval("nickname") %>' />
                </td>
                <td>
                    <asp:Label ID="authorityidLabel" runat="server" Text='<%# Eval("authorityid") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse;
                border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>
                        未返回数据。
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
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                </td>
                <td>
                    <asp:TextBox ID="realnameTextBox" runat="server" Text='<%# Bind("realname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ageTextBox" runat="server" Text='<%# Bind("age") %>' />
                </td>
                <td>
                    <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                </td>
                <td>
                    <asp:TextBox ID="entrytimeTextBox" runat="server" Text='<%# Bind("entrytime") %>' />
                </td>
                <td>
                    <asp:TextBox ID="lastlogintimeTextBox" runat="server" Text='<%# Bind("lastlogintime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="isonjobCheckBox" runat="server" Checked='<%# Bind("isonjob") %>' />
                </td>
                <td>
                    <asp:TextBox ID="mobilephoneTextBox" runat="server" Text='<%# Bind("mobilephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="teleareacodeTextBox" runat="server" Text='<%# Bind("teleareacode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="headpicTextBox" runat="server" Text='<%# Bind("headpic") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nicknameTextBox" runat="server" Text='<%# Bind("nickname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="authorityidTextBox" runat="server" Text='<%# Bind("authorityid") %>' />
                </td>
                <td>
                    <asp:TextBox ID="additionalTextBox" runat="server" Text='<%# Bind("additional") %>' />
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
                                    用户名
                                </th>
                                <th runat="server">
                                    密码
                                </th>
                                <th runat="server">
                                    真实姓名
                                </th>
                                <th runat="server">
                                    年龄
                                </th>
                                <th runat="server">
                                    性别
                                </th>
                                <th runat="server">
                                    入职时间
                                </th>
                                <th runat="server">
                                    上次登录时间
                                </th>
                                <th runat="server">
                                    是否在职
                                </th>
                                <th runat="server">
                                    手机
                                </th>
                                <th runat="server">
                                    电话
                                </th>
                                <th runat="server">
                                    区号
                                </th>
                                <th runat="server">
                                    地址
                                </th>
                                <th runat="server">
                                    邮编
                                </th>
                                <th runat="server">
                                    头像
                                </th>
                                <th runat="server">
                                    昵称
                                </th>
                                <th runat="server">
                                    权限
                                </th>
                                <th runat="server">
                                    其他
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
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                </td>
                <td>
                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                </td>
                <td>
                    <asp:TextBox ID="realnameTextBox" runat="server" Text='<%# Bind("realname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ageTextBox" runat="server" Text='<%# Bind("age") %>' />
                </td>
                <td>
                    <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>' />
                </td>
                <td>
                    <asp:TextBox ID="entrytimeTextBox" runat="server" Text='<%# Bind("entrytime") %>' />
                </td>
                <td>
                    <asp:TextBox ID="lastlogintimeTextBox" runat="server" Text='<%# Bind("lastlogintime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="isonjobCheckBox" runat="server" Checked='<%# Eval("isonjob").ToString().ToLower() == "true" ? true : false %>' />
                </td>
                <td>
                    <asp:TextBox ID="mobilephoneTextBox" runat="server" Text='<%# Bind("mobilephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                </td>
                <td>
                    <asp:TextBox ID="teleareacodeTextBox" runat="server" Text='<%# Bind("teleareacode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                </td>
                <td>
                    <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' />
                </td>
                <td>
                    <asp:TextBox ID="headpicTextBox" runat="server" Text='<%# Bind("headpic") %>' />
                </td>
                <td>
                    <asp:TextBox ID="nicknameTextBox" runat="server" Text='<%# Bind("nickname") %>' />
                </td>
                <td>
                    <asp:TextBox ID="authorityidTextBox" runat="server" Text='<%# Bind("authorityid") %>' />
                </td>
                <td>
                    <asp:TextBox ID="additionalTextBox" runat="server" Text='<%# Bind("additional") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                </td>
                <td>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                </td>
                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                </td>
                <td>
                    <asp:Label ID="realnameLabel" runat="server" Text='<%# Eval("realname") %>' />
                </td>
                <td>
                    <asp:Label ID="ageLabel" runat="server" Text='<%# Eval("age") %>' />
                </td>
                <td>
                    <asp:Label ID="sexLabel" runat="server" Text='<%# Eval("sex") %>' />
                </td>
                <td>
                    <asp:Label ID="entrytimeLabel" runat="server" Text='<%# Eval("entrytime") %>' />
                </td>
                <td>
                    <asp:Label ID="lastlogintimeLabel" runat="server" Text='<%# Eval("lastlogintime") %>' />
                </td>
                <td>
                    <asp:CheckBox ID="isonjobCheckBox" runat="server" Checked='<%# Eval("isonjob").ToString().ToLower() == "true" ? true : false %>'
                        Enabled="false" />
                </td>
                <td>
                    <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Eval("mobilephone") %>' />
                </td>
                <td>
                    <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                </td>
                <td>
                    <asp:Label ID="teleareacodeLabel" runat="server" Text='<%# Eval("teleareacode") %>' />
                </td>
                <td>
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                </td>
                <td>
                    <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Eval("zipcode") %>' />
                </td>
                <td>
                    <asp:Label ID="headpicLabel" runat="server" Text='<%# Eval("headpic") %>' />
                </td>
                <td>
                    <asp:Label ID="nicknameLabel" runat="server" Text='<%# Eval("nickname") %>' />
                </td>
                <td>
                    <asp:Label ID="authorityidLabel" runat="server" Text='<%# Eval("authorityid") %>' />
                </td>
                <td>
                    <asp:Label ID="additionalLabel" runat="server" Text='<%# Eval("additional") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource_clerk" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
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
            <asp:Parameter Name="isonjob" Type="String" />
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
            <asp:Parameter Name="isonjob" Type="String" />
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
</asp:Content>
