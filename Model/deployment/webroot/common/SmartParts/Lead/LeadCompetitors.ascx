<%@ Control Language="C#" ClassName="LeadCompetitors" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
  <SalesLogix:SlxGridView runat="server" ID="grdLeadCompetitors" GridLines="None"
AutoGenerateColumns="false" CellPadding="4" CssClass="datagrid" PagerStyle-CssClass="gridPager"
AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt" SelectedRowStyle-CssClass="rowSelected" ShowEmptyTable="true" EnableViewState="false"
EmptyTableRowText="<%$ resources: grdLeadCompetitors.EmptyTableRowText %>"  ExpandableRows="True" ResizableColumns="True"  OnRowCommand="grdLeadCompetitors_RowCommand"
 DataKeyNames="InstanceId,Id"
 OnRowEditing="grdLeadCompetitors_RowEditing"  OnRowDeleting="grdLeadCompetitors_RowDeleting" OnRowDataBound="grdLeadCompetitors_RowDataBound" >
<Columns>
   <asp:BoundField DataField="Competitor.CompetitorName"
      HeaderText="<%$ resources: grdLeadCompetitors.ce2e617d-01f8-44f5-a629-61da6c5e3e52.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Competitor.Rating"
      HeaderText="<%$ resources: grdLeadCompetitors.e1333ceb-b646-45f1-8c2f-5c3b85534c55.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Competitor.Weaknesses"
      HeaderText="<%$ resources: grdLeadCompetitors.2d52b5a8-f18f-4089-8f3c-fcb3c528bb79.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:CheckBoxField DataField="CurrentMajorCompetitor" ReadOnly="True"
      HeaderText="<%$ resources: grdLeadCompetitors.53944890-9fd3-4a0f-9dc6-2e7dce90680c.ColumnHeading %>"        >
          </asp:CheckBoxField>
    <asp:TemplateField   HeaderText="<%$ resources: grdLeadCompetitors.28c832f5-efc6-44d5-85fc-9f72e80e4e4a.ColumnHeading %>"        >
    <itemtemplate>
 <SalesLogix:Currency runat="server" ID="grdLeadCompetitorscol5" DisplayMode="AsText"  ExchangeRateType="BaseRate"   Text='<%#  dsLeadCompetitors.getPropertyValue(Container.DataItem, "COMPETITORRATE")  %>' CssClass=""  DecimalDigits="2"  />
   </itemtemplate></asp:TemplateField>
    <asp:BoundField DataField="COMPETITORSHAREOFWELLET"
      HeaderText="<%$ resources: grdLeadCompetitors.30596f25-c917-4f05-87bf-fac0279937e9.ColumnHeading %>"          >
      </asp:BoundField>
  <asp:ButtonField CommandName="Edit"
  Text="<%$ resources: grdLeadCompetitors.13644226-77de-437b-99d7-4194ad1ce617.Text %>"  DataTextField="Id"      HeaderText="<%$ resources: grdLeadCompetitors.13644226-77de-437b-99d7-4194ad1ce617.ColumnHeading %>"        >
          </asp:ButtonField>
     <asp:ButtonField CommandName="Delete"
  Text="<%$ resources: grdLeadCompetitors.7c56d8ed-2fa7-4950-af38-cebc70ec4f85.Text %>"   DataTextField="Id"       HeaderText="<%$ resources: grdLeadCompetitors.7c56d8ed-2fa7-4950-af38-cebc70ec4f85.ColumnHeading %>"        >
          </asp:ButtonField>
   </Columns>
</SalesLogix:SlxGridView>

<script runat="server" type="text/C#">

                        private int _grdLeadCompetitorsdeleteColumnIndex = -2;
protected int grdLeadCompetitorsDeleteColumnIndex
{
    get
    {
        if (_grdLeadCompetitorsdeleteColumnIndex == -2)
        {
            int bias = (grdLeadCompetitors.ExpandableRows) ? 1 : 0;
            _grdLeadCompetitorsdeleteColumnIndex = -1;
            int colcount = 0;
            foreach (DataControlField col in grdLeadCompetitors.Columns)
            {
                ButtonField btn = col as ButtonField;
                if (btn != null)
                {
                    if (btn.CommandName == "Delete")
                    {
                        _grdLeadCompetitorsdeleteColumnIndex = colcount + bias;
                        break;
                    }
                }
                colcount++;
            }
        }
        return _grdLeadCompetitorsdeleteColumnIndex;
    }
}

