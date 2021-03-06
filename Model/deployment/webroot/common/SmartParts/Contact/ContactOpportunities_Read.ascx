<%@ Control Language="C#" ClassName="ContactOpportunities_Read" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
  <SalesLogix:SlxGridView runat="server" ID="grdOpportunityContacts" GridLines="None"
AutoGenerateColumns="false" CellPadding="4" CssClass="datagrid" PagerStyle-CssClass="gridPager"
AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt" SelectedRowStyle-CssClass="rowSelected" ShowEmptyTable="true" EnableViewState="false"
 ExpandableRows="True" ResizableColumns="True" >
<Columns>
   <asp:BoundField DataField="Opportunity.Description"
      HeaderText="<%$ resources: grdOpportunityContacts.0f3c1ab8-8cf6-47b8-8a69-a051192e92b5.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Opportunity.Status"
      HeaderText="<%$ resources: grdOpportunityContacts.bcffeb84-6140-4be6-9557-f1c30e0531eb.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Opportunity.EstimatedClose"
      HeaderText="<%$ resources: grdOpportunityContacts.c424ec14-a33b-407c-97f2-9f29a17e32f4.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Opportunity.SalesPotential"
      HeaderText="<%$ resources: grdOpportunityContacts.6585ddbb-1a65-4bd4-a0f8-2ccc99634aca.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Opportunity.CloseProbability"
      HeaderText="<%$ resources: grdOpportunityContacts.697f3d7e-9fec-44fa-83a3-05bb6c2f8acf.ColumnHeading %>"          >
      </asp:BoundField>
 </Columns>
</SalesLogix:SlxGridView>

<script runat="server" type="text/C#">


</script>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="ContactOpportunities_Read_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=ContactOpportunities_Read&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkContactOpportunities_ReadHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="ContactOpportunities_Read" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dsOpportunityContacts;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dsOpportunityContacts
{ 
  get 
  {
    if (_dsOpportunityContacts == null)
    {
             _dsOpportunityContacts = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.IOpportunityContact), 
	    EntityType              ,"Opportunities", System.Reflection.MemberTypes.Property);
                   _dsOpportunityContacts.UseSmartQuery = true;
      	   	}
 	return _dsOpportunityContacts;
  }
}

void dsOpportunityContacts_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dsOpportunityContacts.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dsOpportunityContacts);
   }
}

 



 

protected override void OnAddEntityBindings() {
       dsOpportunityContacts.Bindings.Add(new Sage.Platform.WebPortal.Binding.WebEntityListBinding("Opportunities", grdOpportunityContacts ));
   dsOpportunityContacts.BindFieldNames = new String[] { "Id","Opportunity.Description","Opportunity.Status","Opportunity.EstimatedClose","Opportunity.SalesPotential","Opportunity.CloseProbability" };
     
     BindingSource.OnCurrentEntitySet += new EventHandler(dsOpportunityContacts_OnCurrentEntitySet);
    
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
if (dsOpportunityContacts.SourceObject == null) { dsOpportunityContacts.SourceObject = BindingSource.Current; }
if (dsOpportunityContacts.SourceObject == null) { RegisterBindingsWithClient(dsOpportunityContacts); }
dsOpportunityContacts.Bind();



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
    get { return _formAdapter ?? (_formAdapter = new ContactOpportunities_ReadAdapter(this)); }
}

public class ContactOpportunities_ReadAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IContactOpportunities_Read
{
    public ContactOpportunities_ReadAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataGridControl _grdOpportunityContacts;
    public  Sage.Platform.Controls.IDataGridControl grdOpportunityContacts
    {
        get { return FindControl(ref _grdOpportunityContacts, "grdOpportunityContacts"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dsOpportunityContacts;
    public  Sage.Platform.Controls.IDataSourceControl dsOpportunityContacts
    {
        get { return FindControl(ref _dsOpportunityContacts, "dsOpportunityContacts"); }
    }

}

</script>

<script type="text/javascript">
</script>
