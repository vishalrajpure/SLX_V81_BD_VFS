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
using System.Web;

public partial class SmartParts_Address_AddEditAddress : EntityBoundSmartPartInfoProvider
{
    private IPersistentEntity _parentEntity;
    private IComponentReference _parentEntityReference;

    /// <summary>
    /// Gets the type of the entity.
    /// </summary>
    /// <value>The type of the entity.</value>
    public override Type EntityType
    {
        get { return typeof(IAddress); }
    }

    /// <summary>
    /// Override this method to add bindings to the currently bound smart part
    /// </summary>
    protected override void OnAddEntityBindings()
    {
        if (BindingSource != null)
        {
            BindingSource.AddBindingProvider(txtEntityId as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("EntityId", txtEntityId, "Value", "", ""));

            BindingSource.AddBindingProvider(pklDecription as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Description", pklDecription, "PickListValue", "", ""));

            BindingSource.AddBindingProvider(cbxPrimaryAddr as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("PrimaryAddress", cbxPrimaryAddr, "Checked", "", false));

            BindingSource.AddBindingProvider(cbxIsPrimary as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("IsPrimary", cbxIsPrimary, "Checked", "", false));

            BindingSource.AddBindingProvider(cbxIsShipping as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("IsMailing", cbxIsShipping, "Checked", "", false));

            BindingSource.AddBindingProvider(pklAddressType as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("AddressType", pklAddressType, "PickListValue", "", ""));

            BindingSource.AddBindingProvider(txtAddress1 as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Address1", txtAddress1, "Text", "", ""));

            BindingSource.AddBindingProvider(txtAddress2 as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Address2", txtAddress2, "Text", "", ""));

            BindingSource.AddBindingProvider(txtAddress3 as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Address3", txtAddress3, "Text", "", ""));

            BindingSource.AddBindingProvider(pklCity as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("City", pklCity, "PickListValue", "", ""));

            BindingSource.AddBindingProvider(pklState as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("State", pklState, "PickListValue", "", ""));

            BindingSource.AddBindingProvider(txtPostalCode as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("PostalCode", txtPostalCode, "Text", "", ""));

            //BindingSource.AddBindingProvider(txtCounty as IEntityBindingProvider);
            //BindingSource.Bindings.Add(new PropertyBinding("County", txtCounty, "Text", "", ""));

            BindingSource.AddBindingProvider(pklCountry as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Country", pklCountry, "PickListValue", "", ""));

            BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Salutation", txtSalutation, "Text", "", ""));

            BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Latitude", txtLatitude, "Text", "", ""));

            BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
            BindingSource.Bindings.Add(new PropertyBinding("Logitude", txtLogitute, "Text", "", ""));
        }
        

    }

    /// <summary>
    /// Handles the Init event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Init(object sender, EventArgs e)
    {
        pklDecription.MaxLength = 64;
        pklCity.MaxLength = 32;
        pklState.MaxLength = 32;
        pklCountry.MaxLength = 32;
        pklAddressType.MaxLength = 32;
    }

    /// <summary>
    /// Derived components should override this method to wire up event handlers.
    /// </summary>
    protected override void OnWireEventHandlers()
    {
        btnSave.Click += btnSave_ClickAction;       
        btnSave.Click += DialogService.CloseEventHappened;
        btnCancel.Click += DialogService.CloseEventHappened;

        btngetGL.Click += btngetGL_ClickAction;
       // btngetGL.Click += DialogService.CloseEventHappened;
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
        ClientBindingMgr.RegisterDialogCancelButton(btnCancel);       

    }

    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        if (BindingSource != null)
        {
            if (BindingSource.Current != null)
            {
                btngetGL.Visible = false;
				btnCancelDetail.Visible = false;
				btnSave.Visible = true;
				btnCancel.Visible = true;
                IAddress address = (IAddress)BindingSource.Current;
                if (_parentEntityReference.Id != null)
                {
                    txtEntityId.Value = _parentEntityReference.Id.ToString();
                }
                else
                {
                    txtEntityId.Value = "";
                }

                if (address.Id != null)
                {
                    cbxIsPrimary.Enabled = (address.IsPrimary != true);
                    cbxIsShipping.Enabled = (address.IsMailing != true);
                    Mode.Value = "UPDATE";
                }
                else
                {
                    Mode.Value = "ADD";
                    pklDecription.PickListValue = GetLocalResourceObject("DefaultDescription").ToString();
                }

                if (_parentEntityReference is IAccount)
                {
                    tinfo.Title = Mode.Value == "ADD"
                                      ? GetLocalResourceObject("DialogTitleAccountAdd").ToString()
                                      : GetLocalResourceObject("DialogTitleAccountEdit").ToString();
                }
                if (_parentEntityReference is IContact)
                {
                    tinfo.Title = Mode.Value == "ADD"
                                      ? GetLocalResourceObject("DialogTitleContactAdd").ToString()
                                      : GetLocalResourceObject("DialogTitleContactEdit").ToString();
                }

                if (!(_parentEntityReference is IAccount || _parentEntityReference is IContact))
                {
                    tinfo.Title = Mode.Value == "ADD"
                                      ? GetLocalResourceObject("DialogTitleAdd").ToString()
                                      : GetLocalResourceObject("DialogTitleEdit").ToString();
                }
            }
            else
            {
                if (Request.QueryString["Type"] != null)
                {
                    
                    btngetGL.Visible = true;
					btnCancelDetail.Visible = true;
					btnSave.Visible = false;
					btnCancel.Visible = false;
					if(!Page.IsPostBack)
					{
						if(Request.QueryString["id"] != null)
						{
		                    string _addid = Request.QueryString["id"].ToString();
		                    Sage.Entity.Interfaces.IAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(_addid);
		                    if (objadd != null)
		                    {
		                        pklDecription.PickListValue = objadd.Description;
		                        txtAddress1.Text = objadd.Address1;
		                        txtAddress2.Text = objadd.Address2;
		                        txtAddress3.Text = objadd.Address3;
		                        pklAddressType.PickListValue = objadd.AddressType;
		                        pklCity.PickListValue = objadd.City;
		                        pklState.PickListValue = objadd.State;
		                        pklCountry.PickListValue = objadd.Country;
		                        cbxPrimaryAddr.Checked = objadd.IsPrimary == true ? true : false;
		                        cbxIsShipping.Checked = objadd.IsMailing == true ? true : false;
		                        cbxIsPrimary.Checked = objadd.PrimaryAddress == true ? true : false;
		                        txtLatitude.Text = Convert.ToString(objadd.Latitude);
		                        txtLogitute.Text = Convert.ToString(objadd.Logitude);
		                        txtPostalCode.Text = objadd.PostalCode;
		                        txtSalutation.Text = objadd.Salutation;          
		                    }
						}
						
						
					}
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
    protected void btnSave_ClickAction(object sender, EventArgs e)
    {
        try
        {
            IPersistentEntity persistentEntity = BindingSource.Current as IPersistentEntity;

            _parentEntity = GetParentEntity() as IPersistentEntity;
            _parentEntityReference = _parentEntity as IComponentReference;

            if (persistentEntity != null)
            {
                bool hasContactMatches = false;
                IAddress address = (IAddress)BindingSource.Current;
                if (address.EntityId == null)
                {
                    address.EntityId = "123123123123";
                    /*HttpCookie _Latitude = Request.Cookies["Latitude"];
                    HttpCookie _Logitute = Request.Cookies["Logitute"];
                    if (_Latitude == null)                   
                    {
                        address.Latitude = "0";
                        address.Logitude = "0";
                    }
                    else
                    {
                        address.Latitude = _Latitude.Value.ToString();
                        address.Logitude = _Logitute.Value.ToString();*/
                    address.Latitude = txtLatitude.Text;
                    address.Logitude = txtLogitute.Text;
                   // }
                }
                if (Mode.Value == "ADD")
                {
                    persistentEntity.Save();
                    Global.ADDRESS_ID = address.Id.ToString();
                }
                if (Mode.Value == "UPDATE")
                {
                    if (address.EntityId != "123123123123")
                    {

                        IContact contact = _parentEntityReference as IContact;
                        IAccount account = _parentEntityReference as IAccount;

                        bool hasSalesOrderMatches = (Helpers.HasMatchingSalesOrderAddresses(_parentEntityReference));
                        if (contact != null)
                            hasContactMatches = contact.HasAddressChanges();
                        else if (account != null)
                            hasContactMatches = account.HasAddressChanges();
                        if ((hasContactMatches || hasSalesOrderMatches) && DialogService != null)
                        {
                            UpdateAddressOptionManager addressOptions = new UpdateAddressOptionManager();
                            addressOptions.HasContactAddressChanges = hasContactMatches;
                            addressOptions.OldAddressValues = contact != null
                                                                  ? Sage.SalesLogix.Contact.Rules.getOriginalAddressValues(
                                                                      contact)
                                                                  : Sage.SalesLogix.Account.Rules.getOriginalAddressValues(
                                                                      account);
                            addressOptions.HasSalesOrderAddressChanges = hasSalesOrderMatches;
                            addressOptions.ParentEntityReference = _parentEntityReference;
                            addressOptions.IsPrimaryAddress = (address.IsPrimary ?? false);

                            DialogService.SetSpecs(200, 200, 200, 450,
                                                   contact != null ? "UpdateContactOptions" : "UpdateAccountOptions", "", true);
                            DialogService.EntityType = typeof(IAddress);
                            DialogService.EntityID = address.Id.ToString();
                            DialogService.DialogParameters.Add("UpdateAddressOptionManager", addressOptions);
                            DialogService.ShowDialog();
                        }
                    }
                    persistentEntity.Save();
                }
            }
            UpdateFlags();
            //btnSave_ClickActionBRC(sender, e);
        }
        catch (Exception ex)
        {
        }
    }

    private void UpdateFlags()
    {
        var thisaddress = BindingSource.Current as IAddress;
        var pi = _parentEntityReference.GetType().GetProperty("Addresses");
        if (pi != null)
        {
            foreach (var adr in (pi.GetValue(_parentEntityReference, null) as ICollection<IAddress>))
            {
                if (adr != thisaddress)
                {
                    adr.IsMailing = Convert.ToBoolean(thisaddress.IsMailing) ? false : adr.IsMailing;
                    adr.IsPrimary = Convert.ToBoolean(thisaddress.IsPrimary) ? false : adr.IsPrimary;
                    adr.PrimaryAddress = Convert.ToBoolean(thisaddress.PrimaryAddress) ? false : adr.PrimaryAddress;
                }
            }
        }
    }

    /// <summary>
    /// Handles the ClickActionBRC event of the btnSave control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void btnSave_ClickActionBRC(object sender, EventArgs e)
    {
        IPanelRefreshService refresher = PageWorkItem.Services.Get<IPanelRefreshService>();
        refresher.RefreshAll();
    }
    protected void txtPostalCode_TextChanged(object sender, EventArgs e)
    {
        IAddress curAdd = this.BindingSource.Current as IAddress;
        btnSave.Enabled = false;
        if (txtPostalCode.Text != "")
        {
            string qry = "select CPINCODE from VWPINCODEMASTER where CPINCODE ='" + txtPostalCode.Text.Trim() + "'";
            Sage.Platform.Data.IDataService service1 = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
            System.Data.OleDb.OleDbConnection conObj = new System.Data.OleDb.OleDbConnection(service1.GetConnectionString());
            System.Data.OleDb.OleDbDataAdapter dataAdapterObj = new System.Data.OleDb.OleDbDataAdapter(qry, conObj);
            System.Data.DataTable dt = new System.Data.DataTable();
            dataAdapterObj.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblerr.Visible = false;
                //lblerr.Text = "Pincode does not Exists in Pincode Masters";
            }
            else
            {
                lblerr.Visible = true;
                lblerr.Text = "Pincode does not Exists in Pincode Masters";
            }
        }
        btnSave.Enabled = true;
        pklCountry.Focus();
    }
    private void btngetGL_ClickAction(object sender, EventArgs e)
    {
        try
        {
            /*HttpCookie _Latitude1 = Request.Cookies["Latitude1"];
            HttpCookie _Logitute1 = Request.Cookies["Logitute1"];
			
            if (_Latitude1 == null || _Logitute1 == null)
            {
               _Latitude1.Value = "0";
               _Logitute1.Value = "0";
            }  */
             Sage.Entity.Interfaces.IAddress objadd;
            string entityID = "";
            if( Request.QueryString["EntityID"] != null)
                entityID = Request.QueryString["EntityID"].ToString();
            if (Request.QueryString["id"] != null && entityID == "")
			{
	            string _addid = Request.QueryString["id"].ToString();
	            objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IAddress>(_addid);
	            if (objadd != null)
	            {
	                objadd.Description = pklDecription.PickListValue;
	                objadd.Address1 = txtAddress1.Text;
	                objadd.Address2 = txtAddress2.Text;
	                objadd.Address3 = txtAddress3.Text;
	                objadd.AddressType = pklAddressType.PickListValue;
	                objadd.City = pklCity.PickListValue;
	                objadd.State = pklState.PickListValue;
	                objadd.Country = pklCountry.PickListValue;
	                objadd.IsPrimary = cbxPrimaryAddr.Checked == true ? true : false;
	                objadd.IsMailing = cbxIsShipping.Checked == true ? true : false;
	                objadd.PrimaryAddress = cbxIsPrimary.Checked == true ? true : false;
	               /* objadd.Latitude = _Latitude1.Value.ToString();
	                objadd.Logitude = _Logitute1.Value.ToString();*/
                    objadd.Latitude = txtLatitude.Text;
                    objadd.Logitude = txtLogitute.Text;
	                objadd.PostalCode = txtPostalCode.Text;
	                objadd.Salutation = txtSalutation.Text;
	                objadd.Save();
	            }
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.close();if (window.opener && !window.opener.closed) { window.opener.location.reload(); }", true);
                btnSave_ClickActionBRC(sender, e);
			}
			else
			{
				
				objadd = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.IAddress>();
				objadd.Description = pklDecription.PickListValue;
                objadd.Address1 = txtAddress1.Text;
                objadd.Address2 = txtAddress2.Text;
                objadd.Address3 = txtAddress3.Text;
                objadd.AddressType = pklAddressType.PickListValue;
                objadd.City = pklCity.PickListValue;
                objadd.State = pklState.PickListValue;
                objadd.Country = pklCountry.PickListValue;
                objadd.IsPrimary = cbxPrimaryAddr.Checked == true ? true : false;
                objadd.IsMailing = cbxIsShipping.Checked == true ? true : false;
                objadd.PrimaryAddress = cbxIsPrimary.Checked == true ? true : false;
                /*objadd.Latitude = _Latitude1.Value.ToString();
                objadd.Logitude = _Logitute1.Value.ToString();*/
                objadd.Latitude = txtLatitude.Text;
                objadd.Logitude = txtLogitute.Text;
                objadd.PostalCode = txtPostalCode.Text;
                objadd.Salutation = txtSalutation.Text;
				objadd.EntityId = entityID;
                objadd.Save();
                Global.ADDRESS_ID = objadd.Id.ToString();
                 if (entityID == "123123123123")
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.close();", true);
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.close();if (window.opener && !window.opener.closed) { window.opener.location.reload(); }", true);
                    btnSave_ClickActionBRC(sender, e);
                }
			}
            

           // string url = string.Format("Account.aspx?entityid=" + objadd.EntityId.ToString());
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.open('Close.html', '_self', null);", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.open('Close.html', '_self', null);", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.close();if (window.opener && !window.opener.closed) { window.opener.location.reload(); }", true);
            //Page.ClientScript.RegisterClientScriptBlock(GetType(), "sas", "<script>window.close();if (window.opener && !window.opener.closed) { window.opener.location.reload(); }</script>", false);
        }
        catch (Exception ex)
        {
          //  throw ex;
        }
    }
	protected void btnCancelDetail_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate1", "window.close();", true);
    }
}