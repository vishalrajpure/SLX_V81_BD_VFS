Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.IntegrationUsers = {

  

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
    
    if (typeof IntegrationUsersgrdUsers_Strings === 'undefined') {
        IntegrationUsersgrdUsers_Strings = {};
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
				name:  IntegrationUsersgrdUsers_Strings['grdUsers_54fb01a9_10a4_4883_856c_927744dde02d_ColumnHeading']  || 'Enable Sync',
	sortable: false,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  aligncenter ',
	headerClasses: ' alignleft '
,
	editable: true,
	type: CheckBox,
	defaultValue: "x"   }
  	,
{ 
    	field: 'User.UserInfo.NameLF',
				name:  IntegrationUsersgrdUsers_Strings['grdUsers_5a60b41f_90eb_4616_8e68_09d14df226d0_ColumnHeading']  || 'User',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
    ,type: SlxLink
    ,editable: false
,
			pageName: 'User',
							idField: 'User.$key'
			 }
  	,
{
		field: 'User.Type',
				name:  IntegrationUsersgrdUsers_Strings['grdUsers_a46d8081_5c68_4020_9bf2_0c8dc3fdf6c3_ColumnHeading']  || 'User Type',
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
		field: 'User.UserInfo.Department',
				name:  IntegrationUsersgrdUsers_Strings['grdUsers_2acc77c9_abfe_41cf_a8d5_a025adb64ee6_ColumnHeading']  || 'Department',
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
		field: 'ExternalIdentifier',
				name:  IntegrationUsersgrdUsers_Strings['grdUsers_43c32e14_eb8e_467d_ae89_bfb058b739a5_ColumnHeading']  || 'Integration Mapping',
	sortable: true,
		width: 30,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: true
				}
  	          ],
		         storeOptions: {
            resourceKind: 'userIntegrationMaps',
            newItemParentReferenceProperty: 'Integration',
            include: [],
            select: ['User.Id'],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'IntegrationUsersgrdUsers_DataCarrier',
            sort: [
                    ]
        },
        tools: [

{
    id : 'IntegrationUsers_Save',
  displayInInsert : false,
  imageClass: 'icon_Save_16x16',  'alternateText' : IntegrationUsersgrdUsers_Strings['grdUsers_Save_ToolTip'] || 'Save',
       mergePosition : 'Default',   mergeControlId : 'Entities/IntegrationLink/Edit', 'handler' : function() {
    this.saveChanges();
 }
}
  ,
{
  displayInInsert : false,
  type : 'Sage.UI.SDataLookup',
  controlConfig : 
{
  id : 'grdUsers_AddRelationTool',
  btnToolTip :  IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_ButtonTooltip']  ||  'Add Users', 
  btnIcon:  '~/ImageResource.axd?scope=global&type=Global_Images&key=plus_16x16'  ,
  dialogButtonText : IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_DialogButtonText']  ||  'Add Selected', 
  displayMode : 4, //$ {qf control . LookupDisplayMode}  When adding other dijit templates, need to convert control to use enum values
  dialogTitle : IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_LookupDialogTitle']  ||  'Lookup User',
      structure : [
     {
       defaultCell: { width: 8, editable: false, styles: 'text-align: left;' },
       cells: [
	       {
        field: '$key',
        editable: false,
        hidden: true,
        id: 'id',
		excludeFromFilters: true,
        formatter: function (value, rowIdx, grid) {
            var anchor = ['<div id=', value, ' >', value, '</ div>'].join('');
		return anchor;
        }
    },
         
		 {
		   name: IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_LookupProperties_UserInfo_UserName_PropertyHeader']  || 'User Name',
		   field: 'UserInfo.UserName',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 17,
		   sortable: true
         }
         ,
		 {
		   name: IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_LookupProperties_UserInfo_Division_PropertyHeader']  || 'Division',
		   field: 'UserInfo.Division',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   sortable: true
         }
         ,
		 {
		   name: IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_LookupProperties_UserInfo_Region_PropertyHeader']  || 'Region',
		   field: 'UserInfo.Region',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   sortable: true
         }
         ,
		 {
		   name: IntegrationUsersgrdUsers_AddRelationTool_Strings['grdUsers_AddRelationTool_LookupProperties_Type_PropertyHeader']  || 'Type',
		   field: 'Type',
		   propertyType: 'Sage.Entity.Interfaces.UserType',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   sortable: true
         }
       ]      }    ],   storeOptions: {
            sort: [ { attribute: 'UserInfo.UserName' } ],    
    resourceKind : 'users',
	select : ['UserInfo.UserName','UserInfo.Division','UserInfo.Region','Type']
  },
  gridOptions: {
		        contextualCondition: function() { return "Type ne 5 and Type ne 8 and Type ne 6"; },
	    selectionMode : 'Multi',
    rowsPerPage : 15
  }
  ,
  doSelected : function (items) {
    var appId = '';
    var clientContextService = Sage.Services.getService('ClientContextService');
    if (clientContextService != null && typeof clientContextService !== 'undefined') {
        if (clientContextService.containsKey('IntegrationLinkId')) {
            appId = clientContextService.getValue('IntegrationLinkId');
        }
    }
    if (appId === '') {
        Sage.UI.Dialogs.showError(IntegrationUsersResources['error_MissingLinkId']);
        return;
    }
    var entities = [];
    for (var i = 0; i < items.length; i++) {
        var userMap = {};
        var hasMap = false;

        // duplicate detection
        for (var k in grid.store.dataCache) {
            var rec = grid.store.dataCache[k];
            if (rec.User && rec.User.$key == items[i].$key)
                hasMap = true;
        }
        if (hasMap)
            continue;

        userMap.Integration = { $key: Sage.Utility.getCurrentEntityId() };
		userMap.AppId = appId;
        userMap.Enabled = 'T';
        userMap.User = {};
        Sage.Utility.extend(userMap.User, items[i]);
        delete userMap.$key;
        delete userMap.$name;
        delete userMap.$url;
        entities.push(userMap);
    }
    if (entities.length > 0)
        grid.createItems(entities, function () {
            if (Sage.Utility.getModeId() !== 'insert') {
                __doPostBack("MainContent", "");
            }
        });
}

} // end of sdata lookup config object

}
  ,
{
    id : 'IntegrationUsers_Cancel',
  displayInInsert : false,
  imageClass: 'icon_Reset_16x16',  'alternateText' : IntegrationUsersgrdUsers_Strings['grdUsers_Cancel_ToolTip'] || 'Revert Changes',
          'handler' : function() { this.cancelChanges(); }
}
  ,
{
    id : 'IntegrationUsers_Delete',
  displayInInsert : false,
  imageClass: 'icon_Delete_16x16',  'alternateText' : IntegrationUsersgrdUsers_Strings['grdUsers_Delete_ToolTip'] || 'Remove',
     appliedSecurity : 'Entities/IntegrationLink/Delete',      'handler' : function() { this.deleteSelected(); }
}
           ],
        contextualCondition: function() { return 'Integration.Id eq "' + Sage.Utility.getCurrentEntityId() + '"'; },
        
						tabId : 'IntegrationUsers',
		gridNodeId: 'IntegrationUsersgrdUsers_Grid',
				id : 'IntegrationUsersgrdUsers',
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
        setTimeout(function() { Sage.UI.Forms.IntegrationUsers.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();