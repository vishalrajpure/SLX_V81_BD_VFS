Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.IntegrationResources = {

  

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
    
    if (typeof IntegrationResourcesgrdResources_Strings === 'undefined') {
        IntegrationResourcesgrdResources_Strings = {};
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
		field: 'ResourceKind',
				name:  IntegrationResourcesgrdResources_Strings['grdResources_563b0b22_501c_47b1_b231_5f5e74b76780_ColumnHeading']  || 'Resource',
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
		field: 'EntityName',
				name:  IntegrationResourcesgrdResources_Strings['grdResources_fbc5db8c_2cce_47bc_a0d4_d9717f77bbad_ColumnHeading']  || 'Saleslogix',
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
				name:  IntegrationResourcesgrdResources_Strings['grdResources_9e586f74_a3c4_4a3b_813c_91ab9f20f919_ColumnHeading']  || 'Enabled',
	sortable: false,
		width: 10,
		styles: 'width:auto;',
    cellClasses: '  aligncenter ',
	headerClasses: ' alignleft '
,
	editable: false,
	type: CheckBox,
	defaultValue: "x"   }
  	,
{
		field: 'SyncDirection',
				name:  IntegrationResourcesgrdResources_Strings['grdResources_31371f88_e3dd_4653_ae5d_619f82317c48_ColumnHeading']  || 'Sync Direction',
	sortable: true,
		width: 30,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
,
	editable: false,
	type: PickList,
	pickListName: 'Integration Sync Direction',		
	storageMode:  'code' ,
	displayMode: 'AsText'
}
  	          ],
        storeOptions: {
            resourceKind: 'integrationResources',
            newItemParentReferenceProperty: 'Integration',
            include: [],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'IntegrationResourcesgrdResources_DataCarrier',
            sort: [
                   ]
        },
        tools: [
         ],
        contextualCondition: function() { return 'Integration.Id eq "' + Sage.Utility.getCurrentEntityId() + '"'; },
        
						tabId : 'IntegrationResources',
		gridNodeId: 'IntegrationResourcesgrdResources_Grid',
				id : 'IntegrationResourcesgrdResources',
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
        setTimeout(function() { Sage.UI.Forms.IntegrationResources.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();