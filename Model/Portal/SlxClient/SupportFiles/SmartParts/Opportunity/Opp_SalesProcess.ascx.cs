using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using NHibernate;
using Sage.Platform.Security;
using Sage.SalesLogix.Security;
using Sage.Platform.Application;
using Sage.Platform.Orm;
using Sage.SalesLogix.Activity;
using Sage.Platform;
using Sage.Platform.WebPortal;
using Sage.Platform.WebPortal.Binding;
using System.Text;
using Sage.Platform.Repository;
using Sage.Platform.Application.UI;
using Sage.Platform.WebPortal.SmartParts;
using Sage.Entity.Interfaces;
using Sage.SalesLogix.Plugins;
using Sage.SalesLogix.SalesProcess;
using System.Data.OleDb;

public partial class SmartParts_Opportunity_Opp_SalesProcess : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            lblSalesProces.ForeColor = System.Drawing.Color.Red;
            LoadSalesProcessDropDown();
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadSalesProcessDropDown()
    {
        ddLSalesProcess.Items.Clear();
        IList<Plugin> pluginList = null;
        pluginList = Helpers.GetSalesProcessPluginList();
        ListItem item = new ListItem();
        item.Text = "None";
        item.Value = "0";
        ddLSalesProcess.Items.Add(item);
       
        foreach (Plugin plugin in pluginList)
        {
          
                item = new ListItem();
                item.Text = plugin.Name;
                item.Value = plugin.PluginId;
                ddLSalesProcess.Items.Add(item);
           
        }
    }
	
	
}