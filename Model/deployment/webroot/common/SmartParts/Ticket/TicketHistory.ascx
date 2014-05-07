<%@ Control Language="C#" ClassName="TicketHistory" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
         <col width="10%" />
            <col width="10%" />
            <col width="10%" />
            <col width="10%" />
     <tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="ownReceivedBy_lbl" AssociatedControlID="ownReceivedBy" runat="server" Text="<%$ resources: ownReceivedBy.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol"  > 
<SalesLogix:OwnerControl runat="server" ID="ownReceivedBy" ButtonToolTip="<%$ resources: ownReceivedBy.ButtonToolTip %>" AutoPostBack="true" Types="$qfcontrol.Types"  />
  </div>

      </td>
                <td  >
  <div  class="textcontrol datepicker"  >
    <SalesLogix:DateTimePicker runat="server" ID="dtpReceivedDate" ButtonToolTip="<%$ resources: dtpReceivedDate.ButtonToolTip %>" />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="usrCreateUser_lbl" AssociatedControlID="usrCreateUser" runat="server" Text="<%$ resources: usrCreateUser.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol"  > 
    <SalesLogix:SlxUserControl runat="server" ID="usrCreateUser" ReadOnly="true"  />
  </div>

      </td>
                <td  >
  <div  class="textcontrol datepicker"  >
    <SalesLogix:DateTimePicker runat="server" ID="dtpCreateDate" ReadOnly="true" />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="ownCompletedBy_lbl" AssociatedControlID="ownCompletedBy" runat="server" Text="<%$ resources: ownCompletedBy.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol"  > 
<SalesLogix:OwnerControl runat="server" ID="ownCompletedBy" ButtonToolTip="<%$ resources: ownCompletedBy.ButtonToolTip %>" AutoPostBack="true" Types="$qfcontrol.Types"  />
  </div>

      </td>
                <td  >
  <div  class="textcontrol datepicker"  >
    <SalesLogix:DateTimePicker runat="server" ID="dtpCompletedDate" ButtonToolTip="<%$ resources: dtpCompletedDate.ButtonToolTip %>" />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="usrModifyUser_lbl" AssociatedControlID="usrModifyUser" runat="server" Text="<%$ resources: usrModifyUser.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol"  > 
    <SalesLogix:SlxUserControl runat="server" ID="usrModifyUser" ReadOnly="true"  />
  </div>

      </td>
                <td  >
  <div  class="textcontrol datepicker"  >
    <SalesLogix:DateTimePicker runat="server" ID="dtpModifyDate" ReadOnly="true" />
  </div>

      </td>
      </tr>
<tr>
            <td  >
<div class="slxlabel  alignleft  checkbox ">

  <SalesLogix:SLXCheckBox runat="server" ID="chkCompletedByNeededDate"  Text="<%$ resources: chkCompletedByNeededDate.Caption %>"  CssClass=""
Enabled="false" LabelPlacement="right"  />
</div>
      </td>
                <td></td>
                <td></td>
                <td></td>
      </tr>
<tr>
            <td  colspan="4" >
<div class="mainContentHeader2"><span id="hzsAuditTrail" 	>
<asp:Localize runat="server" Text="<%$ resources: hzsAuditTrail.Caption %>"   >Audit Trail</asp:Localize></span></div>


      </td>
                        </tr>
<tr>
            <td  colspan="4" >
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

 

<SalesLogix:ScriptResourceProvider ID="TicketHistoryQFSDataGrid_Strings" runat="server">
    <Keys>
        <SalesLogix:ResourceKeyName Key="QFSDataGrid.EmptyTableRowText" />  <SalesLogix:ResourceKeyName Key="QFSDataGrid.172d76f3-99b4-4ea1-8414-da75e5e88912.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.51deac7c-b02d-44ec-97ca-b8fea21eea43.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.d1f6b256-d567-40b6-ae8a-8a3bc328b642.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.19b71659-8053-4cb9-8f99-81170e06c1f7.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.de9a042c-2163-485e-8896-186e17d886ca.ColumnHeading" />
       <SalesLogix:ResourceKeyName Key="QFSDataGrid.0bed4c04-75b7-4c30-b38f-adc480b39157.ColumnHeading" />
            </Keys>
