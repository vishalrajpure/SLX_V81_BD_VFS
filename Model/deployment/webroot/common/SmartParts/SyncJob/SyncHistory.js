Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.SyncHistory = {

  

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
    
    if (typeof SyncHistorygrdSyncHistory_Strings === 'undefined') {
        SyncHistorygrdSyncHistory_Strings = {};
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
    	field: 'RunName',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_d7d40e19_0f70_4fab_9707_52e02c18dfd3_ColumnHeading']  || 'Sync History Log Name',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
    ,type: SlxLink
    ,editable: false
,
			pageName: 'SyncResult',
							idField: '$key'
			 }
  	,
{ 
    	field: 'User.UserInfo.NameLF',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_46f1ed4c_739b_4779_911d_9f4405d2cb7d_ColumnHeading']  || 'User Name',
	sortable: true,
		width: 20,
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
		field: 'ResourceType',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_18d63b98_17ae_4516_8d4e_532ba6b2c845_ColumnHeading']  || 'Resource',
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
    	field: 'EntityValue',
				    //Set to the value of the visibleCondition property
	    hidden: function () { return true; }(),
		name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_f3320432_30a4_4b53_8eeb_9c0ec3a0cbc1_ColumnHeading']  || 'Record',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
    ,type: SlxLink
    ,editable: false
,
			pageName: function () { return 'EntityType'; } (),
				idField: function () { return 'EntityId'; } ()
	 }
  	,
{
		field: 'EntityValue',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_ff0ba147_6d52_4109_819a_c76588a071e7_ColumnHeading']  || 'Record',
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
		field: 'SyncedFrom.Name',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_cdfb348f_d6b8_4812_9de4_cb8e8ed5f9f9_ColumnHeading']  || 'Sent From',
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
		field: 'SyncedTo.Name',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_36de09c3_4aa6_43d9_90d7_c9058c59e655_ColumnHeading']  || 'Received By',
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
		field: 'Stamp',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_e5481099_93e7_47bf_a395_6084280e2f41_ColumnHeading']  || 'Log Create Date',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	dateOnly: false,
		type: DateTime
}
  	,
{
		field: 'SyncJob.Integration.Name',
				name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_933921af_b23b_4fa4_a3f3_cd29b5ed4da5_ColumnHeading']  || 'Integration',
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
		field: 'EntityId',
				    //Set to the value of the visibleCondition property
	    hidden: function () { return true; }(),
		name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_d45b3e9a_677d_4425_b274_4a80e8ce6050_ColumnHeading']  || '',
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
		field: 'EntityType',
				    //Set to the value of the visibleCondition property
	    hidden: function () { return true; }(),
		name:  SyncHistorygrdSyncHistory_Strings['grdSyncHistory_df4c721d_d55a_44e6_ab85_0043fc6bca56_ColumnHeading']  || '',
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
            resourceKind: 'syncResults',
            include: [],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'SyncHistorygrdSyncHistory_DataCarrier',
            sort: [
                          ]
        },
        tools: [
         ],
        contextualCondition: function() {
	var userFilter = '';
	var resourceFilter = '';
	var clientContextService = Sage.Services.getService('ClientContextService');
	if (clientContextService != null) {
	    if (clientContextService.containsKey('SyncHistoryFilterByUser')) {
	        var user = clientContextService.getValue('SyncHistoryFilterByUser');
	        if (user !== '') {
	            userFilter = dojo.string.substitute(" And User.Id eq '${0}'", [user]);
	        }
	    }
	    if (clientContextService.containsKey('SyncHistoryFilterByResource')) {
	        var resource = clientContextService.getValue('SyncHistoryFilterByResource');
	        if (resource !== '') {
	            userFilter = dojo.string.substitute(" And ResourceType eq '${0}'", [resource]);
	        }
	    }
	}
	return dojo.string.substitute("SyncJob.Id eq '${0}'${1}${2}", [Sage.Utility.getCurrentEntityId(), userFilter, resourceFilter]);
},
        
						tabId : 'SyncHistory',
		gridNodeId: 'SyncHistorygrdSyncHistory_Grid',
				id : 'SyncHistorygrdSyncHistory',
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
        setTimeout(function() { Sage.UI.Forms.SyncHistory.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();