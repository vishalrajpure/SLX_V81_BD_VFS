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

public partial class SmartParts_Address_AddLeadAddress : EntityBoundSmartPartInfoProvider
{
    private IPersistentEntity _parentEntity;
    private IComponentReference _parentEntityReference;
    private ILead _Objlead;
    private string _id = "";
    private static string _name = "";
    private string _entityid = "";

    /// <summary>
    /// Gets the type of the entity.
    /// </summary>
    /// <value>The type of the entity.</value>
    public override Type EntityType
    {
        get { return typeof(ILeadAddress); }
    }

    /// <summary>
    /// Override this method to add bindings to the currently bound smart part
    /// </summary>
    protected override void OnAddEntityBindings()
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

   
        BindingSource.AddBindingProvider(pklCountry as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Country", pklCountry, "PickListValue", "", ""));

        BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Salutation", txtSalutation, "Text", "", ""));

        BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Latitude", txtLatitude, "Text", "", ""));

        BindingSource.AddBindingProvider(txtSalutation as IEntityBindingProvider);
        BindingSource.Bindings.Add(new PropertyBinding("Logitude", txtLogitute, "Text", "", ""));
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
        Mode.Value = "ADD";
    }

    /// <summary>
    /// Derived components should override this method to wire up event handlers.
    /// </summary>
    protected override void OnWireEventHandlers()
    {
        btnSave.Click += btnSave_ClickAction;
        btnSave.Click += DialogService.CloseEventHappened;
        btnCancel.Click += DialogService.CloseEventHappened;
        base.OnWireEventHandlers();
    }

