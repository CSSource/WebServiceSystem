<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>�û�����-�ۺ����ϵͳ</title>
    <style type="text/css">
        .style1
        {
            height: 43px;
            width: 336px;
        }
        .style2
        {
            height: 43px;
            width: 475px;
        }
        .TextBoxstyle
        {
            height: 23px;
            width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <table style="width: 80%;">
        <tr>
            <td class="style1">
                ������
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBoxOldVal" runat="server" CssClass="TextBoxstyle" 
                    CausesValidation="True" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorOldVal" runat="server" 
                    ControlToValidate="TextBoxOldVal" ErrorMessage="�������û�����">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                ������
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBoxNewVal" runat="server" CssClass="TextBoxstyle" 
                    CausesValidation="True" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewVal" runat="server" 
                    ControlToValidate="TextBoxNewVal" ErrorMessage="������������">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                ȷ��������
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBoxConfirm" runat="server" CssClass="TextBoxstyle" 
                    CausesValidation="True" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidatorPsd" runat="server" 
                    ControlToCompare="TextBoxNewVal" ControlToValidate="TextBoxConfirm" 
                    ErrorMessage="������������벻ͬ������������">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
            </td>
            <td class="style2">
                <asp:Button ID="ButtonSubmit" runat="server" Text="����" 
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
