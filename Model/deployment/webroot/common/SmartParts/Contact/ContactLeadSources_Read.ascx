<%@ Control Language="C#" ClassName="ContactLeadSources_Read" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
  <SalesLogix:SlxGridView runat="server" ID="grdContactLeadSources" GridLines="None"
AutoGenerateColumns="false" CellPadding="4" CssClass="datagrid" PagerStyle-CssClass="gridPager"
AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt" SelectedRowStyle-CssClass="rowSelected" ShowEmptyTable="true" EnableViewState="false"
 ExpandableRows="True" ResizableColumns="True" >
<Columns>
   <asp:BoundField DataField="LeadSource.SourceDate"
      HeaderText="<%$ resources: grdContactLeadSources.7f8cfa8b-b263-45f3-9c89-92025299f8bd.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="LeadSource.Description"
      HeaderText="<%$ resources: grdContactLeadSources.c3788dda-76e8-4648-963a-22c43814443f.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="LeadSource.AbbrevDescription"
      HeaderText="<%$ resources: grdContactLeadSources.0f2e4ff6-de1a-428a-bff0-100954e03f0b.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="LeadSource.SourceDate"
      HeaderText="<%$ resources: grdContactLeadSources.340357e6-c80e-48fd-881f-6cee46bff184.ColumnHeading %>"          >
      </asp:BoundField>
 </Columns>
</SalesLogix:SlxGridView>

<script runat="server" type="text/C#">


</script>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="ContactLeadSources_Read_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=ContactLeadSources_Read&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkContactLeadSources_ReadHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="ContactLeadSources_Read" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dsContactLeadSources;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dsContactLeadSources
{ 
  get 
  {
    if (_dsContactLeadSources == null)
    {
             _dsContactLeadSources = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.IContactLeadSource), 
	    EntityType              ,"LeadSources", System.Reflection.MemberTypes.Property);
                   _dsContactLeadSources.UseSmartQuery = true;
      	   	}
 	return _dsContactLeadSources;
  }
}

void dsContactLeadSources_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dsContactLeadSources.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dsContactLeadSources);
   }
}

 



 

protected override void OnAddEntityBindings() {
       dsContactLeadSources.Bindings.Add(new Sage.Platform.WebPortal.Binding.WebEntityListBinding("LeadSources", grdContactLeadSources ));
   dsContactLeadSources.BindFieldNames = new String[] { "LeadsourceId","LeadSource.SourceDate","LeadDate","LeadSource.Description","LeadSource","LeadSource.AbbrevDescription" };
     
     BindingSource.OnCurrentEntitySet += new EventHandler(dsContactLeadSources_OnCurrentEntitySet);
    
}
       

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 
}

protected override void OnFormBound()
{
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dsContactLeadSources.SourceObject == null) { dsContactLeadSources.SourceObject = BindingSource.Current; }
if (dsContactLeadSources.SourceObject == null) { RegisterBindingsWithClient(dsContactLeadSources); }
dsContactLeadSources.Bind();



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
    get { return _formAdapter ?? (_formAdapter = new ContactLeadSources_ReadAdapter(this)); }
}

public class ContactLeadSources_ReadAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IContactLeadSources_Read
{
    public ContactLeadSources_ReadAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataGridControl _grdContactLeadSources;
    public  Sage.Platform.Controls.IDataGridControl grdContactLeadSources
    {
        get { return FindControl(ref _grdContactLeadSources, "grdContactLeadSources"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dsContactLeadSources;
    public  Sage.Platform.Controls.IDataSourceControl dsContactLeadSources
    {
        get { return FindControl(ref _dsContactLeadSources, "dsContactLeadSources"); }
    }

}

</script>

<script type="text/javascript">
</script>
