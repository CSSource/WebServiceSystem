<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="SheetDetail2.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.SheetDetail2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>维修单-售后管理系统</title>
    <link href="../css/ui-lightness/jquery-ui-1.10.4.min.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-2.0.2.min.js" type="text/javascript"></script>

    <script src="../js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>

    <style type="text/css">
        .style-td
        {
            width: 10%;
            text-align: center;
        }
        .style-multydatatd-3zu
        {
            width: 23%;
            text-align: left;
        }
        .style-multydatatd-2zu
        {
            width: 40%;
            text-align: left;
        }
        .style-multidatatd-3lie
        {
            width: 33%;
            text-align: center;
        }
        .style-multidatatd-5lie
        {
            width: 20%;
            text-align: center;
        }
        .style-singleydatatd
        {
        }
        .Fillstyle
        {
            width: 100%;
        }
        .TextBoxstyle
        {
            width: 99%;
            height: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <h1 align="center" style="font-weight: bold; font-size: x-large; font-family: 楷体;
        text-align: center;">
        维 修 服 务 报 告</h1>
    <br />
    <div align="right">
        <b>NO.</b>
        <asp:Label ID="Label_No" runat="server" Font-Underline="True"></asp:Label>
        &nbsp;&nbsp;
    </div>
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
    <asp:FormView ID="FormView_custom" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_Custom"
        CssClass="Fillstyle">
        <ItemTemplate>
            <table style="width: 100%;" border="2">
                <tr>
                    <td class="style-td">
                        代 理 商
                    </td>
                    <td colspan="5">
                        <asp:Label ID="agentLabel" runat="server" Text='<%# Bind("agent") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        用 户
                    </td>
                    <td colspan="5">
                        <asp:Label ID="companyLabel" runat="server" Text='<%# Bind("company") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        地 址
                    </td>
                    <td colspan="5">
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        联 系 人
                    </td>
                    <td class="style-multydatatd-3zu">
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td class="style-td">
                        电 话
                    </td>
                    <td class="style-multydatatd-3zu">
                        <asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' />
                    </td>
                    <td class="style-td">
                        传 真
                    </td>
                    <td class="style-multydatatd-3zu">
                        <asp:Label ID="faxLabel" runat="server" Text='<%# Bind("fax") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource_sheet" runat="server" DeleteMethod="Delete"
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
    <asp:FormView ID="FormView_sheet" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_sheet"
        CssClass="Fillstyle">
        <ItemTemplate>
            <table style="width: 100%;" border="2">
                <tr>
                    <td class="style-td">
                        产品名称
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("producttype") %>' />
                    </td>
                    <td class="style-td">
                        产品编号
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("productnumber") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource_report" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBysheetid"
        TypeName="AfterSaleServiceSystem.DAL.dsReportsTableAdapters.tb_reportsTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
            <asp:Parameter Name="warrantyperiod" Type="Boolean" />
            <asp:Parameter Name="modifytime" Type="DateTime" />
            <asp:Parameter Name="productname" Type="String" />
            <asp:Parameter Name="productnumber" Type="String" />
            <asp:Parameter Name="softwareVersion" Type="String" />
            <asp:Parameter Name="errorcode" Type="String" />
            <asp:Parameter Name="breakdowndescription" Type="String" />
            <asp:Parameter Name="breakdownreason" Type="String" />
            <asp:Parameter Name="resultofrepair" Type="String" />
            <asp:Parameter Name="laborcost" Type="Decimal" />
            <asp:Parameter Name="partcost" Type="Decimal" />
            <asp:Parameter Name="testcost" Type="Decimal" />
            <asp:Parameter Name="transitcost" Type="Decimal" />
            <asp:Parameter Name="starttime" Type="DateTime" />
            <asp:Parameter Name="endtime" Type="DateTime" />
            <asp:Parameter Name="type_delivery" Type="String" />
            <asp:Parameter Name="awbnumber_delivery" Type="String" />
            <asp:Parameter Name="time_delivery" Type="DateTime" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="sheetid" QueryStringField="id" Type="Int64" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
            <asp:Parameter Name="warrantyperiod" Type="Boolean" />
            <asp:Parameter Name="modifytime" Type="DateTime" />
            <asp:Parameter Name="productname" Type="String" />
            <asp:Parameter Name="productnumber" Type="String" />
            <asp:Parameter Name="softwareVersion" Type="String" />
            <asp:Parameter Name="errorcode" Type="String" />
            <asp:Parameter Name="breakdowndescription" Type="String" />
            <asp:Parameter Name="breakdownreason" Type="String" />
            <asp:Parameter Name="resultofrepair" Type="String" />
            <asp:Parameter Name="laborcost" Type="Decimal" />
            <asp:Parameter Name="partcost" Type="Decimal" />
            <asp:Parameter Name="testcost" Type="Decimal" />
            <asp:Parameter Name="transitcost" Type="Decimal" />
            <asp:Parameter Name="starttime" Type="DateTime" />
            <asp:Parameter Name="endtime" Type="DateTime" />
            <asp:Parameter Name="type_delivery" Type="String" />
            <asp:Parameter Name="awbnumber_delivery" Type="String" />
            <asp:Parameter Name="time_delivery" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView_report" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource_report"
        DefaultMode="Edit" CssClass="Fillstyle" 
        OnItemCreated="FormView_report_ItemCreated" 
        onitemupdating="FormView_report_ItemUpdating" 
        oniteminserting="FormView_report_ItemInserting">
        <EditItemTemplate>
            <table style="width: 100%;" border="2">
                <tr>
                    <td class="style-td">
                        软件版本
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("softwareVersion") %>' Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        报警代码
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("errorcode") %>' Class="TextBoxstyle" />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        保 修 期
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("warrantyperiod") %>'
                            Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        日 期
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxEdtTime" runat="server" Text='<%# Bind("modifytime") %>'
                            Class="TextBoxstyle" />

                        <script type="text/javascript">
                            $('#<asp:Literal ID="LiteralEdtTime" runat="server"></asp:Literal>').datepicker();                     
                        </script>

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障（初检）情况：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("breakdowndescription") %>'
                            TextMode="MultiLine" Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障原因分析：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("breakdownreason") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        维修结果：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("resultofrepair") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        收费信息：
                        <br />
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-multidatatd-5lie">
                                    人工费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    器件费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    测试费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    运费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    合计
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%#Bind("laborcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("partcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("testcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("transitcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:Label ID="costsum" runat="server" Text='0.00' class="Fillstyle" BorderStyle="Ridge"
                                        BorderWidth="1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-multidatatd-3lie">
                                    开始时间
                                </td>
                                <td class="style-multidatatd-3lie">
                                    结束时间
                                </td>
                                <td class="style-multidatatd-3lie">
                                    维修工程师
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxStartTime" runat="server" Text='<%# Bind("starttime") %>'
                                        Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralstartTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxEndTime" runat="server" Text='<%# Bind("endtime") %>' Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralEndTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

                                </td>
                                <td>                                    
                                    <asp:Label ID="labelclerk" runat="server" Text='' Class="TextBoxstyle" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        发货信息：
                        <br />
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-td">
                                    支付方式
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("type_delivery") %>' Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    运单号
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("awbnumber_delivery") %>'
                                        Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    发货日期
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("time_delivery") %>' Class="TextBoxstyle" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="clerkidTextBox" runat="server" Text='<%# Bind("clerkid") %>' Style="display: none" />
            <asp:TextBox ID="repairsheetidTextBox" runat="server" Text='<%# Bind("repairsheetid") %>'
                Style="display: none" />
            <asp:TextBox ID="productnameTextBox" runat="server" Text='<%# Bind("productname") %>'
                Style="display: none" />
            <asp:TextBox ID="productnumberTextBox" runat="server" Text='<%# Bind("productnumber") %>'
                Style="display: none" />
            <asp:Repeater ID="Repeater_partchange" runat="server">
            </asp:Repeater>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="保存" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table style="width: 100%;" border="2">
                <tr>
                    <td class="style-td">
                        软件版本
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("softwareVersion") %>' Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        报警代码
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("errorcode") %>' Class="TextBoxstyle" />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        保 修 期
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("warrantyperiod") %>'
                            Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        日 期
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxEdtTime" runat="server" Text='<%# Bind("modifytime") %>'
                            Class="TextBoxstyle" />

                        <script type="text/javascript">
                            $('#<asp:Literal ID="LiteralEdtTime" runat="server"></asp:Literal>').datepicker();                     
                        </script>

                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障（初检）情况：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("breakdowndescription") %>'
                            TextMode="MultiLine" Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障原因分析：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("breakdownreason") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        维修结果：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("resultofrepair") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="200" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        收费信息：
                        <br />
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-multidatatd-5lie">
                                    人工费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    器件费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    测试费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    运费
                                </td>
                                <td class="style-multidatatd-5lie">
                                    合计
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%#Bind("laborcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("partcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("testcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("transitcost") %>' Class="TextBoxstyle" />
                                </td>
                                <td>
                                    <asp:Label ID="costsum" runat="server" Text='0.00' class="Fillstyle" BorderStyle="Ridge"
                                        BorderWidth="1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-multidatatd-3lie">
                                    开始时间
                                </td>
                                <td class="style-multidatatd-3lie">
                                    结束时间
                                </td>
                                <td class="style-multidatatd-3lie">
                                    维修工程师
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="TextBoxStartTime" runat="server" Text='<%# Bind("starttime") %>'
                                        Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralstartTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxEndTime" runat="server" Text='<%# Bind("endtime") %>' Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralEndTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

                                </td>
                                <td>                                    
                                    <asp:Label ID="labelclerk" runat="server" Text='' Class="TextBoxstyle" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        发货信息：
                        <br />
                        <table class="Fillstyle" border="0">
                            <tr>
                                <td class="style-td">
                                    支付方式
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("type_delivery") %>' Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    运单号
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("awbnumber_delivery") %>'
                                        Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    发货日期
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("time_delivery") %>' Class="TextBoxstyle" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>




            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="保存" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            clerkid:
            <asp:Label ID="clerkidLabel" runat="server" Text='<%# Bind("clerkid") %>' />
            <br />
            repairsheetid:
            <asp:Label ID="repairsheetidLabel" runat="server" Text='<%# Bind("repairsheetid") %>' />
            <br />
            warrantyperiod:
            <asp:CheckBox ID="warrantyperiodCheckBox" runat="server" Checked='<%# Bind("warrantyperiod") %>'
                Enabled="false" />
            <br />
            modifytime:
            <asp:Label ID="modifytimeLabel" runat="server" Text='<%# Bind("modifytime") %>' />
            <br />
            productname:
            <asp:Label ID="productnameLabel" runat="server" Text='<%# Bind("productname") %>' />
            <br />
            productnumber:
            <asp:Label ID="productnumberLabel" runat="server" Text='<%# Bind("productnumber") %>' />
            <br />
            softwareVersion:
            <asp:Label ID="softwareVersionLabel" runat="server" Text='<%# Bind("softwareVersion") %>' />
            <br />
            errorcode:
            <asp:Label ID="errorcodeLabel" runat="server" Text='<%# Bind("errorcode") %>' />
            <br />
            breakdowndescription:
            <asp:Label ID="breakdowndescriptionLabel" runat="server" Text='<%# Bind("breakdowndescription") %>' />
            <br />
            breakdownreason:
            <asp:Label ID="breakdownreasonLabel" runat="server" Text='<%# Bind("breakdownreason") %>' />
            <br />
            resultofrepair:
            <asp:Label ID="resultofrepairLabel" runat="server" Text='<%# Bind("resultofrepair") %>' />
            <br />
            laborcost:
            <asp:Label ID="laborcostLabel" runat="server" Text='<%# Bind("laborcost") %>' />
            <br />
            partcost:
            <asp:Label ID="partcostLabel" runat="server" Text='<%# Bind("partcost") %>' />
            <br />
            testcost:
            <asp:Label ID="testcostLabel" runat="server" Text='<%# Bind("testcost") %>' />
            <br />
            transitcost:
            <asp:Label ID="transitcostLabel" runat="server" Text='<%# Bind("transitcost") %>' />
            <br />
            starttime:
            <asp:Label ID="starttimeLabel" runat="server" Text='<%# Bind("starttime") %>' />
            <br />
            endtime:
            <asp:Label ID="endtimeLabel" runat="server" Text='<%# Bind("endtime") %>' />
            <br />
            type_delivery:
            <asp:Label ID="type_deliveryLabel" runat="server" Text='<%# Bind("type_delivery") %>' />
            <br />
            awbnumber_delivery:
            <asp:Label ID="awbnumber_deliveryLabel" runat="server" Text='<%# Bind("awbnumber_delivery") %>' />
            <br />
            time_delivery:
            <asp:Label ID="time_deliveryLabel" runat="server" Text='<%# Bind("time_delivery") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="编辑" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="删除" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="新建" />
        </ItemTemplate>
    </asp:FormView>
    <div style="display: none">
        <table style="width: 100%;" border="2">
            <tr>
                <td class="style-td">
                    代 理 商
                </td>
                <td colspan="5">
                </td>
            </tr>
            <tr>
                <td class="style-td">
                    联 系 人
                </td>
                <td class="style-multydatatd-2zu">
                </td>
                <td class="style-td">
                    电 话
                </td>
                <td class="style-multydatatd-2zu">
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource_partchange" runat="server"></asp:ObjectDataSource>
</asp:Content>