</SalesLogix:ScriptResourceProvider>

						 
  <div id="TicketHistoryQFSDataGrid_Container" style="width:100%;height:100%;" class="">
    <div id="TicketHistoryQFSDataGrid_Grid" style="width:100%;height:100%;"
     data-dojo-type="dijit.layout.BorderContainer"
></div>
</div>



      </td>
                        </tr>
<tr>
            <td></td>
                <td></td>
                <td></td>
                <td></td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="TicketHistory_RTools" ToolbarLocation="right">
    <asp:ImageButton runat="server" ID="cmdSave"
 AlternateText="<%$ resources: cmdSave.Caption %>"  ToolTip="<%$ resources: cmdSave.ToolTip %>" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Save_16x16"  />
   
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=TicketHistory&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkTicketHistoryHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="TicketHistory" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.ITicket); }
}

 private Sage.Platform.WebPortal.Binding.WebEntityListBindingSource _dtsHistory;
public Sage.Platform.WebPortal.Binding.WebEntityListBindingSource dtsHistory
{ 
  get 
  {
    if (_dtsHistory == null)
    {
             _dtsHistory = new Sage.Platform.WebPortal.Binding.WebEntityListBindingSource(typeof(Sage.Entity.Interfaces.ITicketHistory), 
	    EntityType              ,"TicketHistory", System.Reflection.MemberTypes.Property);
                   _dtsHistory.UseSmartQuery = true;
      	   	}
 	return _dtsHistory;
  }
}

void dtsHistory_OnCurrentEntitySet(object sender, EventArgs e) 
{
      if (Visible)
    { 
		if(BindingSource.Current != null)
		{
		
      
        dtsHistory.SourceObject = BindingSource.Current;
   		}
    }
   if (Visible)
   {   
      RegisterBindingsWithClient(dtsHistory);
   }
}

 



 

protected override void OnAddEntityBindings() {
                 // ownReceivedBy.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ownReceivedByLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("ReceivedBy", ownReceivedBy, "LookupResultValue", "", null);
        BindingSource.Bindings.Add(ownReceivedByLookupResultValueBinding);
                    // dtpReceivedDate.DateTimeValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding dtpReceivedDateDateTimeValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("ReceivedDate", dtpReceivedDate, "DateTimeValue", "", null);
        BindingSource.Bindings.Add(dtpReceivedDateDateTimeValueBinding);
                    // usrCreateUser.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding usrCreateUserLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CreateUser", usrCreateUser, "LookupResultValue");
        BindingSource.Bindings.Add(usrCreateUserLookupResultValueBinding);
                    // dtpCreateDate.DateTimeValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding dtpCreateDateDateTimeValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CreateDate", dtpCreateDate, "DateTimeValue", "", null);
        BindingSource.Bindings.Add(dtpCreateDateDateTimeValueBinding);
                    // ownCompletedBy.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding ownCompletedByLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CompletedBy", ownCompletedBy, "LookupResultValue", "", null);
        BindingSource.Bindings.Add(ownCompletedByLookupResultValueBinding);
                    // dtpCompletedDate.DateTimeValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding dtpCompletedDateDateTimeValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CompletedDate", dtpCompletedDate, "DateTimeValue", "", null);
        BindingSource.Bindings.Add(dtpCompletedDateDateTimeValueBinding);
                    // usrModifyUser.LookupResultValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding usrModifyUserLookupResultValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("ModifyUser", usrModifyUser, "LookupResultValue");
        BindingSource.Bindings.Add(usrModifyUserLookupResultValueBinding);
                    // dtpModifyDate.DateTimeValue Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding dtpModifyDateDateTimeValueBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("ModifyDate", dtpModifyDate, "DateTimeValue", "", null);
        BindingSource.Bindings.Add(dtpModifyDateDateTimeValueBinding);
                    // chkCompletedByNeededDate.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkCompletedByNeededDateCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CompletedByNeededDate", chkCompletedByNeededDate, "Checked", "", null);
        BindingSource.Bindings.Add(chkCompletedByNeededDateCheckedBinding);
          
     BindingSource.OnCurrentEntitySet += new EventHandler(dtsHistory_OnCurrentEntitySet);
    
    }
                                                                             
protected void cmdSave_ClickAction(object sender, EventArgs e) {
  Sage.Entity.Interfaces.ITicket _entity = BindingSource.Current as Sage.Entity.Interfaces.ITicket;
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

  
}

