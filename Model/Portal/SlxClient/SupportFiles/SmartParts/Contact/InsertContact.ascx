
<%@ Import Namespace="Sage.Platform.Application.UI" %>
<%@ Import Namespace="Sage.Platform.Security" %>
<%@ Import Namespace="Sage.Platform.WebPortal.SmartParts" %>
<%@ Import Namespace="Sage.SalesLogix.Entities" %>
<%@ Import Namespace="Sage.Platform" %>
<%@ Import Namespace="Sage.Entity.Interfaces" %>
<%@ Control Language="C#" ClassName="InsertContact" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.Binding" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.Services" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.WebUserOptions" Namespace="Sage.SalesLogix.WebUserOptions" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.Application" Namespace="Sage.Platform.Application.Services" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.Application" Namespace="Sage.Platform.Application" TagPrefix="SalesLogix" %>



<script lang="javascript" type="text/javascript">

    function ChkRequiredField() {

        if (document.getElementById('MainContent_InsertContact_nmeContactName_prefix').value == '') {
            alert("Please Enter the Prefix of Contact");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_nmeContactName_first').value == '') {
            alert("Please Enter the FirstName of Contact");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_nmeContactName_first').value.length > 32) {
            alert("FirstName Length has more than 32 Characters");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_nmeContactName_last').value == '') {
            alert("Please Enter the LastName of Contact");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_nmeContactName_last').value.length > 32) {
            alert("LastName Length has more than 32 Characters");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_nmeContactName_middle').value.length > 32) {
            alert("MiddleName Length has more than 32 Characters");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_txtContactAccountName').value == '') {
            alert("Please Enter the Account");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_txtContactAccountName').value.length > 128) {
            alert("AccountName Length has more than 128 Characters");
            return false;
        }
            //else if (document.getElementById('MainContent_InsertContact_txtlegalname').value == '') {
            //alert("Please Enter the LegalName");
            //return false;
            //}
            //else if (document.getElementById('MainContent_InsertContact_txtlegalname').value.length > 128) {
            //alert("LegalName Length has more than 128 Characters");
            //return false;
            //}
            //else if (document.getElementById('MainContent_InsertContact_lkpmktsegment_text').value.length > 10) {
            //  alert("Mkt Segment Length has more than 10 Characters");
            //return false;
            //}

        else if (document.getElementById('MainContent_InsertContact_phnContactWorkPhone_PhoneTextBox').value == '') {
            alert("Please Enter the WorkPhone");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_phnContactHomePhone_PhoneTextBox').value == '' && document.getElementById('MainContent_InsertContact_phnContactMobile_PhoneTextBox').value == '') {
            alert("Please Enter Either the HomePhone or Mobile of Contact");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_txtAccountAddress').value == '') {
            alert("Please Enter the Required Address Details");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_adrContactAddress_Zip').value == '') {
            alert("Please Enter the Pincode of Contact");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_adrAccountAddress_Addr1').value == '') {
            alert("Please Enter the Address1 of Account");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_adrAccountAddress_Zip').value == '') {
            alert("Please Enter the Pincode of Account");
            return false;
        }
        else if (document.getElementById('MainContent_InsertContact_txtAccountBusinessDescription').value.length > 2000) {
            alert("DescriptionofBusiness Length has more than 255 Characters");
            return false;
        }
        return true;
    }

</script>





<script lang="javascript" type="text/javascript">

    function GetLocation() {

        //var geocoder = new google.maps.Geocoder();
                
        var df = true;
        var address = document.getElementById('DialogWorkspace_AddEditAddress_txtAddress1').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_txtAddress2').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_txtAddress3').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_pklCity_Text').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_pklState_Text').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_pklCountry_Text').value + ',' + document.getElementById('DialogWorkspace_AddEditAddress_txtPostalCode').value;
        var add1 = document.getElementById('DialogWorkspace_AddEditAddress_txtAddress1').value;
        var pin = document.getElementById('DialogWorkspace_AddEditAddress_txtPostalCode').value;
        if (add1 == '') {
            alert('Please Fill Required fields');
            return false;
        }
        else if (pin == '') {
            alert('Please Fill Required fields');
            return false;
        }
        /*geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                document.cookie = "Latitude=" + latitude;
                document.cookie = "Logitute=" + longitude;

                document.getElementById('MainContent_InsertContact_txtAccountAddress').value = address;
                //alert(document.getElementById('DialogWorkspace_AddEditAddress_btnSave'));
                document.getElementById('DialogWorkspace_AddEditAddress_btnSave').click();

                df = true;
            } else {
        		alert("Geocode was not successful for the following reason: " + status);
                df = false;
            }
        });*/
        document.getElementById('MainContent_InsertContact_txtAccountAddress').value = address;
        //document.getElementById('DialogWorkspace_AddEditAddress_btnSave').click();
        return df;
    }
</script>

<div style="display: none">
    <asp:Panel ID="pnlInsertContact_LTools" runat="server"></asp:Panel>
    <asp:Panel ID="pnlInsertContact_CTools" runat="server"></asp:Panel>
    <asp:Panel ID="pnlInsertContact_RTools" runat="server">
        <asp:ImageButton runat="server" ID="cmdSave" AlternateText="<%$ resources: cmdSave.Caption %>" ToolTip="<%$ resources: cmdSave.ToolTip %>"
            ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16" OnClientClick="return ChkRequiredField()" />
        <asp:ImageButton runat="server" ID="cmdSaveNew" AlternateText="<%$ resources: cmdSaveNew.Caption %>" ToolTip="<%$ resources: cmdSaveNew.ToolTip %>"
            ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_New16x16" OnClientClick="return ChkRequiredField()" />
        <asp:ImageButton runat="server" ID="cmdSaveClear" AlternateText="<%$ resources: cmdSaveClear.Caption %>" ToolTip="<%$ resources: cmdSaveClear.ToolTip %>"
            ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_Clear16x16" OnClientClick="return ChkRequiredField()" />
        <SalesLogix:PageLink ID="lnkInsertContactHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: lnkHelp.Caption %>"
            Target="<%$ resources: lnkHelp.ToolTip %>" NavigateUrl="contactadd1.aspx" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16">
        </SalesLogix:PageLink>
    </asp:Panel>
