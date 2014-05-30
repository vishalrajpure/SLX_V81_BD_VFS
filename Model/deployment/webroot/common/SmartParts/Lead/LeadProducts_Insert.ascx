<%@ Control Language="C#" ClassName="LeadProducts_Insert" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
  <SalesLogix:SlxGridView runat="server" ID="grdLeadProducts" GridLines="None"
AutoGenerateColumns="false" CellPadding="4" CssClass="datagrid" PagerStyle-CssClass="gridPager"
AlternatingRowStyle-CssClass="rowdk" RowStyle-CssClass="rowlt" SelectedRowStyle-CssClass="rowSelected" ShowEmptyTable="true" EnableViewState="false"
EmptyTableRowText="<%$ resources: grdLeadProducts.EmptyTableRowText %>"  ExpandableRows="True" ResizableColumns="True"  OnRowCommand="grdLeadProducts_RowCommand"
 DataKeyNames="InstanceId,Leadid,ProductID"
 OnRowDeleting="grdLeadProducts_RowDeleting" OnRowDataBound="grdLeadProducts_RowDataBound" >
<Columns>
   <asp:BoundField DataField="Product.Name"
      HeaderText="<%$ resources: grdLeadProducts.162baef0-0325-46c0-94c4-e203cef4ee96.ColumnHeading %>"          >
      </asp:BoundField>
    <asp:BoundField DataField="Product.Family"
      HeaderText="<%$ resources: grdLeadProducts.a5ed166a-de48-48e5-9f31-f73287f6e11c.ColumnHeading %>"          >
      </asp:BoundField>
   <asp:ButtonField CommandName="Delete"
  Text="<%$ resources: grdLeadProducts.dd4d3cc8-3335-4f09-a374-95b8d9aece45.Text %>"         HeaderText="<%$ resources: grdLeadProducts.dd4d3cc8-3335-4f09-a374-95b8d9aece45.ColumnHeading %>"        >
          </asp:ButtonField>
   </Columns>
</SalesLogix:SlxGridView>

<script runat="server" type="text/C#">

         private int _grdLeadProductsdeleteColumnIndex = -2;
protected int grdLeadProductsDeleteColumnIndex
{
    get
    {
        if (_grdLeadProductsdeleteColumnIndex == -2)
        {
            int bias = (grdLeadProducts.ExpandableRows) ? 1 : 0;
            _grdLeadProductsdeleteColumnIndex = -1;
            int colcount = 0;
            foreach (DataControlField col in grdLeadProducts.Columns)
            {
                ButtonField btn = col as ButtonField;
                if (btn != null)
                {
                    if (btn.CommandName == "Delete")
                    {
                        _grdLeadProductsdeleteColumnIndex = colcount + bias;
                        break;
                    }
                }
                colcount++;
            }
        }
        return _grdLeadProductsdeleteColumnIndex;
    }
}

protected void grdLeadProducts_RowDataBound(object sender, GridViewRowEventArgs e)
{
}
   
