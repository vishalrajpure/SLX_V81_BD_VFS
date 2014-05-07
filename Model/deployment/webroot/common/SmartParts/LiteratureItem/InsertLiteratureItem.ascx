<%@ Control Language="C#" ClassName="InsertLiteratureItem" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
<table border="0" cellpadding="1" cellspacing="0" class="formtable">
         <col width="50%" />
            <col width="50%" />
     <tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="Itemnumber_lbl" AssociatedControlID="Itemnumber" runat="server" Text="<%$ resources: Itemnumber.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="Itemnumber"  dojoType="Sage.UI.Controls.TextBox"  />
  </div>

      </td>
                <td></td>
      </tr>
<tr>
            <td  colspan="2" >
 <div class="twocollbl alignleft" >
   <asp:Label ID="Itemname_lbl" AssociatedControlID="Itemname" runat="server" Text="<%$ resources: Itemname.Caption %>" ></asp:Label>
 </div>
  <div  class="twocoltextcontrol"   >
<asp:TextBox runat="server" ID="Itemname"  dojoType="Sage.UI.Controls.TextBox" MaxLength="128"  />
  </div>

      </td>
            </tr>
<tr>
            <td  colspan="2" >
 <div class="twocollbl alignleft" >
   <asp:Label ID="Authoredby_lbl" AssociatedControlID="Authoredby" runat="server" Text="<%$ resources: Authoredby.Caption %>" ></asp:Label>
 </div>
  <div  class="twocoltextcontrol"   >
<asp:TextBox runat="server" ID="Authoredby"  dojoType="Sage.UI.Controls.TextBox" MaxLength="64"  />
  </div>

      </td>
            </tr>
<tr>
            <td  colspan="2" >
 <div class="twocollbl alignleft">
   <asp:Label ID="Itemfamily_lbl" AssociatedControlID="Itemfamily" runat="server" Text="<%$ resources: Itemfamily.Caption %>" ></asp:Label>
 </div>   
   <div  class="twocoltextcontrol picklist"  > 
    <SalesLogix:PickListControl runat="server" ID="Itemfamily" PickListName="Literature Families"  />
  </div>

      </td>
            </tr>
<tr>
            <td  >
<div class=" lbl alignleft">
    <asp:Label ID="Cost_lbl" AssociatedControlID="Cost" runat="server" Text="<%$ resources: Cost.Caption %>" ></asp:Label>
</div>
 <div  class="textcontrol currency"  >
    <SalesLogix:Currency
    runat="server"
    ID="Cost" 
    ExchangeRateType="BaseRate"
     Required="false"
 DecimalDigits="-1"
 />
</div>

      </td>
                <td></td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="Qtyonhand_lbl" AssociatedControlID="Qtyonhand" runat="server" Text="<%$ resources: Qtyonhand.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol numeric"  > 
    <SalesLogix:NumericControl runat="server" ID="Qtyonhand"
Strict="False" 
 />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="Reorderqty_lbl" AssociatedControlID="Reorderqty" runat="server" Text="<%$ resources: Reorderqty.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol numeric"  > 
    <SalesLogix:NumericControl runat="server" ID="Reorderqty"
Strict="False" 
 />
  </div>

      </td>
      </tr>
<tr>
            <td  colspan="2" >
  <hr />
 

      </td>
            </tr>
<tr>
            <td  colspan="2" >
 <div class="twocollbl alignleft" >
   <asp:Label ID="Filename_lbl" AssociatedControlID="Filename" runat="server" Text="<%$ resources: Filename.Caption %>" ></asp:Label>
 </div>
  <div  class="twocoltextcontrol"   >
<asp:TextBox runat="server" ID="Filename"  dojoType="Sage.UI.Controls.TextBox" MaxLength="255"  />
  </div>

      </td>
            </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="ExpireDate_lbl" AssociatedControlID="ExpireDate" runat="server" Text="<%$ resources: ExpireDate.Caption %>" ></asp:Label>
 </div>
   <div  class="textcontrol datepicker"  >
    <SalesLogix:DateTimePicker runat="server" ID="ExpireDate" ButtonToolTip="<%$ resources: ExpireDate.ButtonToolTip %>" DisplayTime="false" />
  </div>

      </td>
                <td></td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="InsertLiteratureItem_RTools" ToolbarLocation="right">
    <asp:ImageButton runat="server" ID="cmdSave"
 AlternateText="<%$ resources: cmdSave.Caption %>"  ToolTip="<%$ resources: cmdSave.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16"  />
   
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=InsertLiteratureItem&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkInsertLiteratureItemHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="InsertLiteratureItem" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.ILiteratureItem); }
}

 

protected override void OnAddEntityBindings() {
                 // Itemnumber.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ItemnumberTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Itemnumber", Itemnumber, "Text");
        BindingSource.Bindings.Add(ItemnumberTextBinding);
                    // Itemname.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ItemnameTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Itemname", Itemname, "Text");
        BindingSource.Bindings.Add(ItemnameTextBinding);
                    // Authoredby.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding AuthoredbyTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Authoredby", Authoredby, "Text");
        BindingSource.Bindings.Add(AuthoredbyTextBinding);
                    // Itemfamily.PickListValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ItemfamilyPickListValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Itemfamily", Itemfamily, "PickListValue");
        BindingSource.Bindings.Add(ItemfamilyPickListValueBinding);
                    // Cost.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding CostTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Cost", Cost, "Text");
        BindingSource.Bindings.Add(CostTextBinding);
                    // Qtyonhand.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding QtyonhandTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Qtyonhand", Qtyonhand, "Text");
        BindingSource.Bindings.Add(QtyonhandTextBinding);
                    // Reorderqty.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ReorderqtyTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Reorderqty", Reorderqty, "Text");
        BindingSource.Bindings.Add(ReorderqtyTextBinding);
                       // Filename.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding FilenameTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Filename", Filename, "Text");
        BindingSource.Bindings.Add(FilenameTextBinding);
                    // ExpireDate.DateTimeValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ExpireDateDateTimeValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("ExpireDate", ExpireDate, "DateTimeValue");
        BindingSource.Bindings.Add(ExpireDateDateTimeValueBinding);
    
   
    }
                                                                      
