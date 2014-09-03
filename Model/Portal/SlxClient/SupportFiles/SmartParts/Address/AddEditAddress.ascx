<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddEditAddress.ascx.cs" Inherits="SmartParts_Address_AddEditAddress" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>


<script lang="javascript" type="text/javascript">

    function Get2() {

        alert("hello");

        return false;
    }
    function querySt(ji) {
        hu = window.location.search.substring(1);
        gy = hu.split("&");
        var type = "";
        for (i = 0; i < gy.length; i++) {
            ft = gy[i].split("=");
            if (ft[0] == ji) {
                type = ft[1];
            }
        }
        return type;
    }
</script>

<script lang="javascript" type="text/javascript">

    function Get() {
        //var geocoder = new google.maps.Geocoder();
        var df = true;
        var address = document.getElementById('MainContent_AddEditAddress_txtAddress1').value + ',' + document.getElementById('MainContent_AddEditAddress_txtAddress2').value + ',' + document.getElementById('MainContent_AddEditAddress_txtAddress3').value + ',' + document.getElementById('MainContent_AddEditAddress_pklCity_Text').value + ',' + document.getElementById('MainContent_AddEditAddress_pklState_Text').value + ',' + document.getElementById('MainContent_AddEditAddress_pklCountry_Text').value + ',' + document.getElementById('MainContent_AddEditAddress_txtPostalCode').value;
        var add1 = document.getElementById('MainContent_AddEditAddress_txtAddress1').value;
        var pin = document.getElementById('MainContent_AddEditAddress_txtPostalCode').value;
        if (add1 == '') {
            alert('Please Fill Required fields');
            return false;
        }
        else if (pin == '') {
            alert('Please Fill Required fields');
            return false;
        }

        /* geocoder.geocode({ 'address': address }, function (results, status) {
             if (status == google.maps.GeocoderStatus.OK) {
                 var latitude = results[0].geometry.location.lat();
                 var longitude = results[0].geometry.location.lng();
                 document.cookie = "Latitude1=" + latitude;
                 document.cookie = "Logitute1=" + longitude;
                 var type = querySt("EntityID");
                 if(type == "123123123123")
                 {
                     window.opener.document.getElementById('MainContent_InsertContact_txtAccountAddress').value = address;
                     
                 }
                 document.getElementById('MainContent_AddEditAddress_btngetGL').click();
                 //document.getElementById('MainContent_AccountDetails_Address').value = address;
                 df = true;
             }else {
                     alert("Geocode was not successful for the following reason: " + status);
                     df = false;
                 }
         
         }); */
        var type = querySt("EntityID");
        if (type == "123123123123") {
            window.opener.document.getElementById('MainContent_InsertContact_txtAccountAddress').value = address;

        }

        return df;
    }
</script>
<div style="display:none">
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

