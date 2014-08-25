<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    CodeBehind="createRepairSheet2.aspx.cs" Inherits="AfterSaleServiceSystem.Supervisor.createRepairSheet2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <title>新建维修单-售后管理系统</title>
    <style type="text/css">
        .Fillstyle
        {
            width: 100%;
        }
    </style>

    <script type="text/javascript">

    
    </script>

    <link href="../css/ui-lightness/jquery-ui-1.10.4.min.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-2.0.2.min.js" type="text/javascript"></script>

    <script src="../js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function SetToalCost() {
            var laborcost = $(".laborcost").val();
            var partcost = $(".partcost").val();
            var testcost = $(".testcost").val();
            var transitcost = $(".transitcost").val();
            if (isNaN(laborcost)) {
                alert("请输入正确格式的金额");
                $(".laborcost").focus();
                return;
            }
            if (isNaN(partcost)) {
                alert("请输入正确格式的金额");
                $(".partcost").focus();
                return;
            }
            if (isNaN(testcost)) {
                alert("请输入正确格式的金额");
                $(".testcost").focus();
                return;
            }
            if (isNaN(transitcost)) {
                alert("请输入正确格式的金额");
                $(".transitcost").focus();
                return;
            }
            $(".totalcost").text(parseFloat(laborcost) + parseFloat(partcost) + parseFloat(testcost) + parseFloat(transitcost));
        }
    </script>

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
    <div>
        当前GUID：
        <asp:Label ID="Label_GUID" runat="server" Text="Label" Font-Underline="True"></asp:Label>
        <%--<asp:Label ID="Label_Test" runat="server" Text="Label"></asp:Label>--%>
    </div>
    <table style="width: 100%;" border="2">
        <tr>
            <td class="style-td">
                代 理 商
            </td>
            <td colspan="5">
                <asp:DropDownList ID="ddlCustom" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCustom_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style-td">
                用 户
            </td>
            <td colspan="5">
                <asp:TextBox ID="companyLabel" runat="server" Text='' />
            </td>
        </tr>
        <tr>
            <td class="style-td">
                地 址
            </td>
            <td colspan="5">
                <asp:TextBox ID="addressLabel" runat="server" Text='' />
            </td>
        </tr>
        <tr>
            <td class="style-td">
                联 系 人
            </td>
            <td class="style-multydatatd-3zu">
                <asp:TextBox ID="nameLabel" runat="server" Text='' />
            </td>
            <td class="style-td">
                电 话
            </td>
            <td class="style-multydatatd-3zu">
                <asp:TextBox ID="telephoneLabel" runat="server" Text='' />
            </td>
            <td class="style-td">
                传 真
            </td>
            <td class="style-multydatatd-3zu">
                <asp:TextBox ID="faxLabel" runat="server" Text='' />
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ds_Report" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByGuid" TypeName="AfterSaleServiceSystem.DAL.dsRepairSheetReportTableAdapters.V_SheetReportTableAdapter"
        UpdateMethod="Update1">
        <UpdateParameters>
            <asp:Parameter Name="producttype" Type="String" />
            <asp:Parameter Name="productnumber" Type="String" />
            <asp:Parameter Name="repairstateid" Type="Int32" />
            <asp:Parameter Name="clerkid" Type="Int32" />
            <asp:Parameter Name="customid" Type="Int32" />
            <asp:Parameter Name="process" Type="Int32" />
            <asp:Parameter Name="warrantyperiod" Type="Boolean" />
            <asp:Parameter Name="modifytime" Type="DateTime" />
            <asp:Parameter Name="productname" Type="String" />
            <asp:Parameter Name="softwareVersion" Type="String" />
            <asp:Parameter Name="errorcode" Type="String" />
            <asp:Parameter Name="breakdownreason" Type="String" />
            <asp:Parameter Name="breakdowndescription" Type="String" />
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
            <asp:Parameter Name="GUID" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="GUID" QueryStringField="GUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:FormView ID="FormView_Report" runat="server" CssClass="Fillstyle" OnItemCreated="FormView_report_ItemCreated"
        OnItemInserting="FormView_report_ItemInserting" DataSourceID="ds_Report" DefaultMode="Edit"
        OnItemCommand="FormView_Report_ItemCommand">
        <EditItemTemplate>
            <table style="width: 100%;" border="2">
                <tr>
                    <td class="style-td">
                        产品名称
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxproducttype" runat="server" Text='<%# Bind("producttype") %>'
                            Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        产品编号
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxproductnumber" runat="server" Text='<%# Bind("productnumber") %>'
                            Class="TextBoxstyle" />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        软件版本
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxsoftwareVersion" runat="server" Text='<%# Bind("softwareVersion") %>'
                            Class="TextBoxstyle" />
                    </td>
                    <td class="style-td">
                        报警代码
                    </td>
                    <td class="style-multydatatd-2zu">
                        <asp:TextBox ID="TextBoxerrorcode" runat="server" Text='<%# Bind("errorcode") %>'
                            Class="TextBoxstyle" />
                    </td>
                </tr>
                <tr>
                    <td class="style-td">
                        保 修 期
                    </td>
                    <td class="style-multydatatd-2zu">
                        保内
                        <asp:CheckBox ID="cbwarrantyperiod" runat="server" Checked='<%# Bind("warrantyperiod") %>'
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
                        <asp:TextBox ID="TextBoxbreakdowndescription" runat="server" Text='<%# Bind("breakdowndescription") %>'
                            TextMode="MultiLine" Class="TextBoxstyle" Height="50" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障原因分析：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBoxbreakdownreason" runat="server" Text='<%# Bind("breakdownreason") %>'
                            TextMode="MultiLine" Class="TextBoxstyle" Height="50" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        维修结果：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBoxresultofrepair" runat="server" Text='<%# Bind("resultofrepair") %>'
                            TextMode="MultiLine" Class="TextBoxstyle" Height="50" />
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
                                    <asp:TextBox ID="TextBoxlaborcost" runat="server" Text='<%#Bind("laborcost") %>'
                                        Class="TextBoxstyle laborcost" onblur="SetToalCost();" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxpartcost" runat="server" Text='<%# Bind("partcost") %>' Class="TextBoxstyle partcost"
                                        onblur="SetToalCost();" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxtestcost" runat="server" Text='<%# Bind("testcost") %>' Class="TextBoxstyle testcost"
                                        onblur="SetToalCost();" />
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxtransitcost" runat="server" Text='<%# Bind("transitcost") %>'
                                        Class="TextBoxstyle transitcost" onblur="SetToalCost();" />
                                </td>
                                <td>
                                    <asp:Label ID="costsum" runat="server" Text='0.00' class="Fillstyle totalcost" BorderStyle="Ridge"
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
                                    <%--<asp:Label ID="labelclerk" runat="server" Text='' Class="TextBoxstyle" />--%>
                                    <asp:TextBox ID="Textboxclerk" runat="server" CssClass="TextBoxstyle"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBoxtype_delivery" runat="server" Text='<%# Bind("type_delivery") %>'
                                        Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    运单号
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBoxawbnumber_delivery" runat="server" Text='<%# Bind("awbnumber_delivery") %>'
                                        Class="TextBoxstyle" />
                                </td>
                                <td class="style-td">
                                    发货日期
                                </td>
                                <td class="style-multydatatd-3zu">
                                    <asp:TextBox ID="TextBoxSendTime" runat="server" Text='<%# Bind("time_delivery") %>'
                                        Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralSendTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:TextBox ID="clerkidTextBox" runat="server" Text='<%# Bind("clerkid") %>' Style="display: none" />
            <asp:TextBox ID="productnameTextBox" runat="server" Text='<%# Bind("productname") %>'
                Style="display: none" />
            <asp:TextBox ID="productnumberTextBox" runat="server" Text='<%# Bind("productnumber") %>'
                Style="display: none" />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Set"
                Text="保存" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Return" Text="取消" />
        </EditItemTemplate>
        <InsertItemTemplate>
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
                        保内
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
                            TextMode="MultiLine" Class="TextBoxstyle" Height="50" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        故障原因分析：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("breakdownreason") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="50" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        维修结果：
                        <br />
                        <br />
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("resultofrepair") %>' TextMode="MultiLine"
                            Class="TextBoxstyle" Height="50" />
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
                                    <asp:TextBox ID="TextBoxSendTime" runat="server" Text='<%# Bind("time_delivery") %>'
                                        Class="TextBoxstyle" />

                                    <script type="text/javascript">
                                        $('#<asp:Literal ID="LiteralSendTime" runat="server"></asp:Literal>').datepicker();                     
                                    </script>

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
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="保存" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="取消" />
        </InsertItemTemplate>
        <ItemTemplate>
            producttype:
            <asp:Label ID="producttypeLabel" runat="server" Text='<%# Bind("producttype") %>' />
            <br />
            productnumber:
            <asp:Label ID="productnumberLabel" runat="server" Text='<%# Bind("productnumber") %>' />
            <br />
            repairstateid:
            <asp:Label ID="repairstateidLabel" runat="server" Text='<%# Bind("repairstateid") %>' />
            <br />
            clerkid:
            <asp:Label ID="clerkidLabel" runat="server" Text='<%# Bind("clerkid") %>' />
            <br />
            customid:
            <asp:Label ID="customidLabel" runat="server" Text='<%# Bind("customid") %>' />
            <br />
            process:
            <asp:Label ID="processLabel" runat="server" Text='<%# Bind("process") %>' />
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
            softwareVersion:
            <asp:Label ID="softwareVersionLabel" runat="server" Text='<%# Bind("softwareVersion") %>' />
            <br />
            errorcode:
            <asp:Label ID="errorcodeLabel" runat="server" Text='<%# Bind("errorcode") %>' />
            <br />
            breakdownreason:
            <asp:Label ID="breakdownreasonLabel" runat="server" Text='<%# Bind("breakdownreason") %>' />
            <br />
            breakdowndescription:
            <asp:Label ID="breakdowndescriptionLabel" runat="server" Text='<%# Bind("breakdowndescription") %>' />
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
            guid:
            <asp:Label ID="guidLabel" runat="server" Text='<%# Bind("guid") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
