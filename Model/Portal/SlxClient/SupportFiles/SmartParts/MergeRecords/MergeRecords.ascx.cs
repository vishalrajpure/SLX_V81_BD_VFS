﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using NHibernate;
using Sage.Entity.Interfaces;
using Sage.Platform.Application;
using Sage.Platform.Application.UI;
using Sage.Platform.Security;
using Sage.Platform.WebPortal;
using Sage.Platform.WebPortal.SmartParts;
using Sage.SalesLogix.Services.Integration;
using Sage.SalesLogix.Services.PotentialMatch;
using SmartPartInfoProvider=Sage.Platform.WebPortal.SmartParts.SmartPartInfoProvider;
using Sage.Platform.Orm.Interfaces;

public partial class MergeRecords : SmartPartInfoProvider
{
    private IntegrationManager _integrationManager;
    private MergeArguments _sessionMergeArguments;
    private MergeOverwrite _recordOverwrite;
    private bool _loadResults = true;

    /// <summary>
    /// Gets or sets the session merge provider.
    /// </summary>
    /// <value>The session merge provider.</value>
    public MergeArguments SessionMergeArguments
    {
        get
        {
            if (_sessionMergeArguments == null)
            {
                if (DialogService.DialogParameters.ContainsKey("mergeArguments"))
                {
                    MergeArguments mergeArguments = DialogService.DialogParameters["mergeArguments"] as MergeArguments;
                    if (mergeArguments.MergeProvider == null)
                    {
                        MergeArguments.GetMergeProvider(mergeArguments);
                    }
                    _sessionMergeArguments = mergeArguments;
                }
            }
            return _sessionMergeArguments;
        }
        set { _sessionMergeArguments = value; }
    }

    /// <summary>
    /// Gets the integration manager.
    /// </summary>
    /// <value>The integration manager.</value>
    public IntegrationManager IntegrationManager
    {
        get
        {
            if (_integrationManager == null)
            {
                if (DialogService.DialogParameters.ContainsKey("IntegrationManager"))
                {
                    _integrationManager = (DialogService.DialogParameters["IntegrationManager"]) as IntegrationManager;
                }
            }
            return _integrationManager;
        }
    }

    /// <summary>
    /// Gets or sets the entity service.
    /// </summary>
    /// <value>The entity service.</value>
    [ServiceDependency(Type = typeof (IEntityContextService), Required = true)]
    public IEntityContextService EntityService { get; set; }

    /// <summary>
    /// Derived components should override this method to wire up event handlers for buttons and other controls in the form.
    /// </summary>
    protected override void OnWireEventHandlers()
    {
        base.OnWireEventHandlers();
        btnNext.Click += new EventHandler(btnNext_OnClick);
        btnBack.Click += new EventHandler(btnBack_OnClick);
        btnClose.Click += new EventHandler(DialogService.CloseEventHappened);
    }