    /// <summary>
    /// Called when the smartpart has been bound.  Derived components should override this method to run code that depends on entity context being set and it not changing.
    /// </summary>
    protected override void OnFormBound()
    {
        base.OnFormBound();
        _parentEntity = GetParentEntity() as IPersistentEntity;
        ILeadAddress curAdd = this.BindingSource.Current as ILeadAddress;
       

        _parentEntityReference = _parentEntity as IComponentReference;
        ClientBindingMgr.RegisterDialogCancelButton(btnCancel);

        if (_parentEntityReference is ILead)
        {
            ViewState["parentEntityID"] = _parentEntityReference.Id;
            _Objlead = _parentEntity as ILead;
        }


        string script_FormatNumber = "";
        //script_FormatNumber += " function only_required(Address1,pincode,Latitude,Logitute,description,isprimary,addtype,add2,add3,city,state,country,attn) ";
        script_FormatNumber += " function only_required(Address1,pincode,Latitude,Logitute,add2,add3,city,state,country) ";
        script_FormatNumber += " {";
        script_FormatNumber += "    var df = true;";
        script_FormatNumber += "     if(Address1 == '') { df =  false; }";
        script_FormatNumber += "     if(pincode == '') {df =  false; }";
        //script_FormatNumber += "     if(Latitude == '') {df =  false; }";
        //script_FormatNumber += "     if(Logitute == '') {df =  false; }";

        script_FormatNumber += "     if(!df) {";
        script_FormatNumber += "     alert('Please Fill Required fields');";
        script_FormatNumber += " return df;} else {";
        script_FormatNumber += " var add = Address1 + ', ' + add2 + ', ' + add3 + ', ' + city + ', '  + state + ', '  + country + ', '  + pincode;";

        script_FormatNumber += " document.getElementById('MainContent_InsertLead_txtAccountAddress').value = add;";
            
        script_FormatNumber += " return df;";
        // script_FormatNumber += " { document.getElementById('MainContent_InsertContact_txtAccountAddress').value = Address1 + pincode + Latitude + Logitute;";
        script_FormatNumber += " }}";

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Validate", script_FormatNumber, true);
       // btnSave.Attributes.Add("onclick", "return only_required(document.getElementById('" + txtAddress1.ClientID + "').value,document.getElementById('" + txtPostalCode.ClientID + "').value,document.getElementById('" + txtLatitude.ClientID + "').value,document.getElementById('" + txtLogitute.ClientID + "').value,document.getElementById('" + txtAddress2.ClientID + "').value,document.getElementById('" + txtAddress3.ClientID + "').value,document.getElementById('" + pklCity.ClientID + "').value,document.getElementById('" + pklState.ClientID + "').value,document.getElementById('" + pklCountry.ClientID + "').value);");
        btnSave.Attributes.Add("onclick", "return only_required(document.getElementById('" + txtAddress1.ClientID + "').value,document.getElementById('" + txtPostalCode.ClientID + "').value,document.getElementById('" + txtLatitude.ClientID + "').value,document.getElementById('" + txtLogitute.ClientID + "').value,document.getElementById('" + txtAddress2.ClientID + "').value,document.getElementById('" + txtAddress3.ClientID + "').value,document.getElementById('" + pklCity.ClientID + "_Text').value,document.getElementById('" + pklState.ClientID + "_Text').value,document.getElementById('"+ pklCountry.ClientID + "_Text').value);");
        

        
        
        if (!IsPostBack)
        {
           
            ILeadAddress curAdd3 = this.BindingSource.Current as ILeadAddress;
            curAdd3.Latitude = 0;
            curAdd3.Logitude = 0;
            
        }
        if (Session["LeadAddressid"] != null && curAdd.Address1 == null)
        {
            
			
            Sage.Entity.Interfaces.ILeadAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILeadAddress>(Session["LeadAddressid"].ToString());
            if (objadd != null )
            {
                curAdd.Address1 = objadd.Address1;
                curAdd.Address2 = objadd.Address2;
                curAdd.Address3 = objadd.Address3;
                curAdd.City = objadd.City;
                curAdd.Country = objadd.Country;
                curAdd.IsPrimary = objadd.IsPrimary;
                curAdd.Latitude = objadd.Latitude != null ? objadd.Latitude : 0;
                curAdd.Logitude = objadd.Logitude != null ? objadd.Logitude : 0;
                curAdd.PostalCode = objadd.PostalCode;
                curAdd.Salutation = objadd.Salutation;
                curAdd.State = objadd.State;
                curAdd.Description = objadd.Description;
                //curAdd = objadd;
            }
        }
        
        
       
    }

    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        if (BindingSource != null)
        {
            if (BindingSource.Current != null)
            {
                ILeadAddress address = (ILeadAddress)BindingSource.Current;

                txtEntityId.Value = "";// _parentEntityReference.Id.ToString();

                if (address.Id != null)
                {
                    cbxIsPrimary.Enabled = (address.IsPrimary != true);
                    cbxIsShipping.Enabled = (address.IsMailing != true);
                    Mode.Value = "UPDATE";
                }
                else
                {
                    Mode.Value = "ADD";
                   // pklDecription.PickListValue = GetLocalResourceObject("DefaultDescription").ToString();
                }

                if (_parentEntityReference is ILead)
                {
                    ViewState["parentEntityID"] = _parentEntityReference.Id;
                    _Objlead = _parentEntity as ILead;
                }

                if (!(_parentEntityReference is IAccount || _parentEntityReference is IContact))
                {
                   // tinfo.Title = Mode.Value == "ADD"
                                    //  ? GetLocalResourceObject("DialogTitleAdd").ToString()
                                    //  : GetLocalResourceObject("DialogTitleEdit").ToString();
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
        string _add = "";
        if(GetLatLong() == true)
		{
            _Objlead = GetParentEntity() as ILead;
            ILeadAddress curAdd = this.BindingSource.Current as ILeadAddress;
            if (Session["LeadAddressid"] != null)
            {
                Sage.Entity.Interfaces.ILeadAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILeadAddress>(Session["LeadAddressid"].ToString());
                if (objadd != null)
                {
                    objadd.Address1 = curAdd.Address1;
                    objadd.Address2 = curAdd.Address2;
                    objadd.Address3 = curAdd.Address3;
                    objadd.City = curAdd.City;
                    objadd.Country = curAdd.Country;
                    objadd.IsPrimary = curAdd.IsPrimary;
                    objadd.Latitude = curAdd.Latitude != null ? curAdd.Latitude : 0;
                    objadd.Logitude = curAdd.Logitude != null ? curAdd.Logitude : 0;
                    objadd.PostalCode = curAdd.PostalCode;
                    objadd.Salutation = curAdd.Salutation;
                    objadd.State = curAdd.State;
                    objadd.Description = curAdd.Description;
                    objadd.Save();
                    //_Objlead.Address = objadd;
                    Session["LeadAddressid"] = objadd.Id.ToString();

                }

            }
            else
            {
               
                curAdd.LeadId = "123123123123";
                curAdd.Save();
                //_Objlead.Address = curAdd;
                Session["LeadAddressid"] = curAdd.Id.ToString();
            }

		}
		
        
    }

    private void UpdateFlags()
    {
        var thisaddress = BindingSource.Current as ILeadAddress;
        var pi = _parentEntityReference.GetType().GetProperty("LeadAddresses");
        if (pi != null)
        {
            foreach (var adr in (pi.GetValue(_parentEntityReference, null) as ICollection<ILeadAddress>))
            {
                if (adr != thisaddress)
                {
                    adr.IsMailing = Convert.ToBoolean(thisaddress.IsMailing) ? false : adr.IsMailing;
                    adr.IsPrimary = Convert.ToBoolean(thisaddress.IsPrimary) ? false : adr.IsPrimary;
                  //  adr.PrimaryAddress = Convert.ToBoolean(thisaddress.PrimaryAddress) ? false : adr.PrimaryAddress;
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
	protected bool GetLatLong()
	{
		try{
            ILeadAddress curAdd = this.BindingSource.Current as ILeadAddress;
            //_Objlead = GetParentEntity() as ILead;
            //_Objlead.Address = curAdd;
            if (txtAddress1.Text != "")
            {
                string addr = string.Empty;

                if (!string.IsNullOrEmpty(txtAddress1.Text))
                    addr += txtAddress1.Text + ", ";

                if (!string.IsNullOrEmpty(pklCity.PickListValue))
                    addr += pklCity.PickListValue + ", ";

                if (!string.IsNullOrEmpty(pklState.PickListValue))
                    addr += pklState.PickListValue + ", ";

                if (!string.IsNullOrEmpty(txtPostalCode.Text))
                    addr += txtPostalCode.Text + ", ";

                if (!string.IsNullOrEmpty(pklCountry.PickListValue))
                    addr += pklCountry.PickListValue + ", ";


                string url = "http://maps.google.com/maps/api/geocode/xml?address=" + addr + "&sensor=false";
                WebRequest request = WebRequest.Create(url);
                using (WebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {
                        DataSet dsResult = new DataSet();
                        dsResult.ReadXml(reader);
                        DataTable dtCoordinates = new DataTable();

                        dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)),
	                        new DataColumn("Address", typeof(string)),
	                        new DataColumn("Latitude",typeof(string)),
	                        new DataColumn("Longitude",typeof(string)) });
                        foreach (DataRow row in dsResult.Tables["result"].Rows)
                        {
                            string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                            DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
                            dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
                        }
                        if (dtCoordinates.Rows.Count > 0)
                        {
                            curAdd.Latitude = Convert.ToDecimal(dtCoordinates.Rows[0]["Latitude"].ToString());
                            curAdd.Logitude = Convert.ToDecimal(dtCoordinates.Rows[0]["Longitude"].ToString());
                            txtLatitude.Text = dtCoordinates.Rows[0]["Latitude"].ToString();
                            txtLogitute.Text = dtCoordinates.Rows[0]["Longitude"].ToString();
                            return true;
                        }
						else
						{
							lblerr.Visible = true;
                			lblerr.Text = "No Lat/Long match found for specified Address, Please Correct the address";
							return false;
						}
                    }
                }
            }
			return true;
 		}
        catch (Exception ex)
        {
			return false;
        }
	}
    protected void btngetGL_Click(object sender, EventArgs e)
    {  
		try{
            ILeadAddress curAdd = this.BindingSource.Current as ILeadAddress;
            //_Objlead = GetParentEntity() as ILead;
            //_Objlead.Address = curAdd;
            if (txtAddress1.Text != "")
            {
                string addr = string.Empty;

                if (!string.IsNullOrEmpty(txtAddress1.Text))
                    addr += txtAddress1.Text + ", ";

                if (!string.IsNullOrEmpty(pklCity.PickListValue))
                    addr += pklCity.PickListValue + ", ";

                if (!string.IsNullOrEmpty(pklState.PickListValue))
                    addr += pklState.PickListValue + ", ";

                if (!string.IsNullOrEmpty(txtPostalCode.Text))
                    addr += txtPostalCode.Text + ", ";

                if (!string.IsNullOrEmpty(pklCountry.PickListValue))
                    addr += pklCountry.PickListValue + ", ";


                string url = "http://maps.google.com/maps/api/geocode/xml?address=" + addr + "&sensor=false";
                WebRequest request = WebRequest.Create(url);
                using (WebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {
                        DataSet dsResult = new DataSet();
                        dsResult.ReadXml(reader);
                        DataTable dtCoordinates = new DataTable();

                        dtCoordinates.Columns.AddRange(new DataColumn[4] { new DataColumn("Id", typeof(int)),
	                        new DataColumn("Address", typeof(string)),
	                        new DataColumn("Latitude",typeof(string)),
	                        new DataColumn("Longitude",typeof(string)) });
                        foreach (DataRow row in dsResult.Tables["result"].Rows)
                        {
                            string geometry_id = dsResult.Tables["geometry"].Select("result_id = " + row["result_id"].ToString())[0]["geometry_id"].ToString();
                            DataRow location = dsResult.Tables["location"].Select("geometry_id = " + geometry_id)[0];
                            dtCoordinates.Rows.Add(row["result_id"], row["formatted_address"], location["lat"], location["lng"]);
                        }
                        if (dtCoordinates.Rows.Count > 0)
                        {
                            curAdd.Latitude = Convert.ToDecimal(dtCoordinates.Rows[0]["Latitude"].ToString());
                            curAdd.Logitude = Convert.ToDecimal(dtCoordinates.Rows[0]["Longitude"].ToString());
                            txtLatitude.Text = dtCoordinates.Rows[0]["Latitude"].ToString();
                            txtLogitute.Text = dtCoordinates.Rows[0]["Longitude"].ToString();
                            /*if (ViewState["parentEntityID"] != null)
                            {           
                                 Sage.Entity.Interfaces.ILead objlead = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILead>(ViewState["parentEntityID"].ToString());
                                 if (objlead != null)
                                 {
                                     Sage.Entity.Interfaces.ILeadAddress objadd = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.ILeadAddress>(objlead.Address.Id.ToString());
                                     if (objadd != null)
                                     {
                                         objadd.Latitude = curAdd.Latitude;
                                         objadd.Logitude = curAdd.Logitude;
                                         objadd.Save();
                                     }
                                 }
                            }*/
                        }
                    }
                }
            }        
 		}
        catch (Exception ex)
        {
        }
    }

    protected void txtPostalCode_TextChanged(object sender, EventArgs e)
    {
        ILeadAddress curAdd = this.BindingSource.Current as ILeadAddress;
        //_Objlead = GetParentEntity() as ILead;
        //_Objlead.Address = curAdd;
        if (txtPostalCode.Text != "")
        {
            string qry = "select CPINCODE from VWPINCODEMASTER where CPINCODE ='" + txtPostalCode.Text + "'";
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
    }
}