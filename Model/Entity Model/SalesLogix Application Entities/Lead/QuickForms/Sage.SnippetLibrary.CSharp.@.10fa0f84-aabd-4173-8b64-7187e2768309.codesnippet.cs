/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="10fa0f84-aabd-4173-8b64-7187e2768309">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>lueLeadCompetitor_OnChangeStep</name>
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
    public static partial class LeadCompetitorsEventHandlers
    {
        public static void lueLeadCompetitor_OnChangeStep( ILeadCompetitors form,  EventArgs args)
        {
            if (form.lueLeadCompetitor.LookupResultValue != null)
            {
                Sage.Entity.Interfaces.ILead parentEntity = form.CurrentEntity as Sage.Entity.Interfaces.ILead;
                Sage.Entity.Interfaces.ICompetitor relatedEntity = form.lueLeadCompetitor.LookupResultValue as Sage.Entity.Interfaces.ICompetitor;
                Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart smartpart = form.NativeForm as Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart;
                Sage.Platform.WebPortal.EntityPage page = (Sage.Platform.WebPortal.EntityPage)smartpart.Page;

                if ((parentEntity != null) && (relatedEntity != null))
                {
                    // check for duplicates
                    bool found = false;
                    foreach (Sage.Entity.Interfaces.ILeadCompetitor oc in parentEntity.Competitors)
                    {
                        if (oc.Competitor == relatedEntity)
                        {
                            found = true;
                            break;
                        }
                    }

                    if (found)
                    {
                        if (smartpart != null && smartpart.DialogService != null)
                        {
                            string msg = string.Format(form.GetResource("DuplicateCompetitorMsg").ToString(), relatedEntity.CompetitorName);
                            smartpart.DialogService.ShowMessage(msg, form.GetResource("DuplicateCompetitorMsgTitle").ToString());
                        }
                    }
                    else
                    {
                        Sage.Entity.Interfaces.ILeadCompetitor relationshipEntity = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.ILeadCompetitor>();
                        relationshipEntity.Lead = parentEntity;
                        relationshipEntity.Competitor = relatedEntity;
                        parentEntity.Competitors.Add(relationshipEntity);
                        if (page.ModeId.ToUpper() != "INSERT")
                        {
                            parentEntity.Save();
                        }

                        if (smartpart.DialogService != null)
                        {
                            smartpart.DialogService.SetSpecs(0, 0, 400, 600, "EditLeadCompetitor", string.Empty, true);
                            smartpart.DialogService.EntityType = typeof(Sage.Entity.Interfaces.ILeadCompetitor);
                            string id = string.Empty;

                            //smartpart.DialogService.CompositeKeyNames = "Leadid,CompetitorID";
                            id = (string)relationshipEntity.Id;//string.Format("{0},{1}", relationshipEntity.Leadid, relationshipEntity.CompetitorID);
                            if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(relationshipEntity))
                            {
                                id = relationshipEntity.InstanceId.ToString();
                                Sage.Platform.ChangeManagement.ChangeManagementEntityFactory.RegisterInstance(relationshipEntity, relationshipEntity.InstanceId);

                                if (relationshipEntity != null && relatedEntity != null)
                                    relationshipEntity.SetLeadCompetitorDefaults(relatedEntity);

                            }
                            smartpart.DialogService.EntityID = id;
                            smartpart.DialogService.ShowDialog();
                        }
                    }
                }
                form.lueLeadCompetitor.LookupResultValue = null; //34026
            }
        }
    }
}
