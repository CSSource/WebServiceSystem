<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户管理-售后管理系统</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:FormView ID="FormViewUser" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSourceClerk"
        OnItemUpdating="FormViewUser_ItemUpdating" 
    onitemcreated="FormViewUser_ItemCreated">
        <EditItemTemplate>
            真实姓名:
            <asp:TextBox ID="realnameTextBox" runat="server" Text='<%# Bind("realname") %>' />
            <br />
            年龄:
            <asp:TextBox ID="ageTextBox" runat="server" Text='<%# Bind("age") %>' />
            <br />
            性别:
            <asp:DropDownList ID="DropDownListSex" runat="server" DataValueField='<%# Bind("age") %>'>
                <asp:ListItem Value="未知">未知</asp:ListItem>
                <asp:ListItem Value="男">男</asp:ListItem>
                <asp:ListItem Value="女">女</asp:ListItem>
            </asp:DropDownList>
            <br />
            昵称:
            <asp:TextBox ID="nicknameTextBox" runat="server" Text='<%# Bind("nickname") %>' />
            <br />
            手机:
            <asp:TextBox ID="mobilephoneTextBox" runat="server" Text='<%# Bind("mobilephone") %>' />
            <br />
            电话:
            <asp:TextBox ID="teleareacodeTextBox" runat="server" Text='<%# Bind("teleareacode") %>' />
            -
            <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
            <br />
            地址:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            邮政编码:
            <asp:TextBox ID="zipcodeTextBox" runat="server" Text='<%# Bind("zipcode") %>' />
            <br />
            头像:
            <asp:TextBox ID="headpicTextBox" runat="server" Text='<%# Bind("headpic") %>' />
            <br />
            备注信息:
            <asp:TextBox ID="additionalTextBox" runat="server" Text='<%# Bind("additional") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="更新" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="取消" />
        </EditItemTemplate>
        <ItemTemplate>
            真实姓名:
            <asp:Label ID="realnameLabel" runat="server" Text='<%# Bind("realname") %>' />
            <br />
            年龄:
            <asp:Label ID="ageLabel" runat="server" Text='<%# Bind("age") %>' />
            <br />
            性别:
            <asp:Label ID="sexLabel" runat="server" Text='<%# Bind("sex") %>' />
            <br />
            昵称:
            <asp:Label ID="nicknameLabel" runat="server" Text='<%# Bind("nickname") %>' />
            <br />
            手机:
            <asp:Label ID="mobilephoneLabel" runat="server" Text='<%# Bind("mobilephone") %>' />
            <br />
            电话:
            <asp:Label ID="teleareacodeLabel" runat="server" Text='<%# Bind("teleareacode") %>' />
            -
            <asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' />
            <br />
            地址:
            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
            <br />
            邮政编码:
            <asp:Label ID="zipcodeLabel" runat="server" Text='<%# Bind("zipcode") %>' />
            <br />
            头像:
            <asp:Label ID="headpicLabel" runat="server" Text='<%# Bind("headpic") %>' />
            <br />
            备注信息:
            <asp:Label ID="additionalLabel" runat="server" Text='<%# Bind("additional") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="修改" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSourceClerk" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByid"
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
        <SelectParameters>
            <asp:SessionParameter DefaultValue="1" Name="id" SessionField="UserId" Type="Int64" />
        </SelectParameters>
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
</asp:Content>