protected void cmdSave_ClickAction(object sender, EventArgs e) {
  Sage.Entity.Interfaces.ILiteratureItem _entity = BindingSource.Current as Sage.Entity.Interfaces.ILiteratureItem;
  if (_entity != null)
  {
    object _parent = GetParentEntity();
    if (DialogService.ChildInsertInfo != null)
    {
        if (_parent != null)
        {
            if (DialogService.ChildInsertInfo.ParentReferenceProperty != null)
            {
                DialogService.ChildInsertInfo.ParentReferenceProperty.SetValue(_entity, _parent, null);
            }
        }
    }
    bool shouldSave = true;
    Sage.Platform.WebPortal.EntityPage page = Page as Sage.Platform.WebPortal.EntityPage;
    if (page != null)
    {
        if(IsInDialog() && page.ModeId.ToUpper() == "INSERT")
        {
            shouldSave = false;
        }
    }

    if(shouldSave)
    {
       _entity.Save();
    }

    if (_parent != null)
    {
        if (DialogService.ChildInsertInfo != null)
        {
           if (DialogService.ChildInsertInfo.ParentsCollectionProperty != null)
           {
              System.Reflection.MethodInfo _add = DialogService.ChildInsertInfo.ParentsCollectionProperty.PropertyType.GetMethod("Add");
              _add.Invoke(DialogService.ChildInsertInfo.ParentsCollectionProperty.GetValue(_parent, null), new object[] { _entity });
           }
        }
     }
  }

          cmdSave_ClickActionBRC(sender, e);
    
  
}
protected void cmdSave_ClickActionBRC(object sender, EventArgs e) {
      Response.Redirect(string.Format("LiteratureItem.aspx?entityId={0}", (this.BindingSource.Current as Sage.Platform.ComponentModel.IComponentReference).Id));
  
}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 cmdSave.Click += new ImageClickEventHandler(cmdSave_ClickAction);


}

protected void quickformload0(object sender, EventArgs e) {
Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
Object[] methodArgs = new Object[] { FormAdapter, e };
lib.Execute("InsertLiteratureItem.OnLoad1", methodArgs);

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
ClientBindingMgr.RegisterSaveButton(cmdSave);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
ClientBindingMgr.SetFocusTo(Itemnumber);


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
    get { return _formAdapter ?? (_formAdapter = new InsertLiteratureItemAdapter(this)); }
}

public class InsertLiteratureItemAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IInsertLiteratureItem
{
    public InsertLiteratureItemAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _Itemnumber;
    public  Sage.Platform.Controls.ITextBoxControl Itemnumber
    {
        get { return FindControl(ref _Itemnumber, "Itemnumber"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _Itemname;
    public  Sage.Platform.Controls.ITextBoxControl Itemname
    {
        get { return FindControl(ref _Itemname, "Itemname"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _Authoredby;
    public  Sage.Platform.Controls.ITextBoxControl Authoredby
    {
        get { return FindControl(ref _Authoredby, "Authoredby"); }
    }
    private Sage.Platform.Controls.IPickListControl _Itemfamily;
    public  Sage.Platform.Controls.IPickListControl Itemfamily
    {
        get { return FindControl(ref _Itemfamily, "Itemfamily"); }
    }
    private Sage.Platform.Controls.ICurrencyControl _Cost;
    public  Sage.Platform.Controls.ICurrencyControl Cost
    {
        get { return FindControl(ref _Cost, "Cost"); }
    }
    private Sage.Platform.Controls.INumericControl _Qtyonhand;
    public  Sage.Platform.Controls.INumericControl Qtyonhand
    {
        get { return FindControl(ref _Qtyonhand, "Qtyonhand"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _Filename;
    public  Sage.Platform.Controls.ITextBoxControl Filename
    {
        get { return FindControl(ref _Filename, "Filename"); }
    }
    private Sage.Platform.Controls.IDateTimePickerControl _ExpireDate;
    public  Sage.Platform.Controls.IDateTimePickerControl ExpireDate
    {
        get { return FindControl(ref _ExpireDate, "ExpireDate"); }
    }
    private Sage.Platform.Controls.INumericControl _Reorderqty;
    public  Sage.Platform.Controls.INumericControl Reorderqty
    {
        get { return FindControl(ref _Reorderqty, "Reorderqty"); }
    }
    private Sage.Platform.Controls.IButtonControl _cmdSave;
    public  Sage.Platform.Controls.IButtonControl cmdSave
    {
        get { return FindControl(ref _cmdSave, "cmdSave"); }
    }

    public  void OnLoad1(System.EventArgs e)
    {
        Sage.Platform.DynamicMethod.DynamicMethodLibrary lib = Sage.Platform.Orm.DynamicMethodLibraryHelper.Instance;
        Object[] methodArgs = new Object[] { this, e };
        lib.Execute("InsertLiteratureItem.OnLoad1", methodArgs);
    }
}

</script>

<script type="text/javascript">
</script>
