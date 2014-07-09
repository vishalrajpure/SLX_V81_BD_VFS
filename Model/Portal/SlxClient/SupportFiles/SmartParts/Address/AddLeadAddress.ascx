<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddLeadAddress.ascx.cs" Inherits="SmartParts_Address_AddLeadAddress" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<a href="App_LocalResources/AddAccountAddress.ascx.resx"></a>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

<script lang="javascript" type="text/javascript">

    function Get() {
        // alert("1");
        var geocoder = new google.maps.Geocoder();
        //alert(geocoder);
        var df = true;
        var address = document.getElementById('MainContent_AddLeadAddress_txtAddress1').value + ',' + document.getElementById('MainContent_AddLeadAddress_txtAddress2').value + ',' + document.getElementById('MainContent_AddLeadAddress_pklCity_Text').value + ',' + document.getElementById('MainContent_AddLeadAddress_pklState_Text').value + ',' + document.getElementById('MainContent_AddLeadAddress_pklCountry_Text').value + ',' + document.getElementById('MainContent_AddLeadAddress_txtPostalCode').value;
        var add1 = document.getElementById('MainContent_AddLeadAddress_txtAddress1').value;
        var pin = document.getElementById('MainContent_AddLeadAddress_txtPostalCode').value;
        if (add1 == '') {
            alert('Please Fill Required fields');
            return false;
        }
        else if (pin == '') {
            alert('Please Fill Required fields');
            return false;
        }

        // alert(address);
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                document.cookie = "Latitude1=" + latitude;
                document.cookie = "Logitute1=" + longitude;

                document.getElementById('MainContent_AddLeadAddress_btnSave').click();
                //document.getElementById('MainContent_AccountDetails_Address').value = address;
                df = true;
            } else {
                alert("No Lat/Long match found for specified Address, Please Correct the address.")
                df = false;
            }
        });
        return df;
    }
</script>
<div style="display: none">
    <asp:Panel ID="AddressForm_LTools" runat="server"></asp:Panel>
    <asp:Panel ID="AddressForm_CTools" runat="server"></asp:Panel>
    <asp:Panel ID="AddressForm_RTools" runat="server">

        <SalesLogix:PageLink ID="lnkAddressHelp" runat="server" LinkType="HelpFileName"
            ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="Help" NavigateUrl="accountaddresschange.aspx"
            ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16">
        </SalesLogix:PageLink>
    </asp:Panel>
    <asp:HiddenField runat="server" ID="txtEntityId" />
    <asp:HiddenField runat="server" ID="Mode" />
</div>



<table id="tblTest" border="0" cellpadding="1" cellspacing="1" style="width: 100%; height: 100%; padding-right: 10px">
     <tr>
        <td colspan="3">
              <asp:Label ID="lblerr" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDescription" AssociatedControlID="pklDecription" runat="server" Text="Description:" meta:resourcekey="lblDecription"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklDecription" PickListId="kSYST0000014" PickListName="Address Description (Account)" AutoPostBack="false" NoneEditable="false" MustExistInList="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" AssociatedControlID="cbxPrimaryAddr" runat="server" Text="Primary" meta:resourcekey="lblPrimaryAddr"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:CheckBox runat="server" ID="cbxPrimaryAddr" Text="" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblIsPrimary" AssociatedControlID="cbxIsPrimary" runat="server" Text="Primary Billing" meta:resourcekey="lblPrimary"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:CheckBox runat="server" ID="cbxIsPrimary" Text="" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblIsShipping" AssociatedControlID="cbxIsShipping" runat="server" Text="Primary Shipping" meta:resourcekey="lblShipping"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:CheckBox runat="server" ID="cbxIsShipping" Text="" />
        </td>
    </tr>
   
    <tr>
        <td>
            <asp:Label ID="lblAddress1" AssociatedControlID="txtAddress1" runat="server" Text="Address1:" meta:resourcekey="lblAddress1" ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress1" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddress2" AssociatedControlID="txtAddress2" runat="server" Text="Address2:" meta:resourcekey="lblAddress2"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress2" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddress3" AssociatedControlID="txtAddress3" runat="server" Text="Address3:" meta:resourcekey="lblAddress3"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress3" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCity" AssociatedControlID="pklCity" runat="server" Text="City:" meta:resourcekey="lblCity"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklCity" Style="width: 100%" PickListId="kSYST0000384" PickListName="City"
                AutoPostBack="false" NoneEditable="false" MustExistInList="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblState" AssociatedControlID="pklState" runat="server" Text="State:" meta:resourcekey="lblState"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklState" Style="width: 100%" PickListId="kSYST0000390" PickListName="State"
                AutoPostBack="false" NoneEditable="false" MustExistInList="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPostalCode" AssociatedControlID="txtPostalCode" runat="server" Text="PostalCode:" meta:resourcekey="lblPostalCode" ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtPostalCode" Style="width: 100%" MaxLength="24" AutoPostBack="True" OnTextChanged="txtPostalCode_TextChanged" />
        </td>
    </tr>

    <tr>
        <td>
            <asp:Label ID="lblCountry" AssociatedControlID="pklCountry" runat="server" Text="Country:" meta:resourcekey="lblCountry"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklCountry" Style="width: 100%" PickListId="kSYST0000386" PickListName="Country"
                AutoPostBack="false" NoneEditable="false" MustExistInList="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblSalutation" AssociatedControlID="txtSalutation" runat="server" Text="Attention:" meta:resourcekey="lblSalutation"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtSalutation" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" AssociatedControlID="txtLatitude"  runat="server" Text="Latitude:"  ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtLatitude" Enabled = "false" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" AssociatedControlID="txtLogitute" runat="server" Text="Logitute:"  ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" Enabled = "false" ID="txtLogitute" Style="width: 100%" MaxLength="64" />
        </td>
    </tr>

</table>
<div>
    <table style"width: 100%">
        <tr>
            <td>
                <asp:Button runat="server" ID="btnSave1" CssClass="slxbutton" ToolTip="btnSave" Text="Ok" OnClientClick="return Get()"/>
                <asp:Button runat="server" ID="btnCancel" CssClass="slxbutton" ToolTip="btnCancel" Text="Cancel" />
                <asp:Button runat="server" ID="btngetGL" CssClass="slxbutton" Visible="false" Text="Get Latitude/Logitute" OnClick="btngetGL_Click" />                
            
        </tr>
    </table>

</div>
<div>
    <asp:Button runat="server" ID="btnSave" CssClass="slxbutton" Width="1px" Height =""/>               
</div>