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
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class SmartParts_QualifierBranchMapping_QB : EntityBoundSmartPartInfoProvider
{
    public string SlxConnectionString = "";

    #region EntityBoundSmartPart methods
    /// <summary>
    /// Gets the type of the entity.
    /// </summary>
    /// <value>The type of the entity.</value>
    [Sage.Platform.Application.ServiceDependency]
    public Sage.Platform.Security.IRoleSecurityService RoleSecurityService { get; set; }

    public override Type EntityType
    {
        get { return typeof(Sage.Entity.Interfaces.IQualifierAndSMpincode); }
    }

    protected override void OnAddEntityBindings()
    {

    }

    public string GetSLXConnectionString()
    {
        string result = string.Empty;
        Sage.Platform.Data.IDataService service = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
        return service.GetConnectionString();
    }



    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                LoadUser();
                LoadBranch();
                LoadGrid();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void LoadUser()
    {        
        Sage.Platform.Data.IDataService service = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
        System.Data.OleDb.OleDbConnection conObj = new System.Data.OleDb.OleDbConnection(service.GetConnectionString());

        string Query = "select UserID from Userinfo where (Title != '' or title is not null) And Userid !='ADMIN'";
        System.Data.OleDb.OleDbDataAdapter dataAdapterObj3 = new System.Data.OleDb.OleDbDataAdapter(Query, conObj);
        System.Data.DataTable dt3 = new System.Data.DataTable();
        dataAdapterObj3.Fill(dt3);

        string lc_ItemId = "";
        if (dt3.Rows.Count > 0)
        {
            for (int i = 0; i < dt3.Rows.Count; i++)
            {
                lc_ItemId += Convert.ToString(dt3.Rows[i][0]) + "','";
            }
        }
        if (lc_ItemId.Length > 0)
        {
            string Accmgr = "Id in ('" + lc_ItemId + "') OR Id";
            this.luequalifier.SeedProperty = Accmgr;
            this.luequalifier.SeedValue = "0";
            this.luequalifier.InitializeLookup = true;
        }    
    }
    private void LoadBranch()
    {
        string QueryObj;
        SlxConnectionString = GetSLXConnectionString();
        QueryObj = "select distinct CBRANCH from vwareamaster ORDER BY CBRANCH";

        OleDbConnection conObj = new OleDbConnection(SlxConnectionString);
        OleDbDataAdapter dataAdapterObj1 = new OleDbDataAdapter(QueryObj, conObj);
        DataTable dtpincode = new DataTable();

        dataAdapterObj1.Fill(dtpincode);
        if (dtpincode.Rows.Count > 0)
        {
           lstbranch.DataSource = dtpincode;
           lstbranch.DataTextField = "CBRANCH";
           lstbranch.DataValueField = "CBRANCH";
           lstbranch.DataBind();

                string QueryObj1;
                string SlxConnectionString1 = GetSLXConnectionString();
                QueryObj1 = "SELECT Branch from QualifierAndSMpincode where Branch ='XXX'";

                OleDbConnection conObj1= new OleDbConnection(SlxConnectionString1);
                OleDbDataAdapter dataAdapterObj2 = new OleDbDataAdapter(QueryObj1, conObj1);
                DataTable dtpincode1 = new DataTable();

                dataAdapterObj2.Fill(dtpincode1);
                if (dtpincode1.Rows.Count > 0)
                {
                    lstbranch.Items.Remove("XXX");
                }
                else
                {
                    lstbranch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("XXX", "XXX", true));
                }
        }
        else
        {
            lstbranch.DataSource = null;
            lstbranch.DataBind();
        }
    }

    private void LoadGrid()
    {
        string QueryObj;
        SlxConnectionString = GetSLXConnectionString();
        QueryObj = "select * from QualifierAndSMpincode order by CREATEDATE desc";

        OleDbConnection conObj = new OleDbConnection(SlxConnectionString);
        OleDbDataAdapter dataAdapterObj1 = new OleDbDataAdapter(QueryObj, conObj);
        DataTable dtgrid = new DataTable();

        dataAdapterObj1.Fill(dtgrid);
        if (dtgrid.Rows.Count > 0)
        {
            grdqualifier.DataSource = dtgrid;
            grdqualifier.DataBind();
        }
        else
        {
            grdqualifier.DataSource = null;
            grdqualifier.DataBind();
        }
    }

    #region GridProperty

    protected void grdqualifier_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        // LoadGrid(e.NewPageIndex);
    }
    protected void grdqualifier_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandArgument.ToString() == "Last" || e.CommandArgument.ToString() == "First")
        {

        }
        else
        {
            int _BTId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Delete1")
            {
                string Id = grdqualifier.DataKeys[_BTId].Value.ToString();
                // string Id = e.CommandArgument.ToString();
                if (DialogService != null)
                {
                    DialogService.SetSpecs(600, 600, "QualifierSMpincode", string.Empty);
                    DialogService.EntityType = typeof(Sage.Entity.Interfaces.IQualifierAndSMpincode);
                    DialogService.EntityID = Id;
                    DialogService.ShowDialog();
                    LoadGrid();
                }
            }
            if (e.CommandName == "Delete")
            {
                string QId = grdqualifier.DataKeys[_BTId].Value.ToString();
                Sage.Entity.Interfaces.IQualifierAndSMpincode objQ = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IQualifierAndSMpincode>(QId);
                if (objQ != null)
                {
                    objQ.Delete();
                    Response.Redirect("QualifierBranchMapping.aspx");
                    //  Response.Redirect(string.Format("~/Opportunity.aspx?entityid=" + objhis.OpportunityId.ToString()));
                }
            }
        }

    }
    protected void grdqualifier_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            LoadGrid();
        }
        catch (Exception ex)
        {
        }
    }

    #endregion
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            if (lstbranch.Items.Count > 0)
            {
                for (int i = 0; i < lstbranch.Items.Count; i++)
                {
                    if (lstbranch.Items[i].Selected)
                    {
                        string _branch = lstbranch.Items[i].Value;
                        Sage.Entity.Interfaces.IQualifierAndSMpincode Objqualifier = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.IQualifierAndSMpincode>();
                        if (Objqualifier != null)
                        {
                            // Objqualifier.QualifierId = luequalifier.LookupResultValue.ToString();
                            Sage.Entity.Interfaces.IUserInfo objuser = Sage.Platform.EntityFactory.GetById<Sage.Entity.Interfaces.IUserInfo>(luequalifier.LookupResultValue.ToString());
                            if (objuser != null)
                            {
                                Objqualifier.QualifierId = objuser.Id.ToString();
                                Objqualifier.QualifierName = objuser.UserName;
                            }
                            Objqualifier.Branch = _branch;
                            Objqualifier.Save();
                        }
                    }
                }
            }           
            Response.Redirect("QualifierBranchMapping.aspx");
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    protected void grdqualifier_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // loop all data rows
            foreach (DataControlFieldCell cell in e.Row.Cells)
            {
                // check all cells in one row
                foreach (Control control in cell.Controls)
                {
                    // Must use LinkButton here instead of ImageButton
                    // if you are having Links (not images) as the command button.
                    ImageButton button = control as ImageButton;
                    if (button != null && button.CommandName == "Delete")
                        // Add delete confirmation
                        button.OnClientClick = "if (!confirm('Are you sure " +
                               "you want to delete this record?')) return;";
                }
            }
        }
    }
}

