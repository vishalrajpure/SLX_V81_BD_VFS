/*globals Sage, dojo, dojox, dijit, Simplate, window, Sys, define, __doPostBack, GroupAdHocListMenu, getCookie, commonTaskActions, $, cookie */
define([
        'dijit/Menu',
        'dijit/Dialog',
        'dijit/form/Button',
        'dijit/form/CheckBox',
        'dijit/registry',
        'Sage/TaskPane/_BaseTaskPaneTasklet',
        'Sage/UI/MenuItem',
        'Sage/UI/Dialogs',
        'Sage/Utility/Email',
        'Sage/Groups/GroupManager',
        'dojo/_base/xhr',
        'dojo/_base/lang',
        'dojo/_base/declare',
        'dojo/string',
        'dojo/i18n!./nls/CommonTasksTasklet',
        'dojo/dom-class',
        'Sage/Utility/Jobs'
],
function (
    DijitMenu,
    DijitDialog,
    dijitButton,
    dijitCheckBox,
    dijitReg,
    _BaseTaskPaneTasklet,
    MenuItem,
    Dialogs,
    email,
    GroupManager,
    xhr,
    lang,
    declare,
    dString,
    nlsResource,
    domClass,
    jobs) {
    var commonTasksTasklet = declare('Sage.TaskPane.CommonTasksTasklet', _BaseTaskPaneTasklet, {
        constructor: function (args) {
            lang.mixin(this, nlsResource);
        },
        removeCurrentFromGroup: function () {
            this.getCurrentEntity();
            var svc = Sage.Services.getService("ClientGroupContext"),
                grpctxt,
                firstid;

            if (svc !== null) {
                grpctxt = svc.getContext();
                firstid = grpctxt.FirstEntityID;
                if (firstid === this.currentEntityId) {
                    firstid = grpctxt.NextEntityID;
                }
                if (firstid !== "") {
                    if (this.contextService) {
                        this.contextService.navigateSLXGroupEntity(firstid, this.currentEntityId);
                    }
                }

                Sage.Groups.GroupManager.removeIds(grpctxt.CurrentGroupID, grpctxt.CurrentName, grpctxt.CurrentFamily, [this.currentEntityId], function () {
                    __doPostBack("MainContent", "");
                }, function (err) {
                    console.error(err);
                }, this);
            }
        },
        removeSelectionsFromGroup: function () {
            GroupManager.removeSelectionsFromGroup();
        },
        saveSelectionsAsNewGroup: function () {
            GroupManager.saveSelectionsAsNewGroup();
        },
        showAdHocList: function (e) {
            var svc = Sage.Services.getService('ClientGroupContext'),
                i,
                item,
                parentNode;
            if (typeof (GroupAdHocListMenu) === 'undefined') {
                GroupAdHocListMenu = new DijitMenu({// jshint ignore:line
                    id: 'GroupAdHocList'
                });
                GroupAdHocListMenu.addChild(new MenuItem({
                    label: this.loadingText
                }));
            }

            svc.getAdHocGroupList(function (list) {
                GroupAdHocListMenu.destroyDescendants();
                for (i = 0; i < list.length; i++) {
                    item = list[i];
                    GroupAdHocListMenu.addChild(new MenuItem({
                        label: item.$descriptor || item.name,
                        ref: dString.substitute("javascript:Sage.Groups.GroupManager.addSelectionsToGroup('${0}')", [item.$key]),
                        onClick: function () {
                            if (this.ref !== '') {
                                try {
                                    window.location.href = this.ref;
                                    dijit.popup.close(GroupAdHocListMenu);
                                } catch (err) {
                                }
                            }
                        }
                    }));
                }
                GroupAdHocListMenu.on('blur', function () { dijit.popup.close(GroupAdHocListMenu); });
                GroupAdHocListMenu.startup();
            }, this);

            if (!e.pageX && !e.pageY) {
                // IE8 won't have e.pageX and e.pageY values
                e.pageX = e.clientX + document.body.scrollLeft;
                e.pageY = e.clientY + document.body.scrollTop;
            }

            dijit.popup.open({
                popup: GroupAdHocListMenu,
                x: e.pageX || 250,
                y: e.pageY || 250
            });

            parentNode = GroupAdHocListMenu.domNode.parentNode;
            if (parentNode && !domClass.contains(parentNode, 'commonTaskAdHoc')) {
                domClass.add(parentNode, 'commonTaskAdHoc');
            }
        },
        exportToExcel: function () {
            this.prepareSelectedRecords(this.triggerExportToExcelJob(this.getSelectionInfo(), this));
        },
        triggerExportToExcelJob: function (selectionInfo, self) {
            return function () {
                /* TODO: Add applied filter sets to parameters
                 * var panel = dijitReg.byId('list');
                var filterManager = panel.get('filterManager');
                var svc = Sage.Services.getService('ClientGroupContext');
                var context;
                var tableName;

                if (svc) {
                    context = svc.getContext();
                    tableName = context.CurrentTable;
                }

                filterManager.createQueryForJobs(tableName);*/

                var parameters = [
                    { "name": "SelectedIds", "value": (selectionInfo.selectionCount > 0) ? selectionInfo.selectedIds.join(',') || '' : '' },
                    { "name": "GroupId", "value": self.getCurrentGroupId()}
                ];
                var groupName = self.getCurrentGroupName();
                var dateStamp = dojo.date.locale.format(new Date(), { selector: "date", datePattern: "yyyy_MM_dd_hhmm" });
                var user = '';
                var clientContextSvc = Sage.Services.getService('ClientContextService');
                if (clientContextSvc) {
                    if (clientContextSvc.containsKey("userPrettyName")) {
                        user = clientContextSvc.getValue("userPrettyName");
                    }
                }
                
                var description = dString.substitute("${0}_${1}_${2}", [groupName, user, dateStamp]);
                var options = {
                    descriptor: description,
                    closable: true,
                    title: self.exportToExcel_Caption,
                    key: "Sage.SalesLogix.BusinessRules.Jobs.ExportToExcelJob",
                    parameters: parameters,
                    infoMessage: self.exportProcessingJobMsg,
                    success: function (result) {
                    },
                    failure: function (result) {
                        Dialogs.showError(dojo.string.substitute(self.errorRequestingJobMgr, [result.result]));
                    },
                    ensureZeroFilters: true
                };
                jobs.triggerJobAndDisplayProgressDialog(options);
            };
        },
		TransferContact: function () {
            this.getCurrentEntity();
            this.prepareSelectedRecords(this.promptForFileFormat2(this));
        },
        
        // Prompt the user to select which delimiter the export should use.
        // Their cultural version of csv or Excel preferred Tab.
        // Also allow the user to save this preference, and not be prompted again.
        promptForFileFormat2: function () {
            var self = this,
                promptForFileFormatDialogId = "promptForFileFormat-Dialog",
                promptForFileFormatDialog = dijit.byId(promptForFileFormatDialogId);

            if (!promptForFileFormatDialog) {
                promptForFileFormatDialog = new DijitDialog({
                    id: promptForFileFormatDialogId,
                    title: "Transfer Contact"
                });
            }

            promptForFileFormatDialog.attr("content", this.getPromptForFileFormatTemplate2().apply({ dialogId: promptForFileFormatDialogId }));
            promptForFileFormatDialog.show();
        },

        getPromptForFileFormatTemplate2: function () {
            return new Simplate([
                '<div>',
                    '<iframe id ="ie" src="smartparts/ContactOwnerChange.aspx" runat="server" width:300,height:150></iframe>',
                    '<br />',
                    '<div style="padding-right:5px; padding-bottom:5px; text-align:right;">',
                        '<button data-dojo-type="dijit.form.Button" type="submit" class="ok-button" onClick="commonTaskActions.onTransferContactClick();">{%= commonTaskActions.exportToFile_OK %}</button>',
                        '<button data-dojo-type="dijit.form.Button" type="button" class="cancel-button" onClick="dijit.byId(\'promptForFileFormat-Dialog\').hide();">{%= commonTaskActions.exportToFile_Cancel %}</button>',
                    '</div>',
                '</div>'
            ]);
        },
        onTransferContactClick: function () {

            //Call the click event for the hidden sumbit button.
        var childiFrame = document.getElementById("ie");       
        var innerDoc = childiFrame.contentDocument || childiFrame.contentWindow.document;
        var Usr = innerDoc.getElementById('drpusers');
        var User = Usr.options[Usr.selectedIndex].value;
            if (User == '0') {
                alert('Please select User');
                window.frames['ie'].document.getElementById('drpusers').focus();
            }
            else {
                document.cookie = "User=" + User;
                dojo.byId([this.clientId, '_tskTransferContact'].join('')).click();
                //dialog.hide(); 
            }

        },
		
		TransferAccount: function () {
            this.getCurrentEntity();
            this.prepareSelectedRecords(this.promptForFileFormat1(this));
        },
        
        // Prompt the user to select which delimiter the export should use.
        // Their cultural version of csv or Excel preferred Tab.
        // Also allow the user to save this preference, and not be prompted again.
        promptForFileFormat1: function () {
            var self = this,
                promptForFileFormatDialogId = "promptForFileFormat-Dialog",
                promptForFileFormatDialog = dijit.byId(promptForFileFormatDialogId);

            if (!promptForFileFormatDialog) {
                promptForFileFormatDialog = new DijitDialog({
                    id: promptForFileFormatDialogId,
                    title: "Transfer Account"
                });
            }

            promptForFileFormatDialog.attr("content", this.getPromptForFileFormatTemplate1().apply({ dialogId: promptForFileFormatDialogId }));
            promptForFileFormatDialog.show();
        },

        getPromptForFileFormatTemplate1: function () {
            return new Simplate([
                '<div>',
                    '<iframe id ="ie" src="smartparts/AccountOwnerChange.aspx" runat="server" width:300,height:150></iframe>',
                    '<br />',
                    '<div style="padding-right:5px; padding-bottom:5px; text-align:right;">',
                        '<button data-dojo-type="dijit.form.Button" type="submit" class="ok-button" onClick="commonTaskActions.onTransferAccountClick();">{%= commonTaskActions.exportToFile_OK %}</button>',
                        '<button data-dojo-type="dijit.form.Button" type="button" class="cancel-button" onClick="dijit.byId(\'promptForFileFormat-Dialog\').hide();">{%= commonTaskActions.exportToFile_Cancel %}</button>',
                    '</div>',
                '</div>'
            ]);
        },
        onTransferAccountClick: function () {

            //Call the click event for the hidden sumbit button.
        var childiFrame = document.getElementById("ie");       
        var innerDoc = childiFrame.contentDocument || childiFrame.contentWindow.document;
        var Usr = innerDoc.getElementById('drpusers');
        var User = Usr.options[Usr.selectedIndex].value;
            if (User == '0') {
                alert('Please select User');
                window.frames['ie'].document.getElementById('drpusers').focus();
            }
            else {
                document.cookie = "User=" + User;
                dojo.byId([this.clientId, '_tskTransferAccount'].join('')).click();
                //dialog.hide(); 
            }

        },
        exportToFile: function () {
            this.getCurrentEntity();
            this.prepareSelectedRecords(this.fileFormatCheck(this));
        },
        fileFormatCheck: function (self) {
            return function () {
                var formatIsSaved = cookie.getCookie("formatIsSaved"),
                format = cookie.getCookie("format");
                //Check for cookie of file format type preference
                if (formatIsSaved === "true" && format.length > 0) {
                    dojo.byId([self.clientId, '_tskExportToExcel'].join('')).click();
                } else {
                    self.promptForFileFormat();
                }
            };
        },
        // Prompt the user to select which delimiter the export should use.
        // Their cultural version of csv or Excel preferred Tab.
        // Also allow the user to save this preference, and not be prompted again.
        promptForFileFormat: function () {
            var self = this,
                promptForFileFormatDialogId = "promptForFileFormat-Dialog",
                promptForFileFormatDialog = dijit.byId(promptForFileFormatDialogId);

            if (!promptForFileFormatDialog) {
                promptForFileFormatDialog = new DijitDialog({
                    id: promptForFileFormatDialogId,
                    title: self.exportToFile_DialogTitle
                });
            }

            promptForFileFormatDialog.attr("content", this.getPromptForFileFormatTemplate().apply({ dialogId: promptForFileFormatDialogId }));
            promptForFileFormatDialog.show();
        },
        getPromptForFileFormatTemplate: function () {
            return new Simplate([
                '<div>',
                    '<label style="padding-left:5px">{%= commonTaskActions.selectFileFormat %}</label>',
                    '<br />',
                    '<div style="padding-left:10px; padding-top:7px">',
                        '<input id="radioCSV" name="format_type" type="radio" data-dojo-type="dijit.form.RadioButton" value="csv" checked="true" />{%= commonTaskActions.exportToFile_OptionCSV %}',
                    '</div>',
                    '<div style="padding-left:10px; padding-top:7px">',
                        '<input id="radioTab" name="format_type" type="radio" data-dojo-type="dijit.form.RadioButton" value="tab" />{%= commonTaskActions.exportToFile_OptionTab %}',
                    '</div>',
                    '<div style="padding-left:11px; padding-top:7px">',
                        '<input id="exportFormatSaved" dojoAttachPoint="exportFormatSaved" data-dojo-type="dijit.form.CheckBox" value="true" />{%= commonTaskActions.exportToFile_OptionSaveFormat %}',
                    '</div>',
            //buttons
                    '<div style="padding-right:5px; padding-bottom:5px; text-align:right;">',
                        '<button data-dojo-type="dijit.form.Button" type="submit" class="ok-button" onClick="commonTaskActions.onExportToFileClick();">{%= commonTaskActions.exportToFile_OK %}</button>',
                        '<button data-dojo-type="dijit.form.Button" type="button" class="cancel-button" onClick="dijit.byId(\'promptForFileFormat-Dialog\').hide();">{%= commonTaskActions.exportToFile_Cancel %}</button>',
                    '</div>',
                '</div>'
            ]);
        },
        onExportToFileClick: function () {
            //Get the user preference
            var typeIsSaved = dojo.byId("exportFormatSaved");
            var formatType;
            //Save the user preference
            if (typeIsSaved !== undefined && typeIsSaved.checked) {
                document.cookie = "formatIsSaved=true; expires=1/01/2020";
            }
            if (dojo.byId("radioCSV").checked) {
                formatType = "csv";
            }
            else {
                formatType = "tab";
            }
            document.cookie = "format=" + formatType + "; expires=1/01/2020";
            //Call the click event for the hidden sumbit button.
            dojo.byId([this.clientId, '_tskExportToExcel'].join('')).click();
        },
        emailSend: function () {
            this.getCurrentEntity();
            var url = "slxdata.ashx/slx/crm/-/namedqueries?columnaliases=email&format=json&hql=";
            var sHql = this.getURL(this.currentEntityTableName);

            if (sHql === null) {
                Dialogs.showError(this.noPrimaryEmail);
                return;
            }
            url = url + sHql;
            var self = this;
            dojo.xhrGet({
                url: url,
                handleAs: 'json',
                load: function (data) {
                    self.sendEmail(data);
                },
                error: function (error) {
                    Dialogs.showError(error.StatusText);
                }
            });
        },
        getURL: function (entity) {
            var url = null;
            switch (entity) {
                // Example when using cached Named Query                            
                case 'CONTACT': url = dojo.string.substitute("select con.Email from Contact con where con.id like '${0}'", [this.currentEntityId]);
                    break;
                case 'ACCOUNT': url = dojo.string.substitute("select con.Email from Contact as con where con.Account.id like '${0}' and con.IsPrimary like 'T'", [this.currentEntityId]);
                    break;
                case 'OPPORTUNITY': url = dojo.string.substitute("select con.Email from Opportunity as opp left join opp.Contacts as oppCon left join oppCon.Contact as con where opp.id like '${0}' and oppCon.IsPrimary like 'T'", [this.currentEntityId]);
                    break;
                case 'LEAD': url = dojo.string.substitute("select le.Email from Lead le where le.id like '${0}'", [this.currentEntityId]);
                    break;
                case 'CAMPAIGN': url = dojo.string.substitute("select ufo.Email from Campaign as cam left join cam.AccountManager as usr left join usr.UserInfo as ufo where cam.id like '${0}'", [this.currentEntityId]);
                    break;
                case 'TICKET': url = dojo.string.substitute("select ufo.Email from User as usr left join usr.UserInfo as ufo where usr.DefaultOwner in  (select own.id from Ticket as tic left join tic.AssignedTo as own where tic.id like '${0}')", [this.currentEntityId]);
                    break;
                case 'DEFECT': url = dojo.string.substitute("select ufo.Email from User as usr left join usr.UserInfo as ufo where usr.DefaultOwner in (select own.id from Defect as def left join def.AssignedTo as own where def.id like '${0}')", [this.currentEntityId]);
                    break;
                case 'CONTRACT': url = dojo.string.substitute("select con.Email from Contract as crt left join crt.Contact as con where crt.id like '${0}'", [this.currentEntityId]);
                    break;
                case 'SALESORDER': url = dojo.string.substitute("select so.ShippingContact.Email from SalesOrder as so where so.Id eq '${0}'", [this.currentEntityId]);
                    break;
                case 'RMA': url = dojo.string.substitute("select con.Email from Return as ret left join ret.ReturnedBy as con where ret.id like '${0}'", [this.currentEntityId]);
                    break;
            }
            return url;
        },
        sendEmail: function (email) {
            if (email.count > 0) {
                var sEmail = email.items[0].email;
                if (sEmail) {
                    sEmail = "mailto:" + sEmail;
                    document.location.href = sEmail;
                    return;
                }
            }
            Dialogs.showError(this.noPrimaryEmail);
        },
        // this is a callback method that calls a method on the Sage.ClientLinkHandler which has a global
        // module that converts the client call into a code-behind call that is handled in the ClientLinkHandler.ascx.cs
        // file.  The method in the Sage.ClientLinkHandler calls a method in the server-side LinkHandler which lives in App_Code.
        // From there, a dialog can be created and displayed.  The dialog takes the selection key and uses the
        // client selection service to get the selected records from the grid.  This callback method is defined in the
        // FillDictionaries method in CommonTasksTasklet.ascx.cs.
        copyUser: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'CopyUser', selectionInfoKey: selectionKey });
        },
        copyUserProfile: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'CopyUserProfile', selectionInfoKey: selectionKey });
        },
        deleteUsers: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'DeleteUsers', selectionInfoKey: selectionKey });
        },
        addToTeam: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'AddToTeam', selectionInfoKey: selectionKey });
        },
        removeFromTeam: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'RemoveFromTeam', selectionInfoKey: selectionKey });
        },
        removeFromAllTeams: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'RemoveFromAllTeams', selectionInfoKey: selectionKey });
        },
        assignRole: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'AssignRole', selectionInfoKey: selectionKey });
        },
        replaceTeamMember: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'ReplaceTeamMember', selectionInfoKey: selectionKey });
        },
        deleteTeam: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'DeleteTeam', selectionInfoKey: selectionKey });
        },
        deleteDepartment: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'DeleteDepartment', selectionInfoKey: selectionKey });
        },
        copyTeam: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'CopyTeam', selectionInfoKey: selectionKey });
        },
        copyDepartment: function () {
            var selectionKey = dojo.byId([commonTaskActions.clientId, '_hfSelections'].join('')).value;
            Sage.ClientLinkHandler.request({ request: 'Administration', type: 'CopyDepartment', selectionInfoKey: selectionKey });
        },
        showDetailReport: function () {
            var oReporting = Sage.Services.getService("ReportingService");
            if (oReporting) {
                oReporting.showDefaultReport();
            }
        },
        writeEmailToGroupSelection: function () {
            email.writeEmailToGroupSelection();
        }
    });
    return commonTasksTasklet;
});
