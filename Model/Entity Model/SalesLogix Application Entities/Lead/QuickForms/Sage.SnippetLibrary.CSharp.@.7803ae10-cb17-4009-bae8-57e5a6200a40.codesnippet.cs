/*
 * This metadata is used by the Saleslogix platform.  Do not remove.
<snippetHeader xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" id="7803ae10-cb17-4009-bae8-57e5a6200a40">
 <assembly>Sage.SnippetLibrary.CSharp</assembly>
 <name>lueLeadProduct_OnChangeStep</name>
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
    public static partial class LeadProducts_InsertEventHandlers
    {
        public static void lueLeadProduct_OnChangeStep( ILeadProducts_Insert form,  EventArgs args)
        {
            if (form.lueLeadProduct.LookupResultValue != null)
            {
                Sage.Entity.Interfaces.ILead parentEntity = form.CurrentEntity as Sage.Entity.Interfaces.ILead;
                Sage.Entity.Interfaces.IProduct relatedEntity = form.lueLeadProduct.LookupResultValue as Sage.Entity.Interfaces.IProduct;
                Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart smartpart = form.NativeForm as Sage.Platform.WebPortal.SmartParts.EntityBoundSmartPart;
                Sage.Platform.WebPortal.EntityPage page = (Sage.Platform.WebPortal.EntityPage)smartpart.Page;

                if ((parentEntity != null) && (relatedEntity != null))
                {
                    // check for duplicates
                    bool found = false;
                    foreach (Sage.Entity.Interfaces.ILeadProduct oc in parentEntity.Products)
                    {
                        if (oc.Product == relatedEntity)
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
                        Sage.Entity.Interfaces.ILeadProduct relationshipEntity = Sage.Platform.EntityFactory.Create<Sage.Entity.Interfaces.ILeadProduct>();
                        relationshipEntity.Lead = parentEntity;
                        relationshipEntity.Product = relatedEntity;
                        parentEntity.Products.Add(relationshipEntity);
                        if (page.ModeId.ToUpper() != "INSERT")
                        {
                            parentEntity.Save();
                        }

                        if (smartpart.DialogService != null)
                        {
                            smartpart.DialogService.SetSpecs(0, 0, 400, 600, "EditLeadProduct", string.Empty, true);
                            smartpart.DialogService.EntityType = typeof(Sage.Entity.Interfaces.ILeadProduct);
                            string id = string.Empty;

                            smartpart.DialogService.CompositeKeyNames = "Leadid,CompetitorID";
                            id = string.Format("{0},{1}", relationshipEntity.Leadid, relationshipEntity.ProductID);
                            if (Sage.Platform.WebPortal.PortalUtil.ObjectIsNewEntity(relationshipEntity))
                            {
                                id = relationshipEntity.InstanceId.ToString();
                                Sage.Platform.ChangeManagement.ChangeManagementEntityFactory.RegisterInstance(relationshipEntity, relationshipEntity.InstanceId);

                                if (relationshipEntity != null && relatedEntity != null)
                                    relationshipEntity.SetLeadProductDefaults(relatedEntity);

                            }
                            smartpart.DialogService.EntityID = id;
                            smartpart.DialogService.ShowDialog();
                        }
                    }
                }
                form.lueLeadProduct.LookupResultValue = null; //34026
            }
        }
    }
}