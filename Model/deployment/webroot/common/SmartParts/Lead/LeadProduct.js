Sage.namespace("Sage.UI.Forms");
Sage.UI.Forms.LeadProduct = {

  

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
    
    if (typeof LeadProductgrdLeadProducts_Strings === 'undefined') {
        LeadProductgrdLeadProducts_Strings = {};
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
    if (Sage.Utility.getModeId() === 'insert') {
        return true;
    }
}(),
		name:  LeadProductgrdLeadProducts_Strings['grdLeadProducts_6ef4d952_2b1a_4d9f_a36e_35a942dd32bb_ColumnHeading']  || '',
	sortable: false,
		width: 4,
		styles: 'width:auto;',
    cellClasses: '  aligncenter ',
	headerClasses: ' alignleft '
,
	   	type: SlxEdit,
		cellValue: LeadProductgrdLeadProducts_Strings['grdLeadProducts_6ef4d952_2b1a_4d9f_a36e_35a942dd32bb_Text']  || 'Edit',
		entityType: 'Sage.Entity.Interfaces.ILeadProduct, Sage.Entity.Interfaces',
		smartPart: 'EditLeadProduct',
		dialogTitle: LeadProductgrdLeadProducts_Strings['38611e40_47c3_4f73_88e1_62bfa47171a4_DialogTitleOverride'] || '',
		isCentered: true ,
		dialogTop: 0,
		dialogLeft: 0,
		dialogHeight: 360,
		dialogWidth: 600,
    	formObjectName: 'Sage.UI.Forms.LeadProduct'
    				,appliedSecurity: 'Entities/Lead/Edit'
    	    }
  	,
{
		field: 'Product.Name',
				name:  LeadProductgrdLeadProducts_Strings['grdLeadProducts_5e29a114_4a97_45a3_9db6_2d0b10fd74dd_ColumnHeading']  || 'Product',
	sortable: true,
		width: 15,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	,
{
		field: 'Product.Family',
				name:  LeadProductgrdLeadProducts_Strings['grdLeadProducts_89fb1ecc_72a4_4f09_921b_29a9175daf56_ColumnHeading']  || 'Family',
	sortable: true,
		width: 6,
		styles: 'width:auto;',
    cellClasses: '  alignleft ',
	headerClasses: ' alignleft '
, 
	defaultValue: '', 
	editable: false
				}
  	          ],
		         storeOptions: {
            resourceKind: 'leadProducts',
            newItemParentReferenceProperty: 'Lead',
            include: ['Product'],
            select: ['Id'],
	    //The .net vehicle to store grid data on postback
            dataCarrierId: 'LeadProductgrdLeadProducts_DataCarrier',
            sort: [
                  ]
        },
        tools: [

{
    id : 'LeadProduct_Save',
  displayInInsert : false,
  imageClass: 'icon_Save_16x16',  'alternateText' : LeadProductgrdLeadProducts_Strings['grdLeadProducts_Save_ToolTip'] || 'Save',
         'handler' : function() {
    this.saveChanges(function () { if (Sage.Utility.getModeId() !== 'insert') { __doPostBack('MainContent', ''); } });
 }
}
  ,
{
  displayInInsert : true,
  type : 'Sage.UI.SDataLookup',
  controlConfig : 
{
  id : 'lueProduct',
  btnToolTip :  LeadProductlueProduct_Strings['lueProduct_ButtonTooltip']  ||  'Include Product', 
  btnIcon:  '~/ImageResource.axd?scope=global&type=Global_Images&key=add_products_16x16'  ,
  dialogButtonText : LeadProductlueProduct_Strings['lueProduct_DialogButtonText']  ||  'Add Selected', 
  displayMode : 4, //$ {qf control . LookupDisplayMode}  When adding other dijit templates, need to convert control to use enum values
  dialogTitle : LeadProductlueProduct_Strings['lueProduct_LookupDialogTitle']  ||  'Lookup Product',
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
		   name: LeadProductlueProduct_Strings['lueProduct_LookupProperties_Name_PropertyHeader']  || 'Name',
		   field: 'Name',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 17,
		   formatter: function (value, rowIdx, grid) {
				return Sage.Utility.SDataLookup.childObjectFormatter({
					value: value, rowIdx: rowIdx, grid: grid,
					fieldName: 'Name', 
							includeButton: true, 
						childentity: 'PackageKitChildViews'
		        });
		   },
		   sortable: true
         }
         ,
		 {
		   name: LeadProductlueProduct_Strings['lueProduct_LookupProperties_Family_PropertyHeader']  || 'Family',
		   field: 'Family',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   formatter: function (value, rowIdx, grid) {
				return Sage.Utility.SDataLookup.childObjectFormatter({
					value: value, rowIdx: rowIdx, grid: grid,
					fieldName: 'Family', 
							includeButton: false, 
						childentity: 'PackageKitChildViews'
		        });
		   },
		   sortable: true
         }
         ,
		 {
		   name: LeadProductlueProduct_Strings['lueProduct_LookupProperties_Status_PropertyHeader']  || 'Status',
		   field: 'Status',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   formatter: function (value, rowIdx, grid) {
				return Sage.Utility.SDataLookup.childObjectFormatter({
					value: value, rowIdx: rowIdx, grid: grid,
					fieldName: 'Status', 
							includeButton: false, 
						childentity: 'PackageKitChildViews'
		        });
		   },
		   sortable: true
         }
         ,
		 {
		   name: LeadProductlueProduct_Strings['lueProduct_LookupProperties_ActualId_PropertyHeader']  || 'SKU',
		   field: 'ActualId',
		   propertyType: 'System.String',
		   				   excludeFromFilters: false,		   
		   		   width: 12,
		   formatter: function (value, rowIdx, grid) {
				return Sage.Utility.SDataLookup.childObjectFormatter({
					value: value, rowIdx: rowIdx, grid: grid,
					fieldName: 'ActualId', 
							includeButton: false, 
						childentity: 'PackageKitChildViews'
		        });
		   },
		   sortable: true
         }
       ]      }    ],   storeOptions: {
            sort: [ { attribute: 'Name' } ],    
    resourceKind : 'productPackageKit',
	select : ['PackageKitChildViews/Name','PackageKitChildViews/Family','PackageKitChildViews/Status','PackageKitChildViews/ActualId','PackageKitChildViews/ProductId','PackageKitChildViews/ProdPackageKitType','PackageKitChildViews/AppId','PackageKitChildViews/Quantity','PackageKitChildViews/ActiveFlag','Name','Family','Status','ActualId','ProductId','ProdPackageKitType','AppId','Quantity','ActiveFlag']
  },
  gridOptions: {
	        contextualShow: 
function () {
    var oResult = { result: true, reason: '' };
    var service = Sage.Services.getService('IntegrationContractService');
    if (service != null && typeof service !== 'undefined') {
        if (service.isIntegrationEnabled) {
            var bFoundOperatingCompany = false;
            var clientContextService = Sage.Services.getService('ClientContextService');
            if (clientContextService != null && typeof clientContextService !== 'undefined') {
                if (clientContextService.containsKey('OperatingCompany')) {
                    var sOperatingCompanyId = clientContextService.getValue('OperatingCompany');
                    bFoundOperatingCompany = (dojo.isString(sOperatingCompanyId) && String(sOperatingCompanyId).length == 12);
                }
                if (!bFoundOperatingCompany) {
                    oResult.result = false;
                    oResult.reason = LeadProductsResources['error_AccountingSystem_Undefined'];
                }
            } else {
                oResult.result = false;
                oResult.reason = LeadProductsResources['error_ClientContext_Undefined'];
            }
        }
    }
    return oResult;
}
,
		        contextualCondition: function () {
    var sCondition = '';
    var showError = function(msg) {
        var msgService = Sage.Services.getService("WebClientMessageService");
        if (msgService != null && typeof msgService !== "undefined") {
            msgService.showClientError(msg);
        } else {
            Sage.UI.Dialogs.showError(msg);
        }
    };
    var service = Sage.Services.getService("IntegrationContractService");
    if (service != null && typeof service !== "undefined") {
        if (service.isIntegrationEnabled) {
            var bFoundOperatingCompany = false;
            var clientContextService = Sage.Services.getService("ClientContextService");
            if (clientContextService != null && typeof clientContextService !== "undefined") {
                if (clientContextService.containsKey("OperatingCompany")) {
                    var sOperatingCompanyId = clientContextService.getValue("OperatingCompany");
                    bFoundOperatingCompany = (dojo.isString(sOperatingCompanyId) && String(sOperatingCompanyId).length == 12);
                    if (bFoundOperatingCompany) {
                        sCondition = 'AppId eq "' + sOperatingCompanyId + '" ' + "And ActiveFlag eq true";
                    }
                }
                var sError = LeadProductsResources['error_OperatingCompany_Undefined'];
                if (!bFoundOperatingCompany) {
                    showError(sError);
                    throw new Error(sError);
                }
            } else {
                sError = LeadProductsResources['error_ClientContext_Undefined'];
                showError(sError);
                throw new Error(sError);
            }
        }
    }
    return sCondition;
},
	    selectionMode : 'Multi',
    rowsPerPage : 15
  }
  ,
  doSelected : 
