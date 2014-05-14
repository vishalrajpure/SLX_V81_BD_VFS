<%@ Control Language="C#" ClassName="EditOpportunityCompetitor" Inherits="Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider" %>
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
         <col width="33.33333%" />
            <col width="33.33333%" />
     <tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtCompetitorName_lbl" AssociatedControlID="txtCompetitorName" runat="server" Text="<%$ resources: txtCompetitorName.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtCompetitorName" ReadOnly="true"  dojoType="Sage.UI.Controls.TextBox"  />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtWebAddress_lbl" AssociatedControlID="txtWebAddress" runat="server" Text="<%$ resources: txtWebAddress.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtWebAddress" ReadOnly="true"  dojoType="Sage.UI.Controls.TextBox"  />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="txtRating_lbl" AssociatedControlID="txtRating" runat="server" Text="<%$ resources: txtRating.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol numeric"  > 
    <SalesLogix:NumericControl runat="server" ID="txtRating"
Strict="False" 
 />
  </div>

      </td>
                <td  >
<div class="slxlabel  alignleft checkboxRight">

  <SalesLogix:SLXCheckBox runat="server" ID="chkIncumbent"  Text="<%$ resources: chkIncumbent.Caption %>"  CssClass=""
LabelPlacement="left"  />
</div>
      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtStrengths_lbl" AssociatedControlID="txtStrengths" runat="server" Text="<%$ resources: txtStrengths.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtStrengths"  Rows="3" TextMode="MultiLine" Columns="40" dojoType="Sage.UI.Controls.SimpleTextarea"  />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtWeaknesses_lbl" AssociatedControlID="txtWeaknesses" runat="server" Text="<%$ resources: txtWeaknesses.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtWeaknesses"  Rows="3" TextMode="MultiLine" Columns="40" dojoType="Sage.UI.Controls.SimpleTextarea"  />
  </div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtStrategy_lbl" AssociatedControlID="txtStrategy" runat="server" Text="<%$ resources: txtStrategy.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtStrategy"  Rows="3" TextMode="MultiLine" Columns="40" dojoType="Sage.UI.Controls.SimpleTextarea"  />
  </div>

      </td>
                <td  >
 <div class=" lbl alignleft" >
   <asp:Label ID="txtNotes_lbl" AssociatedControlID="txtNotes" runat="server" Text="<%$ resources: txtNotes.Caption %>" ></asp:Label>
 </div>
  <div  class="textcontrol"   >
<asp:TextBox runat="server" ID="txtNotes"  Rows="3" TextMode="MultiLine" Columns="40" dojoType="Sage.UI.Controls.SimpleTextarea"  />
  </div>

      </td>
      </tr>
<tr>
            <td  >
<div class="slxlabel  alignleft checkboxRight">

  <SalesLogix:SLXCheckBox runat="server" ID="chkCurrentMajorCompetitor"  Text="<%$ resources: chkCurrentMajorCompetitor.Caption %>"  CssClass=""
LabelPlacement="left"  />
</div>
      </td>
                <td  >
<div class=" lbl alignleft">
    <asp:Label ID="txtCompetitorRate_lbl" AssociatedControlID="txtCompetitorRate" runat="server" Text="<%$ resources: txtCompetitorRate.Caption %>" ></asp:Label>
</div>
 <div  class="textcontrol currency"  >
    <SalesLogix:Currency
    runat="server"
    ID="txtCompetitorRate" 
    ExchangeRateType="BaseRate"
     Required="false"
 DecimalDigits="-1"
 />
</div>

      </td>
      </tr>
<tr>
            <td  >
 <div class=" lbl alignleft">
   <asp:Label ID="txtCompetitorShareOfWellet_lbl" AssociatedControlID="txtCompetitorShareOfWellet" runat="server" Text="<%$ resources: txtCompetitorShareOfWellet.Caption %>" ></asp:Label>
 </div>   
   <div  class="textcontrol numeric"  > 
    <SalesLogix:NumericControl runat="server" ID="txtCompetitorShareOfWellet"
Strict="False" 
 />
  </div>

      </td>
                <td></td>
      </tr>
<tr>
            <td></td>
                <td  >
