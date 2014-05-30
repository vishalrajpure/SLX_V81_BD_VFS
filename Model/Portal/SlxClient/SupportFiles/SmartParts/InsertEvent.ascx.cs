using System;
using System.Web.UI;
using System.Collections.Generic;
using Sage.Platform.WebPortal.SmartParts;
using Sage.Entity.Interfaces;
using Sage.Platform.Orm.Interfaces;
using Sage.Platform.ComponentModel;
using Sage.Platform.EntityBinding;
using Sage.Platform.Application.UI;
using Sage.Platform.WebPortal.Services;
using Sage.SalesLogix.Address;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class SmartParts_InsertEvent : EntityBoundSmartPartInfoProvider
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private IPersistentEntity _parentEntity;
    private IComponentReference _parentEntityReference;
    private string _id = "";
    private string _name = "";
    private string _entityid = "";

    /// <summary>
    /// Gets the type of the entity.
    /// </summary>
    /// <value>The type of the entity.</value>
    public override Type EntityType
    {
        get { return typeof(IEvent); }
    }

    /// <summary>
    /// Override this method to add bindings to the currently bound smart part
    /// </summary>
    protected override void OnAddEntityBindings()
    {
        BindingSource.AddBindingProvider(txtEntityId as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("EntityId", txtEntityId, "Value", "", ""));

        BindingSource.AddBindingProvider(pklType as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Type", pklType, "PickListValue", "", ""));      
      
        BindingSource.AddBindingProvider(txtDescription as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Description", txtDescription, "Text", "", ""));

        BindingSource.AddBindingProvider(txtDuration as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Duration", txtDuration, "Text", "", ""));

        BindingSource.AddBindingProvider(dtStartDate as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("StartDate", dtStartDate, "DateTimeValue", "", ""));

        BindingSource.AddBindingProvider(dtEndDate as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("EndDate", dtEndDate, "DateTimeValue", "", ""));

        BindingSource.AddBindingProvider(usrUser as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("UserId", usrUser, "LookupResultValue", "", ""));

       
    }

    /// <summary>
    /// Handles the Init event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Init(object sender, EventArgs e)
    {
        txtDescription.MaxLength = 128;
        pklType.MaxLength = 32;
        txtDuration.MaxLength = 64;        
        Mode.Value = "ADD";
        lblStartDate.ForeColor = System.Drawing.Color.Red;
        lblenddate.ForeColor = System.Drawing.Color.Red;
        lblpklType.ForeColor = System.Drawing.Color.Red;
        lblduration.ForeColor = System.Drawing.Color.Red;
    }

    /// <summary>
    /// Derived components should override this method to wire up event handlers.
    /// </summary>
    protected override void OnWireEventHandlers()
    {
        cmdSave.Click += cmdSave_ClickAction;
       // btnSave.Click += btnSave_ClickAction;
       // btnSave.Click += DialogService.CloseEventHappened;
       // btnCancel.Click += DialogService.CloseEventHappened;

        base.OnWireEventHandlers();
    }

    /// <summary>
    /// Called when the smartpart has been bound.  Derived components should override this method to run code that depends on entity context being set and it not changing.
    /// </summary>
    protected override void OnFormBound()
    {
        base.OnFormBound();

        _parentEntity = GetParentEntity() as IPersistentEntity;
        _parentEntityReference = _parentEntity as IComponentReference;
        
        Sage.SalesLogix.Activity.Event slxEvent = this.BindingSource.Current as Sage.SalesLogix.Activity.Event;
       
        if (slxEvent != null)
        {
           // Delete.Visible = (slxEvent.Id != null);

          /* usrUser.Items.Clear();
            foreach (var uc in Sage.SalesLogix.Activity.UserCalendar.GetCurrentUserCalendarList())
            {
                if (uc.AllowAdd == true)
                {
                    ListItem li = new ListItem(uc.UserName, uc.CalUser.Id.ToString().Trim());
                    UserId.Items.Add(li);
                }
            }

            UserId.SelectedValue = slxEvent.UserId;*/

            DateTime defaultDate;
            if (Request.QueryString["startdate"] != null)
            {
                defaultDate = Convert.ToDateTime(Server.UrlDecode(Request.QueryString["startdate"]));

                if (defaultDate != null)
                {
                    DateTime startDate = new DateTime(defaultDate.Year, defaultDate.Month, defaultDate.Day, 0, 0, 5);
                    slxEvent.StartDate = startDate;
                    slxEvent.EndDate = startDate;
                }
            }

            ((Sage.Platform.WebPortal.EntityPage)Page).TitleBar.Text =
                System.Web.HttpContext.GetLocalResourceObject(Request.CurrentExecutionFilePath, "PageTitle").ToString();
        }
       

    }

    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        if (BindingSource != null)
        {
            if (BindingSource.Current != null)
            {
                IEvent address = (IEvent)BindingSource.Current;
                txtEntityId.Value = "";// _parentEntityReference.Id.ToString();                

                if (_parentEntityReference is IEvent)
                {
                    tinfo.Title = Mode.Value == "ADD" ? "Insert Event" : "Event Detail";
                }
               
            }
        }

        foreach (Control c in AddressForm_LTools.Controls)
            tinfo.LeftTools.Add(c);
        foreach (Control c in AddressForm_CTools.Controls)
            tinfo.CenterTools.Add(c);
        foreach (Control c in AddressForm_RTools.Controls)
            tinfo.RightTools.Add(c);
        return tinfo;
    }

    /// <summary>
    /// Handles the ClickAction event of the btnSave control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void cmdSave_ClickAction(object sender, EventArgs e)
    {
        try
        {
            IEvent curevnt = this.BindingSource.Current as IEvent;
            if (curevnt != null)
            {
                curevnt.Duration = txtDuration.PickListValue;
                curevnt.Save();
                Response.Redirect(string.Format("Calendar.aspx?modeid=Detail"));
            }
            /*  string _parentId = "";
              string _Entityid = "";
              if (ViewState["parentEntityID"] != null)
              {
                  if (ViewState["parentEntity"].ToString() == "Contact")
                  {
                      Sage.Entity.Interfaces.IContact objcontact = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IContact>(ViewState["parentEntityID"].ToString());
                      _Entityid = objcontact.Address.Id.ToString();
                  }
                  else
                  {
                      Sage.Entity.Interfaces.IAccount objaccount = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAccount>(ViewState["parentEntityID"].ToString());
                      _Entityid = objaccount.Address.Id.ToString();
                  }
                  if (_parentId != null)
                  {
                      IEvent curAdd = this.BindingSource.Current as IEvent;
                      Sage.Entity.Interfaces.IEvent objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IEvent>(_Entityid);
                      if (objadd != null)
                      {
                          objadd.Address1 = curAdd.Address1;
                          objadd.Address2 = curAdd.Address2;
                          objadd.Address3 = curAdd.Address3;
                          objadd.AddressType = curAdd.AddressType;
                          objadd.City = curAdd.City;
                          objadd.Country = curAdd.Country;
                          objadd.IsPrimary = curAdd.IsPrimary;
                          objadd.Latitude = curAdd.Latitude;
                          objadd.Logitude = curAdd.Logitude;
                          objadd.PostalCode = curAdd.PostalCode;
                          objadd.Salutation = curAdd.Salutation;
                          objadd.State = curAdd.State;
                          objadd.Save();
                          Response.Redirect(string.Format(Calendar.aspx?modeid=Detail));
                      }
                  }
              }
              else
              {
                  IEvent curAdd1 = this.BindingSource.Current as IEvent;
                  curAdd1.EntityId = "123123123123";
                  curAdd1.Save();
                  Session["Addressid"] = curAdd1.Id.ToString();
                  // Response.Redirect(string.Format("InsertContactAccount.aspx?modeid=Insert"));
              }*/
        }
        catch (Exception ex)
        {
        }

    }

    private void UpdateFlags()
    {
        var thisaddress = BindingSource.Current as IEvent;
        var pi = _parentEntityReference.GetType().GetProperty("Event");
        if (pi != null)
        {
            foreach (var adr in (pi.GetValue(_parentEntityReference, null) as ICollection<IEvent>))
            {
                if (adr != thisaddress)
                {
                   // adr..IsMailing = Convert.ToBoolean(thisaddress.IsMailing) ? false : adr.IsMailing;
                  //  adr.IsPrimary = Convert.ToBoolean(thisaddress.IsPrimary) ? false : adr.IsPrimary;
                   // adr.PrimaryAddress = Convert.ToBoolean(thisaddress.PrimaryAddress) ? false : adr.PrimaryAddress;
                }
            }
        }
    }

    /// <summary>
    /// Handles the ClickActionBRC event of the btnSave control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
   // protected void btnSave_ClickActionBRC(object sender, EventArgs e)
   // {
   //     IPanelRefreshService refresher = PageWorkItem.Services.Get<IPanelRefreshService>();
   //     refresher.RefreshAll();
   // }
    
  
}