protected void grdLeadProducts_RowCommand(object sender, GridViewCommandEventArgs e)
{
    if (e.CommandName == "Page")
        return;
    int rowIndex;
    if (Int32.TryParse(e.CommandArgument.ToString(), out rowIndex))
    {
        dsLeadProducts.SelectedIndex = rowIndex;
        object currentEntity = dsLeadProducts.Current;
        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
        string id = String.Empty;
        //Check if this is an unpersisted entity and use its InstanceId
        if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(currentEntity))
        {
            if (grdLeadProducts.DataKeys[0].Values.Count > 1) {
                foreach (DictionaryEntry val in grdLeadProducts.DataKeys[rowIndex].Values)
                {
                    if (val.Key.ToString() == "InstanceId")
                    {
                        Guid instanceId = (Guid)val.Value;
                        dsLeadProducts.SetCurrentEntityByInstanceId(instanceId);
                        id = instanceId.ToString();
                        currentEntity = dsLeadProducts.Current;
                        if ((currentEntity is Sage.Platform.ComponentModel.ComponentView) && !((Sage.Platform.ComponentModel.ComponentView)currentEntity).IsVirtualComponent)
                            currentEntity = ((Sage.Platform.ComponentModel.ComponentView)currentEntity).Component;
                    }
                }
            }
        }
        else
        {
            foreach (DictionaryEntry val in grdLeadProducts.DataKeys[rowIndex].Values)
            {
                if (val.Key.ToString() != "InstanceId")
                {
                    id = val.Value.ToString();
                }
            }
        }
        if (e.CommandName.Equals("Delete"))
        {
            Sage.Entity.Interfaces.ILead mainentity = this.BindingSource.Current as Sage.Entity.Interfaces.ILead;
            if (mainentity != null)
            {
                Sage.Entity.Interfaces.ILeadProduct childEntity = null;
                if((currentEntity != null) && (currentEntity is Sage.Entity.Interfaces.ILeadProduct))
                {
                    childEntity = (Sage.Entity.Interfaces.ILeadProduct)currentEntity;
                }
                else if (id != null)
                {
                    childEntity = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILeadProduct>(id);
            }
                if(childEntity != null)
                {
                     mainentity.Products.Remove(childEntity);

                     if((childEntity.PersistentState & Sage.Platform.Orm.Interfaces.PersistentState.New) <= 0)
                     {
                         childEntity.Delete();
                     }
                     dsLeadProducts.SelectedIndex = -1;
                }
            }
        }
    }
    grdLeadProducts_refresh();
}
    protected void grdLeadProducts_refresh()
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

            protected void grdLeadProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdLeadProducts.SelectedIndex = -1;
    }
    </script>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="LeadProducts_Insert_RTools" ToolbarLocation="right">
   <SalesLogix:LookupControl runat="server" ID="lueLeadProduct" LookupEntityName="Product" LookupEntityTypeName="Sage.Entity.Interfaces.IProduct, Sage.Entity.Interfaces, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null" LookupDisplayMode="ButtonOnly" AutoPostBack="true" LookupImageURL="~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16"  >
<LookupProperties>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueLeadProduct.LookupProperties.Name.PropertyHeader %>" PropertyName="Name" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
<SalesLogix:LookupProperty PropertyHeader="<%$ resources: lueLeadProduct.LookupProperties.Family.PropertyHeader %>" PropertyName="Family" PropertyType="System.String" PropertyFormat="None" PropertyFormatString="" UseAsResult="True" ExcludeFromFilters="False"></SalesLogix:LookupProperty>
</LookupProperties>
<LookupPreFilters>
</LookupPreFilters>
</SalesLogix:LookupControl>
 

  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=LeadProducts_Insert&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkLeadProducts_InsertHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="LeadProducts_Insert" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
       dsLeadProducts.Bindings.Add(new Sage.Platform.WebPortal.Binding.WebEntityListBinding("Products", grdLeadProducts ));
   dsLeadProducts.BindFieldNames = new String[] { "Leadid","ProductID","Product.Name","Product.Family" };
     
     BindingSource.OnCurrentEntitySet += new EventHandler(dsLeadProducts_OnCurrentEntitySet);
    
    }
       
protected void lueLeadProduct_ChangeAction(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("LeadProducts_Insert.lueLeadProduct_OnChange", methodArgs);

}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 lueLeadProduct.LookupResultValueChanged += new EventHandler(lueLeadProduct_ChangeAction);


}

protected override void OnFormBound()
{
ClientBindingMgr.RegisterBoundControl(lueLeadProduct);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dsLeadProducts.SourceObject == null) { dsLeadProducts.SourceObject = BindingSource.Current; }
if (dsLeadProducts.SourceObject == null) { RegisterBindingsWithClient(dsLeadProducts); }
dsLeadProducts.Bind();



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
    get { return _formAdapter ?? (_formAdapter = new LeadProducts_InsertAdapter(this)); }
}

public class LeadProducts_InsertAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ILeadProducts_Insert
{
    public LeadProducts_InsertAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IDataGridControl _grdLeadProducts;
    public  Sage.Platform.Controls.IDataGridControl grdLeadProducts
    {
        get { return FindControl(ref _grdLeadProducts, "grdLeadProducts"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dsLeadProducts;
    public  Sage.Platform.Controls.IDataSourceControl dsLeadProducts
    {
        get { return FindControl(ref _dsLeadProducts, "dsLeadProducts"); }
    }
    private Sage.Platform.Controls.ILookupControl _lueLeadProduct;
    public  Sage.Platform.Controls.ILookupControl lueLeadProduct
    {
        get { return FindControl(ref _lueLeadProduct, "lueLeadProduct"); }
    }

    public  void lueLeadProduct_OnChange(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("LeadProducts_Insert.lueLeadProduct_OnChange", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