<asp:Panel runat="server" ID="QFControlsList" CssClass="controlslist qfActionContainer"
>
   <asp:Button runat="server" ID="btnOk"
 Text="<%$ resources: btnOk.Caption %>" CssClass="slxbutton"  />
   
   <asp:Button runat="server" ID="btnCancel"
 Text="<%$ resources: btnCancel.Caption %>" CssClass="slxbutton"  />
 
</asp:Panel>
      </td>
      </tr>
</table>
 


 <SalesLogix:SmartPartToolsContainer runat="server" ID="EditOpportunityCompetitor_RTools" ToolbarLocation="right">
  <SalesLogix:PageLink ID="btnEditForm" CssClass="adminEditFormButton" runat="server" LinkType="RelativePath" ToolTip="<%$ resources: Portal, EditForm_ToolTip %>" NavigateUrl="~/FormManager.aspx?entityid=EditOpportunityCompetitor&modeid=Detail" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=form_manager_16x16"></SalesLogix:PageLink>
 
 
 
 
 <SalesLogix:PageLink ID="lnkEditOpportunityCompetitorHelp" runat="server" LinkType="HelpFileName" ToolTip="<%$ resources: Portal, Help_ToolTip %>" Target="MCWebHelp" NavigateUrl="EditOpportunityCompetitor" ImageUrl="~/ImageResource.axd?scope=global&type=Global_Images&key=Help_16x16"></SalesLogix:PageLink>
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
    get { return typeof(Sage.Entity.Interfaces.IOpportunityCompetitor); }
}

 

protected override void OnAddEntityBindings() {
                 // txtCompetitorName.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtCompetitorNameTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Competitor.CompetitorName", txtCompetitorName, "Text");
        BindingSource.Bindings.Add(txtCompetitorNameTextBinding);
                    // txtWebAddress.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtWebAddressTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Competitor.WebAddress", txtWebAddress, "Text");
        BindingSource.Bindings.Add(txtWebAddressTextBinding);
                    // txtRating.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtRatingTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Rating", txtRating, "Text");
        BindingSource.Bindings.Add(txtRatingTextBinding);
                    // chkIncumbent.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkIncumbentCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Incumbent", chkIncumbent, "Checked");
        BindingSource.Bindings.Add(chkIncumbentCheckedBinding);
                    // txtStrengths.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtStrengthsTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Strengths", txtStrengths, "Text");
        BindingSource.Bindings.Add(txtStrengthsTextBinding);
                    // txtWeaknesses.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtWeaknessesTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Weaknesses", txtWeaknesses, "Text");
        BindingSource.Bindings.Add(txtWeaknessesTextBinding);
                    // txtStrategy.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtStrategyTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Strategy", txtStrategy, "Text");
        BindingSource.Bindings.Add(txtStrategyTextBinding);
                    // txtNotes.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtNotesTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("Notes", txtNotes, "Text");
        BindingSource.Bindings.Add(txtNotesTextBinding);
                    // chkCurrentMajorCompetitor.Checked Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding chkCurrentMajorCompetitorCheckedBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CurrentMajorCompetitor", chkCurrentMajorCompetitor, "Checked");
        BindingSource.Bindings.Add(chkCurrentMajorCompetitorCheckedBinding);
                    // txtCompetitorRate.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtCompetitorRateTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CompetitorRate", txtCompetitorRate, "Text");
        BindingSource.Bindings.Add(txtCompetitorRateTextBinding);
                    // txtCompetitorShareOfWellet.Text Binding
        Sage.Platform.WebPortal.Binding.WebEntityBinding txtCompetitorShareOfWelletTextBinding = new Sage.Platform.WebPortal.Binding.WebEntityBinding("CompetitorShareOfWellet", txtCompetitorShareOfWellet, "Text");
        BindingSource.Bindings.Add(txtCompetitorShareOfWelletTextBinding);
             
   
}
                                                                                                  
protected void btnOk_ClickAction(object sender, EventArgs e) {
  Sage.Entity.Interfaces.IOpportunityCompetitor _entity = BindingSource.Current as Sage.Entity.Interfaces.IOpportunityCompetitor;
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
 btnOk.Click += new EventHandler(btnOk_ClickAction);
btnOk.Click += new EventHandler(DialogService.CloseEventHappened);
btnOk.Click += new EventHandler(Refresh);
btnCancel.Click += new EventHandler(DialogService.CloseEventHappened);


}

