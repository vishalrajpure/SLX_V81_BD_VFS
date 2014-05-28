<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Opp_SalesProcess.ascx.cs" Inherits="SmartParts_Opportunity_Opp_SalesProcess" %>


<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls"
    TagPrefix="SalesLogix" %>
<div>
<br />
<br />
<table border="0" cellpadding="0" cellspacing="0" class="" width="30%">   
    <tr>
        <td>
            <span >
                <asp:Label ID="lblSalesProces" runat="server" Text="Sales Process *" 
                AssociatedControlID="ddlSalesProcess" Font-Bold="True"></asp:Label>&nbsp;
            </span>&nbsp;  
        </td>
        <td>               
            <span>
                <asp:DropDownList runat="server" ID="ddLSalesProcess" AutoPostBack="false">
                </asp:DropDownList>
            </span>
        </td>
    </tr>
</table>
</div>