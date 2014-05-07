<%@ Control Language="C#" ClassName="RoleActions" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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

			

<SalesLogix:ScriptResourceProvider ID="RoleActionsgrdActions_AddRelationTool_Strings" runat="server">
    <Keys>
        <SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.ButtonTooltip" />
        <SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.LookupDialogTitle" />
        <SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.DialogButtonText" />
						<SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.LookupProperties.Name.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.LookupProperties.Description.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="grdActions_AddRelationTool.LookupProperties.Parent.PropertyHeader" />
		       </Keys>
</SalesLogix:ScriptResourceProvider>

	  	   

<SalesLogix:ScriptResourceProvider ID="RoleActionsgrdActions_Strings" runat="server">
    <Keys>
          <SalesLogix:ResourceKeyName Key="grdActions.e7eaee1f-899d-4ba9-b582-28e6b2f7cfa0.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActions.352f9b5f-09f0-4957-8039-9e9c9cbec6f6.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActions.6e83b38d-22a6-410c-be4d-d54a43278d11.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActions.d4b59393-8e72-4f22-9130-c3d6baea4461.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdActions.b0ffa555-4b26-4a1d-ad52-ee24d2395a1c.ColumnHeading" />
           <SalesLogix:ResourceKeyName Key="grdActions.Relate.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdActions.Delete.ToolTip" />
     </Keys>
</SalesLogix:ScriptResourceProvider>

					 





























<div style="display:none;">
  <asp:TextBox runat="server" ID="RoleActionsgrdActions_DataCarrier" class="RoleActionsgrdActions_DataCarrier" ></asp:TextBox>
</div>
  <div id="RoleActionsgrdActions_Container" style="width:100%;height:100%;" class="">
    <div id="RoleActionsgrdActions_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>


 

 <SalesLogix:SmartPartToolsContainer runat="server" ID="RoleActions_LTools" ToolbarLocation="left">
    <div class="slxlabel"><asp:Label runat="server" ID="QFLabel" Text="<%$ resources: QFLabel.Text %>"  />
</div>
  </SalesLogix:SmartPartToolsContainer>

 <SalesLogix:SmartPartToolsContainer runat="server" ID="RoleActions_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=RoleActions&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkRoleActionsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="RoleActions" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IRole); }
}

 

protected override void OnAddEntityBindings() {
    
   
       }
       
protected void grdActions_InsertAssociationAction(object sender, EventArgs e) {

	    string text = Request.Form.Get(RoleActionsgrdActions_DataCarrier.UniqueID);
    if (text.Length > 0)
    {
    var feed = new Sage.Integration.Entity.Feeds.SecuredActionRoleFeed();

		using (var stream = new System.IO.MemoryStream(Encoding.UTF8.GetBytes(text)))
		{
			new Sage.Common.Syndication.JsonSerializer().LoadFromStream<Sage.Integration.Entity.Feeds.SecuredActionRoleEntry>(feed, stream);
		}

		if (feed == null) return;
		var transformer =
			Sage.Platform.Application.ApplicationContext.Current.Services.Get
				<Sage.Platform.SData.IAtomEntryToEntityTransformationService>();
    	
		var entity = BindingSource.Current as Sage.Entity.Interfaces.IRole;

		if (transformer != null && entity != null && entity.SecuredActions.Count == 0)
		{
			foreach (Sage.Integration.Entity.Feeds.SecuredActionRoleEntry entry in feed.Entries)
			{
				var item = transformer.ConvertEntry(entry) as Sage.Entity.Interfaces.ISecuredActionRole;
				if (item != null)
				{
					item.Role = entity;
					entity.SecuredActions.Add(item);
				}
			}
			entity.Persisted -= grdActions_InsertAssociationAction;
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
         ent.Persisted += grdActions_InsertAssociationAction;
     }
 }


}

protected override void OnFormBound()
{
 var entity = BindingSource.Current as Sage.Entity.Interfaces.IRole; 
 if (this.PageWorkItem.State["ModeId"].ToString() == "Insert") 
 { 
 var feed = new Sage.Integration.Entity.Feeds.SecuredActionRoleFeed(); 
 if (entity != null) 
      if (entity.SecuredActions.Count > 0) 
      { 
			var include = Sage.Common.Syndication.InclusionNode.CreateInclusionTree("SecuredActions", null, null, null); 
          var transformer = 
              Sage.Platform.Application.ApplicationContext.Current.Services.Get 
                  <Sage.Platform.SData.IAtomEntryToEntityTransformationService>(); 
          foreach (Sage.Entity.Interfaces.ISecuredActionRole item in entity.SecuredActions) 
          { 
              var transItem = transformer.ConvertEntity(item, include) as Sage.Integration.Entity.Feeds.SecuredActionRoleEntry; 
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
          RoleActionsgrdActions_DataCarrier.Text = text; 
          entity.SecuredActions.Clear(); 
      } 
 } 
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}

                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/Role/RoleActions.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.RoleActions.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.RoleActions.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_RoleActions", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new RoleActionsAdapter(this)); }
}

public class RoleActionsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IRoleActions
{
    public RoleActionsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ILabelControl _QFLabel;
    public  Sage.Platform.Controls.ILabelControl QFLabel
    {
        get { return FindControl(ref _QFLabel, "QFLabel"); }
    }

}

</script>

<script type="text/javascript">
</script>