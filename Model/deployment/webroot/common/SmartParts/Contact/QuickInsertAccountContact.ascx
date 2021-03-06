<%@ Control Language="C#" ClassName="QuickInsertAccountContact" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
<%@ Register Assembly="Sage.SalesLogix.Client.GroupBuilder" Namespace="Sage.SalesLogix.Client.GroupBuilder" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Timeline" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.SmartParts" TagPrefix="SalesLogix" %>

<%//------------------------------------------------------------------------
//This file was generated by a tool.  Changes to this file may cause incorrect behavior and will be lost if the code is regenerated.
//------------------------------------------------------------------------ %>
<table border="0" cellpadding="1" cellspacing="0" class="formtable">
         <col width="50%" />
            <col width="50%" />
     <tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtAccount_lbl" AssociatedControlID="txtAccount" runat="server" Text="<%$ resources: txtAccount.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtAccount"  dojoType="Sage.UI.Controls.TextBox"  />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="nameContact_lbl" AssociatedControlID="nameContact" runat="server" Text="<%$ resources: nameContact.Caption %>" ></asp:Label>
 </div>
   <div  class="textcontrol"  >
    <SalesLogix:FullName runat="server" ID="nameContact"  />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="pklType_lbl" AssociatedControlID="pklType" runat="server" Text="<%$ resources: pklType.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol picklist"  > 
    <SalesLogix:PickListControl runat="server" ID="pklType" PickListName="Account Type" MustExistInList="false"  />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="pklTitle_lbl" AssociatedControlID="pklTitle" runat="server" Text="<%$ resources: pklTitle.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol picklist"  > 
    <SalesLogix:PickListControl runat="server" ID="pklTitle" PickListName="Title" MustExistInList="false"  />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="phAccountMain_lbl" AssociatedControlID="phAccountMain" runat="server" Text="<%$ resources: phAccountMain.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol phone"  > 
    <SalesLogix:Phone runat="server" ID="phAccountMain"
 />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="pContactMain_lbl" AssociatedControlID="pContactMain" runat="server" Text="<%$ resources: pContactMain.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol phone"  > 
    <SalesLogix:Phone runat="server" ID="pContactMain"
 />
  </div>

      </td>
      </tr>
<tr>
            <td rowspan="2"  >
 <div class=" lbl alignleft">
   <asp:Label ID="addressMain_lbl" AssociatedControlID="addressMain" runat="server" Text="<%$ resources: addressMain.Caption %>" ></asp:Label>
 </div>
   <div  class="textcontrol address"  >
    <SalesLogix:AddressControl runat="server" ID="addressMain" AddressDescriptionPickListName="Address Description (Account)" AddressDescriptionPickListId="kSYST0000014"  ToolTip="<%$ resources: addressMain.ToolTip %>" IsPrimaryVisible="false" IsMailingVisible="false" >
<AddressDescStyle Height="80"></AddressDescStyle> </SalesLogix:AddressControl>
</div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="phMoble_lbl" AssociatedControlID="phMoble" runat="server" Text="<%$ resources: phMoble.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol phone"  > 
    <SalesLogix:Phone runat="server" ID="phMoble"
 />
  </div>

      </td>
      </tr>
<tr>
                  <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="email_lbl" AssociatedControlID="email" runat="server" Text="<%$ resources: email.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol"  > 
<SalesLogix:Email runat="server" ID="email" EmailTextBoxStyle-ForeColor="#000099" EmailTextBoxStyle-Font-Underline="false" />
  </div>

      </td>
      </tr>
<tr>
            <td></td>
                <td  >
<asp:Panel runat="server" ID="QFControlsList" CssClass="controlslist qfActionContainer"
>
   <asp:Button runat="server" ID="btnOK"
 Text="<%$ resources: btnOK.Caption %>" CssClass="slxbutton"  />
   
   <asp:Button runat="server" ID="btnCancel"
 Text="<%$ resources: btnCancel.Caption %>" CssClass="slxbutton"  />
 
</asp:Panel>
      </td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="QuickInsertAccountContact_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=QuickInsertAccountContact&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkQuickInsertAccountContactHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="QuickInsertAccountContact" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
 </SalesLogix:SmartPartToolsContainer>



<script runat="server" type="text/C#">
/// <summary>
/// Gets or sets the role security service.
/// </summary>
/// <value>The role security service.</value>
[Sage.Platform.Application.ServiceDependency]
public Sage.Platform.Security.IRoleSecurityService RoleSecurityService { get; set; }