protected void grdLeadCompetitors_RowDataBound(object sender, GridViewRowEventArgs e)
{
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
        if ((grdLeadCompetitorsDeleteColumnIndex >= 0) && (grdLeadCompetitorsDeleteColumnIndex < e.Row.Cells.Count))
        {
            TableCell cell = e.Row.Cells[grdLeadCompetitorsDeleteColumnIndex];
            foreach (Control c in cell.Controls)
            {
                LinkButton btn = c as LinkButton;
                if (btn != null)
                {
                    btn.Attributes.Add("onclick", "javascript: return confirm('" + Sage.Platform.WebPortal.PortalUtil.JavaScriptEncode(GetLocalResourceObject("grdLeadCompetitors.7c56d8ed-2fa7-4950-af38-cebc70ec4f85.ConfirmationMessage").ToString()) + "');");
                    return;
                }
            }
        }
    }
}
   
protected void grdLeadCompetitors_RowCommand(object sender, GridViewCommandEventArgs e)
{
    if (e.CommandName == "Page")
        return;
    int rowIndex;
    if (Int32.TryParse(e.CommandArgument.ToString(), out rowIndex))
    {
        dsLeadCompetitors.SelectedIndex = rowIndex;
        object currentEntity = dsLeadCompetitors.Current;
        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
        string id = String.Empty;
        //Check if this is an unpersisted entity and use its InstanceId
        if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(currentEntity))
        {
            if (grdLeadCompetitors.DataKeys[0].Values.Count > 1) {
                foreach (DictionaryEntry val in grdLeadCompetitors.DataKeys[rowIndex].Values)
                {
                    if (val.Key.ToString() == "InstanceId")
                    {
                        Guid instanceId = (Guid)val.Value;
                        dsLeadCompetitors.SetCurrentEntityByInstanceId(instanceId);
                        id = instanceId.ToString();
                        currentEntity = dsLeadCompetitors.Current;
                        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
                            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
                    }
                }
            }
        }
        else
        {
            foreach (DictionaryEntry val in grdLeadCompetitors.DataKeys[rowIndex].Values)
            {
                if (val.Key.ToString() != "InstanceId")
                {
                    id = val.Value.ToString();
                }
            }
        }
        if (e.CommandName.Equals("Edit"))
        {
            if (DialogService != null)
            {
                // QFDataGrid
                            DialogService.SetSpecs(400, 600, "EditLeadCompetitor", string.Empty );
                            DialogService.EntityType = typeof(Sage.Entity.Interfaces.ILeadCompetitor );
                DialogService.EntityID = id;
                DialogService.ShowDialog();
            }
        }
        if (e.CommandName.Equals("Delete"))
        {
            Sage.Entity.Interfaces.ILead mainentity = this.BindingSource.Current as Sage.Entity.Interfaces.ILead;
            if (mainentity != null)
            {
                Sage.Entity.Interfaces.ILeadCompetitor childEntity = null;
                if((currentEntity != null) && (currentEntity is Sage.Entity.Interfaces.ILeadCompetitor))
                {
                    childEntity = (Sage.Entity.Interfaces.ILeadCompetitor)currentEntity;
                }
                else if (id != null)
                {
                    childEntity = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILeadCompetitor>(id);
            }
                if(childEntity != null)
                {
                     mainentity.Competitors.Remove(childEntity);

                     if((childEntity.PersistentState & Sage.Platform.Orm.Interfaces.PersistentState.New) <= 0)
                     {
                         childEntity.Delete();
                     }
                     dsLeadCompetitors.SelectedIndex = -1;
                }
            }
        }
    }
    grdLeadCompetitors_refresh();
}
    protected void grdLeadCompetitors_refresh()
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

        protected void grdLeadCompetitors_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdLeadCompetitors.SelectedIndex = e.NewEditIndex;
        e.Cancel = true;
    }
            protected void grdLeadCompetitors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdLeadCompetitors.SelectedIndex = -1;
    }
    </script>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="LeadCompetitors_RTools" ToolbarLocation="right">
   <SalesLogix:LookupControl runat="server" ID="lueLeadCompetitor" ButtonToolTip="<%$ resources: lueLeadCompetitor.ButtonToolTip %>" LookupEntityName="Competitor" LookupEntityTypeName="Sage.Entity.Interfaces.ICompetitor, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupDisplayMode="ButtonOnly" AutoPostBack="true" LookupImageURL="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueLeadCompetitor.LookupProperties.CompetitorName.PropertyHeader %>" PropertyName="CompetitorName" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueLeadCompetitor.LookupProperties.Rating.PropertyHeader %>" PropertyName="Rating" PropertyType="System.Int32" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueLeadCompetitor.LookupProperties.Strengths.PropertyHeader %>" PropertyName="Strengths" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
 

  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=LeadCompetitors&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkLeadCompetitorsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="LeadCompetitors" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.ILead); }
}

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dsLeadCompetitors;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dsLeadCompetitors
{ 
  get 
  {
    if (_dsLeadCompetitors == null)
    {
             _dsLeadCompetitors = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.ILeadCompetitor), 
	    EntityType              ,"Competitors", System.Reflection.MemberTypes.Property);
                   _dsLeadCompetitors.UseSmartQuery = true;
      	   	}
 	return _dsLeadCompetitors;
  }
}

