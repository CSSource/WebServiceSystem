<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebErr.aspx.cs" Inherits="AfterSaleServiceSystem.WebErr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src="img/bg_404.gif" />
        <br />
        <asp:Label ID="LabelErrMsg" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelErrSrc" runat="server"></asp:Label>
        <br />
        <asp:Label ID="LabelErrStack" runat="server"></asp:Label>
        <br />
    </div>
    </form>
</body>
</html>
