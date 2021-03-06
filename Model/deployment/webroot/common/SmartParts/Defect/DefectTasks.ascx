<%@ Control Language="C#" ClassName="DefectTasks" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
   <%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.ScriptResourceProvider" TagPrefix="SalesLogix" %>
  <%--Grid style overrides for quickform configurations and textbox compatibility with IE7.--%>
<style 
type="text/css">     
    .alignleft { text-align : left; }
    .alignright { text-align : right; }
    .aligncenter { text-align : center; }
	.dijitTextBox { width: auto; }
	.ISOSpace {width: 75% !important; }
</style>

	   

<SalesLogix:ScriptResourceProvider ID="DefectTasksQFSDataGrid_Strings" runat="server">
    <Keys>
          <SalesLogix:ResourceKeyName Key="QFSDataGrid.0f31a545-b3eb-4376-9be1-d782280951bd.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.1f81c6a0-6b8f-41cd-9b79-f4494ef9b93f.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.3c192154-b97f-4114-a0b3-98006c84c0f9.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.d69bde13-9701-4f76-831e-7b628c6e7a70.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.eb485934-e8fb-4779-8c8c-c2fc4a6f96f2.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.0882c553-d70c-4e00-955f-86fbd1b8ab8d.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.d710efdf-15a0-47bf-9bf3-5fd75236109e.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.32c60f20-75c4-486a-b342-0c083e1d80ef.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.e922b190-ae70-4d7f-af2a-5f4ddbed026b.ColumnHeading" />
        <SalesLogix:ResourceKeyName Key="QFSDataGrid.e922b190-ae70-4d7f-af2a-5f4ddbed026b.Text" />
<SalesLogix:ResourceKeyName Key="29ccadbc-442d-4f0d-aad8-e3f169ba8859.DialogTitleOverride" />       <SalesLogix:ResourceKeyName Key="QFSDataGrid.Delete.ToolTip" />
     </Keys>
</SalesLogix:ScriptResourceProvider>

												
		
		
		
		

				 





























<div style="display:none;">
  <asp:TextBox runat="server" ID="DefectTasksQFSDataGrid_DataCarrier" class="DefectTasksQFSDataGrid_DataCarrier" ></asp:TextBox>
</div>
  <div id="DefectTasksQFSDataGrid_Container" style="width:100%;height:100%;" class="">
    <div id="DefectTasksQFSDataGrid_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>


 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="DefectTasks_RTools" ToolbarLocation="right">
    <asp:ImageButton runat="server" ID="cmdAddTask"
 AlternateText="<%$ resources: cmdAddTask.Caption %>"  ToolTip="<%$ resources: cmdAddTask.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  />
 
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=DefectTasks&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkDefectTasksHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="DefectTasks" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IDefect); }
}

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dtsDefectActivities;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dtsDefectActivities
{ 
  get 
  {
    if (_dtsDefectActivities == null)
    {
             _dtsDefectActivities = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.IDefectActivityItem), 
	    EntityType              ,"DefectActivities", System.Reflection.MemberTypes.Property);
            	   	}
 	return _dtsDefectActivities;
  }
}

void dtsDefectActivities_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dtsDefectActivities.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dtsDefectActivities);
   }
}

 



 

protected override void OnAddEntityBindings() {
    
     BindingSource.OnCurrentEntitySet += new EventHandler(dtsDefectActivities_OnCurrentEntitySet);
    
    }
       
protected void cmdAddTask_ClickAction(object sender, EventArgs e) {
if (DialogService != null)
{
  // InsertChildDialogActionItem
  DialogService.SetSpecs(400, 600, "AddEditDefectTask", GetLocalResourceObject("b103cbb1-54c0-4921-80bb-0a4ddadcb084.DialogTitleOverride").ToString() );
  DialogService.EntityType = typeof(Sage.Entity.Interfaces.IDefectActivityItem); 
  DialogService.SetChildIsertInfo(
    typeof(Sage.Entity.Interfaces.IDefectActivityItem),
    typeof(Sage.Entity.Interfaces.IDefect),
    typeof(Sage.Entity.Interfaces.IDefectActivityItem).GetProperty("Defect"),
    typeof(Sage.Entity.Interfaces.IDefect).GetProperty("DefectActivities"));
  DialogService.ShowDialog();
}

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 cmdAddTask.Click += new ImageClickEventHandler(cmdAddTask_ClickAction);


}

protected override void OnFormBound()
{
 var systemInfo = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.SalesLogix.Services.ISystemOptionsService>(true);  
 if (systemInfo.MultiCurrency) 
 { 
    FormHelper.AddBaseUserCurrencyRatesToClientContext(PageWorkItem); 
 } 
 var entity = BindingSource.Current as Sage.Entity.Interfaces.IDefect; 
 if (this.PageWorkItem.State["ModeId"].ToString() == "Insert") 
 { 
 var feed = new Sage.Integration.Entity.Feeds.DefectActivityItemFeed(); 
 if (entity != null) 
      if (entity.DefectActivities.Count > 0) 
      { 
			var include = Sage.Common.Syndication.InclusionNode.CreateInclusionTree("DefectActivities", null, null, null); 
          var transformer = 
              Sage.Platform.Application.ApplicationContext.Current.Services.Get 
                  <Sage.Platform.SData.IAtomEntryToEntityTransformationService>(); 
          foreach (Sage.Entity.Interfaces.IDefectActivityItem item in entity.DefectActivities) 
          { 
              var transItem = transformer.ConvertEntity(item, include) as Sage.Integration.Entity.Feeds.DefectActivityItemEntry; 
              if (transItem != null) 
              { 
                  feed.Entries.Add(transItem); 
              } 
          } 
          string text; 
          using (var stream = new System.IO.MemoryStream()) 
          { 
          	          	new Sage.Common.Syndication.JsonSerializer().SaveToStream((Sage.Common.Syndication.IFeed)feed, stream, null, include); 
          	text = Encoding.UTF8.GetString(stream.ToArray()); 
          } 
          DefectTasksQFSDataGrid_DataCarrier.Text = text; 
          entity.DefectActivities.Clear(); 
      } 
 } 
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dtsDefectActivities.SourceObject == null) { dtsDefectActivities.SourceObject = BindingSource.Current; }
if (dtsDefectActivities.SourceObject == null) { RegisterBindingsWithClient(dtsDefectActivities); }
dtsDefectActivities.Bind();


                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/Defect/DefectTasks.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.DefectTasks.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.DefectTasks.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_DefectTasks", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new DefectTasksAdapter(this)); }
}

public class DefectTasksAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IDefectTasks
{
    public DefectTasksAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataSourceControl _dtsDefectActivities;
    public  Sage.Platform.Controls.IDataSourceControl dtsDefectActivities
    {
        get { return FindControl(ref _dtsDefectActivities, "dtsDefectActivities"); }
    }
    private Sage.Platform.Controls.IButtonControl _cmdAddTask;
    public  Sage.Platform.Controls.IButtonControl cmdAddTask
    {
        get { return FindControl(ref _cmdAddTask, "cmdAddTask"); }
    }

}

</script>

<script type="text/javascript">
</script>