protected override void OnWireEventHandlers()
{
 base.OnWireEventHandlers();
 cmdSave.Click += new ImageClickEventHandler(cmdSave_ClickAction);


}

protected override void OnFormBound()
{
ClientBindingMgr.RegisterSaveButton(cmdSave);

if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
if (dtsHistory.SourceObject == null) { dtsHistory.SourceObject = BindingSource.Current; }
if (dtsHistory.SourceObject == null) { RegisterBindingsWithClient(dtsHistory); }
dtsHistory.Bind();


                                var script = new StringBuilder();
                                script.AppendLine("require(['" + Page.ResolveUrl("~/SmartParts/Ticket/TicketHistory.js") + "'], function () {");
                                if (Page.IsPostBack)
                                {
                                    script.Append(" Sage.UI.Forms.TicketHistory.init({workspace: '" + getMyWorkspace() + "'} );");
                                }
                                else 
                                {
                                    script.AppendLine("require(['dojo/ready'], function(ready) {");
                                    script.Append("ready(function () {Sage.UI.Forms.TicketHistory.init({workspace: '" + getMyWorkspace() + "'} ); });");
                                    script.AppendLine("});");//end ready require
                                }

                                script.AppendLine("});");// end require
                                ScriptManager.RegisterStartupScript(this, GetType(), "initialize_TicketHistory", script.ToString(), true);


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
    get { return _formAdapter ?? (_formAdapter = new TicketHistoryAdapter(this)); }
}

public class TicketHistoryAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.ITicketHistory
{
    public TicketHistoryAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.IOwnerControl _ownReceivedBy;
    public  Sage.Platform.Controls.IOwnerControl ownReceivedBy
    {
        get { return FindControl(ref _ownReceivedBy, "ownReceivedBy"); }
    }
    private Sage.Platform.Controls.IOwnerControl _ownCompletedBy;
    public  Sage.Platform.Controls.IOwnerControl ownCompletedBy
    {
        get { return FindControl(ref _ownCompletedBy, "ownCompletedBy"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkCompletedByNeededDate;
    public  Sage.Platform.Controls.ICheckBoxControl chkCompletedByNeededDate
    {
        get { return FindControl(ref _chkCompletedByNeededDate, "chkCompletedByNeededDate"); }
    }
    private Sage.Platform.Controls.IDateTimePickerControl _dtpReceivedDate;
    public  Sage.Platform.Controls.IDateTimePickerControl dtpReceivedDate
    {
        get { return FindControl(ref _dtpReceivedDate, "dtpReceivedDate"); }
    }
    private Sage.Platform.Controls.IDateTimePickerControl _dtpCompletedDate;
    public  Sage.Platform.Controls.IDateTimePickerControl dtpCompletedDate
    {
        get { return FindControl(ref _dtpCompletedDate, "dtpCompletedDate"); }
    }
    private Sage.Platform.Controls.IUserControl _usrCreateUser;
    public  Sage.Platform.Controls.IUserControl usrCreateUser
    {
        get { return FindControl(ref _usrCreateUser, "usrCreateUser"); }
    }
    private Sage.Platform.Controls.IUserControl _usrModifyUser;
    public  Sage.Platform.Controls.IUserControl usrModifyUser
    {
        get { return FindControl(ref _usrModifyUser, "usrModifyUser"); }
    }
    private Sage.Platform.Controls.IDateTimePickerControl _dtpCreateDate;
    public  Sage.Platform.Controls.IDateTimePickerControl dtpCreateDate
    {
        get { return FindControl(ref _dtpCreateDate, "dtpCreateDate"); }
    }
    private Sage.Platform.Controls.IDateTimePickerControl _dtpModifyDate;
    public  Sage.Platform.Controls.IDateTimePickerControl dtpModifyDate
    {
        get { return FindControl(ref _dtpModifyDate, "dtpModifyDate"); }
    }
    private Sage.Platform.Controls.IDataSourceControl _dtsHistory;
    public  Sage.Platform.Controls.IDataSourceControl dtsHistory
    {
        get { return FindControl(ref _dtsHistory, "dtsHistory"); }
    }
    private Sage.Platform.Controls.IButtonControl _cmdSave;
    public  Sage.Platform.Controls.IButtonControl cmdSave
    {
        get { return FindControl(ref _cmdSave, "cmdSave"); }
    }

}

</script>

<script type="text/javascript">
</script>