<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsertEvent.ascx.cs" Inherits="SmartParts_InsertEvent" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<a href="App_LocalResources/AddAccountAddress.ascx.resx"></a>

<script lang="javascript" type="text/javascript">
  function ChkRequiredField() {

        if (document.getElementById('MainContent_InsertEvent_dtStartDate').value == '') {
            alert("Please Enter the StartDate");
            return false;
        }
        else if (document.getElementById('MainContent_InsertEvent_dtEndDate').value == '') {
            alert("Please Enter the EndDate");
            return false;
        }
        else if (document.getElementById('MainContent_InsertEvent_txtDuration_Text').value == '') {
            alert("Please Enter the Duration");
            return false;
        }      
        else if (document.getElementById('MainContent_InsertEvent_pklType_Text').value == '') {
            alert("Please Enter the Day Type");
            return false;
        }      
        return true;
    }

</script>

<div style="display: none">
    <asp:Panel ID="AddressForm_LTools" runat="server"></asp:Panel>
    <asp:Panel ID="AddressForm_CTools" runat="server"></asp:Panel>
    <asp:Panel ID="AddressForm_RTools" runat="server">

      <asp:ImageButton runat="server" ID="cmdSave" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16" OnClientClick="return ChkRequiredField()" />
      
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
            <asp:Label ID="lblStartDate" AssociatedControlID="dtStartDate" runat="server" Text="Start Date:"></asp:Label>
        </td>
        <td>
           <div >
               <SalesLogix:DateTimePicker runat="server" ID="dtStartDate" DisplayTime="false" Timeless="true" />
          </div>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblenddate" AssociatedControlID="dtEndDate" runat="server" Text="End Date:" ></asp:Label>
        </td>
        <td>
            <div>
               <SalesLogix:DateTimePicker runat="server" ID="dtEndDate" DisplayTime="false" Timeless="true" />
          </div>
        </td>
    </tr>
     <tr>
        <td>
            <asp:Label ID="lblduration" AssociatedControlID="txtDuration" runat="server" Text="Duration:"></asp:Label>
        </td>
        <td>
            <SalesLogix:PickListControl runat="server" ID="txtDuration"  PickListName="EventDuration" AutoPostBack="false" NoneEditable="false" MustExistInList="true" />           
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblpklType" AssociatedControlID="pklType" runat="server" Text="Day Type:" ></asp:Label>
        </td>
        <td>
            <SalesLogix:PickListControl runat="server" ID="pklType" Style="width: 100%" PickListName="EventType" AutoPostBack="false" NoneEditable="false" MustExistInList="true" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblDescription" AssociatedControlID="txtDescription" runat="server" Text="Description:"></asp:Label>
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtDescription"  MaxLength="64" />
        </td>
    </tr>
    <tr>
           <td>         
                <asp:Label ID="usrUser_lbl" AssociatedControlID="usrUser" runat="server" Text="User:" ></asp:Label>
          </td>
          <td>          
                <SalesLogix:SlxUserControl runat="server" ID="usrUser" Style="width: 30%" />    
         </td>
    </tr>
 </table>
