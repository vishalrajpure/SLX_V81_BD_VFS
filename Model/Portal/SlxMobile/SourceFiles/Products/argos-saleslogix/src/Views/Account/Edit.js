/*
 * Copyright (c) 1997-2013, SalesLogix, NA., LLC. All rights reserved.
 */
define('Mobile/SalesLogix/Views/Account/Edit', [
    'dojo/_base/declare',
    'dojo/string',
    'Mobile/SalesLogix/Validator',
    'Mobile/SalesLogix/Format',
    'Mobile/SalesLogix/Template',
    'Sage/Platform/Mobile/Edit',
	'Sage/Platform/Mobile/Utility'
], function(
    declare,
    string,
    validator,
    format,
    template,
    Edit,
    utility
) {

    return declare('Mobile.SalesLogix.Views.Account.Edit', [Edit], {
	
        //Localization
        accountStatusTitleText: 'Account Status',
        accountSubTypeTitleText: 'Account Subtype',
        accountText: 'account',
		legalnameText: 'legal name',
        accountTypeTitleText: 'account type',
        acctMgrText: 'acct mgr',
        businessDescriptionText: 'bus desc',
        businessDescriptionTitleText: 'Business Description',
        descriptionText: 'desc',
        faxText: 'fax',
        fullAddressText: 'address',
        importSourceText: 'lead source',
		//MSTsegmentText: 'MSTsegment',
       // industryText: 'industry',
        //industryTitleText: 'Industry',
        ownerText: 'owner',
        phoneText: 'phone',
        statusText: 'status',
        subTypeText: 'subtype',
        titleText: 'Account',
        typeText: 'type',
        webText: 'web',
		InvalidText: "Please fill Address.",
		durationInvalidText:"Invalid status...",
		legalInvalidText:"Invalid legalname...",

        //View Properties
        entityName: 'Account',
        id: 'account_edit',		
        insertSecurity: 'Entities/Account/Add',
        updateSecurity: 'Entities/Account/Edit',
        querySelect: [
            'AccountManager/UserInfo/FirstName',
            'AccountManager/UserInfo/LastName',
            'AccountName',
			'LegalName',
			'AccountId',
            'BusinessDescription',
            'Description',
            'Fax',
            //'Industry',
			'Indsgmst/Cmktsgdesc',
            'LeadSource/Description',			
            'MainPhone',
            'Notes',
            'Owner/OwnerDescription',
            'Status',
            //'SubType',
            'Type',
            'User/UserInfo/UserName',
			'Address/*',
            'WebAddress'
        ],
        resourceKind: 'accounts',
 		startup: function() {
            this.inherited(arguments);
            this.connect(this.fields['Status'], 'onChange', this.onStatusChange);
			this.connect(this.fields['LegalName'], 'onChange', this.onLegalChange);
		},
		authenticate: function() {
            if (this.busy) {
                return;
            }   
            var credentials = this.getValues(),
                LegalName = credentials && credentials.LegalName;
    
            if (LegalName && /\w+/.test(LegalName)) {
                this.validateCredentials(LegalName.toUpperCase());
    			
            }
        },
		validateCredentials: function(LegalName) {
			//this.fields['Status'].setValue("Active");
			//alert(LegalName);
		    var request = new Sage.SData.Client.SDataSingleResourceRequest(this.getService())
                .setResourceKind('vwlegalmasters')
                //.setResourceSelector(string.substitute("'${0}'", [LegalName]))
                .setQueryArg('select', 'Legalcompanyname')
				.setQueryArg('where', "upper(Legalcompanyname) eq '" + [LegalName] + "'");
            request.allowCacheUse = true;
			//alert(request);
            request.read({
                success: this.processAccountLegal,
                failure: this.requestAccountLegalFailure,
                scope: this
            });	
        },
		requestAccountLegalFailure: function(xhr, o) {
			alert("false");
        },
        processAccountLegal: function(entry) {
			
			if(entry)
			{
				this.fields['LegalName'].setValue("");
            	alert("Legalname already present");  
				
			}
            
        },
		  onLegalChange: function() {
		  this.authenticate();
		},
		
		onStatusChange: function(value, field) {
		
            var fields, entry, phoneField;

            fields = this.fields;
            entry = field.currentSelection;	
            if (entry) {			
				if(this.fields['Type'].getValue().toUpperCase() == "CUSTOMER" && value.text.toUpperCase() != "LOST" && value.text.toUpperCase() != "ACTIVE" )
				{
					alert("Invalid Status of Account");
					this.requestAccount(this.fields['Address.EntityId'].getValue());
				   	
				}
				else if((this.fields['Type'].getValue().toUpperCase() == "PROSPECT"|| this.fields['Type'].getValue().toUpperCase() == "SUSPECT") && value.text.toUpperCase() == "LOST")
				{
					alert("Invalid Status of Account");
				   	this.requestAccount(this.fields['Address.EntityId'].getValue());
				}
            }
        },
		requestAccount: function(accountId) {
			//this.fields['Status'].setValue("Active");
			
		    var request = new Sage.SData.Client.SDataSingleResourceRequest(this.getService())
                .setResourceKind('accounts')
                .setResourceSelector(string.substitute("'${0}'", [accountId]))
                .setQueryArg('select', 'Status');
            request.allowCacheUse = true;
			
            request.read({
                success: this.processAccount,
                failure: this.requestAccountFailure,
                scope: this
            });			
        },
        requestAccountFailure: function(xhr, o) {
		
        },
        processAccount: function(entry) {
					
            var accstatus = utility.getValue(entry, 'Status');			
            if (accstatus) {
                this.fields['Status'].setValue(accstatus);
            }
            
        },
        formatDependentPicklist: function(dependentValue, format) {
            return string.substitute(format, [dependentValue]);
        },
        applyContext: function(templateEntry) {
            this.inherited(arguments);

            this.fields['AccountManager'].setValue(App.context.user);
            this.fields['Owner'].setValue(App.context['defaultOwner']);

            this.fields['Type'].setValue(templateEntry.Type);
            this.fields['Status'].setValue(templateEntry.Status);
        },
		
        createLayout: function() {
            return this.layout || (this.layout = [{
					name: 'Address.EntityId',
                    property: 'Address.EntityId',
                    type: 'hidden'
                }, {
                    label: this.accountText,
                    name: 'AccountName',
                    property: 'AccountName',
                    type: 'text',
                    validator: validator.notEmpty
				}, {
                    label: this.legalnameText,
                    name: 'LegalName',
                    property: 'LegalName',                   
                    type: 'text',  
                    maxTextLength: 128,					
					notificationTrigger: 'blur',
					validator: validator.exceedsMaxTextLength
                    
                }, {
                    label: this.webText,
                    name: 'WebAddress',
                    property: 'WebAddress',
                    renderer: format.link,
                    type: 'text',
                    inputType: 'url',
                    maxTextLength: 128,
                    validator: validator.exceedsMaxTextLength
                }, {
                    label: this.phoneText,
                    name: 'MainPhone',
                    property: 'MainPhone',
                    type: 'phone',
                    maxTextLength: 32,
                    validator: validator.notEmpty
                }, {
                    emptyText: '',
                    formatValue: format.address.bindDelegate(this, [true], true),
                    label: this.fullAddressText,
                    name: 'Address',
                    property: 'Address',
                    type: 'address',
                    view: 'address_edit',
					validator: validator.exists					
                }, {
                    label: this.faxText,
                    name: 'Fax',
                    property: 'Fax',
                    type: 'phone',
                    maxTextLength: 32,
                    validator: validator.exceedsMaxTextLength
                }, {
                    label: this.typeText,
                    name: 'Type',
                    property: 'Type',
                    //picklist: 'Account Type',
                   // requireSelection: true,
                    title: this.accountTypeTitleText,
                    type: 'text',
                    readonly: true
					
                },/* {
                    dependsOn: 'Type',
                    label: this.subTypeText,
                    name: 'SubType',
                    property: 'SubType',
                    picklist: this.formatDependentPicklist.bindDelegate(
                        this, 'Account ${0}', true
                    ),
                    requireSelection: false,
                    title: this.accountSubTypeTitleText,
                    type: 'picklist',
                    maxTextLength: 64,
                    validator: validator.exceedsMaxTextLength
                },*/ {
                    label: this.statusText,
                    name: 'Status',
                    property: 'Status',
                    picklist: 'Account Status',
                    requireSelection: false,
                    title: this.accountStatusTitleText,
                    type: 'picklist',
                    readonly: true
                },/* {
                    label: this.industryText,
                    name: 'Industry',
                    property: 'Industry',
                    picklist: 'Industry',
                    requireSelection: false,
                    title: this.industryTitleText,
                    type: 'picklist',
                    maxTextLength: 64,
                    validator: validator.exceedsMaxTextLength
                }, */
				{
                    label: 'MKT Segment',
                    name: 'Indsgmst',
                    property: 'Indsgmst',
                    textProperty: 'Cmktsgdesc',
                    type: 'lookup',
                    view: 'Indsgmst_list'
                },
				{
                    label: this.businessDescriptionText,
                    name: 'BusinessDescription',
                    property: 'BusinessDescription',
                    noteProperty: false,
                    title: this.businessDescriptionTitleText,
                    type: 'note',
                    view: 'text_edit'
                }, {
                    label: this.acctMgrText,
                    name: 'AccountManager',
                    property: 'AccountManager',
                    textProperty: 'UserInfo',
                    textTemplate: template.nameLF,
                    type: 'lookup',
                    view: 'user_list'
                }, {
                    label: this.ownerText,
                    name: 'Owner',
                    property: 'Owner',
                    textProperty: 'OwnerDescription',
                    type: 'lookup',
                    view: 'owner_list'
				},  {
                    label: this.importSourceText,
                    name: 'LeadSource',
                    property: 'LeadSource',
                    textProperty: 'Description',
                    type: 'lookup',
                    view: 'leadsource_list'
                }]);
        }
    });
});

