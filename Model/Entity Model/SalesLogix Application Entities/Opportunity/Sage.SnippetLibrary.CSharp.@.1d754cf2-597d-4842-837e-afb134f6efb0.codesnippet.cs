/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="1d754cf2-597d-4842-837e-afb134f6efb0">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>OnBeforeUpdateStep</name>
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
using NHibernate;
using Sage.SalesLogix.API;
using Sage.Platform.WebPortal.SmartParts;
#endregion Usings

namespace Sage.BusinessRules.CodeSnippets
{
    public static partial class OpportunityBusinessRules
    {
        public static void OnBeforeUpdateStep( IOpportunity opportunity,  ISession session)
        {
            //Sage.Entity.Interfaces.IOpportunity opp = BindingSource.Current as Sage.Entity.Interfaces.IOpportunity;

			if(opportunity.BusinessPotential <= 0)
			{
				 //DialogService.ShowMessage("Please Enter proper Business Potential...");
				//throw (new Exception("Please Enter proper Business Potential..."));
				throw new Sage.Platform.Application.ValidationException("Please Enter Proper Business Potential...");
			}			
			if (opportunity.Status == "Closed - Won")
			{
			    //pklStatus.PickListValue = opportunity.Status;
				throw new Sage.Platform.Application.ValidationException("You are not authorised to change the status to Closed - Won.");
			}
			else
			{
				if ((opportunity.Status == "Lost" || opportunity.Status == "Dropped" || opportunity.Status == "Future Opportunity") && string.IsNullOrEmpty(opportunity.Notes))
			   	{
		             //DialogService.ShowMessage("Please  mention comments for changing the status.");
					throw new Sage.Platform.Application.ValidationException("Please  mention comments for changing the status.");
		        
			   	}
				
				//System.Web.HttpContext.Current.Response.Redirect(string.Format("Opportunity.aspx?modeid=Detail"));
			 }   
        }
    }
}
