<%@ Control Language="C#" ClassName="OpportunityCompetitors" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
  <SalesLogix:SlxGridView runat="server" ID="grdOppCompetitors" GridLines="None"
AutoGenerateColumns="false" CellPadding="4" CssClass="datagrid" PagerStyle-CssClass="gridPager"
AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt" SelectedRowStyle-CssClass="rowSelected" ShowEmptyTable="true" EnableViewState="false"
 AllowPaging="true" PageSize="10" OnPageIndexChanging="grdOppCompetitorspage_changing" EmptyTableRowText="<%$ resources: grdOppCompetitors.EmptyTableRowText %>"  ExpandableRows="True" ResizableColumns="True"  OnRowCommand="grdOppCompetitors_RowCommand"
 DataKeyNames="InstanceId,OpportunityId,CompetitorId"
 AllowSorting="true" OnSorting="grdOppCompetitors_Sorting"  OnRowEditing="grdOppCompetitors_RowEditing"  OnRowDeleting="grdOppCompetitors_RowDeleting" OnRowDataBound="grdOppCompetitors_RowDataBound"  ShowSortIcon="true" >
<Columns>
   <asp:BoundField DataField="Competitor.CompetitorName"
      HeaderText="<%$ resources: grdOppCompetitors.dee29184-964d-4b80-9665-c6588f28be58.ColumnHeading %>"       SortExpression="Competitor.CompetitorName"    >
      </asp:BoundField>
    <asp:BoundField DataField="Rating"
      HeaderText="<%$ resources: grdOppCompetitors.387ab373-6251-4066-a6a4-f62e43f6c507.ColumnHeading %>"       SortExpression="Rating"    >
      </asp:BoundField>
    <asp:BoundField DataField="Weaknesses"
      HeaderText="<%$ resources: grdOppCompetitors.91df61c9-bfa0-4b34-b33f-d9bcfbfb0903.ColumnHeading %>"       SortExpression="Weaknesses"    >
      </asp:BoundField>
    <asp:CheckBoxField DataField="CurrentMajorCompetitor" ReadOnly="True"
      HeaderText="<%$ resources: grdOppCompetitors.ce453213-3bc0-42a0-8545-26a9ad5985f5.ColumnHeading %>"        >
          </asp:CheckBoxField>
    <asp:TemplateField   HeaderText="<%$ resources: grdOppCompetitors.e5c5aa99-5983-4577-b38a-47283aea5089.ColumnHeading %>"        >
    <itemtemplate>
 <SalesLogix:Currency runat="server" ID="grdOppCompetitorscol5" DisplayMode="AsText"  ExchangeRateType="BaseRate"   Text='<%#  dtsOppCompetitors.getPropertyValue(Container.DataItem, "CompetitorRate")  %>' CssClass=""  DecimalDigits="2"  />
   </itemtemplate></asp:TemplateField>
    <asp:BoundField DataField="CompetitorShareOfWellet"
      HeaderText="<%$ resources: grdOppCompetitors.8b2a3dea-a970-474d-b3d0-8d51563bd14a.ColumnHeading %>"          >
      </asp:BoundField>
  <asp:ButtonField CommandName="Edit"
  Text="<%$ resources: grdOppCompetitors.47b79b74-6484-4b2b-94fd-978b86cd3bc2.Text %>"               >
          </asp:ButtonField>
      
     <asp:ButtonField CommandName="Delete"
  Text="<%$ resources: grdOppCompetitors.e1e41ffc-1494-4188-bcc8-83cf568985dc.Text %>"                >
          </asp:ButtonField>
      
   </Columns>
    <PagerSettings Mode="NumericFirstLast" FirstPageImageUrl="ImageResource.axd?scope=global&type=Global_Images&key=Start_16x16" LastPageImageUrl="ImageResource.axd?scope=global&type=Global_Images&key=End_16x16" />
</SalesLogix:SlxGridView>

<script runat="server" type="text/C#">

                        private int _grdOppCompetitorsdeleteColumnIndex = -2;
protected int grdOppCompetitorsDeleteColumnIndex
{
    get
    {
        if (_grdOppCompetitorsdeleteColumnIndex == -2)
        {
            int bias = (grdOppCompetitors.ExpandableRows) ? 1 : 0;
            _grdOppCompetitorsdeleteColumnIndex = -1;
            int colcount = 0;
            foreach (DataControlField col in grdOppCompetitors.Columns)
            {
                ButtonField btn = col as ButtonField;
                if (btn != null)
                {
                    if (btn.CommandName == "Delete")
                    {
                        _grdOppCompetitorsdeleteColumnIndex = colcount + bias;
                        break;
                    }
                }
                colcount++;
            }
        }
        return _grdOppCompetitorsdeleteColumnIndex;
    }
}