</div>
<table border="0" cellpadding="1" cellspacing="0" class="formtable">
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    <tr>
        <td>
            <span class="lbl">
                <asp:Label ID="nmeContactName_lz" AssociatedControlID="nmeContactName" runat="server" Text="<%$ resources:nmeContactName.Caption %>" ForeColor="Red"></asp:Label>
            </span>
            <span>
                <span class="textcontrol">
                    <SalesLogix:FullName runat="server" ID="nmeContactName" />
                </span>
            </span>
        </td>
        <td colspan="2">
            <span class="lbl">
                <asp:Label ID="lueUseExistingAccount_lz" AssociatedControlID="lueUseExistingAccount" runat="server" Text="<%$ resources: lueUseExistingAccount.Caption %>"></asp:Label></span>
            <span class="textcontrol">
                <SalesLogix:LookupControl runat="server" ID="lueUseExistingAccount" LookupEntityName="Account" LookupDisplayMode="HyperText" AutoPostBack="true"
                    LookupEntityTypeName="Sage.Entity.Interfaces.IAccount, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null">
                    <LookupProperties>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.AccountName.PropertyHeader %>"
                            PropertyName="AccountName" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Address.City.PropertyHeader %>"
                            PropertyName="Address.City" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Address.State.PropertyHeader %>"
                            PropertyName="Address.State" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.MainPhone.PropertyHeader %>"
                            PropertyName="MainPhone" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Type.PropertyHeader %>"
                            PropertyName="Type" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.SubType.PropertyHeader %>"
                            PropertyName="SubType" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Status.PropertyHeader %>"
                            PropertyName="Status" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.AccountManager.PropertyHeader %>"
                            PropertyName="AccountManager.UserInfo.UserName" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Owner.PropertyHeader %>"
                            PropertyName="Owner.OwnerDescription" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False">
                        </SalesLogix:LookupProperty>
                    </LookupProperties>
                    <LookupPreFilters>
                    </LookupPreFilters>
                </SalesLogix:LookupControl>
            </span>
        </td>
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="txtContactAccountName_lz" AssociatedControlID="txtContactAccountName" runat="server" Text="<%$ resources:txtContactAccountName.Caption %>" ForeColor="Red"></asp:Label>
            </div>
            <div class="textcontrol">
                <asp:TextBox runat="server" ID="txtContactAccountName" dojoType="Sage.UI.Controls.TextBox" />
            </div>
        </td>
        <td rowspan="2" colspan="2">
            <asp:Localize runat="server" ID="lblLookForMatches" Text="<%$ resources: lblLookForMatches.Caption %>"></asp:Localize>
        </td>
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="lbllegalname" runat="server" Text="Legal Name:"></asp:Label>
            </div>
            <div class="textcontrol">
               <asp:TextBox ID="txtlegalname" runat="server" AutoPostBack="false"></asp:TextBox>
            </div>
        </td>
    </tr>
	<tr>
		<td>
            <div class="lbl">
                <asp:Label ID="emlContactEmail_lz" AssociatedControlID="emlContactEmail" runat="server" Text="<%$ resources: emlContactEmail.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Email runat="server" ID="emlContactEmail" EmailTextBoxStyle-ForeColor="#000099" EmailTextBoxStyle-Font-Underline="false"
                    ToolTip="<%$ resources: emlEmail.ToolTip %>">
                </SalesLogix:Email>
            </div>
        </td>
	</tr>
    <tr>
        <td>
            <div class=" lbl alignleft">
   <asp:Label ID="lkpIndustry1_lbl" AssociatedControlID="lkpIndustry" runat="server" Text="MKT Segment:" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup"   >
<SalesLogix:LookupControl runat="server" ID="lkpIndustry" Enabled="true" LookupEntityName="Indsgmst" LookupEntityTypeName="Sage.Entity.Interfaces.IIndsgmst, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="MKT Segment" PropertyName="Cmktsgdesc" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="Industry" PropertyName="Cindsgdesc" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
  </div>

            <!--<div class=" lbl alignleft">
   <asp:Label ID="lkpIndustry_lbl" runat="server" Text="Industry:" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup">
      <asp:DropDownList ID ="ddlIndustry"  runat ="server" AutoPostBack="true" OnSelectedIndexChanged="ddlIndustry_SelectedIndexChanged" ></asp:DropDownList>
  </div>
        </td>

        
    </tr>
    <tr>
        <td>

            <div class=" lbl alignleft">
   <asp:Label ID="lkpMKTSegment_lbl" runat="server" Text="MKT Segment:" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup"   >
