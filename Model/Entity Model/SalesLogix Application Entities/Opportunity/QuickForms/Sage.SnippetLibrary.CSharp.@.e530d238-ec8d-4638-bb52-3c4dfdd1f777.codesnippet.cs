/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="e530d238-ec8d-4638-bb52-3c4dfdd1f777">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>OnLoad1Step</name>
 <references>
  <reference>
   <assemblyName>Sage.Entity.Interfaces.dll</assemblyName>
   <hintPath>%BASEBUILDPATH%\interfaces\bin\Sage.Entity.Interfaces.dll</hintPath>
  </reference>
  <reference>
   <assemblyName>Sage.Form.Interfaces.dll</assemblyName>
   <hintPath>%BASEBUILDPATH%\formInterfaces\bin\Sage.Form.Interfaces.dll</hintPath>
  </reference>
  <reference>
   <assemblyName>Sage.Platform.dll</assemblyName>
   <hintPath>%BASEBUILDPATH%\assemblies\Sage.Platform.dll</hintPath>
  </reference>
  <reference>
   <assemblyName>Sage.SalesLogix.API.dll</assemblyName>
  </reference>
 </references>
</snippetHeader>
*/


#region Usings
using System;
using Sage.Entity.Interfaces;
using Sage.Form.Interfaces;
using Sage.SalesLogix.API;
#endregion Usings

namespace Sage.BusinessRules.CodeSnippets
{
    public static partial class OpportunityProductsEventHandlers
    {
        public static void OnLoad1Step( IOpportunityProducts form,  EventArgs args)
        {
            Sage.Entity.Interfaces.IOpportunity opportunity = form.CurrentEntity as Sage.Entity.Interfaces.IOpportunity;
			if (opportunity != null)
			{
				 
				/*//pklStatus.PickListValue= objOpp.Status;
				if (opportunity.Status == "Closed - Won" || opportunity.Status.ToUpper() == "LOST" || opportunity.Status.ToUpper() == "DROPPED")
				{
				   
				    form.grd.Enabled = false;
				    
				}
				else
				{
				    SlxGridView grd = (SlxGridView)Page.Controls[1];
				    grd.Enabled = true;

				}

				if (!IsPostBack)
				{
				    string _UserId = "", AccManager = "";
				    Sage.Platform.Security.IUserService _IUserService = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Security.IUserService>();
				    _UserId = _IUserService.UserId; //get login Userid
				    if (opportunity.AccountManager != null)
				    {
					AccManager = Convert.ToString(opportunity.AccountManager.Id);
					
				    if (AccManager.Trim() == _UserId.Trim() || Convert.ToString(opportunity.Account.AccountManager.Id) == _UserId.Trim())
				    {
				       SlxGridView grd = (SlxGridView)Page.Controls[1];
				    	grd.Enabled = true;
				    }
				    else
				    {
				        SlxGridView grd = (SlxGridView)Page.Controls[1];
				    	grd.Enabled = false;
				    }
					}
				}*/
				
				
			    /*Sage.Platform.SData.IAppIdMappingService mappingService =
			        Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.SData.IAppIdMappingService>(
			            true);
				if (mappingService.IsIntegrationEnabled())
				{
					var clientContextService = PageWorkItem.Services.Get<Sage.Platform.WebPortal.Services.ClientContextService>();
					if (clientContextService != null)
					{
						// OperatingCompany
						if (clientContextService.CurrentContext.ContainsKey("OperatingCompany"))
						{
			                if (opportunity.OperatingCompany != null)
			                {
							    clientContextService.CurrentContext["OperatingCompany"] = opportunity.OperatingCompany.Id.ToString();
			                }
			                else
			                {
			                    clientContextService.CurrentContext.Remove("OperatingCompany");
			                }
						}
						else
						{
			                if (opportunity.OperatingCompany != null)
			                {
			                    clientContextService.CurrentContext.Add("OperatingCompany", opportunity.OperatingCompany.Id.ToString());
			                }
						}
						
						// SlxPriceList
						if (clientContextService.CurrentContext.ContainsKey("SlxPriceList"))
						{
			                if (opportunity.SlxPriceList != null)
			                {
							    clientContextService.CurrentContext["SlxPriceList"] = opportunity.SlxPriceList.Id.ToString();
			                }
			                else
			                {
			                    clientContextService.CurrentContext.Remove("SlxPriceList");
			                }
						}
						else
						{
			                if (opportunity.SlxPriceList != null)
			                {
			                    clientContextService.CurrentContext.Add("SlxPriceList", opportunity.SlxPriceList.Id.ToString());
			                }
						}						
			        }
				}*/
			}
        }
    }
}