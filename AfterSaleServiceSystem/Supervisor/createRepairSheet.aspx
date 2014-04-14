<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createRepairSheet.aspx.cs"
MasterPageFile="~/Serviceman/ClerkMaster.Master" Inherits="AfterSaleServiceSystem.Supervisor.createRepairSheet" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户首页-售后管理系统</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<form  action  ="createRepairSheet.aspx"  >
  <P> 请扫描维修单条形码  <input type ="text" name = "GUID" /><asp:Label ID="Label1" 
          runat="server"></asp:Label> </P>   
  
  <p>
  产品型号<input  type = "text" name = "productType" />
  </p>
    <p>
    产品编号<input  type = "text" name = "productCode" />
  </p>
  <p>  请选择该维修单来自的客户名
      <asp:DropDownList ID="DropDownList1" runat="server" 
          DataSourceID="SqlDataSource1" DataTextField="username" 
          DataValueField="username" EnableViewState="False">
      </asp:DropDownList>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:DatabaseAsssConnectionString %>" 
          SelectCommand="SELECT [username] FROM [tb_clerk]"></asp:SqlDataSource>
  </p>
  <p> <input type ="submit" name ="提交"</p>
  <p>
  <asp:Label ID="isInsertSucced" runat="server" ></asp:Label></p>
</form>
</asp:Content>