protected void grdOppCompetitors_RowDataBound(object sender, GridViewRowEventArgs e)
{
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
        if ((grdOppCompetitorsDeleteColumnIndex >= 0) && (grdOppCompetitorsDeleteColumnIndex < e.Row.Cells.Count))
        {
            TableCell cell = e.Row.Cells[grdOppCompetitorsDeleteColumnIndex];
            foreach (Control c in cell.Controls)
            {
                LinkButton btn = c as LinkButton;
                if (btn != null)
                {
                    btn.Attributes.Add("onclick", "javascript: return confirm('" + Sage.Platform.WebPortal.PortalUtil.JavaScriptEncode(GetLocalResourceObject("grdOppCompetitors.e1e41ffc-1494-4188-bcc8-83cf568985dc.ConfirmationMessage").ToString()) + "');");
                    return;
                }
            }
        }
    }
}
   
protected void grdOppCompetitorspage_changing(object sender, GridViewPageEventArgs e)
{
 grdOppCompetitors.PageIndex = e.NewPageIndex;
 grdOppCompetitors.DataBind();
}
protected void grdOppCompetitors_Sorting(object sender, GridViewSortEventArgs e) { }
protected void grdOppCompetitors_RowCommand(object sender, GridViewCommandEventArgs e)
{
    if (e.CommandName == "Page")
        return;
    int rowIndex;
    if (Int32.TryParse(e.CommandArgument.ToString(), out rowIndex))
    {
        dtsOppCompetitors.SelectedIndex = rowIndex;
        object currentEntity = dtsOppCompetitors.Current;
        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
        string id = String.Empty;
        //Check if this is an unpersisted entity and use its InstanceId
        if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(currentEntity))
        {
            if (grdOppCompetitors.DataKeys[0].Values.Count > 1) {
                foreach (DictionaryEntry val in grdOppCompetitors.DataKeys[rowIndex].Values)
                {
                    if (val.Key.ToString() == "InstanceId")
                    {
                        Guid instanceId = (Guid)val.Value;
                        dtsOppCompetitors.SetCurrentEntityByInstanceId(instanceId);
                        id = instanceId.ToString();
                        currentEntity = dtsOppCompetitors.Current;
                        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
                            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
                    }
                }
            }
        }
        else
        {
            foreach (DictionaryEntry val in grdOppCompetitors.DataKeys[rowIndex].Values)
            {
                if (val.Key.ToString() != "InstanceId")
                {
                    if (string.IsNullOrEmpty(id))
                    {
                        id = val.Value.ToString();
                        ViewState["datakeyfield"] = val.Key;
                    }
                    else
                    {
                        id = string.Concat(id, ",", val.Value.ToString());
                        if (ViewState["datakeyfield"] == null)
                            ViewState["datakeyfield"] = val.Key;
                        else
                            ViewState["datakeyfield"] = string.Concat(ViewState["datakeyfield"], ",", val.Key);
                    }

                }
            }
        }
        if (e.CommandName.Equals("Edit"))
        {
            if (DialogService != null)
            {
                // QFDataGrid
                            DialogService.SetSpecs(400, 600, "EditOpportunityCompetitor", string.Empty );
                            DialogService.EntityType = typeof(Sage.Entity.Interfaces.IOpportunityCompetitor );
                DialogService.CompositeKeyNames = "OpportunityId,CompetitorId";
                DialogService.EntityID = id;
                DialogService.ShowDialog();
            }
        }
        if (e.CommandName.Equals("Delete"))
        {
            Sage.Entity.Interfaces.IOpportunity mainentity = this.BindingSource.Current as Sage.Entity.Interfaces.IOpportunity;
            if (mainentity != null)
            {
                Sage.Entity.Interfaces.IOpportunityCompetitor childEntity = null;
                if((currentEntity != null) && (currentEntity is Sage.Entity.Interfaces.IOpportunityCompetitor))
                {
                    childEntity = (Sage.Entity.Interfaces.IOpportunityCompetitor)currentEntity;
                }
                else if (id != null)
                {
                    childEntity = (Sage.Entity.Interfaces.IOpportunityCompetitor)Sage.Platform.EntityFactory.GetByCompositeId(typeof(Sage.Entity.Interfaces.IOpportunityCompetitor), "OpportunityId,CompetitorId".Split(','), id.Split(','));
            }
                if(childEntity != null)
                {
                     mainentity.Competitors.Remove(childEntity);

                     if((childEntity.PersistentState & Sage.Platform.Orm.Interfaces.PersistentState.New) <= 0)
                     {
                         childEntity.Delete();
                     }
                     dtsOppCompetitors.SelectedIndex = -1;
                }
            }
        }
    }
    grdOppCompetitors_refresh();
}
    protected void grdOppCompetitors_refresh()
    {
        if (PageWorkItem != null) {
            Sage.Platform.WebPortal.Services.IPanelRefreshService refresher = PageWorkItem.Services.Get<Sage.Platform.WebPortal.Services.IPanelRefreshService>();
            if (refresher != null)
            {
                refresher.RefreshAll();
            }
            else
            {
                Response.Redirect(Request.Url.ToString());
            }
        }
    }

        protected void grdOppCompetitors_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdOppCompetitors.SelectedIndex = e.NewEditIndex;
        e.Cancel = true;
    }
            protected void grdOppCompetitors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdOppCompetitors.SelectedIndex = -1;
    }
    </script>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="OpportunityCompetitors_RTools" ToolbarLocation="right">
   <SalesLogix:LookupControl runat="server" ID="lueAssociateCompetitor" ButtonToolTip="<%$ resources: lueAssociateCompetitor.ButtonToolTip %>" LookupEntityName="Competitor" LookupEntityTypeName="Sage.Entity.Interfaces.ICompetitor, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupDisplayMode="ButtonOnly" AutoPostBack="true" LookupImageURL="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueAssociateCompetitor.LookupProperties.CompetitorName.PropertyHeader %>" PropertyName="CompetitorName" PropertyType="" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueAssociateCompetitor.LookupProperties.Rating.PropertyHeader %>" PropertyName="Rating" PropertyType="" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueAssociateCompetitor.LookupProperties.Strengths.PropertyHeader %>" PropertyName="Strengths" PropertyType="" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
 

  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=OpportunityCompetitors&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkOpportunityCompetitorsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="OpportunityCompetitors" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dtsOppCompetitors;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dtsOppCompetitors
{ 
  get 
  {
    if (_dtsOppCompetitors == null)
    {
             _dtsOppCompetitors = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.IOpportunityCompetitor), 
	    EntityType              ,"Competitors", System.Reflection.MemberTypes.Property);
            	   	}
 	return _dtsOppCompetitors;
  }
}

