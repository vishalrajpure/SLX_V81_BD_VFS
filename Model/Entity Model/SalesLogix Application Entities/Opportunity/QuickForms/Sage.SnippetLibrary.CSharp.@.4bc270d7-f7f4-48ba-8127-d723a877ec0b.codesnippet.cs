/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="4bc270d7-f7f4-48ba-8127-d723a877ec0b">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>lueAssociateContacts_OnChangeStep</name>
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
    public static partial class OpportunityContacts_DetailEventHandlers
    {
        public static void lueAssociateContacts_OnChangeStep( IOpportunityContacts_Detail form,  EventArgs args)
        {
            if (form.lueAssociateContacts.LookupResultValue != null)
            {
                Sage.Entity.Interfaces.IOpportunity parentEntity = form.CurrentEntity as Sage.Entity.Interfaces.IOpportunity;
                Sage.Entity.Interfaces.IContact relatedEntity = form.lueAssociateContacts.LookupResultValue as Sage.Entity.Interfaces.IContact;
                Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart smartpart = form.NativeForm as Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart;
                Sage.Platform.WebPortal.EntityPage page = (Sage.Platform.WebPortal.EntityPage)smartpart.Page;

                if ((parentEntity != null) && (relatedEntity != null))
                {
                    // check for duplicates
                    bool found = false;
                    foreach (Sage.Entity.Interfaces.IOpportunityContact oc in parentEntity.Contacts)
                    {
                        if (oc.Contact == relatedEntity)
                        {
                            found = true;
                            break;
                        }
                    }

                    if (found)
                    {
                        if (smartpart != null && smartpart.DialogService != null)
                        {
                            string msg = string.Format(form.GetResource("DuplicateCompetitorMsg").ToString(), relatedEntity.Name);
                            smartpart.DialogService.ShowMessage(msg, form.GetResource("DuplicateCompetitorMsgTitle").ToString());
                        }
                    }
                    else
                    {
                        Sage.Entity.Interfaces.IOpportunityContact relationshipEntity = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.IOpportunityContact>();
                        relationshipEntity.Opportunity = parentEntity;
                        relationshipEntity.Contact = relatedEntity;
						
                        parentEntity.Contacts.Add(relationshipEntity);
                        if (page.ModeId.ToUpper() != "INSERT")
                        {
                            parentEntity.Save();
                        }

                        if (smartpart.DialogService != null)
                        {
                            smartpart.DialogService.SetSpecs(0, 0, 400, 600, "EditOpportunityContact", string.Empty, true);
                            smartpart.DialogService.EntityType = typeof(Sage.Entity.Interfaces.IOpportunityContact);
                            string id = string.Empty;

                            //smartpart.DialogService.CompositeKeyNames = "Opportunity.Id,Contact.Id";
                            //id = string.Format("{0},{1}", relationshipEntity.Opportunity.Id, relationshipEntity.Contact.Id);
							id = (string)relationshipEntity.Id;
                            if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(relationshipEntity))
                            {
                                id = relationshipEntity.InstanceId.ToString();
                                Sage.Platform.ChangeManagement.ChangeManagementEntityFactory.RegisterInstance(relationshipEntity, relationshipEntity.InstanceId);

                                if (relationshipEntity != null && relatedEntity != null)
                                    relationshipEntity.SetOppContactDefaults(relatedEntity);

                            }
                            smartpart.DialogService.EntityID = id;
                            smartpart.DialogService.ShowDialog();
                        }
                    }
                }
                form.lueAssociateContacts.LookupResultValue = null; //34026
            }
        }
    }
}