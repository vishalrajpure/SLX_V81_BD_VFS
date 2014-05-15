<%@ Control Language="C#" ClassName="QualifierSMpincode" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
 <div class=" lbl alignleft">
   <asp:Label ID="luePincode_lbl" AssociatedControlID="luePincode" runat="server" Text="<%$ resources: luePincode.Caption %>" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup"   >
<SalesLogix:LookupControl runat="server" ID="luePincode" LookupEntityName="Vwpincodemaster" LookupEntityTypeName="Sage.Entity.Interfaces.IVwpincodemaster, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luePincode.LookupProperties.Carea.PropertyHeader %>" PropertyName="Carea" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luePincode.LookupProperties.Cpincode.PropertyHeader %>" PropertyName="Cpincode" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luePincode.LookupProperties.Cpindesc.PropertyHeader %>" PropertyName="Cpindesc" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
  </div>

      </td>
                <td></td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="luequalifier_lbl" AssociatedControlID="luequalifier" runat="server" Text="<%$ resources: luequalifier.Caption %>" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup"   >
<SalesLogix:LookupControl runat="server" ID="luequalifier" LookupEntityName="UserInfo" LookupEntityTypeName="Sage.Entity.Interfaces.IUserInfo, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luequalifier.LookupProperties.FirstName.PropertyHeader %>" PropertyName="FirstName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luequalifier.LookupProperties.LastName.PropertyHeader %>" PropertyName="LastName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luequalifier.LookupProperties.Department.PropertyHeader %>" PropertyName="Department" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luequalifier.LookupProperties.Division.PropertyHeader %>" PropertyName="Division" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: luequalifier.LookupProperties.Email.PropertyHeader %>" PropertyName="Email" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
  </div>

      </td>
                <td></td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="lueSaleManager_lbl" AssociatedControlID="lueSaleManager" runat="server" Text="<%$ resources: lueSaleManager.Caption %>" ></asp:Label>
 </div>   
  <div   class="textcontrol lookup"   >
<SalesLogix:LookupControl runat="server" ID="lueSaleManager" LookupEntityName="UserInfo" LookupEntityTypeName="Sage.Entity.Interfaces.IUserInfo, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupBindingMode="String"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueSaleManager.LookupProperties.FirstName.PropertyHeader %>" PropertyName="FirstName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueSaleManager.LookupProperties.LastName.PropertyHeader %>" PropertyName="LastName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueSaleManager.LookupProperties.Department.PropertyHeader %>" PropertyName="Department" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueSaleManager.LookupProperties.Division.PropertyHeader %>" PropertyName="Division" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueSaleManager.LookupProperties.Email.PropertyHeader %>" PropertyName="Email" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
  </div>

      </td>
                <td></td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="QualifierSMpincode_RTools" ToolbarLocation="right">
   <SalesLogix:GroupNavigator runat="server" ID="grupnavqualifierBM" ></SalesLogix:GroupNavigator>
    <asp:ImageButton runat="server" ID="QFButton"
 ToolTip="<%$ resources: QFButton.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16"  />
 
    <asp:ImageButton runat="server" ID="btndelete"
 ToolTip="<%$ resources: btndelete.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Delete_16x16" 
 />
 
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=QualifierSMpincode&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkQualifierSMpincodeHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="QualifierSMpincode" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IQualifierAndSMpincode); }
}

 

protected override void OnAddEntityBindings() {
                 // luePincode.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding luePincodeLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("PincodeId", luePincode, "LookupResultValue");
        BindingSource.Bindings.Add(luePincodeLookupResultValueBinding);
                    // luequalifier.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding luequalifierLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("QualifierId", luequalifier, "LookupResultValue");
        BindingSource.Bindings.Add(luequalifierLookupResultValueBinding);
                    // lueSaleManager.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding lueSaleManagerLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("SalesManagerId", lueSaleManager, "LookupResultValue");
        BindingSource.Bindings.Add(lueSaleManagerLookupResultValueBinding);
    
   
            }
                     