public override Type EntityType
{
    get { return typeof(Sage.Entity.Interfaces.IContact); }
}

 

protected override void OnAddEntityBindings() {
                 // txtAccount.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtAccountTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Account.AccountName", txtAccount, "Text");
        BindingSource.Bindings.Add(txtAccountTextBinding);
                    // nameContact.NameFirst Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding nameContactNameFirstBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("FirstName", nameContact, "NameFirst");
        BindingSource.Bindings.Add(nameContactNameFirstBinding);
                 // nameContact.NameLast Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding nameContactNameLastBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("LastName", nameContact, "NameLast");
        nameContactNameLastBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(nameContactNameLastBinding);
                 // nameContact.NameMiddle Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding nameContactNameMiddleBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("MiddleName", nameContact, "NameMiddle");
        nameContactNameMiddleBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(nameContactNameMiddleBinding);
                 // nameContact.NamePrefix Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding nameContactNamePrefixBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Prefix", nameContact, "NamePrefix");
        nameContactNamePrefixBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(nameContactNamePrefixBinding);
                 // nameContact.NameSuffix Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding nameContactNameSuffixBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Suffix", nameContact, "NameSuffix");
        nameContactNameSuffixBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(nameContactNameSuffixBinding);
                    // pklType.PickListValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding pklTypePickListValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Account.Type", pklType, "PickListValue");
        BindingSource.Bindings.Add(pklTypePickListValueBinding);
                    // pklTitle.PickListValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding pklTitlePickListValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Title", pklTitle, "PickListValue");
        BindingSource.Bindings.Add(pklTitlePickListValueBinding);
                    // phAccountMain.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding phAccountMainTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Account.MainPhone", phAccountMain, "Text");
        BindingSource.Bindings.Add(phAccountMainTextBinding);
                    // pContactMain.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding pContactMainTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("WorkPhone", pContactMain, "Text");
        BindingSource.Bindings.Add(pContactMainTextBinding);
                    // addressMain.AddressCity Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressCityBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.City", addressMain, "AddressCity");
        addressMainAddressCityBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressCityBinding);
                 // addressMain.AddressCountry Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressCountryBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.Country", addressMain, "AddressCountry");
        addressMainAddressCountryBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressCountryBinding);
                 // addressMain.AddressCounty Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressCountyBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.County", addressMain, "AddressCounty");
        addressMainAddressCountyBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressCountyBinding);
                 // addressMain.AddressDesc1 Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressDesc1Binding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.Address1", addressMain, "AddressDesc1");
        BindingSource.Bindings.Add(addressMainAddressDesc1Binding);
                 // addressMain.AddressDesc2 Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressDesc2Binding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.Address2", addressMain, "AddressDesc2");
        addressMainAddressDesc2Binding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressDesc2Binding);
                 // addressMain.AddressDesc3 Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressDesc3Binding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.Address3", addressMain, "AddressDesc3");
        addressMainAddressDesc3Binding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressDesc3Binding);
                 // addressMain.AddressDescription Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressDescriptionBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.Description", addressMain, "AddressDescription");
        addressMainAddressDescriptionBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressDescriptionBinding);
                 // addressMain.AddressPostalCode Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressPostalCodeBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.PostalCode", addressMain, "AddressPostalCode");
        addressMainAddressPostalCodeBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressPostalCodeBinding);
                 // addressMain.AddressState Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressStateBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.State", addressMain, "AddressState");
        addressMainAddressStateBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressStateBinding);
                 // addressMain.AddressType Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainAddressTypeBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.AddressType", addressMain, "AddressType");
        addressMainAddressTypeBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainAddressTypeBinding);
                 // addressMain.PrimaryAddress Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding addressMainPrimaryAddressBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Address.PrimaryAddress", addressMain, "PrimaryAddress");
        addressMainPrimaryAddressBinding.IgnoreFLSDisabling = true;
        BindingSource.Bindings.Add(addressMainPrimaryAddressBinding);
                    // phMoble.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding phMobleTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Mobile", phMoble, "Text");
        BindingSource.Bindings.Add(phMobleTextBinding);
                    // email.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding emailTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Email", email, "Text");
        BindingSource.Bindings.Add(emailTextBinding);
             
   
}
                                                                                    
