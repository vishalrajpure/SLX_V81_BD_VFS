Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.UserIntegrations = {

  

makeGrid : function(runtimeConfig) {
    require(['Sage/UI/EditableGrid',
             'Sage/UI/Columns/DateTime',
             'Sage/UI/Columns/SlxLink',
             'Sage/UI/Columns/SlxEdit',
             'Sage/UI/Columns/PickList',
             'Sage/UI/Columns/Phone',
             'Sage/UI/Columns/Email',
             'Sage/UI/Columns/CheckBox',
             'Sage/UI/Columns/Numeric',
             'Sage/UI/Columns/Currency',
             'Sage/UI/Columns/Lookup',
             'dojo/aspect',
             'Sage/UI/SLXPreviewGrid',
             'Sage/UI/Columns/SlxUser'],
			 
			 function(EditableGrid, DateTime, SlxLink, SlxEdit, PickList, Phone, Email, CheckBox,
			   Numeric, Currency, Lookup, aspect, SLXPreviewGrid, SlxUser) {
    
    if (typeof UserIntegrationsgrdUserMaps_Strings === 'undefined') {
        UserIntegrationsgrdUserMaps_Strings = {};
    }

    var options = {		
		        context: runtimeConfig,		
				        		//Set to the value of the ReadOnlyCondition property
		          readOnly: false,
			        columns: [
    {
        field: '$key',
        editable: false,
		excludeFromFilters: true,
        hidden: true,
        id: 'id',
        formatter: function (value, rowIdx, cel) {
            var insertId = [cel.grid.id, '-row', rowIdx].join('');
            var id = (Sage.Utility.getModeId() === 'insert') ? insertId : value;
            var anchor = ['<div id=', id, ' >', id, '</ div>'].join('');
            return anchor;
        }
    },

{
		field: 'Enabled',
				name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_6dd9a68d_8002_4804_97cc_bfbfad954fe7_ColumnHeading']  || 'Enable Sync',
	sortable: true,
		width: 6,
		styles: 'width:auto;',
    cellClasses: '  aligncenter ',
	headerClasses: ' alignleft '
,
	editable: true,
	type: CheckBox,
	defaultValue: "x"   }
  	,
{
		field: 'Integration.Name',
				name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_ed4eb596_44ab_426e_b579_8d4f537226a8_ColumnHeading']  || 'Integration',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{
		field: 'Name',
				name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_538047f7_512d_4df8_b6e6_f2e730ba0b71_ColumnHeading']  || 'Display Name',
	sortable: true,
		width: 20,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{
		field: 'ExternalIdentifier',
				name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_f3fcc9c0_9088_49f1_a84e_b547ec4d766b_ColumnHeading']  || 'Integration Mapping',
	sortable: true,
		width: 15,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: true
				}
  	,
{
		field: 'Integration.LinkType',
				name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_084c7934_5eaa_4aaf_9f04_63bcd8068fed_ColumnHeading']  || 'Type',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{
		field: 'IsUserIntegrationMap',
				    //Set to the value of the visibleCondition property
	    hidden: function () { return true; }(),
		name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_1f3b80f1_9e32_4844_b74c_c739e84ad01e_ColumnHeading']  || '',
	sortable: false,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{
		field: 'Id',
				    //Set to the value of the visibleCondition property
	    hidden: function () { return true; }(),
		name:  UserIntegrationsgrdUserMaps_Strings['grdUserMaps_9be32f03_8cf9_4c0e_9419_581335f71f5a_ColumnHeading']  || '',
	sortable: false,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	          ],
        storeOptions: {
            resourceKind: 'userIntegrationsViews',
            include: [],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'UserIntegrationsgrdUserMaps_DataCarrier',
            sort: [
                      ]
        },
        tools: [

 {
    id : 'UserIntegrations_btnEnableSync',
  displayInInsert : false,
  imageClass: 'icon_Sync_Enable_16x16',  'alternateText' : UserIntegrationsgrdUserMaps_Strings['grdUserMaps_btnEnableSync_ToolTip'] || 'Enable sync',
          'handler' : function () {
//get grid selections to enable sync
//var grid = this;
var selectedItems = grid.selection.getSelected();
if (selectedItems.length < 1) {
    Sage.UI.Dialogs.showError(grid.noSelectionsText);
    return;
}
if (selectedItems.length) {
    dojo.forEach(selectedItems, function (selectedItem) {
        if (selectedItem !== null) {
            if (selectedItem.IsUserIntegrationMap) {

            }
            //			                                 dojo.forEach(grid.store.getAttributes(selectedItem), function(attribute) {
            //			                                     // Get the value of the current attribute:
            //			                                     var value = grid.store.getValues(selectedItem, attribute);
            //			                                     // Now, you can do something with this attribute/value pair.
            //			                                     // Our short example shows the attribute together
            //			                                     // with the value in an alert box, but we are sure, that
            //			                                     // you'll find a more ambitious usage in your own code:
            //			                                     alert('attribute: ' + attribute + ', value: ' + value);
            //			                                 }); // end forEach
        } // end if
    }); // end forEach
}
}
}
  ,
 {
    id : 'UserIntegrations_btnDisableSync',
  displayInInsert : false,
  imageClass: 'icon_Sync_Disable_16x16',  'alternateText' : UserIntegrationsgrdUserMaps_Strings['grdUserMaps_btnDisableSync_ToolTip'] || 'Disable sync',
          'handler' : function () {
//get grid selections to disable sync 
}
}
           ],
        contextualCondition: function() { return 'User.Id eq "' + Sage.Utility.getCurrentEntityId() + '"'; },
        
						tabId : 'UserIntegrations',
		gridNodeId: 'UserIntegrationsgrdUserMaps_Grid',
				id : 'UserIntegrationsgrdUserMaps',
        rowsPerPage: 20,
        singleClickEdit: true
    };

		var grid = new EditableGrid(options);
	var container = dijit.byId(grid.gridNodeId);
	container.addChild(grid);
	    window.setTimeout(function () { grid.startup(); }, 1);
	aspect.after(grid, 'startup', function () {
		// This is not a typo.  The dijit.layout.ContentPane is not affectively determining all of it's layout information
		// on the first pass through resize.  Calling resize twice effectively renders the grid to fill it's container.
		var localTC = dijit.byId('tabContent');
		localTC.resize(); localTC.resize();
	});
   
});
}

  ,

    init : function(runtimeConfig) {
        setTimeout(function() { Sage.UI.Forms.UserIntegrations.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();