protected override void OnFormBound()
{
ClientBindingMgr.RegisterSaveButton(btnOk);

ScriptManager.RegisterStartupScript(Page, GetType(), "cleanupcontainer", "jQuery(\".controlslist > div:empty\").remove();", true);
if (!RoleSecurityService.HasAccess("Administration/Forms/View"))
{
btnEditForm.Visible = false;
}
ClientBindingMgr.RegisterDialogCancelButton(btnCancel);


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
    get { return _formAdapter ?? (_formAdapter = new EditOpportunityCompetitorAdapter(this)); }
}

public class EditOpportunityCompetitorAdapter : Sage.Platform.WebPortal.Adapters.EntityFormAdapter, Sage.Form.Interfaces.IEditOpportunityCompetitor
{
    public EditOpportunityCompetitorAdapter(Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPartInfoProvider smartPart)
        : base(smartPart) {}

    private Sage.Platform.Controls.ITextBoxControl _txtCompetitorName;
    public  Sage.Platform.Controls.ITextBoxControl txtCompetitorName
    {
        get { return FindControl(ref _txtCompetitorName, "txtCompetitorName"); }
    }
    private Sage.Platform.Controls.INumericControl _txtRating;
    public  Sage.Platform.Controls.INumericControl txtRating
    {
        get { return FindControl(ref _txtRating, "txtRating"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtStrengths;
    public  Sage.Platform.Controls.ITextBoxControl txtStrengths
    {
        get { return FindControl(ref _txtStrengths, "txtStrengths"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtStrategy;
    public  Sage.Platform.Controls.ITextBoxControl txtStrategy
    {
        get { return FindControl(ref _txtStrategy, "txtStrategy"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkCurrentMajorCompetitor;
    public  Sage.Platform.Controls.ICheckBoxControl chkCurrentMajorCompetitor
    {
        get { return FindControl(ref _chkCurrentMajorCompetitor, "chkCurrentMajorCompetitor"); }
    }
    private Sage.Platform.Controls.INumericControl _txtCompetitorShareOfWellet;
    public  Sage.Platform.Controls.INumericControl txtCompetitorShareOfWellet
    {
        get { return FindControl(ref _txtCompetitorShareOfWellet, "txtCompetitorShareOfWellet"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtWebAddress;
    public  Sage.Platform.Controls.ITextBoxControl txtWebAddress
    {
        get { return FindControl(ref _txtWebAddress, "txtWebAddress"); }
    }
    private Sage.Platform.Controls.ICheckBoxControl _chkIncumbent;
    public  Sage.Platform.Controls.ICheckBoxControl chkIncumbent
    {
        get { return FindControl(ref _chkIncumbent, "chkIncumbent"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtWeaknesses;
    public  Sage.Platform.Controls.ITextBoxControl txtWeaknesses
    {
        get { return FindControl(ref _txtWeaknesses, "txtWeaknesses"); }
    }
    private Sage.Platform.Controls.ITextBoxControl _txtNotes;
    public  Sage.Platform.Controls.ITextBoxControl txtNotes
    {
        get { return FindControl(ref _txtNotes, "txtNotes"); }
    }
    private Sage.Platform.Controls.ICurrencyControl _txtCompetitorRate;
    public  Sage.Platform.Controls.ICurrencyControl txtCompetitorRate
    {
        get { return FindControl(ref _txtCompetitorRate, "txtCompetitorRate"); }
    }
    private Sage.Platform.Controls.IControlsListControl _QFControlsList;
    public  Sage.Platform.Controls.IControlsListControl QFControlsList
    {
        get { return FindControl(ref _QFControlsList, "QFControlsList"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnOk;
    public  Sage.Platform.Controls.IButtonControl btnOk
    {
        get { return FindControl(ref _btnOk, "btnOk"); }
    }
    private Sage.Platform.Controls.IButtonControl _btnCancel;
    public  Sage.Platform.Controls.IButtonControl btnCancel
    {
        get { return FindControl(ref _btnCancel, "btnCancel"); }
    }

}

</script>

<script type="text/javascript">
</script>