protected void btnOK_ClickAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("QuickInsertAccountContact.btnOK_OnClick", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 btnOK.Click += new EventHandler(btnOK_ClickAction);
btnOK.Click += new EventHandler(DialogService.CloseEventHappened);
btnOK.Click += new EventHandler(Refresh);
btnCancel.Click += new EventHandler(DialogService.CloseEventHappened);


}

protected override void OnFormBound()
{
ClientBindingMgr.RegisterSaveButton(btnOK);

ScriptManager.RegisterStartupScript(Page, GetType(), "cleanupcontainer", "jQuery(\".controlslist > div:empty\").remove();", true);
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
ClientBindingMgr.RegisterDialogCancelButton(btnCancel);


}



public override Sage.Platform.Application.UI.ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
{
    ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
    
    foreach (Control c in Controls)
    {
        SmartPartToolsContainer cont = c as SmartPartToolsContainer;
        if (cont != null)
        {
            switch (cont.ToolbarLocation)
            {
                case SmartPartToolsLocation.Right:
                    foreach (Control tool in cont.Controls)
                    {
                                            tinfo.RightTools.Add(tool);
                                        }
                    break;
                case SmartPartToolsLocation.Center:
                    foreach (Control tool in cont.Controls)
                    {
                        tinfo.CenterTools.Add(tool);
                    }
                    break;
                case SmartPartToolsLocation.Left:
                    foreach (Control tool in cont.Controls)
                    {
                        tinfo.LeftTools.Add(tool);
                    }
                    break;
            }
        }
    }

        return tinfo;
}

private Sage.Platform.Controls.IEntityForm _formAdapter;

public Sage.Platform.Controls.IEntityForm FormAdapter
{
    get { return _formAdapter ?? (_formAdapter = new QuickInsertAccountContactAdapter(this)); }
}

public class QuickInsertAccountContactAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IQuickInsertAccountContact
{
    public QuickInsertAccountContactAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _txtAccount;
    public  Sage.Platform.Controls.ITextBoxControl txtAccount
    {
        get { return FindControl(ref _txtAccount, "txtAccount"); }
    }
    private Sage.Platform.Controls.IPickListControl _pklType;
    public  Sage.Platform.Controls.IPickListControl pklType
    {
        get { return FindControl(ref _pklType, "pklType"); }
    }
    private Sage.Platform.Controls.IPhoneControl _phAccountMain;
    public  Sage.Platform.Controls.IPhoneControl phAccountMain
    {
        get { return FindControl(ref _phAccountMain, "phAccountMain"); }
    }
    private Sage.Platform.Controls.IAddressControl _addressMain;
    public  Sage.Platform.Controls.IAddressControl addressMain
    {
        get { return FindControl(ref _addressMain, "addressMain"); }
    }
    private Sage.Platform.Controls.IPersonNameControl _nameContact;
    public  Sage.Platform.Controls.IPersonNameControl nameContact
    {
        get { return FindControl(ref _nameContact, "nameContact"); }
    }
    private Sage.Platform.Controls.IPickListControl _pklTitle;
    public  Sage.Platform.Controls.IPickListControl pklTitle
    {
        get { return FindControl(ref _pklTitle, "pklTitle"); }
    }
    private Sage.Platform.Controls.IPhoneControl _pContactMain;
    public  Sage.Platform.Controls.IPhoneControl pContactMain
    {
        get { return FindControl(ref _pContactMain, "pContactMain"); }
    }
    private Sage.Platform.Controls.IPhoneControl _phMoble;
    public  Sage.Platform.Controls.IPhoneControl phMoble
    {
        get { return FindControl(ref _phMoble, "phMoble"); }
    }
    private Sage.Platform.Controls.IEmailControl _email;
    public  Sage.Platform.Controls.IEmailControl email
    {
        get { return FindControl(ref _email, "email"); }
    }
    private Sage.Platform.Controls.IControlsListControl _QFControlsList;
    public  Sage.Platform.Controls.IControlsListControl QFControlsList
    {
        get { return FindControl(ref _QFControlsList, "QFControlsList"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnOK;
    public  Sage.Platform.Controls.IButtonControl btnOK
    {
        get { return FindControl(ref _btnOK, "btnOK"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnCancel;
    public  Sage.Platform.Controls.IButtonControl btnCancel
    {
        get { return FindControl(ref _btnCancel, "btnCancel"); }
    }

    public  void btnOK_OnClick(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("QuickInsertAccountContact.btnOK_OnClick", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