<SalesLogix:LookupControl runat="server" ID="lkpmktsegment" LookupEntityName="Vwsegmentmst" LookupEntityTypeName="Sage.Entity.Interfaces.IVwsegmentmst, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="Segment" PropertyName="Segmentname" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="Industry" PropertyName="Industryid" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
      <asp:DropDownList ID ="ddlMKTSegment"  runat ="server"></asp:DropDownList>
  </div>-->
        </td>

        
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="webContactWebAddress_lz" AssociatedControlID="webContactWebAddress" runat="server" Text="<%$ resources:webContactWebAddress.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:URL runat="server" ID="webContactWebAddress" URLTextBoxStyle-ForeColor="#000099" URLTextBoxStyle-Font-Underline="false" ButtonToolTip="<%$ resources: webContactWebAddress.ButtonToolTip %>" />
            </div>
        </td>
        <td colspan="2">
            <span>
                <asp:Button runat="server" ID="cmdMatchingRecords" Text="<%$ resources: cmdMatchingRecords.Caption %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Find_16x16" CssClass="slxbutton" />
            </span>
        </td>
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="phnContactWorkPhone_lz" AssociatedControlID="phnContactWorkPhone" runat="server" Text="<%$ resources:phnContactWorkPhone.Caption %>" ForeColor="Red"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnContactWorkPhone" AutoPostBack="true" />
            </div>
        </td>
        <td colspan="2">
            <div class="slxlabel alignleft checkbox">
                <SalesLogix:SLXCheckBox runat="server" ID="chkAutoSearch" Text="<%$ resources: chkAutoSearch.Caption %>" LabelPlacement="right" />
            </div>
        </td>
    </tr>

    <!-- <tr>
        <td>
            <div>
                <asp:Button runat="server" ID="cmdSelectAddress" Text="<%$ resources: cmdSelectAddress.Caption %>" CssClass="slxbutton"
                    ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Alternate_Address_16x16" />
            </div>
        </td>
    </tr> -->
    <tr>
        <td colspan="3" style="padding: 5px 0px;">
            <div class="mainContentHeader">
                <div id="hzsAccountInformation" style="padding-left: 30px">
                    <asp:Localize ID="Localize2" runat="server" Text="<%$ resources: hzsAccountInformation.Caption %>">Account Information</asp:Localize>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="lnkaddress" Text="Address:" runat="server" OnClick="lnkaddress_Click" Font-Underline="True"></asp:LinkButton>
			<asp:ImageButton runat="server" ID="cmdShowMap" Visible ="false" ToolTip="Show Map" onClick="cmdShowMap_Click" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Get_Map_16x16"  />
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="phnAccountMainPhone_lz" AssociatedControlID="phnAccountMainPhone" runat="server" Text="<%$ resources: phnAccountMainPhone.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnAccountMainPhone" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="pklAccountIndustry_lz" AssociatedControlID="pklAccountIndustry" runat="server" Visible="false" Text="<%$ resources: pklAccountIndustry.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:PickListControl runat="server" ID="pklAccountIndustry" PickListId="kSYST0000388" Visible="false" PickListName="Industry" MustExistInList="false"
                    NoneEditable="true" AlphaSort="true" />
            </div>
        </td>

    </tr>
    <tr>
        <td rowspan="2">
            <div class="textcontrol">
                <asp:TextBox runat="server" ID="txtAccountAddress" TextMode="MultiLine" Columns="40" Rows="5" ReadOnly="True" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="phnAccountFax_lz" AssociatedControlID="phnAccountFax" runat="server" Text="<%$ resources: phnAccountFax.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnAccountFax" />
            </div>
        </td>
        <td rowspan="2">
            <div class="lbl">
                <asp:Label ID="txtAccountBusinessDescription_lz" AssociatedControlID="txtAccountBusinessDescription" runat="server" Text="<%$ resources: txtAccountBusinessDescription.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <asp:TextBox runat="server" ID="txtAccountBusinessDescription" TextMode="MultiLine" Columns="40" Rows="3" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="pklAccountType_lz" AssociatedControlID="pklAccountType" runat="server" Text="<%$ resources: pklAccountType.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:PickListControl runat="server" ID="pklAccountType" PickListId="kSYST0000382" PickListName="Account Type" ReadOnly="true"
                    NoneEditable="true" />
            </div>
        </td>


    </tr>
    <tr>
        <td></td>
        <td>
            <div class="lbl">
                <asp:Label ID="pklAccountStatus_lz" AssociatedControlID="pklAccountStatus" runat="server" Text="<%$ resources: pklAccountStatus.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:PickListControl runat="server" ID="pklAccountStatus" PickListId="kSYST0000381" PickListName="Account Status" MustExistInList="false"
                    AlphaSort="true" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="pklAccountSubType_lz" AssociatedControlID="pklAccountSubType" runat="server" Text="<%$ resources: pklAccountSubType.Caption %>" Visible="false"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:PickListControl runat="server" ID="pklAccountSubType" PickListId="kSYST0000382" MustExistInList="false"  Visible="false" />
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding: 5px 0px;">
            <div class="mainContentHeader">
                <span id="hzsContactInformation" style="padding-left: 30px">
                    <asp:Localize ID="Localize1" runat="server" Text="<%$ resources: hzsContactInformation.Caption %>">Contact Information</asp:Localize>
                </span>
            </div>
        </td>
    </tr>
    <tr>


        <td>
            <div class="lbl">
                <asp:Label ID="phnContactHomePhone_lz" AssociatedControlID="phnContactHomePhone" runat="server" Text="Direct Phone:" ></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnContactHomePhone" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="pklContactTitle_lz" AssociatedControlID="pklContactTitle" runat="server" Text="<%$ resources: pklContactTitle.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:PickListControl runat="server" ID="pklContactTitle" PickListId="kSYST0000385" PickListName="Title" MustExistInList="false" AlphaSort="true" />
            </div>
        </td>
        <td rowspan="1">
            <div class="lbl">
                <asp:Label ID="adrContactAddress_lz" AssociatedControlID="adrContactAddress" runat="server" Text="<%$ resources:adrContactAddress.Caption %>" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:AddressControl Visible="False" runat="server" ID="adrContactAddress" AddressDescriptionPickListId="kSYST0000013" AutoPostBack="true" AddressDescriptionPickListName="Address Description (Contact)"
                    AddressToolTip="<%$ resources: adrContactAddress.AddressToolTip %>" ButtonToolTip="<%$ resources: adrContactAddress.ButtonToolTip %>">
                    <AddressDescStyle Height="80" />
                </SalesLogix:AddressControl>
            </div>
        </td>
    </tr>
    <tr>

        <td>
            <div class="lbl">
                <asp:Label ID="phnContactMobile_lz" font AssociatedControlID="phnContactMobile" runat="server" Text="<%$ resources: phnContactMobile.Caption %>"  ForeColor="Red"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnContactMobile" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="phnContactFax_lz" AssociatedControlID="phnContactFax" runat="server" Text="<%$ resources: phnContactFax.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:Phone runat="server" ID="phnContactFax" />
            </div>
        </td>   
        <td rowspan="1">
            <div class="lbl">
                <asp:Label ID="adrAccountAddress_lz" AssociatedControlID="adrAccountAddress" runat="server" Text="<%$ resources:adrAccountAddress.Caption %>" ForeColor="Red" Visible="False"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:AddressControl runat="server" Visible="False" ID="adrAccountAddress" AddressDescriptionPickListId="kSYST0000014" AddressDescriptionPickListName="Address Description (Account)"
                    AddressToolTip="<%$ resources: adrContactAddress.AddressToolTip %>" ButtonToolTip="<%$ resources: adrContactAddress.ButtonToolTip %>">
                    <AddressDescStyle Height="80" />
                </SalesLogix:AddressControl>
            </div>
        </td>

    </tr>

    <tr>
        <td colspan="3" style="padding: 5px 0px;">
            <div>
                <hr />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="lbl">
                <asp:Label ID="usrAccountManager_lz" AssociatedControlID="usrAccountManager" runat="server" Text="<%$ resources: usrAccountManager.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:SlxUserControl runat="server" ID="usrAccountManager" />
            </div>
        </td>
        <td>
            <div class="lbl">
                <asp:Label ID="ownAccountOwner_lz" AssociatedControlID="ownAccountOwner" runat="server" Text="<%$ resources: ownAccountOwner.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol">
                <SalesLogix:OwnerControl runat="server" ID="ownAccountOwner" />
            </div>
        </td>
        <td>
            <div class=" lbl alignleft">
                <asp:Label ID="LeadSource_lbl" AssociatedControlID="lucLeadSource" runat="server" Text="<%$ resources: LeadSource.Caption %>"></asp:Label>
            </div>
            <div class="textcontrol lookup">
                <SalesLogix:LookupControl runat="server" ID="lucLeadSource" Enabled = "false" ButtonToolTip="<%$ resources: LeadSource.ButtonToolTip %>" LookupEntityName="LeadSource" LookupEntityTypeName="Sage.Entity.Interfaces.ILeadSource, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null">
                    <LookupProperties>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: LeadSource.LookupProperties.Type.PropertyHeader %>" PropertyName="Type" PropertyType="" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: LeadSource.LookupProperties.Description.PropertyHeader %>" PropertyName="Description" PropertyType="" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: LeadSource.LookupProperties.AbbrevDescription.PropertyHeader %>" PropertyName="AbbrevDescription" PropertyType="" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                        <SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueUseExistingAccount.LookupProperties.Status.PropertyHeader %>" PropertyName="Status" PropertyType="System.String" PropertyFormat="None" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
                    </LookupProperties>
                    <LookupPreFilters>
                        <SalesLogix:LookupPreFilter PropertyName="Status" PropertyType="System.String" OperatorCode="="
                            FilterValue="<%$ resources: LeadSource.LUPF.Status %>">
                        </SalesLogix:LookupPreFilter>
                    </LookupPreFilters>
                </SalesLogix:LookupControl>
            </div>
        </td>
    </tr>
