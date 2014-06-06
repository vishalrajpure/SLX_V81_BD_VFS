/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="fca09298-b303-4613-b483-1179843cbbb0">
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
    public static partial class OpportunityCompetitorsEventHandlers
    {
        public static void OnLoad1Step( IOpportunityCompetitors form,  EventArgs args)
        {
            Sage.Entity.Interfaces.IOpportunity opportunity = form.CurrentEntity as Sage.Entity.Interfaces.IOpportunity;
			if (opportunity.Status == "Closed - Won" || opportunity.Status.ToUpper() == "LOST" || opportunity.Status.ToUpper() == "DROPPED")
			{
			   	form.grdOppCompetitors.Enabled = false;
			    form.lueAssociateCompetitor.Enabled=false;
			}
			else
			{
			  	form.grdOppCompetitors.Enabled = true;
				form.lueAssociateCompetitor.Enabled = true;
			}

			//if (!form.PostBack)
			//{
			    string _UserId = "", AccManager = "";
			    Sage.Platform.Security.IUserService _IUserService = Sage.Platform.Application.ApplicationContext.Current.Services.Get<Sage.Platform.Security.IUserService>();
			    _UserId = _IUserService.UserId; //get login Userid
				if(opportunity.AccountManager != null)
				{
				    AccManager = Convert.ToString(opportunity.AccountManager.Id);
				    if (AccManager.Trim() == _UserId.Trim() || Convert.ToString(opportunity.Account.AccountManager.Id) == _UserId.Trim())
				    {
				     	form.grdOppCompetitors.Enabled = false;
						form.lueAssociateCompetitor.Enabled = true;
				    }
				    else
				    {
				       	form.grdOppCompetitors.Enabled = true;
						form.lueAssociateCompetitor.Enabled = true;
				    }
				}
			//}
			
        }
    }
}