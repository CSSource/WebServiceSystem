<%@ Page Title="" Language="C#" MasterPageFile="~/Serviceman/ClerkMaster.Master"
    AutoEventWireup="true" CodeBehind="SheetLog.aspx.cs" Inherits="AfterSaleServiceSystem.Serviceman.SheetLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>编辑维修单记录-售后管理系统</title>

    <script src="../js/jquery-2.0.2.min.js" type="text/javascript"></script>

    <script src="../js/kindeditor/kindeditor-min.js" type="text/javascript"></script>

    <script src="../js/kindeditor/zh_CN.js" type="text/javascript"></script>

    <script>
        KindEditor.ready(function(K) {
            K.each({
                'plug-align': {
                    name: '对齐方式',
                    method: {
                        'justifyleft': '左对齐',
                        'justifycenter': '居中对齐',
                        'justifyright': '右对齐'
                    }
                },
                'plug-order': {
                    name: '编号',
                    method: {
                        'insertorderedlist': '数字编号',
                        'insertunorderedlist': '项目编号'
                    }
                },
                'plug-indent': {
                    name: '缩进',
                    method: {
                        'indent': '向右缩进',
                        'outdent': '向左缩进'
                    }
                }
            }, function(pluginName, pluginData) {
                var lang = {};
                lang[pluginName] = pluginData.name;
                KindEditor.lang(lang);
                KindEditor.plugin(pluginName, function(K) {
                    var self = this;
                    self.clickToolbar(pluginName, function() {
                        var menu = self.createMenu({
                            name: pluginName,
                            width: pluginData.width || 100
                        });
                        K.each(pluginData.method, function(i, v) {
                            menu.addItem({
                                title: v,
                                checked: false,
                                iconClass: pluginName + '-' + i,
                                click: function() {
                                    self.exec(i).hideMenu();
                                }
                            });
                        })
                    });
                });
            });

            K.create('#contentqq', {
                themeType: 'qq',
                items: [
						'bold', 'italic', 'underline', 'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'plug-align', 'plug-order', 'plug-indent', 'link'
					]
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <p>
        <textarea id="contentqq" name="content" style="width: 700px; height: 200px; visibility: visible;"></textarea>
        <asp:FormView ID="FormViewLog" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSourceLog"
            DefaultMode="Edit" OnItemUpdated="FormView1_ItemUpdated" ForeColor="#333333"
            OnItemUpdating="FormView1_ItemUpdating">
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <EditItemTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id") %>' />
                <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("clerkid") %>' />
                <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Bind("logtime") %>' />
                <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Bind("repairsheetid") %>' />
                日志内容:
                <br />
                <asp:TextBox ID="logdataTextBox" runat="server" Text='<%# Bind("logdata") %>' TextMode="MultiLine"
                    Height="400" Width="600" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                    Text="保存" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                    CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
    </p>
    <asp:ObjectDataSource ID="ObjectDataSourceLog" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByid"
        TypeName="AfterSaleServiceSystem.DAL.dsLogsTableAdapters.tb_logsTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int64" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="logdata" Type="String" />
            <asp:Parameter Name="logtime" Type="DateTime" />
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
            <asp:Parameter Name="Original_id" Type="Int64" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="id" QueryStringField="id" Type="Int64" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="logdata" Type="String" />
            <asp:Parameter Name="logtime" Type="DateTime" />
            <asp:Parameter Name="clerkid" Type="Int64" />
            <asp:Parameter Name="repairsheetid" Type="Int64" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
