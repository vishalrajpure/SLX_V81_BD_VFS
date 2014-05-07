Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.ProviderScopes = {

  

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
    
    if (typeof ProviderScopesgrdScopes_Strings === 'undefined') {
        ProviderScopesgrdScopes_Strings = {};
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
		field: 'Scope',
				name:  ProviderScopesgrdScopes_Strings['grdScopes_a3a81aee_a56f_406b_8052_6ac66e9bfe85_ColumnHeading']  || 'Scope',
	sortable: true,
		width: 30,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	          ],
        storeOptions: {
            resourceKind: 'oAuthProviderScopes',
            newItemParentReferenceProperty: 'OAuthProvider',
            include: ['OAuthProvider'],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'ProviderScopesgrdScopes_DataCarrier',
            sort: [
                ]
        },
        tools: [
         ],
        contextualCondition: function () {
     var clientContextService = Sage.Services.getService("ClientContextService");
     if (clientContextService != null && typeof clientContextService !== "undefined") {
         if (clientContextService.containsKey("OAuthProviderId")) {
             return dojo.string.substitute("OAuthProvider.Id eq '${0}'", [clientContextService.getValue("OAuthProviderId")]);
         }
        return '';
     } 
 },
        
						tabId : 'ProviderScopes',
		gridNodeId: 'ProviderScopesgrdScopes_Grid',
				id : 'ProviderScopesgrdScopes',
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
        setTimeout(function() { Sage.UI.Forms.ProviderScopes.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();