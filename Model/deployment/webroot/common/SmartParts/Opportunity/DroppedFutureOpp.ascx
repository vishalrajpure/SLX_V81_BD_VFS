<%@ Control Language="C#" ClassName="DroppedFutureOpp" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
         <col width="100%" />
     <tr>
            <td rowspan="2"  colspan="2" >
 <div class="twocollbl alignleft" >
   <asp:Label ID="txtComments_lbl" AssociatedControlID="txtComments" runat="server" Text="<%$ resources: txtComments.Caption %>" ></asp:Label>
 </div>
  <div  class="twocoltextcontrol"   >
<asp:TextBox runat="server" ID="txtComments" Required="true"  dojoType="Sage.UI.Controls.TextBox" MaxLength="2147483647"  />
  </div>

      </td>
      </tr>
<tr>
        </tr>
<tr>
            <td  >
<asp:Panel runat="server" ID="QFControlsList" CssClass="controlslist "
>
   <asp:Button runat="server" ID="btnOk"
 Text="<%$ resources: btnOk.Caption %>"  />
   
   <asp:Button runat="server" ID="btnCancel"
 Text="<%$ resources: btnCancel.Caption %>"  />
 
</asp:Panel>
      </td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="DroppedFutureOpp_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=DroppedFutureOpp&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkDroppedFutureOppHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="DroppedFutureOpp" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IOpportunity); }
}

 

protected override void OnAddEntityBindings() {
                 // txtComments.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtCommentsTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Notes", txtComments, "Text");
        BindingSource.Bindings.Add(txtCommentsTextBinding);
             
   
}
                            
protected void btnOk_ClickAction(object sender, EventArgs e) {
  Sage.Entity.Interfaces.IOpportunity _entity = BindingSource.Current as Sage.Entity.Interfaces.IOpportunity;
  if (_entity != null)
  {
    object _parent = GetParentEntity();
    if (DialogService.ChildInsertInfo != null)
    {
        if (_parent != null)
        {
            if (DialogService.ChildInsertInfo.ParentReferenceProperty != null)
            {
                DialogService.ChildInsertInfo.ParentReferenceProperty.SetValue(_entity, _parent, null);
            }
        }
    }
    bool shouldSave = true;
    Sage.Platform.WebPortal.EntityPage page = Page as Sage.Platform.WebPortal.EntityPage;
    if (page != null)
    {
        if(IsInDialog() && page.ModeId.ToUpper() == "INSERT")
        {
            shouldSave = false;
        }
    }

    if(shouldSave)
    {
       _entity.Save();
    }

    if (_parent != null)
    {
        if (DialogService.ChildInsertInfo != null)
        {
           if (DialogService.ChildInsertInfo.ParentsCollectionProperty != null)
           {
              System.Reflection.MethodInfo _add = DialogService.ChildInsertInfo.ParentsCollectionProperty.PropertyType.GetMethod("Add");
              _add.Invoke(DialogService.ChildInsertInfo.ParentsCollectionProperty.GetValue(_parent, null), new object[] { _entity });
           }
        }
     }
  }

      		        btnOk_ClickActionBRC(sender, e);
    
  
}
protected void btnOk_ClickActionBRC(object sender, EventArgs e) {
Sage.Entity.Interfaces.IOpportunity opp = BindingSource.Current as Sage.Entity.Interfaces.IOpportunity;
System.Web.HttpContext.Current.Response.Redirect(string.Format("Opportunity.aspx?modeid=Detail&entityid=" + opp.Id.ToString()));

}
protected void btnCancel_ClickAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("DroppedFutureOpp.btnCancel_OnClick", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 btnOk.Click += new EventHandler(btnOk_ClickAction);
btnOk.Click += new EventHandler(DialogService.CloseEventHappened);
btnOk.Click += new EventHandler(Refresh);
btnCancel.Click += new EventHandler(btnCancel_ClickAction);
btnCancel.Click += new EventHandler(DialogService.CloseEventHappened);


}

protected void quickformload0(object sender, EventArgs e) {
this.txtComments.TextMode = TextBoxMode.MultiLine;
this.txtComments.Height =  100;

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
ClientBindingMgr.RegisterSaveButton(btnOk);

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
    get { return _formAdapter ?? (_formAdapter = new DroppedFutureOppAdapter(this)); }
}

public class DroppedFutureOppAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IDroppedFutureOpp
{
    public DroppedFutureOppAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _txtComments;
    public  Sage.Platform.Controls.ITextBoxControl txtComments
    {
        get { return FindControl(ref _txtComments, "txtComments"); }
    }
    private Sage.Platform.Controls.IControlsListControl _QFControlsList;
    public  Sage.Platform.Controls.IControlsListControl QFControlsList
    {
        get { return FindControl(ref _QFControlsList, "QFControlsList"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnOk;
    public  Sage.Platform.Controls.IButtonControl btnOk
    {
        get { return FindControl(ref _btnOk, "btnOk"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnCancel;
    public  Sage.Platform.Controls.IButtonControl btnCancel
    {
        get { return FindControl(ref _btnCancel, "btnCancel"); }
    }

    public  void btnCancel_OnClick(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("DroppedFutureOpp.btnCancel_OnClick", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
