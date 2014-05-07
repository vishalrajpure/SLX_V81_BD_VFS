Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.IntegrationLinks = {

  

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
    
    if (typeof IntegrationLinksgrdLinks_Strings === 'undefined') {
        IntegrationLinksgrdLinks_Strings = {};
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
    			field: 'Id',
				    //Set to the value of the visibleCondition property
	    hidden: function () {
	var clientContextService = Sage.Services.getService('ClientContextService');
	if (clientContextService != null) {
		if (clientContextService.containsKey('IntegrationAuthType') && clientContextService.containsKey('IntegrationLinkType')) {
	    	return clientContextService.getValue('IntegrationAuthType') !== 'Basic' || clientContextService.getValue('IntegrationLinkType') === 'Admin';
		}
	}
	return false;
}(),
		name:  IntegrationLinksgrdLinks_Strings['grdLinks_cda051d5_d4dc_4bb2_924a_ea2df29888c0_ColumnHeading']  || ' ',
	sortable: false,
		width: 6,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
,
	   	type: SlxEdit,
		cellValue: IntegrationLinksgrdLinks_Strings['grdLinks_cda051d5_d4dc_4bb2_924a_ea2df29888c0_Text']  || 'Edit',
		entityType: 'Sage.Entity.Interfaces.IAppIdMapping, Sage.Entity.Interfaces',
		smartPart: 'AddEditLink',
		dialogTitle: IntegrationLinksgrdLinks_Strings['afede43f_5ad7_44c9_9532_cc1bbd79038d_DialogTitleOverride'] || 'Edit Link',
		isCentered: true ,
		dialogTop: 0,
		dialogLeft: 0,
		dialogHeight: 400,
		dialogWidth: 500,
    	formObjectName: 'Sage.UI.Forms.IntegrationLinks'
    				,appliedSecurity: 'Entities/IntegrationLink/Edit'
    	    }
  	,
{
    			field: 'Id',
				    //Set to the value of the visibleCondition property
	    hidden: function () {
	var clientContextService = Sage.Services.getService('ClientContextService');
	if (clientContextService != null) {
	    if (clientContextService.containsKey('IntegrationAuthType')) {
	        return clientContextService.getValue('IntegrationAuthType') === 'Basic';
	    }
	}
	return false;
}(),
		name:  IntegrationLinksgrdLinks_Strings['grdLinks_ec7179d9_f6ea_4c31_9e21_df2ae6d282de_ColumnHeading']  || ' ',
	sortable: false,
		width: 6,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
,
	   	type: SlxEdit,
		cellValue: IntegrationLinksgrdLinks_Strings['grdLinks_ec7179d9_f6ea_4c31_9e21_df2ae6d282de_Text']  || '',
		entityType: 'Sage.Entity.Interfaces.IAppIdMapping, Sage.Entity.Interfaces',
		smartPart: 'AuthorizeService',
		dialogTitle: IntegrationLinksgrdLinks_Strings['8197f088_249b_4acc_9cfa_df95788bf686_DialogTitleOverride'] || 'Authorize Services',
		isCentered: true ,
		dialogTop: 0,
		dialogLeft: 0,
		dialogHeight: 400,
		dialogWidth: 600,
    	formObjectName: 'Sage.UI.Forms.IntegrationLinks'
    				,appliedSecurity: 'Entities/AuthenticationProvider/Edit'
    	    }
  	,
{
		field: 'Enabled',
				name:  IntegrationLinksgrdLinks_Strings['grdLinks_8611b626_1549_441d_a831_ff73ab1027be_ColumnHeading']  || 'Enabled',
	sortable: false,
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
		field: 'Name',
				name:  IntegrationLinksgrdLinks_Strings['grdLinks_f3a490d0_b497_4f70_b0d7_08b6127916e9_ColumnHeading']  || 'Display Name',
	sortable: true,
		width: 20,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: true
				}
  	,
{
		field: 'EndPointURL',
				name:  IntegrationLinksgrdLinks_Strings['grdLinks_da8216b3_8d02_41ef_a729_bed51d4dbdd5_ColumnHeading']  || 'URL',
	sortable: true,
		width: 40,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{ 
    	field: 'User.UserInfo.NameLF',
				name:  IntegrationLinksgrdLinks_Strings['grdLinks_07081f40_bdf3_42df_b974_39b355062663_ColumnHeading']  || 'User',
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
  	          ],
        storeOptions: {
            resourceKind: 'operatingCompanies',
            include: ['Integration'],
            select: [],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'IntegrationLinksgrdLinks_DataCarrier',
            sort: [
                     ]
        },
        tools: [

{
    id : 'IntegrationLinks_Save',
  displayInInsert : false,
  imageClass: 'icon_Save_16x16',  'alternateText' : IntegrationLinksgrdLinks_Strings['grdLinks_Save_ToolTip'] || 'Save',
         'handler' : function() {
    this.saveChanges();
 }
}
  ,
{
    id : 'IntegrationLinks_Cancel',
  displayInInsert : false,
  imageClass: 'icon_Reset_16x16',  'alternateText' : IntegrationLinksgrdLinks_Strings['grdLinks_Cancel_ToolTip'] || 'Revert Changes',
          'handler' : function() { this.cancelChanges(); }
}
           ],
        contextualCondition: function() { return 'Integration.Id eq "' + Sage.Utility.getCurrentEntityId() + '"'; },
        
						tabId : 'IntegrationLinks',
		gridNodeId: 'IntegrationLinksgrdLinks_Grid',
				id : 'IntegrationLinksgrdLinks',
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
        setTimeout(function() { Sage.UI.Forms.IntegrationLinks.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();