void dtsOppCompetitors_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dtsOppCompetitors.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dtsOppCompetitors);
   }
}

 



 

protected override void OnAddEntityBindings() {
       dtsOppCompetitors.Bindings.Add(new Sage.Platform.WebPortal.Binding.WebEntityListBinding("Competitors", grdOppCompetitors ));
   dtsOppCompetitors.BindFieldNames = new String[] { "OpportunityId","CompetitorId","Competitor.CompetitorName","Rating","Weaknesses","CurrentMajorCompetitor","CompetitorRate","CompetitorShareOfWellet" };
                
     BindingSource.OnCurrentEntitySet += new EventHandler(dtsOppCompetitors_OnCurrentEntitySet);
    
    }
       
protected void lueAssociateCompetitor_ChangeAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("OpportunityCompetitors.lueAssociateCompetitor_OnChange", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 lueAssociateCompetitor.LookupResultValueChanged += new EventHandler(lueAssociateCompetitor_ChangeAction);


}

protected void quickformload0(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("OpportunityCompetitors.OnLoad1", methodArgs);

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
grdOppCompetitors.Columns[6].Visible = (RoleSecurityService.HasAccess("Entities/Opportunity/Edit"));
grdOppCompetitors.Columns[7].Visible = (RoleSecurityService.HasAccess("Entities/Opportunity/Edit"));
ClientBindingMgr.RegisterBoundControl(lueAssociateCompetitor);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dtsOppCompetitors.SourceObject == null) { dtsOppCompetitors.SourceObject = BindingSource.Current; }
if (dtsOppCompetitors.SourceObject == null) { RegisterBindingsWithClient(dtsOppCompetitors); }
dtsOppCompetitors.Bind();



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
    get { return _formAdapter ?? (_formAdapter = new OpportunityCompetitorsAdapter(this)); }
}

public class OpportunityCompetitorsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IOpportunityCompetitors
{
    public OpportunityCompetitorsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataGridControl _grdOppCompetitors;
    public  Sage.Platform.Controls.IDataGridControl grdOppCompetitors
    {
        get { return FindControl(ref _grdOppCompetitors, "grdOppCompetitors"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dtsOppCompetitors;
    public  Sage.Platform.Controls.IDataSourceControl dtsOppCompetitors
    {
        get { return FindControl(ref _dtsOppCompetitors, "dtsOppCompetitors"); }
    }
    private Sage.Platform.Controls.ILookupControl _lueAssociateCompetitor;
    public  Sage.Platform.Controls.ILookupControl lueAssociateCompetitor
    {
        get { return FindControl(ref _lueAssociateCompetitor, "lueAssociateCompetitor"); }
    }

    public  void OnLoad1(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("OpportunityCompetitors.OnLoad1", methodArgs);
    }
    public  void lueAssociateCompetitor_OnChange(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("OpportunityCompetitors.lueAssociateCompetitor_OnChange", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
