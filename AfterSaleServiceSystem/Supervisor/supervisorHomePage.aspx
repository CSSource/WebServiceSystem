<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisorHomePage.aspx.cs"
MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.supervisorHomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>管理员首页</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div style="height: 400px">
<p>  <a href ="getBarCode.aspx">创建维修单</a>   </p>
<p>  <a href ="repairSheetView.aspx">维修单列表</a>   </p>
<p>  <a href ="customListvew.aspx">客户群列表</a>   </p>
<p>  <a href ="clerkSheetView.aspx">维修人员列表</a>   </p>
</div>
</asp:Content>