</table>

<script runat="server" type="text/C#">
    public override Type EntityType
    {
        get { return typeof(IContact); }
    }

    [ServiceDependency]
    public IRoleSecurityService RoleSecurityService { get; set; }

    [ServiceDependency(Type = typeof(IEntityContextService), Required = true)]
    public IEntityContextService EntityService { get; set; }

    private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dsAddrss;
    public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource DSAddress
    {
        get
        {
            if (_dsAddrss == null)
            {
                _dsAddrss = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(IAddress),
                 EntityService.EntityType, "Addresses", System.Reflection.MemberTypes.Property);
                _dsAddrss.UseSmartQuery = false;
            }
            return _dsAddrss;
        }
    }




    private IUserOptionsService _userOpts;
    private IUserOptionsService UserOptionsService
    {
        get
        {
            if ((_userOpts == null) && (ApplicationContext.Current != null))
                _userOpts = ApplicationContext.Current.Services.Get<IUserOptionsService>();
            return _userOpts;
        }
    }

    private void DiasbleFLS()
    {
        foreach (Sage.Platform.EntityBinding.IEntityBinding eb in BindingSource.Bindings)
        {
            WebEntityBinding wb = eb as WebEntityBinding;
            wb.IgnoreFLSDisabling = true;
        }
    }
    private void IgnoreAccountBindings()
    {


        foreach (Sage.Platform.EntityBinding.IEntityBinding eb in BindingSource.Bindings)
        {
            WebEntityBinding wb = eb as WebEntityBinding;
            if (IsAccountBinding(wb.EntityBindingString))
            {
                wb.IgnoreControlChanges = true;
            }
        }
    }

    private bool IsAccountBinding(string propertyName)
    {
        switch (propertyName)
        {
            case "Account.AccountName":
                return true;
            case "Account.MainPhone":
                return true;
            case "Account.Industry":
                return true;
            case "Account.Fax":
                return true;
            case "Account.BusinessDescription":
                return true;
            case "Account.Type":
                return true;
            case "Account.SubTyp":
                return true;
            case "Account.Status":
                return true;
            case "Account.AccountManager":
                return true;
            case "Account.Owner":
                return true;
            case "Account.LeadSource":
                return true;
            case "Account.Address.FullAddress":
                return true;
            case "Account.Address.City":
                return true;
            case "Account.Address.Country":
                return true;
            case "Account.Address.County":
                return true;
            case "Account.Address.Address1":
                return true;
            case "Account.Address.Address2":
                return true;
            case "Account.Address.Address3":
                return true;
            case "Account.Address.Description":
                return true;
            case "Account.Address.IsMailing":
                return true;
            case "Account.Address.IsPrimary":
                return true;
            case "Account.Address.PostalCode":
                return true;
            case "Account.Address.Salutation":
                return true;
            case "Account.Address.State":
                return true;

            case "Account.LEGALNAME":
                return true;
            case "Account.MKTSEGMENT":
                return true;
            default:
                return false;
        }
    }

    protected override void OnAddEntityBindings()
    {
        BindingSource.Bindings.Add(new WebEntityBinding("Prefix", nmeContactName, "NamePrefix"));
        BindingSource.Bindings.Add(new WebEntityBinding("FirstName", nmeContactName, "NameFirst"));
        BindingSource.Bindings.Add(new WebEntityBinding("MiddleName", nmeContactName, "NameMiddle"));
        BindingSource.Bindings.Add(new WebEntityBinding("LastName", nmeContactName, "NameLast"));
        BindingSource.Bindings.Add(new WebEntityBinding("Suffix", nmeContactName, "NameSuffix"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.AccountName", txtContactAccountName, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Email", emlContactEmail, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("WebAddress", webContactWebAddress, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("WorkPhone", phnContactWorkPhone, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Title", pklContactTitle, "PickListValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("HomePhone", phnContactHomePhone, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.FullAddress", adrContactAddress, "AddressDisplay"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Description", adrContactAddress, "AddressDescription"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.IsPrimary", adrContactAddress, "AddressIsPrimary"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.IsMailing", adrContactAddress, "AddressIsMailing"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Address1", adrContactAddress, "AddressDesc1"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Address2", adrContactAddress, "AddressDesc2"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Address3", adrContactAddress, "AddressDesc3"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.City", adrContactAddress, "AddressCity"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.State", adrContactAddress, "AddressState"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.PostalCode", adrContactAddress, "AddressPostalCode"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.County", adrContactAddress, "AddressCounty"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Country", adrContactAddress, "AddressCountry"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.Salutation", adrContactAddress, "AddressSalutation"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.AddressType", adrContactAddress, "AddressType"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.PrimaryAddress", adrContactAddress, "PrimaryAddress"));
        BindingSource.Bindings.Add(new WebEntityBinding("Mobile", phnContactMobile, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Fax", phnContactFax, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.FullAddress", adrAccountAddress, "AddressDisplay"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.City", adrAccountAddress, "AddressCity"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Country", adrAccountAddress, "AddressCountry"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.County", adrAccountAddress, "AddressCounty"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Address1", adrAccountAddress, "AddressDesc1"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Address2", adrAccountAddress, "AddressDesc2"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Address3", adrAccountAddress, "AddressDesc3"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Description", adrAccountAddress, "AddressDescription"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.IsMailing", adrAccountAddress, "AddressIsMailing"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.IsPrimary", adrAccountAddress, "AddressIsPrimary"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.PostalCode", adrAccountAddress, "AddressPostalCode"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.Salutation", adrAccountAddress, "AddressSalutation"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Address.State", adrAccountAddress, "AddressState"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.AddressType", adrAccountAddress, "AddressType"));
        BindingSource.Bindings.Add(new WebEntityBinding("Address.PrimaryAddress", adrAccountAddress, "PrimaryAddress"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.MainPhone", phnAccountMainPhone, "Text"));
        //BindingSource.Bindings.Add(new WebEntityBinding("Account.Industry", pklAccountIndustry, "PickListValue"));
        //BindingSource.Bindings.Add(new WebEntityBinding("Account.Industry", ddlIndustry, "PickListValue"));
        //BindingSource.Bindings.Add(new WebEntityBinding("Account.MktSegment", ddlMKTSegment, "PickListValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Fax", phnAccountFax, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.BusinessDescription", txtAccountBusinessDescription, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Type", pklAccountType, "PickListValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.SubType", pklAccountSubType, "PickListValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Status", pklAccountStatus, "PickListValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.AccountManager", usrAccountManager, "LookupResultValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.Owner", ownAccountOwner, "LookupResultValue"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.LeadSource", lucLeadSource, "LookupResultValue"));

        BindingSource.Bindings.Add(new WebEntityBinding("Account.LEGALNAME", txtlegalname, "Text"));
        BindingSource.Bindings.Add(new WebEntityBinding("Account.SegmentmstID", lkpIndustry, "LookupResultValue"));


        DiasbleFLS();
    }

    protected void lueUseExistingAccount_ChangeAction(object sender, EventArgs e)
    {
        IgnoreAccountBindings();
        IAccount account = (lueUseExistingAccount.LookupResultValue as IAccount);
        IContact contact = (BindingSource.Current as IContact);
        if (account == null || contact == null) return;
        txtContactAccountName.Enabled = false;
		txtlegalname.Enabled = false;
        adrAccountAddress.Enabled = false;
        phnAccountMainPhone.Enabled = false;
        phnAccountFax.Enabled = false;
        pklAccountType.Enabled = false;
        pklAccountSubType.Enabled = false;
        pklAccountStatus.Enabled = false;
        //pklAccountIndustry.Enabled = false;
        lkpIndustry.Enabled = false;
        lkpIndustry.ReadOnly = true;
        //ddlIndustry.Enabled = false;
        //ddlMKTSegment.Enabled = false;
        txtAccountBusinessDescription.Enabled = false;
        usrAccountManager.Enabled = false;
        ownAccountOwner.Enabled = false;
        lucLeadSource.Enabled = false;

        cmdSelectAddress.Enabled = (account.Addresses.Count > 0);

        contact.Account = account;
        contact.AccountName = account.AccountName;

        contact.WebAddress = account.WebAddress;
        contact.WorkPhone = account.MainPhone;
        contact.Fax = account.Fax;

        contact.Address.Address1 = account.Address.Address1;
        contact.Address.Address2 = account.Address.Address2;
        contact.Address.Address3 = account.Address.Address3;
        contact.Address.Address4 = account.Address.Address4;
        contact.Address.City = account.Address.City;
        contact.Address.Country = account.Address.Country;
        contact.Address.County = account.Address.County;
        contact.Address.IsMailing = true;
        contact.Address.IsPrimary = true;
        contact.Address.PrimaryAddress = true;
        contact.Address.AddressType = account.Address.AddressType;
        contact.Address.PostalCode = account.Address.PostalCode;
        contact.Address.Routing = account.Address.Routing;
        contact.Address.Salutation = contact.FirstName;
        contact.Address.State = account.Address.State;
        contact.Address.TimeZone = account.Address.TimeZone;
        contact.Address.Type = account.Address.Type;

        contact.Address.Description = string.IsNullOrEmpty(account.Address.Description)
                                          ? GetLocalResourceObject("Contact_Address_Description_Default").ToString()
                                          : account.Address.Description;
        lueUseExistingAccount.LookupResultValue = account;
    }

    protected void DialogService_onDialogClosing(object from, WebDialogClosingEventArgs e)
    {
        if (DialogService == null) return;
        if (DialogService.SmartPartMappedID != "ContactSearchForDuplicates") return;
        if (DialogService.DialogParameters.ContainsKey("JumpID"))
        {
            string strJumpID = DialogService.DialogParameters["JumpID"].ToString();
            if (strJumpID != EntityContext.EntityID.ToString())
            {
                IgnoreAccountBindings();
                IAccount account = EntityFactory.GetById<IAccount>(strJumpID);
                lueUseExistingAccount.LookupResultValue = account;
                lueUseExistingAccount_ChangeAction(@from, e);

                IPanelRefreshService refresher = PageWorkItem.Services.Get<IPanelRefreshService>();
                if (refresher != null)
                {
                    refresher.RefreshAll();
                }
            }
        }
    }

    protected void phnContactWorkPhone_ChangeAction(object sender, EventArgs e)
    {
        ///* If we're dealing with a new Account and Contact. */
        IContact contact = BindingSource.Current as IContact;
        if (contact == null) return;
        if (contact.Account.Id == null)
        {
            contact.Account.MainPhone = contact.WorkPhone;
			phnAccountMainPhone.Focus();
        }
        if ((DialogService != null) && (chkAutoSearch.Checked))
        {
            contact.AccountName = contact.Account.AccountName;
            DialogService.DialogParameters.Clear();
            DialogService.DialogParameters.Add("Contact", BindingSource.Current);
            DialogService.DialogParameters.Add("Account", contact.Account);
            DialogService.SetSpecs(0, 0, 800, 1000, "ContactSearchForDuplicates", "", true);
            DialogService.ShowDialog();
        }
		
    }

    protected void cmdMatchingRecords_ClickAction(object sender, EventArgs e)
    {
        if (DialogService != null)
        {
            IContact contact = BindingSource.Current as IContact;
            if (contact != null)
            {
                IAccount account = contact.Account;
                contact.AccountName = account.AccountName;
                DialogService.DialogParameters.Clear();
                DialogService.DialogParameters.Add("Contact", BindingSource.Current);
                DialogService.DialogParameters.Add("Account", account);
                DialogService.SetSpecs(0, 0, 800, 1000, "ContactSearchForDuplicates", "", true);
                DialogService.ShowDialog();
            }
        }
    }

    protected void adrContactAddress_ChangeAction(object sender, EventArgs e)
    {
        /* If we're dealing with a new Account and Contact. */
        IContact contact = BindingSource.Current as IContact;
        if (contact == null) return;
        if (contact.Account.Id == null)
        {
            contact.Account.Address.Address1 = adrContactAddress.AddressDesc1;
            contact.Account.Address.Address2 = adrContactAddress.AddressDesc2;
            contact.Account.Address.Address3 = adrContactAddress.AddressDesc3;
            contact.Account.Address.Address4 = "";
            contact.Account.Address.City = adrContactAddress.AddressCity;
            contact.Account.Address.Country = adrContactAddress.AddressCountry;
            contact.Account.Address.County = adrContactAddress.AddressCounty;
            contact.Account.Address.Description = adrContactAddress.AddressDescription;
            contact.Account.Address.PostalCode = adrContactAddress.AddressPostalCode;
            contact.Account.Address.Routing = "";
            contact.Account.Address.Salutation = adrContactAddress.AddressSalutation;
            contact.Account.Address.State = adrContactAddress.AddressState;
            contact.Account.Address.TimeZone = "";
            contact.Account.Address.IsMailing = true;
            contact.Account.Address.IsPrimary = true;
        }
    }

    protected void cmdSelectAddress_ClickAction(object sender, EventArgs e)
    {
        if (DialogService != null)
        {
            DialogService.SetSpecs(100, 100, 300, 800, "SelectAccountAddress", GetLocalResourceObject("SelectAddress_rsc.DialogTitleOverride").ToString(), true);
            DialogService.ShowDialog();
        }
    }

    protected void cmdSave_ClickAction(object sender, EventArgs e)
    {
        if (saveOptions() == false)
        {
            return;
        }
        IContact contact = BindingSource.Current as IContact;
        
        if (contact != null)
        {          
           
            object[] objarray = new object[] { contact, contact.Account };
            object contactId = EntityFactory.Execute<Contact>("Contact.SaveContactAccount", objarray);
            Sage.Platform.Security.IUserService _IUserService = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Security.IUserService>();
            string _UserId = _IUserService.UserId;
            Sage.Entity.Interfaces.IUser user = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IUser>((object)_UserId);
            contact.AccountManager = user;
            contact.Save();
             Response.Redirect(string.Format("Contact.aspx?entityId={0}", (contactId)));
            
        }

    }

    protected void cmdSaveNew_ClickAction(object sender, EventArgs e)
    {
        if (saveOptions() == false)
        {
            return;
        }
        IContact contact = BindingSource.Current as IContact;
        if (contact != null)
        {
            object[] objarray = new object[] { contact, contact.Account };
            EntityFactory.Execute<Contact>("Contact.SaveContactAccount", objarray);
            Sage.Platform.Security.IUserService _IUserService = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Security.IUserService>();
            string _UserId = _IUserService.UserId;
            Sage.Entity.Interfaces.IUser user = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IUser>((object)_UserId);
            contact.AccountManager = user;
            contact.Save();
            Response.Redirect(string.Format("InsertContactAccount.aspx?modeid=Insert&accountId={0}", contact.Account.Id));
        }
    }

    protected void cmdSaveClear_ClickAction(object sender, EventArgs e)
    {
        if (saveOptions() == false)
        {
            return;
        }
        IContact contact = BindingSource.Current as IContact;
        if (contact != null)
        {
            object[] objarray = new object[] { contact, contact.Account };
            EntityFactory.Execute<Contact>("Contact.SaveContactAccount", objarray);
            Sage.Platform.Security.IUserService _IUserService = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Security.IUserService>();
            string _UserId = _IUserService.UserId;
            Sage.Entity.Interfaces.IUser user = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IUser>((object)_UserId);
            contact.AccountManager = user;
            contact.Save();
            Response.Redirect("InsertContactAccount.aspx?modeid=Insert");
        }
    }
    protected void ddlIndustry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlIndustry.SelectedItem.Text != "")
        {
            string qry = "select CMKTSGDESC From INDSGMST where CINDSGDESC = '" + ddlIndustry.SelectedItem.Text + "'";

            Sage.Platform.Data.IDataService service1 = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
            System.Data.OleDb.OleDbConnection conObj = new System.Data.OleDb.OleDbConnection(service1.GetConnectionString());
            System.Data.OleDb.OleDbDataAdapter dataAdapterObj = new System.Data.OleDb.OleDbDataAdapter(qry, conObj);
            System.Data.DataTable dt = new System.Data.DataTable();
            dataAdapterObj.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                ddlMKTSegment.DataTextField = "CMKTSGDESC";
                ddlMKTSegment.DataValueField = "CMKTSGDESC";
                ddlMKTSegment.DataSource = dt;                
                ddlMKTSegment.DataBind();
                ddlMKTSegment.Items.Insert(0, new ListItem("", ""));

            }
            else
            {
                ddlMKTSegment.DataSource = null;
                ddlMKTSegment.DataBind();
            }
        }
    }
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        ClientBindingMgr.RegisterBoundControl(lueUseExistingAccount);
        ClientBindingMgr.RegisterSaveButton(cmdSave);
        ClientBindingMgr.RegisterSaveButton(cmdSaveClear);
        ClientBindingMgr.RegisterSaveButton(cmdSaveNew);
        LoadView();
    }

    private void LoadView()
    {
        if (!RoleSecurityService.HasAccess("Entities/Account/Add"))
        {
            txtContactAccountName.Enabled = false;
            txtContactAccountName.ReadOnly = true;
            adrAccountAddress.Enabled = false;
            adrAccountAddress.ReadOnly = true;
            adrAccountAddress.ShowButton = false;
            phnAccountMainPhone.Enabled = false;
            phnAccountMainPhone.ReadOnly = true;
            phnAccountFax.Enabled = false;
            phnAccountFax.ReadOnly = true;
            pklAccountType.Enabled = false;
            pklAccountType.ReadOnly = true;
            pklAccountSubType.Enabled = false;
            pklAccountSubType.ReadOnly = true;
            pklAccountStatus.Enabled = false;
            pklAccountStatus.ReadOnly = true;
            //pklAccountIndustry.Enabled = false;
            //pklAccountIndustry.ReadOnly = true;
            //ddlIndustry.Enabled = false;
            //ddlMKTSegment.Enabled = false;
            lkpIndustry.Enabled = false;
            lkpIndustry.ReadOnly = true;
            txtAccountBusinessDescription.Enabled = false;
            txtAccountBusinessDescription.ReadOnly = true;
            usrAccountManager.Enabled = false;
            usrAccountManager.ReadOnly = true;
            ownAccountOwner.Enabled = false;
            ownAccountOwner.ReadOnly = true;
            lucLeadSource.Enabled = false;
            lucLeadSource.ReadOnly = true;
        }
        IContact contact = (BindingSource.Current as IContact);
        if (contact != null)
        {
            if (contact.Id == null)
            {
                if (!Page.IsPostBack)
                {
                    chkAutoSearch.Checked = TurnOnAutoSearch();
					
                }
            }

            IAccount account = GetCurrentAccount(contact);
            if (account == null) return;
            if (!Page.IsPostBack)
            {

                string qry = "select CINDSGDESC From INDSGMST";

                Sage.Platform.Data.IDataService service1 = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
                System.Data.OleDb.OleDbConnection conObj = new System.Data.OleDb.OleDbConnection(service1.GetConnectionString());
                System.Data.OleDb.OleDbDataAdapter dataAdapterObj = new System.Data.OleDb.OleDbDataAdapter(qry, conObj);
                System.Data.DataTable dt = new System.Data.DataTable();
                dataAdapterObj.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ddlIndustry.DataTextField = "CINDSGDESC";
                    ddlIndustry.DataValueField = "CINDSGDESC";
                    ddlIndustry.DataSource = dt;                    
                    ddlIndustry.DataBind();
                    ddlIndustry.Items.Insert(0, new ListItem("", ""));

                }
                else
                {
                    ddlIndustry.DataSource = null;
                    ddlIndustry.DataBind();
                }
            }
            Boolean changeEnable = (account.Id == null);
            txtContactAccountName.Enabled = changeEnable;
			txtlegalname.Enabled = changeEnable;
            adrAccountAddress.Enabled = changeEnable;
            phnAccountMainPhone.Enabled = changeEnable;
            phnAccountFax.Enabled = changeEnable;
            pklAccountType.Enabled = changeEnable;
            pklAccountSubType.Enabled = changeEnable;
            pklAccountStatus.Enabled = changeEnable;
            //pklAccountIndustry.Enabled = changeEnable;
            lkpIndustry.Enabled = changeEnable;
            
            //ddlIndustry.Enabled = changeEnable;
            //ddlMKTSegment.Enabled = changeEnable;
            txtAccountBusinessDescription.Enabled = changeEnable;
            usrAccountManager.Enabled = changeEnable;
            ownAccountOwner.Enabled = changeEnable;
            lucLeadSource.Enabled = changeEnable;

            pklAccountSubType.PickListName = account.GetSubTypePickListName();
            cmdSelectAddress.Enabled = (account.Addresses.Count > 0);
            if (account.Id != null)
            {
                lueUseExistingAccount.LookupResultValue = account;
                pklAccountSubType.PickListName = account.GetSubTypePickListName();
            }

            if (!IsPostBack)
            {
                if (Global.ADDRESS_ID != "")
	            {
                    Sage.Entity.Interfaces.IAddress ad = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(Global.ADDRESS_ID);
                    ad.Delete();
                    Global.ADDRESS_ID="";
				}
                contact.WebAddress = account.WebAddress;
                contact.WorkPhone = account.MainPhone;
                contact.Fax = account.Fax;
                contact.Address.Address1 = account.Address.Address1;
                contact.Address.Address2 = account.Address.Address2;
                contact.Address.Address3 = account.Address.Address3;
                contact.Address.Address4 = account.Address.Address4;
                contact.Address.City = account.Address.City;
                contact.Address.Country = account.Address.Country;
                contact.Address.County = account.Address.County;
                contact.Address.IsMailing = true;
                contact.Address.IsPrimary = true;
                contact.Address.PostalCode = account.Address.PostalCode;
                contact.Address.Routing = account.Address.Routing;
                contact.Address.Salutation = contact.FirstName;
                contact.Address.State = account.Address.State;
                contact.Address.TimeZone = account.Address.TimeZone;
                contact.Address.Type = account.Address.Type;

                contact.Account.Type = "Suspect";


                if (String.IsNullOrEmpty(contact.PreferredContact))
                {
                    contact.PreferredContact = GetLocalResourceObject("Default_Contact_Preferred_Contact").ToString();
                }
                if (String.IsNullOrEmpty(account.Address.Description))
                {
                    account.Address.Description = GetLocalResourceObject("Account_Address_Description_Default").ToString();
                }
                contact.Address.Description = account.Address.Description;


            }
            if (Global.ADDRESS_ID != "")
            {
                Sage.Entity.Interfaces.IAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(Global.ADDRESS_ID);
                if (objadd != null)
                {
                    string _add = objadd.Address1 + "," + objadd.Address2 + "," + objadd.Address3 + "\r\n";
                    _add += objadd.City + "," + objadd.State + "," + objadd.Country + "\r\n";
                    _add += objadd.PostalCode + "\r\n";
                    //_add += objadd.Latitude + "\r\n";
                    //_add += objadd.Logitude;
                    txtAccountAddress.Text = _add;
                }
            }
        }
    }

    private IAccount GetCurrentAccount(IContact contact)
    {
        IAccount account;
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["accountId"] != null)
            {
                string accountId = Request.QueryString["accountId"];
                account = EntityFactory.GetById<IAccount>(accountId);
            }
            else
            {
                account = EntityFactory.Create<IAccount>();
            }
            contact.Account = account;
            ClientBindingMgr.SetFocusTo(nmeContactName);
        }
        else
        {
            account = contact.Account;
        }
        return account;
    }

    protected override void OnWireEventHandlers()
    {
        base.OnWireEventHandlers();
        lueUseExistingAccount.LookupResultValueChanged += lueUseExistingAccount_ChangeAction;
        phnContactWorkPhone.TextChanged += phnContactWorkPhone_ChangeAction;
        cmdMatchingRecords.Click += cmdMatchingRecords_ClickAction;
        adrContactAddress.TextChanged += adrContactAddress_ChangeAction;
        cmdSelectAddress.Click += cmdSelectAddress_ClickAction;
        cmdSave.Click += cmdSave_ClickAction;
        cmdSaveNew.Click += cmdSaveNew_ClickAction;
        cmdSaveClear.Click += cmdSaveClear_ClickAction;
        DialogService.onDialogClosing += DialogService_onDialogClosing;
		//txtlegalname.TextChanged += txtlegalname_TextChanged;

    }

    protected override void OnFormBound()
    {
        IContact contact = (BindingSource.Current as IContact);
        IAccount account = contact.Account;
        if (account != null)
        {
            pklAccountSubType.PickListName = account.GetSubTypePickListName();
            cmdSelectAddress.Enabled = (account.Addresses.Count > 0);
            if (Global.ADDRESS_ID != "")
            {
                IAddress address = Sage.Platform.EntityFactory.GetById<IAddress>(Global.ADDRESS_ID);
                string _add = address.Address1 + "," + address.Address2 + "," + address.Address3 + "\r\n";
                _add += address.City + "," + address.State + "," + address.Country + "\r\n";
                _add += address.PostalCode;
                //_add += account.Address.Latitude + "\r\n";
                //_add += account.Address.Logitude;
                txtAccountAddress.Text = _add;
            }
            else if (account.Id != null)
            {
                lueUseExistingAccount.LookupResultValue = account;
				string _add = account.Address.Address1 + "," + account.Address.Address2 + "," + account.Address.Address3 + "\r\n";
                _add += account.Address.City + "," + account.Address.State + "," + account.Address.Country + "\r\n";
                _add += account.Address.PostalCode;
                //_add += account.Address.Latitude + "\r\n";
                //_add += account.Address.Logitude;
                txtAccountAddress.Text = _add;
                Global.ADDRESS_ID = account.Address.Id.ToString();
                pklAccountSubType.PickListName = account.GetSubTypePickListName();
            }
        }
        base.OnFormBound();
    }


    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        foreach (Control c in pnlInsertContact_LTools.Controls)
        {
            tinfo.LeftTools.Add(c);
        }
        foreach (Control c in pnlInsertContact_CTools.Controls)
        {
            tinfo.CenterTools.Add(c);
        }
        foreach (Control c in pnlInsertContact_RTools.Controls)
        {
            tinfo.RightTools.Add(c);
        }
        return tinfo;
    }

    /* public void pklAccountType_PickListValueChanged(object sender, EventArgs e)
     {
         IContact contact = (BindingSource.Current as IContact);
         if (contact != null)
         {
             IAccount account = GetCurrentAccount(contact);
             if (account != null)
                 account.SubType = string.Empty;
         }
     }*/

    private bool TurnOnAutoSearch()
    {
        string option = UserOptionsService.GetCommonOption("InsertNewContactAccount.AutoSearch", "Insert");
        if (option.Equals("Y"))
        {
            return true;
        }
        return false;
    }

    private bool saveOptions()
    {       
	
		
		if(lueUseExistingAccount.LookupResultValue == null)
		{
			string qry = "Select Account From Account where Account = '" + txtContactAccountName.Text.Trim() + "'";
			Sage.Platform.Data.IDataService service1 = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
			System.Data.OleDb.OleDbConnection conObj = new System.Data.OleDb.OleDbConnection(service1.GetConnectionString());
			System.Data.OleDb.OleDbDataAdapter dataAdapterObj = new System.Data.OleDb.OleDbDataAdapter(qry, conObj);
			System.Data.DataTable dt = new System.Data.DataTable();
			dataAdapterObj.Fill(dt);
			if (dt.Rows.Count > 0)
			{
			    DialogService.ShowMessage("This Account is already exists");
			    return false;
			}			
			qry = "select LegalCompanyName from LegalMaster where upper(LegalCompanyName) ='" + txtlegalname.Text.Trim().ToUpper() + "'";
	        dataAdapterObj = new System.Data.OleDb.OleDbDataAdapter(qry, conObj);
	        dt = new System.Data.DataTable();
	        dataAdapterObj.Fill(dt);
	        if (dt.Rows.Count > 0)
	        {
	            DialogService.ShowMessage("This legal Entity is already exists");
	            return false;
	        }
        }
		IContact contact = BindingSource.Current as IContact;
        IAddress objadd=null;
        if (Global.ADDRESS_ID != "")
        {
            objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(Global.ADDRESS_ID);           
            
            if (lueUseExistingAccount.LookupResultValue == null)
            {
                contact.Account.Address = objadd;
                contact.Account.WebAddress = contact.WebAddress;
                contact.Account.Save();
                objadd.EntityId = contact.Account.Id.ToString();
                objadd.Save();  
            }
        }
        //contact.Account.Industry = ddlIndustry.SelectedItem.Text;
        //contact.Account.MktSegment = ddlMKTSegment.SelectedItem.Text;
        contact.Account.Save();
		
	 	
		
        contact.Save();
        
              
       
        contact.Address.Address1 = objadd.Address1;
        contact.Address.Address2 = objadd.Address2;
        contact.Address.Address3 = objadd.Address3;
        contact.Address.AddressType = objadd.AddressType;
        contact.Address.City = objadd.City;
        contact.Address.Country = objadd.Country;
        contact.Address.CreateDate = objadd.CreateDate;
        contact.Address.CreateUser = objadd.CreateUser;
        contact.Address.Description = objadd.Description;
        contact.Address.IsMailing = objadd.IsMailing;
        contact.Address.IsPrimary = objadd.IsPrimary;
        contact.Address.Latitude = objadd.Latitude;
        contact.Address.Logitude = objadd.Logitude;
        contact.Address.PostalCode = objadd.PostalCode;
        contact.Address.PrimaryAddress = objadd.PrimaryAddress;
		contact.Address.Salutation = objadd.Salutation;
        contact.Address.State = objadd.State;
        contact.Address.Salutation = objadd.Salutation;
        //contact.Address.EntityId = contact.Id.ToString();
        contact.Address.Save();

        Global.ADDRESS_ID="";
       
        string option = "N";
        if (chkAutoSearch.Checked)
        {
            option = "Y";
        }
        UserOptionsService.SetCommonOption("InsertNewContactAccount.AutoSearch", "Insert", option, false);
		return true;
    }
	protected void cmdShowMap_Click(object sender, EventArgs e)
    {
        if (Global.ADDRESS_ID != "")
		{
            Sage.Entity.Interfaces.IAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(Global.ADDRESS_ID);            
			
		    if (objadd != null)
		    {
                //string url = "http://maps.google.com/maps?key=AIzaSyDKK-1E4tfTgGlBptK5TCCfap5coV_kzC0&q=" + objadd.Latitude + "," + objadd.Logitude;
                string url = "ViewMap.html?latlon=" + objadd.Latitude + "," + objadd.Logitude;
				ScriptManager.RegisterStartupScript(Page, typeof(Page), "ShowMap", "window.open('" + url + "');",true);
			}
		}
		else
		{
			DialogService.ShowMessage("Please Enter Address...");
			return;
		}

    }

    protected void lnkaddress_Click(object sender, EventArgs e)
    {       
        if (DialogService != null)
        {
            if (lueUseExistingAccount.LookupResultValue == null)
            {
                DialogService.SetSpecs(200, 200, 440, 300, "AddEditAddress", "", true);
                DialogService.EntityType = typeof(IAddress);
                if (Global.ADDRESS_ID != "")
                {
                    DialogService.EntityID = Global.ADDRESS_ID;
                }
                else
                {
                    DialogService.EntityID = "";
                }
                DialogService.ShowDialog();
            }
            else
            {
                string script_FormatNumber1 = "";
                if (Global.ADDRESS_ID != "")
                {
                    script_FormatNumber1 = "window.showModalDialog('InsertAddress.aspx?type=Account&id=" + Global.ADDRESS_ID.ToString() + "&EntityID=123123123123', '_blank', 'dialogHeight=480,dialogWidth=100,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' )";
                }
                else
                {
                    IAccount account = (IAccount)lueUseExistingAccount.LookupResultValue;
                    script_FormatNumber1 = "window.showModalDialog('InsertAddress.aspx?type=Account&id=" + account.Address.Id.ToString() + "&EntityID=123123123123', '_blank', 'dialogHeight=480,dialogWidth=100,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no,titlebar=no' )";
                    
                }
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", script_FormatNumber1, true);
            }
        }
    }
  
</script>

	