<table id="tblTest" border="0" cellpadding="1" cellspacing="1" style="width:90%;height:100%;padding-right:10px" >
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
            <SalesLogix:PickListControl runat="server" ID="pklDecription"  PickListId="kSYST0000014" PickListName="Address Description (Account)" AutoPostBack="false" NoneEditable="false" mustExistInlist="false" />
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
            <asp:Label ID="lblAddressType" AssociatedControlID="pklAddressType" runat="server" Text="Address Type:" meta:resourcekey="lblAddressType"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklAddressType" style="width: 100%" PickListId="kDEMOA0000D5" PickListName="Address Type" AutoPostBack="false" NoneEditable="false" mustExistInlist="true"/>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddress1" AssociatedControlID="txtAddress1" runat="server" Text="Address1:" meta:resourcekey="lblAddress1"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress1" style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddress2"  AssociatedControlID="txtAddress2" runat="server" Text="Address2:" meta:resourcekey="lblAddress2"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress2" style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblAddress3"  AssociatedControlID="txtAddress3" runat="server" Text="Address3:" meta:resourcekey="lblAddress3"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtAddress3" style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCity" AssociatedControlID="pklCity" runat="server" Text="City:" meta:resourcekey="lblCity"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklCity" style="width: 100%" PickListId="kSYST0000384" PickListName="City"
                AutoPostBack="false" NoneEditable="false" mustExistInlist="false"/>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblState" AssociatedControlID="pklState" runat="server" Text="State:" meta:resourcekey="lblState"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklState" style="width: 100%" PickListId="kSYST0000390" PickListName="State"
                AutoPostBack="false" NoneEditable="false" mustExistInlist="false"/>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPostalCode"  AssociatedControlID="txtPostalCode" runat="server" Text="PostalCode:" meta:resourcekey="lblPostalCode" ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px; ">
            <asp:TextBox runat="server" ID="txtPostalCode" style="width: 100%" MaxLength="24" AutoPostBack="True" OnTextChanged="txtPostalCode_TextChanged"/>
        </td>
    </tr>
   <%-- <tr>
        <td>
            <asp:Label ID="lblCounty"  AssociatedControlID="txtCounty" runat="server" Text="<%$ resources: txtCounty.Text %>"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" ID="txtCounty" style="width: 100%" MaxLength="32" />
        </td>
    </tr>--%>
    <tr>
        <td>
            <asp:Label ID="lblCountry" AssociatedControlID="pklCountry" runat="server" Text="Country:" meta:resourcekey="lblCountry"></asp:Label>
        </td>
        <td style="width: 150px;">
            <SalesLogix:PickListControl runat="server" ID="pklCountry" style="width: 100%" PickListId="kSYST0000386" PickListName="Country"
                AutoPostBack="false" NoneEditable="false" mustExistInlist="false" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblSalutation" AssociatedControlID="txtSalutation" runat="server" Text="Attention:" meta:resourcekey="lblSalutation"></asp:Label>
        </td>
        <td style="width: 150px; ">
            <asp:TextBox runat="server" ID="txtSalutation" style="width: 100%" MaxLength="64" />
        </td>
    </tr>
    <tr>
        <td>
        
           <asp:Label ID="txtLatitude_lbl" AssociatedControlID="txtLatitude" runat="server" Text="Latitude:" ></asp:Label>
        </td>
         <td>
            <SalesLogix:NumericControl runat="server" ID="txtLatitude"
        MaxLength="13" DecimalDigits="10" Strict="False"  />
         
       
            </td>
        
<!-- <td>
            <asp:Label ID="Label2" AssociatedControlID="txtLatitude1" runat="server" Text="Latitude:" ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" Enabled = "true" ID="txtLatitude1" Style="width: 100%" MaxLength="64" />
        </td>-->
    </tr>
    <tr>
        <td>
         
           <asp:Label ID="txtLogitute_lbl" AssociatedControlID="txtLogitute" runat="server" Text="Longitude:" ></asp:Label>
         </td>
          <td> 
            <SalesLogix:NumericControl runat="server" ID="txtLogitute"
        MaxLength="13" DecimalDigits="10" Strict="False" 
         />
         
        </td>
        <!--<td>
            <asp:Label ID="Label3" AssociatedControlID="txtLogitute1" runat="server" Text="Logitute:" ForeColor="Red"></asp:Label>
        </td>
        <td style="width: 150px;">
            <asp:TextBox runat="server" Enabled = "true" ID="txtLogitute1" Style="width: 100%" MaxLength="64" />
        </td>-->
    </tr>
    
</table>
<div class="button-bar alignright">
    <asp:Button runat="server" ID="btngetGL1" CssClass="slxbutton" Visible="false" ToolTip="Ok" Text="Ok" OnClientClick="return Get()"/>
    <asp:Button runat="server" ID="btngetGL" CssClass="slxbutton" OnClientClick="return Get()" ToolTip="Ok" Text="Ok" />
    <asp:Button runat="server" ID="btnSave1" CssClass="slxbutton" Visible="false" ToolTip="Ok" Text ="Ok" OnClientClick="return GetLocation()"/> 
    <asp:Button runat="server" ID="btnSave" CssClass="slxbutton" ToolTip="Ok" Text ="Ok" OnClientClick="return GetLocation()"/> 
    <asp:Button runat="server" ID="btnCancel" CssClass="slxbutton" ToolTip="btnCancel" meta:resourcekey="btnCancel" /> 
    <asp:Button runat="server" ID="btnCancelDetail" CssClass="slxbutton" ToolTip="Cancel" Text="Cancel" OnClick="btnCancelDetail_Click" /> 
</div>
<div>
    <!--<asp:Button runat="server" ID="btngetGL2" CssClass="slxbutton" Width="1px" Height="1px"/>
    <asp:Button runat="server" ID="btnSave2" CssClass="slxbutton" Width="1px" Height="1px"/>-->
</div>