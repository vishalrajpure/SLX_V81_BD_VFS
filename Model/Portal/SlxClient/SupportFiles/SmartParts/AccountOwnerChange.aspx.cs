using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Sage.Platform.WebPortal.Workspaces.Tab;
using Sage.Platform.Application.UI.Web;
using Sage.SalesLogix.Client.GroupBuilder;
using Sage.Platform.Application;
using Sage.SalesLogix.SelectionService;
using Sage.Entity.Interfaces;
using System.Collections.Generic;
using Sage.SalesLogix.Web.SelectionService;

public partial class SmartParts_AccountOwnerChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillUsers();
            //if (Request.QueryString["flagmode"].ToString().Trim() == "1")
            //{
            //    //lblselect.Text = "Select Pincode:";
            //   FillUsers();
            //}
            //else
            //{
            //    //lblselect.Text = "Select Branch:";
            //    //Prepaid();
            //}
        }
        else
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Message", "var win=window.open('','_top','','true');win.opener=true;win.close();", true); 
        }
    }
    private void FillUsers()
    {
        Sage.Platform.Data.IDataService service = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
        System.Data.OleDb.OleDbConnection conObj1 = new System.Data.OleDb.OleDbConnection(service.GetConnectionString());
        string query = " select * from Userinfo where (Title != '' or title is not null) And Userid !='ADMIN' "
                     + " order by Username";

        System.Data.OleDb.OleDbCommand cmd = new System.Data.OleDb.OleDbCommand(query, conObj1);
        System.Data.OleDb.OleDbDataAdapter da = new System.Data.OleDb.OleDbDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        drpusers.DataTextField = "UserName";
        drpusers.DataValueField = "userid";
        drpusers.DataSource = ds;
        drpusers.DataBind();
        drpusers.Items.Insert(0, new ListItem("Select One...", "0"));

        //Sage.Platform.Data.IDataService service = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Data.IDataService>();
        //System.Data.OleDb.OleDbConnection conObj1 = new System.Data.OleDb.OleDbConnection(service.GetConnectionString());

       /* cmd = new System.Data.OleDb.OleDbCommand("Select distinct p.Id,p.TEXT from PICKLIST p inner join PickListView pv on p.PICKLISTID = pv.PicklistId inner join  PickListItemView Piv on piv.PicklistId = pv.PicklistId where pv.PicklistName ='MappingRole'", conObj1);
        System.Data.OleDb.OleDbDataAdapter da1 = new System.Data.OleDb.OleDbDataAdapter(cmd);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        drprole.DataTextField = "Text";
        drprole.DataValueField = "Text";
        drprole.DataSource = ds1;
        drprole.DataBind();
        drprole.Items.Insert(0, new ListItem("Select One...", "0"));*/
    }
}