    /// <summary>
    /// Raises the <see cref="E:Load"/> event.
    /// </summary>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (Visible)
        {
            if (DialogService.DialogParameters.ContainsKey("mergeArguments"))
            {
                btnNext.Text = SessionMergeArguments.SourceEntityType == typeof (ILead)
                                   ? GetLocalResourceObject("merge_Caption").ToString()
                                   : GetLocalResourceObject("btnNext.Caption").ToString();
            }
            RegisterClientScript();
        }
    }

    /// <summary>
    /// Raises the <see cref="E:System.Web.UI.Control.PreRender"/> event.
    /// </summary>
    /// <param name="e">An <see cref="T:System.EventArgs"/> object that contains the event data.</param>
    protected override void OnPreRender(EventArgs e)
    {
        if (!_loadResults) return;
        if (DialogService.DialogParameters.ContainsKey("mergeArguments"))
        {
            if (!Sage.SalesLogix.BusinessRules.BusinessRuleHelper.ValidateCanMergeEntity(
                    SessionMergeArguments.SourceEntityId, SessionMergeArguments.SourceEntityType))
            {
                DialogService.DialogParameters.Remove("mergeArguments");
                throw new ValidationException(GetLocalResourceObject("error_Promoted_Target").ToString());
            }
            btnBack.Visible = false;
            grdMerge.Height = 450;
            if (!SessionMergeArguments.MergeProvider.ValidateUserSecurity())
            {
                throw new UserObservableApplicationException(GetLocalResourceObject("error_Security_NoAccess").ToString());
            }

            grdMerge.DataSource = SessionMergeArguments.MergeProvider.GetMergeView(Convert.ToBoolean(txtShowAll.Value));
            _recordOverwrite = SessionMergeArguments.MergeProvider.RecordOverwrite;
        }
        else
        {
            if (DialogService.DialogParameters.ContainsKey("IntegrationManager"))
            {
                lnkMergeRecordsHelp.NavigateUrl = "Merge_Data.htm";
                grdMerge.Height = 275;
                if (IntegrationManager.DataViewMappings == null)
                {
                    IntegrationManager.SetMergeDataMappings(Convert.ToBoolean(txtShowAll.Value));
                }
                grdMerge.DataSource = IntegrationManager.DataViewMappings;
            }
        }
        grdMerge.DataBind();
        if (grdMerge.Rows.Count <= 0)
        {
            lblMergeText.Text = GetLocalResourceObject("lblMergeText_NoDifferences.Text").ToString();
            lblMergeDetailDifferences.Text = GetLocalResourceObject("lblMergeDetailNoDifferences.Caption").ToString();
        }
        else
        {
            lblMergeText.Text = GetLocalResourceObject("lblMergeText_DifferencesFound.Text").ToString();
            lblMergeDetailDifferences.Text = GetLocalResourceObject("lblMergeDetailDifferences.Caption").ToString();
        }
        lnkShowAllWizard.Text = Convert.ToBoolean(txtShowAll.Value)
                                    ? GetLocalResourceObject("lnkHideDups.Caption").ToString()
                                    : GetLocalResourceObject("lnkShowAll.Caption").ToString();
    }

    /// <summary>
    /// Registers the client script.
    /// </summary>
    private void RegisterClientScript()
    {
        StringBuilder sb = new StringBuilder(GetLocalResourceObject("MergeRecords_ClientScript").ToString());
        sb.Replace("@lnkShowAllWizardId", lnkShowAllWizard.ClientID);
        sb.Replace("@txtShowAllId", txtShowAll.ClientID);
        sb.Replace("@lnkShowAllCaption", PortalUtil.JavaScriptEncode(GetLocalResourceObject("lnkShowAll.Caption").ToString()));
        sb.Replace("@lnkHideDupsCaption", PortalUtil.JavaScriptEncode(GetLocalResourceObject("lnkHideDups.Caption").ToString()));
        ScriptManager.RegisterStartupScript(Page, GetType(), "MergeRecords", sb.ToString(), false);
    }

    /// <summary>
    /// Creates the record radio button.
    /// </summary>
    /// <param name="context">The context.</param>
    /// <returns></returns>
    protected string CreateRecordRadioButton(string context)
    {
        string radioButton = String.Empty;
        if (context.Equals("Source"))
        {
            string strChecked = String.Empty;
            if (_recordOverwrite == MergeOverwrite.sourceWins)
                strChecked = "checked";
            bool canMerge = !DialogService.DialogParameters.ContainsKey("mergeArguments") ||
                       Sage.SalesLogix.BusinessRules.BusinessRuleHelper.ValidateCanMergeEntity(
                           SessionMergeArguments.TargetEntityId, SessionMergeArguments.TargetEntityType);
            var disabled = canMerge ? string.Empty : "disabled";
            radioButton =
                String.Format(
                    "<input type='radio' onclick='onSourceWins()' checked='{0}' id='rdoSourceRecordWins' name='rdoRecordOverwrite' value='SourceWins' {1} />",
                    strChecked, disabled);
        }
        if (context.Equals("Target"))
        {
            string strChecked = String.Empty;
            if (_recordOverwrite == MergeOverwrite.targetWins)
                strChecked = "checked";
            radioButton =
                String.Format(
                    "<input type='radio' checked='{0}' onclick='onTargetWins()' id='rdoTargetRecordWins' name='rdoRecordOverwrite' value='TargetWins' {0} />",
                    strChecked);
        }
        return radioButton;
    }

    /// <summary>
    /// Creates the radio button for each of the configuration properties.
    /// </summary>
    /// <param name="data">The data.</param>
    /// <param name="context">The context.</param>
    /// <returns></returns>
    protected string CreatePropertyRadioButton(object data, string context)
    {
        string radioButton = String.Empty;
        if (data != null)
        {
            MergeRecordView mergeRecordView = data as MergeRecordView;
            if (mergeRecordView != null && !mergeRecordView.SourceValue.Equals(mergeRecordView.TargetValue))
            {
                if (!mergeRecordView.MergeDataOption.Equals(MergeDataOption.DisplayOnly))
                {
                    if (context.Equals("Source"))
                    {
                        string strChecked = String.Empty;
                        if (mergeRecordView.PropertyOverwrite == MergeOverwrite.sourceWins)
                            strChecked = "checked";
                        radioButton =
                            String.Format(
                                "<input type='radio' class='rdoSourceWins' id='rdoSourceWins_{0}' name='rdoMergeOverwrite_{0}' value='SourceWins' {1} />",
                                mergeRecordView.PropertyMapId, strChecked);
                    }
                    if (context.Equals("Target"))
                    {
                        string strChecked = String.Empty;
                        if (mergeRecordView.PropertyOverwrite == MergeOverwrite.targetWins)
                            strChecked = "checked";
                        radioButton =
                            String.Format(
                                "<input type='radio' class='rdoTargetWins' id='rdoTargetWins_{0}' name='rdoMergeOverwrite_{0}' value='TargetWins' {1} />",
                                mergeRecordView.PropertyMapId, strChecked);
                    }
                }
            }
        }
        return radioButton;
    }

    protected string GetSourceHeaderCaption()
    {
        return SessionMergeArguments != null
                   ? GetLocalResourceObject("Source.Caption").ToString()
                   : IntegrationManager.SourceMapping.Name;
    }

    protected string GetTargetHeaderCaption()
    {
        return SessionMergeArguments != null
                   ? GetLocalResourceObject("Target.Caption").ToString()
                   : IntegrationManager.TargetMapping.Name;
    }

    /// <summary>
    /// Handles the OnClick event of the btnNext control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void btnNext_OnClick(object sender, EventArgs e)
    {
        if (DialogService.DialogParameters.ContainsKey("mergeArguments"))
        {
            UpdatePropertyMappings(SessionMergeArguments.MergeProvider.MergeMaps);
            string recordOverWrite = Request.Form["rdoRecordOverwrite"];
            if (recordOverWrite != null)
            {
                SessionMergeArguments.MergeProvider.RecordOverwrite = recordOverWrite.Equals("SourceWins")
                                                                          ? MergeOverwrite.sourceWins
                                                                          : MergeOverwrite.targetWins;
            }

            if (SessionMergeArguments.SourceEntityType == typeof (ILead))
            {
                using (ISession session = new Sage.Platform.Orm.SessionScopeWrapper(true))
                {
                    Type type = SessionMergeArguments.MergeProvider.Source.EntityType;
                    string entityId = SessionMergeArguments.MergeProvider.Source.EntityId;
                    IPersistentEntity source = Sage.Platform.EntityFactory.GetById(type, entityId) as IPersistentEntity;
                    if (source != null)
                    {
                        source.Delete();
                        EntityService.RemoveEntityHistory(type, source);
                    }
                    Response.Redirect(String.Format("{0}.aspx", GetEntityName(SessionMergeArguments.MergeProvider.Target.EntityType)));
                }
            }
            else
            {
                ShowDialog("MergeAddress", GetLocalResourceObject("LinkAddress.Caption").ToString(), 600, 1200);
            }
        }
        else
        {
            UpdatePropertyMappings((IEnumerable<MergePropertyMap>)IntegrationManager.MergePropertyMaps);
            ShowDialog("MergeChildren", GetLocalResourceObject("LinkAddress.Caption").ToString(), 600, 1200);
        }
    }

    private static String GetEntityName(Type entity)
    {
        return entity.Name.Substring(1, entity.Name.Length - 1);
    }

    private void UpdatePropertyMappings(IEnumerable<MergePropertyMap> propertyMaps)
    {
        foreach (MergePropertyMap map in propertyMaps)
        {
            string overWrite = Request.Form[String.Format("rdoMergeOverwrite_{0}", map.Name)];
            if (overWrite != null)
            {
                map.MergeOverwrite = overWrite.Equals("SourceWins")
                                         ? MergeOverwrite.sourceWins
                                         : MergeOverwrite.targetWins;
            }
        }
    }

    /// <summary>
    /// Handles the OnClick event of the btnBack control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        ShowDialog("SearchResults", GetLocalResourceObject("LinkToAccounting_SelectAccount.Caption").ToString(), 375, 800);
    }

    /// <summary>
    /// Shows a particular dialog setting the caption height and width.
    /// </summary>
    /// <param name="dialog">The name of the dialog to be displayed.</param>
    /// <param name="caption">The caption of the dialog to be displayed.</param>
    /// <param name="height">The height of the dialog to be displayed.</param>
    /// <param name="width">The width of the dialog to be displayed.</param>
    private void ShowDialog(string dialog, string caption, int height, int width)
    {
        DialogService.SetSpecs(200, 200, height, width, dialog, caption, true);
        DialogService.ShowDialog();
    }

    /// <summary>
    /// Handles the OnClick event of the lnkShowAll control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void lnkShowAll_OnClick(object sender, EventArgs e)
    {
        if (DialogService.DialogParameters.ContainsKey("mergeArguments"))
        {
            IList<MergeRecordView> mergeView = SessionMergeArguments.MergeProvider.GetMergeView(Convert.ToBoolean(txtShowAll.Value));
            grdMerge.DataSource = mergeView;
        }
        else
        {
            IntegrationManager integrationManager = DialogService.DialogParameters["IntegrationManager"] as IntegrationManager;
            integrationManager.SetMergeDataMappings(Convert.ToBoolean(txtShowAll.Value));
            grdMerge.DataSource = integrationManager.DataViewMappings;
        }
        grdMerge.DataBind();
    }

    /// <summary>
    /// Called when the dialog is closing.
    /// </summary>
    protected override void OnClosing()
    {
        _loadResults = false;
    }

    /// <summary>
    /// Retrieves smart part information compatible with type smartPartInfoType.
    /// </summary>
    /// <param name="smartPartInfoType">Type of information to retrieve.</param>
    /// <returns>
    /// The <see cref="T:Sage.Platform.Application.UI.ISmartPartInfo"/> instance or null if none exists in the smart part.
    /// </returns>
    public override ISmartPartInfo GetSmartPartInfo(Type smartPartInfoType)
    {
        ToolsSmartPartInfo tinfo = new ToolsSmartPartInfo();
        foreach (Control c in MergeRecords_RTools.Controls)
        {
            tinfo.RightTools.Add(c);
        }
        return tinfo;
    }
}
