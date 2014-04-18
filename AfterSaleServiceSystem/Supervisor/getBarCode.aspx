<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getBarCode.aspx.cs" MasterPageFile="~/Serviceman/ClerkMaster.Master"
 Inherits="AfterSaleServiceSystem.Supervisor.getBarCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<p>请输入条形码 <input type="text"  name = "barCode"/> </p>
    <asp:Button ID="Button1" runat="server" Text="确定"  onclick="Button1_Click" />
</asp:Content>