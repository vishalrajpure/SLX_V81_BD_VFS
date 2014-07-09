/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="95627f97-eafd-49d5-99d9-fe71d9fe88b5">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>OnBeforeInsertStep</name>
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
#endregion Usings

namespace Sage.BusinessRules.CodeSnippets
{
    public static partial class OpportunityBusinessRules
    {
        public static void OnBeforeInsertStep( IOpportunity opportunity,  ISession session)
        {
            if(opportunity.BusinessPotential <= 0)
			{
				 throw new Sage.Platform.Application.ValidationException("Please Enter Proper Business Potential...");
			     
			}
			if(opportunity.Products.Count <= 0)
			{
				 throw new Sage.Platform.Application.ValidationException("Product required...");
			     
			}
        }
    }
}