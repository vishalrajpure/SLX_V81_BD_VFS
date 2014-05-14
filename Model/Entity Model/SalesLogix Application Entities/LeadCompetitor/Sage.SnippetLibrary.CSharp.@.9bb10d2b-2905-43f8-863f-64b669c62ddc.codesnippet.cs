/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="9bb10d2b-2905-43f8-863f-64b669c62ddc">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>SetLeadCompetitorDefaultsStep</name>
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
    public static partial class LeadCompetitorBusinessRules
    {
        public static void SetLeadCompetitorDefaultsStep( ILeadCompetitor leadcompetitor,  ICompetitor competitor)
        {
            leadcompetitor.Competitor = competitor;
		    leadcompetitor.RATING = competitor.Rating;
		    leadcompetitor.STRENGTHS = competitor.Strengths;
		    leadcompetitor.WEAKNESSES = competitor.Weaknesses;
		    leadcompetitor.STRATEGY = competitor.Strategy;
		    leadcompetitor.Notes = competitor.Notes;
		    leadcompetitor.INCUMBENT = false;

        }
    }
}