function (items) {
    dojo.require('Sage.UI.Dialogs');
    var undefinedAccountingSystem = LeadProductsResources['error_AccountingSystem_Undefined'];
    if (!items.length) return;
    var bIsIcEnabled = isIntegrationContractEnabled();
    var grid = dijit.byId('LeadProductsgrdLeadProducts');
    if (grid && grid.store) {
        var recordCount = grid.rowCount;
        var iCurrentCount = 0;
        var iTotalCount = 0;
        var sAppId = "";
        if (bIsIcEnabled) {
            var sOperatingCompanyId = "";
            var sPriceListId = "";
            var clientContextService = Sage.Services.getService("ClientContextService");
            if (clientContextService != null && typeof clientContextService !== "undefined") {
                if (clientContextService.containsKey("OperatingCompany")) {
                    sOperatingCompanyId = clientContextService.getValue("OperatingCompany");
                    if (dojo.isString(sOperatingCompanyId) && String(sOperatingCompanyId).length == 12) {
                        sAppId = sOperatingCompanyId;
                    }
                }
            }
            if (sAppId === "") {
                Sage.UI.Dialogs.showError(undefinedAccountingSystem);
                return;
            }
        }
        var arrItems = [];
        grid.store.newItem({
            onComplete: function(LeadProduct) {
                var addProduct = function(prod, refresh, quantity) {
                    var sSelect = "select=Id,Description,Family,Name,Unit,";
                    sSelect += (bIsIcEnabled) ? "UnitOfMeasure/Id,Prices/Price,Prices/Currency,Prices/UnitOfMeasure,Prices/SlxPriceList,Prices/SlxPriceList.Id" : "ProductProgram/Program,ProductProgram/Price,ProductProgram/DefaultProgram";
                    var sWhere = dojo.string.substitute("where=Id eq '${0}'", [prod.$key]);
                    sWhere += (bIsIcEnabled) ? dojo.string.substitute(" and UnitOfMeasure eq Prices.UnitOfMeasure and Prices.SlxPriceList.Id eq '${0}' and Prices.AppId eq '${1}' and Prices.ActiveFlag = true", [sPriceListId, sAppId]) : "";
                    var sUrl = dojo.string.substitute("slxdata.ashx/slx/dynamic/-/products?${0}&${1}&format=json&_t=${2}",
                        [sSelect, sWhere, (new Date().getTime().toString())]);
                    dojo.xhrGet({
                        url: sUrl,
                        cache: false,
                        preventCache: true,
                        handleAs: 'json',
                        load: function(prodResponse) {
                            if (prodResponse.$resources == null || prodResponse.$resources.length == 0) {
                                if (bIsIcEnabled) {
                                    /* Check without using an SlxPriceList.Id. */
                                    sSelect = "select=Id,ActualId,CommodityType,Description,Family,Name,";
                                    sSelect += "UnitOfMeasure/Id,UnitOfMeasure/Name,Prices/Price,Prices/Currency,Prices/UnitOfMeasure";
                                    sWhere = dojo.string.substitute("where=Id eq '${0}'", [prod.$key]);
                                    sWhere += dojo.string.substitute(" and UnitOfMeasure eq Prices.UnitOfMeasure and Prices.AppId eq '${0}' and Prices.ActiveFlag = true", [sAppId]);
                                    sUrl = dojo.string.substitute("slxdata.ashx/slx/dynamic/-/products?${0}&${1}&format=json&_t=${2}",
                                        [sSelect, sWhere, (new Date().getTime().toString())]);
                                    dojo.xhrGet({
                                        cache: false,
                                        preventCache: true,
                                        handleAs: 'json',
                                        url: sUrl,
                                        load: function(prodResponse) {
                                            if (prodResponse.$resources == null || prodResponse.$resources.length == 0) {
                                                var newEntity = { };
                                                var product = prod;
                                                //Insert mode check
                                                if (Sage.Utility.getModeId() === 'insert') {
                                                    product.$cacheID = new Date().getTime();
                                                } else {
                                                    LeadProduct.Lead = { $key: Sage.Utility.getCurrentEntityId() };
                                                }
                                                LeadProduct.Product = { };
                                                delete product.index;
                                                Sage.Utility.extend(LeadProduct.Product, product);
                                                LeadProduct.Product.Family = product.Family;
                                                /*LeadProduct.Discount = 0;
                                                LeadProduct.Quantity = quantity;
                                                LeadProduct.Sort = recordCount += 1;

                                                product.Price = 0;
                                                LeadProduct.Price = 0;
                                                LeadProduct.ExtendedPrice = 0;
                                                LeadProduct.CalculatedPrice = 0;*/

                                                delete product.$key;
                                                delete product.$name;
                                                delete product.$url;
                                                Sage.Utility.extend(true, newEntity, LeadProduct, product);
                                                arrItems.push(newEntity);
                                                iCurrentCount++;
                                                if (iCurrentCount === iTotalCount) {
                                                    grid.createItems(arrItems, function() {
                                                        if (Sage.Utility.getModeId() !== 'insert') {
                                                            __doPostBack("MainContent", "");
                                                        }
                                                    });
                                                }
                                            } else {
                                                if (prodResponse.$resources != null && prodResponse.$resources.length > 0) {
                                                    for (var x = 0; x < prodResponse.$resources.length; x++) {
                                                        var newEntity = { };
                                                        var product = prodResponse.$resources[x];
                                                        //Insert mode check
                                                        if (Sage.Utility.getModeId() === 'insert') {
                                                            product.$cacheID = new Date().getTime();
                                                        } else {
                                                            LeadProduct.Lead = { $key: Sage.Utility.getCurrentEntityId() };
                                                        }
                                                        LeadProduct.Product = { };
                                                        delete product.index;
                                                        Sage.Utility.extend(LeadProduct.Product, product);

                                                        /*LeadProduct.Discount = 0;
                                                        LeadProduct.Quantity = quantity;
                                                        LeadProduct.Sort = recordCount += 1;
                                                        var price = 0;
                                                        product.Price = 0;
                                                        LeadProduct.Price = 0;
                                                        LeadProduct.ExtendedPrice = 0;
                                                        LeadProduct.CalculatedPrice = 0;
                                                        if (prodResponse.$resources[x].Prices != null &&
                                                            prodResponse.$resources[x].Prices.$resources != null &&
                                                                prodResponse.$resources[x].Prices.$resources.length > 0) {
                                                            for (var j = 0; j < prodResponse.$resources[x].Prices.$resources.length; j++) {
                                                                if (prodResponse.$resources[x].Prices.$resources[j].UnitOfMeasure.$key === product.UnitOfMeasure.$key) {
                                                                    if (prodResponse.$resources[x].Prices.$resources[j].Price != null) {
                                                                        price = prodResponse.$resources[x].Prices.$resources[j].Price;
                                                                    }
                                                                    product.Price = price;
                                                                    LeadProduct.Price = price;
                                                                    LeadProduct.ExtendedPrice = price;
                                                                    LeadProduct.CalculatedPrice = price;
                                                                    break;
                                                                }
                                                            }
                                                        }*/
                                                        delete product.$key;
                                                        delete product.$name;
                                                        delete product.$url;
                                                        Sage.Utility.extend(true, newEntity, LeadProduct, product);
                                                        arrItems.push(newEntity);
                                                        iCurrentCount++;
                                                        if (iCurrentCount === iTotalCount) {
                                                            grid.createItems(arrItems, function() {
                                                                if (Sage.Utility.getModeId() !== 'insert') {
                                                                    __doPostBack("MainContent", "");
                                                                }
                                                            });
                                                        }
                                                    }
                                                } else {
                                                    iTotalCount--;
                                                    if (iCurrentCount === iTotalCount) {
                                                        grid.createItems(arrItems, function() {
                                                            if (Sage.Utility.getModeId() !== 'insert') {
                                                                __doPostBack("MainContent", "");
                                                            }
                                                        });
                                                    }
                                                }
                                            }
                                        },
                                        data: { },
                                        error: function(request, status, error) {
                                            if (iTotalCount > 0) {
                                                iTotalCount--;
                                            }
                                            var sError = dojo.string.substitute(LeadProductsResources['error_ExecutingRequest'], [sUrl, request.statusText, request.status]);
                                            if (dojo.isString(request.responseText)) {
                                                if ((request.responseText.indexOf("[", 0) == 0) && (request.responseText.lastIndexOf("]") == request.responseText.length - 1)) {
                                                    var oSDataError = dojo.fromJson(request.responseText);
                                                    if (dojo.isArray(oSDataError)) {
                                                        sError = dojo.string.substitute(LeadProductsResources['error_ExecutingRequestExt'],
                                                            [sUrl, oSDataError[0].severity, oSDataError[0].sdataCode, oSDataError[0].message, oSDataError[0].applicationCode, request.statusText, request.status]);
                                                    }
                                                }
                                            }
                                            Sage.UI.Dialogs.showError(sError);
                                        }
                                    });
                                } else {
                                    var newEntity = { };
                                    var product = prod;
                                    //Insert mode check
                                    if (Sage.Utility.getModeId() === 'insert') {
                                        product.$cacheID = new Date().getTime();
                                    } else {
                                        LeadProduct.Lead = { $key: Sage.Utility.getCurrentEntityId() };
                                    }
                                    LeadProduct.Product = { };
                                    delete product.index;
                                    Sage.Utility.extend(LeadProduct.Product, product);
                                    LeadProduct.Product.Family = product.Family;
                                    /*LeadProduct.Discount = 0;
                                    LeadProduct.Quantity = quantity;
                                    LeadProduct.Sort = recordCount += 1;
                                    LeadProduct.Price = product.Price;
                                    LeadProduct.ExtendedPrice = product.Price;
                                    LeadProduct.CalculatedPrice = product.Price;*/
                                    delete product.$key;
                                    delete product.$name;
                                    delete product.$url;
                                    Sage.Utility.extend(true, newEntity, LeadProduct, product);
                                    arrItems.push(newEntity);
                                    iCurrentCount++;
                                    if (iCurrentCount === iTotalCount) {
                                        grid.createItems(arrItems, function() {
                                            if (Sage.Utility.getModeId() !== 'insert') {
                                                __doPostBack("MainContent", "");
                                            }
                                        });
                                    }
                                }
                            } else {
                                if (prodResponse.$resources != null && prodResponse.$resources.length > 0) {
                                    for (var x = 0; x < prodResponse.$resources.length; x++) {
                                        var newEntity = { };
                                        var product = prodResponse.$resources[x];
                                        //Insert mode check
                                        if (Sage.Utility.getModeId() === 'insert') {
                                            product.$cacheID = new Date().getTime();
                                        } else {
                                            LeadProduct.Lead = { $key: Sage.Utility.getCurrentEntityId() };
                                        }
                                        LeadProduct.Product = { };
                                        delete product.index;
                                        Sage.Utility.extend(LeadProduct.Product, product);
                                        /*LeadProduct.Discount = 0;
                                        LeadProduct.Quantity = quantity;
                                        LeadProduct.Sort = recordCount += 1;
                                        var price = 0;
                                        if (bIsIcEnabled) {
                                            /* IC */
                                            product.Price = 0;
                                            LeadProduct.Price = 0;
                                            LeadProduct.ExtendedPrice = 0;
                                            LeadProduct.CalculatedPrice = 0;
                                            LeadProduct.Program = null;
                                            if (prodResponse.$resources[x].Prices != null &&
                                                prodResponse.$resources[x].Prices.$resources != null &&
                                                    prodResponse.$resources[x].Prices.$resources.length > 0) {
                                                for (var j = 0; j < prodResponse.$resources[x].Prices.$resources.length; j++) {
                                                    if (prodResponse.$resources[x].Prices.$resources[j].UnitOfMeasure.$key === product.UnitOfMeasure.$key) {
                                                        if (prodResponse.$resources[x].Prices.$resources[j].Price != null) {
                                                            price = prodResponse.$resources[x].Prices.$resources[j].Price;
                                                        }
                                                        product.Price = price;
                                                        LeadProduct.Price = price;
                                                        LeadProduct.ExtendedPrice = price;
                                                        LeadProduct.CalculatedPrice = price;
                                                        break;
                                                    }
                                                }
                                            }
                                        } else {
                                            /* NON-IC */
                                            product.Price = 0;
                                            LeadProduct.Price = 0;
                                            LeadProduct.ExtendedPrice = 0;
                                            LeadProduct.CalculatedPrice = 0;
                                            LeadProduct.Program = null;
                                            if (prodResponse.$resources[x].ProductProgram != null &&
                                                prodResponse.$resources[x].ProductProgram.$resources != null &&
                                                    prodResponse.$resources[x].ProductProgram.$resources.length > 0) {
                                                for (var j = 0; j < prodResponse.$resources[x].ProductProgram.$resources.length; j++) {
                                                    /* Grab the price for the default program. */
                                                    if (prodResponse.$resources[x].ProductProgram.$resources[j].DefaultProgram) {
                                                        if (prodResponse.$resources[x].ProductProgram.$resources[j].Price != null) {
                                                            price = prodResponse.$resources[x].ProductProgram.$resources[j].Price;
                                                        }
                                                        product.Price = price;
                                                        LeadProduct.Price = price;
                                                        LeadProduct.ExtendedPrice = price;
                                                        LeadProduct.CalculatedPrice = price;
                                                        LeadProduct.Program = prodResponse.$resources[x].ProductProgram.$resources[j].Program;
                                                        break;
                                                    }
                                                }
                                            }
                                        }*/
                                        delete product.$key;
                                        delete product.$name;
                                        delete product.$url;
                                        Sage.Utility.extend(true, newEntity, LeadProduct, product);
                                        arrItems.push(newEntity);
                                        iCurrentCount++;
                                        if (iCurrentCount === iTotalCount) {
                                            grid.createItems(arrItems, function() {
                                                if (Sage.Utility.getModeId() !== 'insert') {
                                                    __doPostBack("MainContent", "");
                                                }
                                            });
                                        }
                                    }
                                }
                            }
                        },
                        data: { },
                        error: function(request, status, error) {
                            if (iTotalCount > 0) {
                                iTotalCount--;
                            }
                            var sError = dojo.string.substitute(LeadProductsResources['error_ExecutingRequest'], [sUrl, request.statusText, request.status]);
                            if (dojo.isString(request.responseText)) {
                                if ((request.responseText.indexOf("[", 0) == 0) && (request.responseText.lastIndexOf("]") == request.responseText.length - 1)) {
                                    var oSDataError = dojo.fromJson(request.responseText);
                                    if (dojo.isArray(oSDataError)) {
                                        sError = dojo.string.substitute(LeadProductsResources['error_ExecutingRequestExt'],
                                            [sUrl, oSDataError[0].severity, oSDataError[0].sdataCode, oSDataError[0].message, oSDataError[0].applicationCode, request.statusText, request.status]);
                                    }
                                }
                            }
                            Sage.UI.Dialogs.showError(sError);
                        }
                    });
                };
                var getTotalCount = function() {
                    var iResult = 0;
                    var i;
                    for (i = 0; i < items.length; i += 1) {
                        var item = items[i];
                        if (item.ProdPackageKitType === 'PKG') {
                            for (var j = 0; j < item.PackageKitChildViews.$resources.length; j++) {
                                iResult++;
                            }
                        } else {
                            iResult++;
                        }
                    }
                    return iResult;
                };
                //iTotalCount = getTotalCount();
                var iCount = 0;
                var i;
                for (i = 0; i < items.length; i += 1) {
                    var quantity = 1;
                    var item = items[i];
                    if (item.ProdPackageKitType === 'PKG') {
                        for (var j = 0; j < item.PackageKitChildViews.$resources.length; j++) {
                            var prod = item.PackageKitChildViews.$resources[j];
                            prod.$key = item.PackageKitChildViews.$resources[j].ProductId;
                            if (prod.Quantity != null) {
                                quantity = prod.Quantity;
                            }
                            iCount++;
                            addProduct(prod, true, quantity);
                        }
                    } else {
                        iCount++;
                        addProduct(item, true, quantity);
                    }
                }
            }
        });
    }
}

} // end of sdata lookup config object

}
  ,
{
    id : 'LeadProduct_Cancel',
  displayInInsert : false,
  imageClass: 'icon_Reset_16x16',  'alternateText' : LeadProductgrdLeadProducts_Strings['grdLeadProducts_Cancel_ToolTip'] || 'Revert Changes',
          'handler' : function() { this.cancelChanges(); }
}
  ,
{
    id : 'LeadProduct_Delete',
  displayInInsert : true,
  imageClass: 'icon_Delete_16x16',  'alternateText' : LeadProductgrdLeadProducts_Strings['grdLeadProducts_Delete_ToolTip'] || 'Remove',
          'handler' : function() { this.deleteSelected(function () { if (Sage.Utility.getModeId() !== 'insert') { __doPostBack('MainContent', ''); } }); }
}
           ],
        onDataChange : /*function (entity, attribute, oldValue, newValue) {
	if (oldValue === newValue) {
        return;
    }
    if (attribute === 'Program') {
        var sUrl = dojo.string.substitute("slxdata.ashx/slx/dynamic/-/productPrograms?select=Price&where=Product.Id eq '${0}' and Program eq '${1}'&format=json",
            [entity.Product.$key, escape(newValue)]);
        dojo.xhrGet({
            cache: false,
            preventCache: true,
            handleAs: 'json',
            url: sUrl,
            sync: true,
            load: function(programPrice) {
                if (programPrice.$resources != null && programPrice.$resources.length == 1) {
                    entity.Price = programPrice.$resources[0].Price;
                    entity.CalculatedPrice = entity.Price - (entity.Price * entity.Discount);
                    entity.ExtendedPrice = entity.CalculatedPrice * entity.Quantity;
                }
            },
            data: { },
            error: function(request, status, error) {
                var sError = dojo.string.substitute(OpportunityProductsResources['error_ExecutingRequest'], [sUrl, request.statusText, request.status]);
                if (dojo.isString(request.responseText)) {
                    if ((request.responseText.indexOf("[", 0) == 0) && (request.responseText.lastIndexOf("]") == request.responseText.length - 1)) {
                        var oSDataError = dojo.fromJson(request.responseText);
                        if (dojo.isArray(oSDataError)) {
                            sError = dojo.string.substitute(OpportunityProductsResources['error_ExecutingRequestExt'],
                                [sUrl, oSDataError[0].severity, oSDataError[0].sdataCode, oSDataError[0].message, oSDataError[0].applicationCode, request.statusText, request.status]);
                        }
                    }
                }
                Sage.UI.Dialogs.showError(sError);
            }
        });
    }
    if (attribute === 'Discount') {
        var price = entity.Price;
        if (price == 0) {
            price = entity.CalculatedPrice;
        }
        if (price == 0) {
            entity.Discount = 0;
            Sage.UI.Dialogs.showError(error_ZeroBasePrice);
        } else {
            entity.CalculatedPrice = price - (price * entity.Discount);
        }
    } else if (attribute === 'CalculatedPrice') {
        if (entity.Price == 0) {
            entity.Discount = 0;
        } else {
            entity.Discount = 1 - entity.CalculatedPrice / entity.Price;
        }
    }
    if ((attribute === 'Discount') || (attribute === 'CalculatedPrice') || (attribute === 'Quantity')) {
        entity.ExtendedPrice = entity.CalculatedPrice * entity.Quantity;
    }
}*/,
        contextualCondition: function() { return 'Lead.Id eq "' + Sage.Utility.getCurrentEntityId() + '"'; },
        
						tabId : 'LeadProduct',
		gridNodeId: 'LeadProductgrdLeadProducts_Grid',
				id : 'LeadProductgrdLeadProducts',
        rowsPerPage: 21,
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
        setTimeout(function() { Sage.UI.Forms.LeadProduct.makeGrid(runtimeConfig); }, 1);

    }
};
if (typeof Sys !== 'undefined')
    Sys.Application.notifyScriptLoaded();