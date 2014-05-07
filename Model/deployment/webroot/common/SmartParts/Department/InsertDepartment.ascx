<%@ Control Language="C#" ClassName="InsertDepartment" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
         <col width="52%" />
            <col width="48%" />
     <tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="OwnerDescription_lbl" AssociatedControlID="OwnerDescription" runat="server" Text="<%$ resources: OwnerDescription.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="OwnerDescription"  dojoType="Sage.UI.Controls.TextBox"  />
  </div>

      </td>
                <td></td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="securityProfileLookup_lbl" AssociatedControlID="securityProfileLookup" runat="server" Text="<%$ resources: securityProfileLookup.Caption %>" ></asp:Label>
 </div>   
  <div    >
<SalesLogix:LookupControl runat="server" ID="securityProfileLookup" LookupEntityName="OwnerSecurityProfile" LookupEntityTypeName="Sage.Entity.Interfaces.IOwnerSecurityProfile, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupDisplayMode="DropDownList" Required="true" AddEmptyListItem="false" CssClass="width: 98%" DialogTitle="<%$ resources: securityProfileLookup.LookupDialogTitle %>"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: securityProfileLookup.LookupProperties.ProfileDescription.PropertyHeader %>" PropertyName="ProfileDescription" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
  </div>
 

      </td>
                <td></td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="InsertDepartment_RTools" ToolbarLocation="right">
    <asp:ImageButton runat="server" ID="SaveButton"
 ToolTip="<%$ resources: SaveButton.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16"  />
   
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=InsertDepartment&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkInsertDepartmentHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="InsertDepartment" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IDepartment); }
}

 

protected override void OnAddEntityBindings() {
       
   
    }
              
protected void SaveButton_ClickAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("InsertDepartment.SaveButton_OnClick", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 SaveButton.Click += new ImageClickEventHandler(SaveButton_ClickAction);


}

protected void quickformload0(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("InsertDepartment.OnLoad1", methodArgs);

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
ClientBindingMgr.RegisterBoundControl(securityProfileLookup);

ClientBindingMgr.RegisterSaveButton(SaveButton);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
ClientBindingMgr.SetFocusTo(OwnerDescription);


}



public override Sage.Platform.Application.UI.ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
{
    ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        if (BindingSource != null)
    {
        if (BindingSource.Current != null)
        {
            tinfo.Description = BindingSource.Current.ToString();
            tinfo.Title = BindingSource.Current.ToString();
        }
    }
    
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
    get { return _formAdapter ?? (_formAdapter = new InsertDepartmentAdapter(this)); }
}

public class InsertDepartmentAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IInsertDepartment
{
    public InsertDepartmentAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _OwnerDescription;
    public  Sage.Platform.Controls.ITextBoxControl OwnerDescription
    {
        get { return FindControl(ref _OwnerDescription, "OwnerDescription"); }
    }
    private Sage.Platform.Controls.ILookupControl _securityProfileLookup;
    public  Sage.Platform.Controls.ILookupControl securityProfileLookup
    {
        get { return FindControl(ref _securityProfileLookup, "securityProfileLookup"); }
    }
    private Sage.Platform.Controls.IButtonControl _SaveButton;
    public  Sage.Platform.Controls.IButtonControl SaveButton
    {
        get { return FindControl(ref _SaveButton, "SaveButton"); }
    }

    public  void OnLoad1(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("InsertDepartment.OnLoad1", methodArgs);
    }
    public  void SaveButton_OnClick(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("InsertDepartment.SaveButton_OnClick", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>