<%@ Control Language="C#" ClassName="TicketActivityItems" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
<%@ Register Assembly="Sage.SalesLogix.Client.GroupBuilder" Namespace="Sage.SalesLogix.Client.GroupBuilder" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.PickList" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.DependencyLookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Lookup" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.Timeline" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.HighLevelTypes" Namespace="Sage.SalesLogix.HighLevelTypes" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.Platform.WebPortal" Namespace="Sage.Platform.WebPortal.SmartParts" TagPrefix="SalesLogix" %>
<%@ Register Assembly="Sage.SalesLogix.Web.Controls" Namespace="Sage.SalesLogix.Web.Controls.ScriptResourceProvider" TagPrefix="Saleslogix" %>

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

			

<SalesLogix:ScriptResourceProvider ID="TicketActivityItemsgrdActivityParts_AddRelationTool_Strings" runat="server">
    <Keys>
        <SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.ButtonTooltip" />
        <SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.LookupDialogTitle" />
        <SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.DialogButtonText" />
						<SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.LookupProperties.ActualId.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.LookupProperties.Name.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="grdActivityParts_AddRelationTool.LookupProperties.Status.PropertyHeader" />
		       </Keys>
</SalesLogix:ScriptResourceProvider>

	  	  	   

<SalesLogix:ScriptResourceProvider ID="TicketActivityItemsgrdActivityParts_Strings" runat="server">
    <Keys>
        <SalesLogix:ResourceKeyName Key="grdActivityParts.EmptyTableRowText" />  <SalesLogix:ResourceKeyName Key="grdActivityParts.a116eddf-12f1-44ba-b510-7e40e6f6e59c.ColumnHeading" />
        <SalesLogix:ResourceKeyName Key="grdActivityParts.a116eddf-12f1-44ba-b510-7e40e6f6e59c.Text" />
<SalesLogix:ResourceKeyName Key="c66600f9-1fe4-4821-9ece-c93d5457d9f6.DialogTitleOverride" />   <SalesLogix:ResourceKeyName Key="grdActivityParts.9d3402ca-f3c1-4cb5-b118-016de4349de1.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActivityParts.b1165945-e43b-4cc8-bb56-630e3e80535c.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActivityParts.5ece826e-d3e3-482d-8c0f-ea72bc664897.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActivityParts.8e9dc831-b1fd-43e0-b6f5-dfb0c44d751f.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActivityParts.86f7a539-714d-4ae1-ae45-af0c526e277b.ColumnHeading" />
           <SalesLogix:ResourceKeyName Key="grdActivityParts.Relate.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdActivityParts.btnCopy.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdActivityParts.Delete.ToolTip" />
     </Keys>
</SalesLogix:ScriptResourceProvider>

									
		
		
		
		

				 





























<div style="display:none;">
  <asp:TextBox runat="server" ID="TicketActivityItemsgrdActivityParts_DataCarrier" class="TicketActivityItemsgrdActivityParts_DataCarrier" ></asp:TextBox>
</div>
  <div id="TicketActivityItemsgrdActivityParts_Container" style="width:100%;height:100%;" class="">
    <div id="TicketActivityItemsgrdActivityParts_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>


 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="TicketActivityItems_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=TicketActivityItems&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkTicketActivityItemsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="TicketActivityItems" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
 </SalesLogix:SmartPartToolsContainer>

<SalesLogix:ScriptResourceProvider ID="TicketActivityItemsResources" runat="server">
<Keys>
			<SalesLogix:ResourceKeyName Key="error_ExecutingRequest" />
			<SalesLogix:ResourceKeyName Key="error_ExecutingRequestEx" />
			<SalesLogix:ResourceKeyName Key="error_CopyingPart" />
	</Keys>
</SalesLogix:ScriptResourceProvider>


<script runat="server" type="text/C#">
/// <summary>
/// Gets or sets the role security service.
/// </summary>
/// <value>The role security service.</value>
[Sage.Platform.Application.ServiceDependency]
public Sage.Platform.Security.IRoleSecurityService RoleSecurityService { get; set; }

public override Type EntityType
{
    get { return typeof(Sage.Entity.Interfaces.ITicketActivity); }
}

 

protected override void OnAddEntityBindings() {
    
   
}
       
protected void grdActivityParts_InsertAssociationAction(object sender, EventArgs e) {

	    string text = Request.Form.Get(TicketActivityItemsgrdActivityParts_DataCarrier.UniqueID);
    if (text.Length > 0)
    {
    var feed = new Sage.Integration.Entity.Feeds.TicketActivityItemFeed();

		using (var stream = new System.IO.MemoryStream(Encoding.UTF8.GetBytes(text)))
		{
			new Sage.Common.Syndication.JsonSerializer().LoadFromStream<Sage.Integration.Entity.Feeds.TicketActivityItemEntry>(feed, stream);
		}

		if (feed == null) return;
		var transformer =
			Sage.Platform.Application.ApplicationContext.Current.Services.Get
				<Sage.Platform.SData.IAtomEntryToEntityTransformationService>();
    	
		var entity = BindingSource.Current as Sage.Entity.Interfaces.ITicketActivity;

		if (transformer != null && entity != null && entity.Items.Count == 0)
		{
			foreach (Sage.Integration.Entity.Feeds.TicketActivityItemEntry entry in feed.Entries)
			{
				var item = transformer.ConvertEntry(entry) as Sage.Entity.Interfaces.ITicketActivityItem;
				if (item != null)
				{
					item.TicketActivity = entity;
					entity.Items.Add(item);
				}
			}
			entity.Persisted -= grdActivityParts_InsertAssociationAction;
			entity.Save();
		}
	}



}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 var epage = Page as Sage.Platform.WebPortal.EntityPage;
 if (epage != null && epage.IsInsertMode)
 {
     var ent = BindingSource.Current as Sage.Platform.Orm.Interfaces.IPersistentEntity;
     if (ent != null)
     {
         ent.Persisted += grdActivityParts_InsertAssociationAction;
     }
 }


}

protected override void OnFormBound()
{
 var systemInfo = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.SalesLogix.Services.ISystemOptionsService>(true);  
 if (systemInfo.MultiCurrency) 
 { 
    FormHelper.AddBaseUserCurrencyRatesToClientContext(PageWorkItem); 
 } 
 var entity = BindingSource.Current as Sage.Entity.Interfaces.ITicketActivity; 
 if (this.PageWorkItem.State["ModeId"].ToString() == "Insert") 
 { 
 var feed = new Sage.Integration.Entity.Feeds.TicketActivityItemFeed(); 
 if (entity != null) 
      if (entity.Items.Count > 0) 
      { 
			var include = Sage.Common.Syndication.InclusionNode.CreateInclusionTree("Product", null, null, null); 
          var transformer = 
              Sage.Platform.Application.ApplicationContext.Current.Services.Get 
                  <Sage.Platform.SData.IAtomEntryToEntityTransformationService>(); 
          foreach (Sage.Entity.Interfaces.ITicketActivityItem item in entity.Items) 
          { 
              var transItem = transformer.ConvertEntity(item, include) as Sage.Integration.Entity.Feeds.TicketActivityItemEntry; 
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
          TicketActivityItemsgrdActivityParts_DataCarrier.Text = text; 
          entity.Items.Clear(); 
      } 
 } 
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}

                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/TicketActivity/TicketActivityItems.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.TicketActivityItems.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.TicketActivityItems.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_TicketActivityItems", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new TicketActivityItemsAdapter(this)); }
}

public class TicketActivityItemsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ITicketActivityItems
{
    public TicketActivityItemsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}


}

</script>

<script type="text/javascript">
</script>
