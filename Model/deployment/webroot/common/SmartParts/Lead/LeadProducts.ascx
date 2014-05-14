<%@ Control Language="C#" ClassName="LeadProducts" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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

	  			

<SalesLogix:ScriptResourceProvider ID="LeadProductslueProduct_Strings" runat="server">
    <Keys>
        <SalesLogix:ResourceKeyName Key="lueProduct.ButtonTooltip" />
        <SalesLogix:ResourceKeyName Key="lueProduct.LookupDialogTitle" />
        <SalesLogix:ResourceKeyName Key="lueProduct.DialogButtonText" />
						<SalesLogix:ResourceKeyName Key="lueProduct.LookupProperties.Name.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="lueProduct.LookupProperties.Family.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="lueProduct.LookupProperties.Status.PropertyHeader" />
		 		<SalesLogix:ResourceKeyName Key="lueProduct.LookupProperties.ActualId.PropertyHeader" />
		       </Keys>
</SalesLogix:ScriptResourceProvider>

	  	  	   

<SalesLogix:ScriptResourceProvider ID="LeadProductsgrdLeadProducts_Strings" runat="server">
    <Keys>
          <SalesLogix:ResourceKeyName Key="grdLeadProducts.6ef4d952-2b1a-4d9f-a36e-35a942dd32bb.ColumnHeading" />
        <SalesLogix:ResourceKeyName Key="grdLeadProducts.6ef4d952-2b1a-4d9f-a36e-35a942dd32bb.Text" />
<SalesLogix:ResourceKeyName Key="38611e40-47c3-4f73-88e1-62bfa47171a4.DialogTitleOverride" />   <SalesLogix:ResourceKeyName Key="grdLeadProducts.5e29a114-4a97-45a3-9db6-2d0b10fd74dd.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadProducts.89fb1ecc-72a4-4f09-921b-29a9175daf56.ColumnHeading" />
           <SalesLogix:ResourceKeyName Key="grdLeadProducts.Save.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdLeadProducts.Relate.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdLeadProducts.Cancel.ToolTip" />
    <SalesLogix:ResourceKeyName Key="grdLeadProducts.Delete.ToolTip" />
     </Keys>
</SalesLogix:ScriptResourceProvider>

			 





























<div style="display:none;">
  <asp:TextBox runat="server" ID="LeadProductsgrdLeadProducts_DataCarrier" class="LeadProductsgrdLeadProducts_DataCarrier" ></asp:TextBox>
</div>
  <div id="LeadProductsgrdLeadProducts_Container" style="width:100%;height:100%;" class="">
    <div id="LeadProductsgrdLeadProducts_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>


 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="LeadProducts_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=LeadProducts&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkLeadProductsHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="LeadProducts" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dsLeadProducts;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dsLeadProducts
{ 
  get 
  {
    if (_dsLeadProducts == null)
    {
             _dsLeadProducts = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.ILeadProduct), 
	    EntityType              ,"Products", System.Reflection.MemberTypes.Property);
                   _dsLeadProducts.UseSmartQuery = true;
      	   	}
 	return _dsLeadProducts;
  }
}

void dsLeadProducts_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dsLeadProducts.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dsLeadProducts);
   }
}

 



 

protected override void OnAddEntityBindings() {
    
     BindingSource.OnCurrentEntitySet += new EventHandler(dsLeadProducts_OnCurrentEntitySet);
    
}
       
protected void grdLeadProducts_InsertAssociationAction(object sender, EventArgs e) {

	    string text = Request.Form.Get(LeadProductsgrdLeadProducts_DataCarrier.UniqueID);
    if (text.Length > 0)
    {
    var feed = new Sage.Integration.Entity.Feeds.LeadProductFeed();

		using (var stream = new System.IO.MemoryStream(Encoding.UTF8.GetBytes(text)))
		{
			new Sage.Common.Syndication.JsonSerializer().LoadFromStream<Sage.Integration.Entity.Feeds.LeadProductEntry>(feed, stream);
		}

		if (feed == null) return;
		var transformer =
			Sage.Platform.Application.ApplicationContext.Current.Services.Get
				<Sage.Platform.SData.IAtomEntryToEntityTransformationService>();
    	
		var entity = BindingSource.Current as Sage.Entity.Interfaces.ILead;

		if (transformer != null && entity != null && entity.Products.Count == 0)
		{
			foreach (Sage.Integration.Entity.Feeds.LeadProductEntry entry in feed.Entries)
			{
				var item = transformer.ConvertEntry(entry) as Sage.Entity.Interfaces.ILeadProduct;
				if (item != null)
				{
					item.Lead = entity;
					entity.Products.Add(item);
				}
			}
			entity.Persisted -= grdLeadProducts_InsertAssociationAction;
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
         ent.Persisted += grdLeadProducts_InsertAssociationAction;
     }
 }


}

protected override void OnFormBound()
{
 var entity = BindingSource.Current as Sage.Entity.Interfaces.ILead; 
 if (this.PageWorkItem.State["ModeId"].ToString() == "Insert") 
 { 
 var feed = new Sage.Integration.Entity.Feeds.LeadProductFeed(); 
 if (entity != null) 
      if (entity.Products.Count > 0) 
      { 
			var include = Sage.Common.Syndication.InclusionNode.CreateInclusionTree("Product", null, null, null); 
          var transformer = 
              Sage.Platform.Application.ApplicationContext.Current.Services.Get 
                  <Sage.Platform.SData.IAtomEntryToEntityTransformationService>(); 
          foreach (Sage.Entity.Interfaces.ILeadProduct item in entity.Products) 
          { 
              var transItem = transformer.ConvertEntity(item, include) as Sage.Integration.Entity.Feeds.LeadProductEntry; 
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
          LeadProductsgrdLeadProducts_DataCarrier.Text = text; 
          entity.Products.Clear(); 
      } 
 } 
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dsLeadProducts.SourceObject == null) { dsLeadProducts.SourceObject = BindingSource.Current; }
if (dsLeadProducts.SourceObject == null) { RegisterBindingsWithClient(dsLeadProducts); }
dsLeadProducts.Bind();


                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/Lead/LeadProducts.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.LeadProducts.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.LeadProducts.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_LeadProducts", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new LeadProductsAdapter(this)); }
}

public class LeadProductsAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ILeadProducts
{
    public LeadProductsAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataSourceControl _dsLeadProducts;
    public  Sage.Platform.Controls.IDataSourceControl dsLeadProducts
    {
        get { return FindControl(ref _dsLeadProducts, "dsLeadProducts"); }
    }

}

</script>

<script type="text/javascript">
</script>
