Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.Integrations = {

  

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
    
    if (typeof IntegrationsgrdIntegrations_Strings === 'undefined') {
        IntegrationsgrdIntegrations_Strings = {};
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
    	field: 'Name',
				name:  IntegrationsgrdIntegrations_Strings['grdIntegrations_9a81e95d_7987_494b_99ff_6719fe163cf1_ColumnHeading']  || 'Integration',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
    ,type: SlxLink
    ,editable: false
,
			pageName: 'Integration',
							idField: '$key'
			 }
  	,
{
		field: 'AuthorizationType',
				name:  IntegrationsgrdIntegrations_Strings['grdIntegrations_3a7d8538_ee6e_4de4_b358_03e57c46ee24_ColumnHeading']  || 'Authentication Type',
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
		field: 'Enabled',
				name:  IntegrationsgrdIntegrations_Strings['grdIntegrations_964dd72b_47bf_40a1_9807_a30a41aa94dc_ColumnHeading']  || 'Enabled',
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
		field: 'SyncInterval',
				name:  IntegrationsgrdIntegrations_Strings['grdIntegrations_cf1192d0_cbc7_43de_b67a_fdfb537377c0_ColumnHeading']  || 'Sync Interval (minutes)',
	sortable: true,
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
            resourceKind: 'integrations',
            include: [],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'IntegrationsgrdIntegrations_DataCarrier',
            sort: [
                   ]
        },
        tools: [

{
    id : 'Integrations_Save',
  displayInInsert : false,
  imageClass: 'icon_Save_16x16',  'alternateText' : IntegrationsgrdIntegrations_Strings['grdIntegrations_Save_ToolTip'] || 'Save',
     appliedSecurity : 'Entities/Integration/Save',     'handler' : function() {
    this.saveChanges();
 }
}
           ],
        
						tabId : 'Integrations',
		gridNodeId: 'IntegrationsgrdIntegrations_Grid',
				id : 'IntegrationsgrdIntegrations',
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
        setTimeout(function() { Sage.UI.Forms.Integrations.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();