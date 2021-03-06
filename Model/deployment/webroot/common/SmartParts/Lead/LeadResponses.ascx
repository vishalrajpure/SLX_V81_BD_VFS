<%@ Control Language="C#" ClassName="LeadResponses" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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

	   

<SalesLogix:ScriptResourceProvider ID="LeadResponsesgrdLeadResponses_Strings" runat="server">
    <Keys>
          <SalesLogix:ResourceKeyName Key="grdLeadResponses.7682d31e-586d-4d11-938e-b1d1993f9473.ColumnHeading" />
        <SalesLogix:ResourceKeyName Key="grdLeadResponses.7682d31e-586d-4d11-938e-b1d1993f9473.Text" />
<SalesLogix:ResourceKeyName Key="617b157e-4487-4efe-bb8b-4b3bbd93e502.DialogTitleOverride" />   <SalesLogix:ResourceKeyName Key="grdLeadResponses.900ce248-d5d4-4759-b2c0-67207e1243d8.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadResponses.c1ca32c0-0234-4113-ba5a-cf8a28e2a831.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadResponses.61198b31-25b1-49fa-9599-887975a70317.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadResponses.f112f065-f9ed-4efb-ab19-243f175e46ec.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadResponses.6f59b7d7-f86e-48a1-bdcd-d9b306e2a3e2.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="grdLeadResponses.32652b96-3a37-4bf0-9b4b-116c78bf41f6.ColumnHeading" />
           <SalesLogix:ResourceKeyName Key="grdLeadResponses.Delete.ToolTip" />
     </Keys>
</SalesLogix:ScriptResourceProvider>

							 
  <div id="LeadResponsesgrdLeadResponses_Container" style="width:100%;height:100%;" class="">
    <div id="LeadResponsesgrdLeadResponses_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>


 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="LeadResponses_RTools" ToolbarLocation="right">
    <asp:ImageButton runat="server" ID="btnAddResponse"
 AlternateText="<%$ resources: btnAddResponse.Caption %>"  ToolTip="<%$ resources: btnAddResponse.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  />
 
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=LeadResponses&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkLeadResponsesHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="LeadResponses" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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

 

protected override void OnAddEntityBindings() {
    
   
    }
       
protected void btnAddResponse_ClickAction(object sender, EventArgs e) {
// Show the "Add Response" dialog, initialized with the current lead.
Sage.Entity.Interfaces.ITargetResponse targetResponse = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.ITargetResponse>();
targetResponse.Lead = (Sage.Entity.Interfaces.ILead)BindingSource.Current;
DialogService.SetSpecs(200, 200, 550, 800, "AddEditTargetResponse", "", true);
DialogService.EntityType = typeof(Sage.Entity.Interfaces.ITargetResponse);
DialogService.DialogParameters.Add("ResponseDataSource", targetResponse);
DialogService.DialogParameters.Add("IsLead", true);
DialogService.ShowDialog();

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 btnAddResponse.Click += new ImageClickEventHandler(btnAddResponse_ClickAction);


}

protected void quickformload0(object sender, EventArgs e) {
DialogService.DialogParameters.Add("IsLead", true);

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
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}

                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/Lead/LeadResponses.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.LeadResponses.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.LeadResponses.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_LeadResponses", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new LeadResponsesAdapter(this)); }
}

public class LeadResponsesAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ILeadResponses
{
    public LeadResponsesAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IButtonControl _btnAddResponse;
    public  Sage.Platform.Controls.IButtonControl btnAddResponse
    {
        get { return FindControl(ref _btnAddResponse, "btnAddResponse"); }
    }

}

</script>

<script type="text/javascript">
</script>
