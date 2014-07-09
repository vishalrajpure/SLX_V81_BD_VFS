<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QB.ascx.cs" Inherits="SmartParts_QualifierBranchMapping_QB" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>



<style type="text/css">
    .auto-style1 {
        width: 349px;
    }
    .auto-style2 {
        width: 61px;
    }
</style>



<script lang="javascript" type="text/javascript">

    function ChkRequiredField() {

        if (document.getElementById('MainContent_QB_luequalifier_LookupText').value == '') {
            alert("Please Enter the Qualifier");
            return false;
        }
        else if (document.getElementById('MainContent_QB_lstbranch').value == '') {
            alert("Please Select Atleast one Pincode");
            return false;
        }

        return true;
    }

</script>

<%--<asp:Panel ID="pnlCallAssignment" runat="server">--%>
<table border="0" cellpadding="1" cellspacing="0" class="formtable" width="100%">
    <tr>
        <td class="auto-style1">
            <asp:Label ID="lblerr" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr style="vertical-align:top">
        <td class="auto-style1">
            <div class=" lbl alignleft">
                <asp:Label ID="luequalifier_lbl" AssociatedControlID="luequalifier" runat="server" Text="Qualifier:" ForeColor="Red"></asp:Label>
            </div>
            <div>
                <SalesLogix:LookupControl runat="server" ID="luequalifier" LookupEntityName="UserInfo" LookupEntityTypeName="Sage.Entity.Interfaces.IUserInfo, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String" Required="true">
                    <LookupProperties>
                        <SalesLogix:LookupProperty PropertyHeader="FirstName" PropertyName="FirstName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="LastName" PropertyName="LastName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="Department" PropertyName="Department" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="Division" PropertyName="Division" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="Email" PropertyName="Email" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                    </LookupProperties>
                    <LookupPreFilters>
                    </LookupPreFilters>
                </SalesLogix:LookupControl>
            </div>
        </td>
        <td  style="vertical-align:top" class="auto-style2">

               <asp:Label ID="Label1" runat="server" Text="Branch:" ForeColor="Red"></asp:Label>
            </td>
        <td>
                 <asp:ListBox ID="lstbranch" runat="server"  Width="41%" SelectionMode="Multiple" Height="166px"></asp:ListBox>
        </td>
    </tr>

    <tr>
        <td class="auto-style1">&nbsp;</td>
    </tr>

    <tr>
        <td class="auto-style1">
            <div class=" lbl alignright">
                <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click" OnClientClick="return ChkRequiredField()" />
            </div>
        </td>
    </tr>
</table>
<br />

<div style="overflow-x: scroll;">
    <SalesLogix:SlxGridView runat="server" ID="grdqualifier" GridLines="None" AutoGenerateColumns="False"
        CellPadding="2" CssClass="datagrid" AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt"
        ShowEmptyTable="true" EmptyTableRowText="No records match the selection criteria."
        EnableViewState="false" AllowPaging="true" PageSize="25" OnPageIndexChanging="grdqualifier_PageIndexChanging"
        OnRowCommand="grdqualifier_RowCommand" DataKeyNames="QualifierAndSMpincodeID" OnRowDeleting="grdqualifier_RowDeleting" OnRowDataBound="grdqualifier_RowDataBound">
        <AlternatingRowStyle CssClass="rowdk"></AlternatingRowStyle>
        <Columns>
            <%--   <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <a href="javascript:window.open('QualifierView.aspx?QualifierAndSMpincodeID=<%# Eval("QualifierAndSMpincodeID") %>','NewPage','width=600,height=200,toolbar=no,menubar=no,top=140,left=180,scrollbars=yes,directories=no,status=no');void(0);">
                    Edit</a>
            </ItemTemplate>
          </asp:TemplateField>--%>
            <asp:ButtonField CommandName="Delete1" Text="Edit" ControlStyle-Width="20px" />
            <asp:ButtonField CommandName="Delete" Text="Delete" ControlStyle-Width="20px" />
            <asp:BoundField DataField="QualifierName" HeaderText="Qualifier" />
            <asp:BoundField DataField="Branch" HeaderText="Branch" />
        </Columns>
        <HeaderStyle ForeColor="#3333FF" />
        <RowStyle CssClass="rowlt"></RowStyle>
    </SalesLogix:SlxGridView>
</div>

<%--</asp:Panel>--%>
