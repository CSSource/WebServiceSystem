<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisorHomePage.aspx.cs"
MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.supervisorHomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>����Ա��ҳ</title>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<div style="height: 400px">
<p>  <a href ="getBarCode.aspx">����ά�޵�</a>   </p>
<p>  <a href ="repairSheetView.aspx">ά�޵��б�</a>   </p>
<p>  <a href ="customListvew.aspx">�ͻ�Ⱥ�б�</a>   </p>
<p>  <a href ="clerkSheetView.aspx">ά����Ա�б�</a>   </p>
</div>
</asp:Content>