protected void QFButton_ClickAction(object sender, EventArgs e) {
Sage.Entity.Interfaces.IQualifierAndSMpincode Objqualifier = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.IQualifierAndSMpincode>();
if (Objqualifier != null)
{
    if (Convert.ToString(luePincode.LookupResultValue) == "")
    {
        DialogService.ShowMessage("Please Select Pincode");
        return;
    }
    if (Convert.ToString(luequalifier.LookupResultValue) == "")
    {
        DialogService.ShowMessage("Please Select Qualifier");
        return;
    }
    if (Convert.ToString(lueSaleManager.LookupResultValue) == "")
    {
        DialogService.ShowMessage("Please Select Branch Manager");
        return;
    }
    else
    {
        Objqualifier.PincodeId = luePincode.LookupResultValue.ToString();            
        Objqualifier.QualifierId = luequalifier.LookupResultValue.ToString();
        Objqualifier.SalesManagerId = lueSaleManager.LookupResultValue.ToString();
        Objqualifier.Save();
        Response.Redirect(string.Format("QualifierAndSMpincode.aspx?entityId={0}", (Objqualifier.Id.ToString())));            
    }
}

}
protected void btndelete_ClickAction(object sender, EventArgs e) {
  Sage.Platform.Orm.Interfaces.IPersistentEntity persistentEntity = this.BindingSource.Current as Sage.Platform.Orm.Interfaces.IPersistentEntity;
  if (persistentEntity != null) {
    persistentEntity.Delete();
  }

  
}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 QFButton.Click += new ImageClickEventHandler(QFButton_ClickAction);
btndelete.Click += new ImageClickEventHandler(btndelete_ClickAction);


}

protected void quickformload0(object sender, EventArgs e) {
luePincode_lbl.ForeColor = System.Drawing.Color.Red;
luequalifier_lbl.ForeColor = System.Drawing.Color.Red;
lueSaleManager_lbl.ForeColor = System.Drawing.Color.Red;

}
private bool _runActivating;
protected override void OnActivating()
{
_runActivating = true;
}
private void DoActivating()
{
quickformload0(this, EventArgs.Empty);

}
protected override void OnFormBound()
{
Sage.Platform.WebPortal.EntityPage epage = Page as Sage.Platform.WebPortal.EntityPage;
        if (epage != null)
            _runActivating = (epage.IsNewEntity || _runActivating);
if (_runActivating) DoActivating();
btndelete.OnClientClick = string.Format("return confirm('{0}');", Sage.Platform.WebPortal.PortalUtil.JavaScriptEncode(GetLocalResourceObject("btndelete.ActionConfirmationMessage").ToString()));

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}


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
    get { return _formAdapter ?? (_formAdapter = new QualifierSMpincodeAdapter(this)); }
}

public class QualifierSMpincodeAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IQualifierSMpincode
{
    public QualifierSMpincodeAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ILookupControl _luePincode;
    public  Sage.Platform.Controls.ILookupControl luePincode
    {
        get { return FindControl(ref _luePincode, "luePincode"); }
    }
    private Sage.Platform.Controls.ILookupControl _luequalifier;
    public  Sage.Platform.Controls.ILookupControl luequalifier
    {
        get { return FindControl(ref _luequalifier, "luequalifier"); }
    }
    private Sage.Platform.Controls.ILookupControl _lueSaleManager;
    public  Sage.Platform.Controls.ILookupControl lueSaleManager
    {
        get { return FindControl(ref _lueSaleManager, "lueSaleManager"); }
    }
    private Sage.Platform.Controls.IGroupNavigatorControl _grupnavqualifierBM;
    public  Sage.Platform.Controls.IGroupNavigatorControl grupnavqualifierBM
    {
        get { return FindControl(ref _grupnavqualifierBM, "grupnavqualifierBM"); }
    }
    private Sage.Platform.Controls.IButtonControl _QFButton;
    public  Sage.Platform.Controls.IButtonControl QFButton
    {
        get { return FindControl(ref _QFButton, "QFButton"); }
    }
    private Sage.Platform.Controls.IButtonControl _btndelete;
    public  Sage.Platform.Controls.IButtonControl btndelete
    {
        get { return FindControl(ref _btndelete, "btndelete"); }
    }

}

</script>

<script type="text/javascript">
</script>