void dsLeadCompetitors_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dsLeadCompetitors.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dsLeadCompetitors);
   }
}

 



 

protected override void OnAddEntityBindings() {
       dsLeadCompetitors.Bindings.Add(new Sage.Platform.WebPortal.Binding.WebEntityListBinding("Competitors", grdLeadCompetitors ));
   dsLeadCompetitors.BindFieldNames = new String[] { "Id","Competitor.CompetitorName","Competitor","Competitor.Rating","RATING","Competitor.Weaknesses","WEAKNESSES","CurrentMajorCompetitor","COMPETITORRATE","COMPETITORSHAREOFWELLET" };
     
     BindingSource.OnCurrentEntitySet += new EventHandler(dsLeadCompetitors_OnCurrentEntitySet);
    
    }
       
protected void lueLeadCompetitor_ChangeAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("LeadCompetitors.lueLeadCompetitor_OnChange", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 lueLeadCompetitor.LookupResultValueChanged += new EventHandler(lueLeadCompetitor_ChangeAction);


}

protected void quickformload0(object sender, EventArgs e) {
Sage.Entity.Interfaces.ILead leadpro = BindingSource.Current as Sage.Entity.Interfaces.ILead;
if(leadpro.Status.ToUpper() == "CONVERTED" || leadpro.Status.ToUpper() == "DROPPED" )
	{
		lueLeadCompetitor.Visible = false;
		
		
	}

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
ClientBindingMgr.RegisterBoundControl(lueLeadCompetitor);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dsLeadCompetitors.SourceObject == null) { dsLeadCompetitors.SourceObject = BindingSource.Current; }
if (dsLeadCompetitors.SourceObject == null) { RegisterBindingsWithClient(dsLeadCompetitors); }
dsLeadCompetitors.Bind();



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
    get { return _formAdapter ?? (_formAdapter = new LeadCompetitorsAdapter(this)); }
}

public class LeadCompetitorsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ILeadCompetitors
{
    public LeadCompetitorsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataGridControl _grdLeadCompetitors;
    public  Sage.Platform.Controls.IDataGridControl grdLeadCompetitors
    {
        get { return FindControl(ref _grdLeadCompetitors, "grdLeadCompetitors"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dsLeadCompetitors;
    public  Sage.Platform.Controls.IDataSourceControl dsLeadCompetitors
    {
        get { return FindControl(ref _dsLeadCompetitors, "dsLeadCompetitors"); }
    }
    private Sage.Platform.Controls.ILookupControl _lueLeadCompetitor;
    public  Sage.Platform.Controls.ILookupControl lueLeadCompetitor
    {
        get { return FindControl(ref _lueLeadCompetitor, "lueLeadCompetitor"); }
    }

    public  void lueLeadCompetitor_OnChange(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("LeadCompetitors.lueLeadCompetitor_OnChange", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
