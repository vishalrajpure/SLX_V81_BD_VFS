/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="0ccd4530-3845-41d7-9fa3-4462fc21de1a">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>QFButton_OnClickStep</name>
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
    public static partial class DroppedFutureOppEventHandlers
    {
        public static void QFButton_OnClickStep( IDroppedFutureOpp form,  EventArgs args)
        {
           IOpportunity opportunity = form.CurrentEntity as IOpportunity;
            if (!(opportunity.Closed ?? false))
			{
			    object resOpen = System.Web.HttpContext.GetGlobalResourceObject("Opportunity", "Opp_Status_Active");
                if (resOpen != null)
			    {
                    opportunity.Status = resOpen.ToString(); //"Open";
			    }
			}
		}
    }
}