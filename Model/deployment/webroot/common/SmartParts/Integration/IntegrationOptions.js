Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.IntegrationOptions = {

  

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
    
    if (typeof IntegrationOptionsgrdOptions_Strings === 'undefined') {
        IntegrationOptionsgrdOptions_Strings = {};
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
		field: 'Description',
				name:  IntegrationOptionsgrdOptions_Strings['grdOptions_b52a627d_e4c4_4473_901e_73432ed6d28b_ColumnHeading']  || 'Option',
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
		field: 'DataValue',
				name:  IntegrationOptionsgrdOptions_Strings['grdOptions_029ec48d_aa36_439c_a5db_5819c65e9eb5_ColumnHeading']  || 'Value',
	sortable: true,
		width: '10',
	 	styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: true
				}
  	,
{
		field: 'DataType',
				name:  IntegrationOptionsgrdOptions_Strings['grdOptions_b07221e5_4bf5_47d5_9648_56278279c489_ColumnHeading']  || 'Data Type',
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
            resourceKind: 'customSettings',
            include: [],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'IntegrationOptionsgrdOptions_DataCarrier',
            sort: [
                  ]
        },
        tools: [

{
    id : 'IntegrationOptions_Save',
  displayInInsert : false,
  imageClass: 'icon_Save_16x16',  'alternateText' : IntegrationOptionsgrdOptions_Strings['grdOptions_Save_ToolTip'] || 'Save',
       mergePosition : 'Default',   mergeControlId : 'Entities/IntegrationOptions/Edit', 'handler' : function() {
    this.saveChanges();
 }
}
  ,
{
    id : 'IntegrationOptions_Cancel',
  displayInInsert : false,
  imageClass: 'icon_Reset_16x16',  'alternateText' : IntegrationOptionsgrdOptions_Strings['grdOptions_Cancel_ToolTip'] || 'Revert Changes',
          'handler' : function() { this.cancelChanges(); }
}
           ],
        contextualCondition: function() {
	var clientContextService = Sage.Services.getService('ClientContextService');
	var integrationCategory = '';
	if (clientContextService != null && typeof clientContextService !== 'undefined') {
		if (clientContextService.containsKey('IntegrationCategory')) {
			integrationCategory = clientContextService.getValue('IntegrationCategory');
		}
	}
	
	return 'Category eq "' + integrationCategory + '"';
},
        
						tabId : 'IntegrationOptions',
		gridNodeId: 'IntegrationOptionsgrdOptions_Grid',
				id : 'IntegrationOptionsgrdOptions',
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
        setTimeout(function() { Sage.UI.Forms.IntegrationOptions.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();