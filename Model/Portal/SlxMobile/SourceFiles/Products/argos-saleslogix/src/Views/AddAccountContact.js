/*
 * Copyright (c) 1997-2013, SalesLogix, NA., LLC. All rights reserved.
 */
define('Mobile/SalesLogix/Views/AddAccountContact', [
    'dojo/_base/declare',
    'dojo/_base/lang',
    'dojo/string',
    'Mobile/SalesLogix/Format',
    'Mobile/SalesLogix/Validator',
    'Mobile/SalesLogix/Template',
    'Sage/Platform/Mobile/Utility',
    'Sage/Platform/Mobile/Edit'
], function(
    declare,
    lang,
    string,
    format,
    validator,
    template,
    utility,
    Edit
) {

    return declare('Mobile.SalesLogix.Views.AddAccountContact', [Edit], {
        //Localization
        accountNameText: 'account',
        accountStatusTitleText: 'Account Status',
        accountSubTypeTitleText: 'Account SubType',
        accountText: 'Account',
		legalnameText: 'legal name',
        accountTypeTitleText: 'Account Type',
        acctMgrText: 'acct mgr',
        addressText: 'address',
        contactTitleText: 'Title',
        descriptionText: 'description',
        detailsAccountText: 'Account Info',
        detailsContactText: 'Contact Info',
        detailsText: 'Contact / Account Info',
        emailText: 'email',
        faxText: 'fax',
        homePhoneText: 'direct phone',
        industryText: 'industry',
        ownerText: 'owner',
        lastNameText: 'last',
        mobileText: 'mobile',
        nameText: 'name',
        statusText: 'status',
        subTypeText: 'sub-type',
        titleText: 'Add Account / Contact',
        typeText: 'type',
        webText: 'web',
        workText: 'work phone',
        //industryTitleText: 'Industry',

        //View Properties
        id: 'add_account_contact',
        resourceKind: 'accounts',
        entityName: 'Account',
        querySelect: [
            'AccountManager/UserInfo/FirstName',
            'AccountManager/UserInfo/LastName',
            'AccountName',
			'LegalName',
            'Address',
            'BusinessDescription',
            'Contact/AccountName',
            'Address',
            'Contact/Email',
            'Contact/Fax',
            'Contact/FirstName',
            'Contact/HomePhone',
            'Contact/LastName',
            'Contact/Mobile',
            'Contact/Title',
            'Contact/WebAddress',
            'Contact/WorkPhone',
            'Fax',
            //'Industry',
			'Indsgmst/Cmktsgdesc',
            'Owner/OwnerDescription',
            'Status',
            'SubType',
            'Type'
        ],
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
			
		    var request = new Sage.SData.Client.SDataSingleResourceRequest(this.getService())
                .setResourceKind('vwlegalmasters')
                //.setResourceSelector(string.substitute("'${0}'", [LegalName]))
                .setQueryArg('select', 'Legalcompanyname')
				.setQueryArg('where', "upper(Legalcompanyname) eq '" + [LegalName] + "'");
            request.allowCacheUse = true;
			
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
        init: function() {
            this.inherited(arguments);

            //this.connect(this.fields['Contacts.$resources[0].Address'], 'onChange', this.onContactAddressChange);
			this.connect(this.fields['Address'], 'onChange', this.onAddressChange);
			this.connect(this.fields['LegalName'], 'onChange', this.onLegalChange);
        },
        getValues: function(all) {
            var values = this.inherited(arguments);

            utility.setValue(values, 'Contacts.$resources[0].$name', 'Contact');
            utility.setValue(values, 'Contacts.$resources[0].AccountName', values['AccountName']);

            return values;
        },
        formatDependentPicklist: function(dependentValue, fmt) {
            if (!lang.isArray(dependentValue)) {
                dependentValue = [dependentValue];
            }
            return string.substitute(fmt, [dependentValue]);
        },
        onInsertCompleted: function(entry) {
            var view = App.getView('account_detail');
            if (view) {
                view.show({
                        descriptor: entry.$descriptor,
                        key: entry.$key
                    }, {
                        returnTo: -1
                    });
            } else {
                this.inherited(arguments);
            }
        },
        /*onContactAddressChange: function(value, field) {
		
            if (this.fields['Address'].getValue() && !this.fields['Address'].getValue().Address1) {
                this.fields['Address'].setValue(value);
            }
        },*/
		onAddressChange: function(value, field) {
				//alert(this.fields['Contacts.$resources[0].Address'].getValue());
            if (!this.fields['Contacts.$resources[0].Address'].getValue()) {			
                this.fields['Contacts.$resources[0].Address'].setValue(value);
            }
        },
        applyContext: function(templateEntry) {
            this.inherited(arguments);

            this.fields['AccountManager'].setValue(App.context.user);
            this.fields['Owner'].setValue(App.context['defaultOwner']);

            this.fields['Type'].setValue(templateEntry.Type);
            this.fields['Status'].setValue(templateEntry.Status);
        },
        createLayout: function() {
            return this.layout || (this.layout = [
                {
                    emptyText: '',
                    formatValue: format.nameLF,
                    label: this.nameText,
                    name: 'Contacts.$resources[0]',
                    property: 'Contacts.$resources[0]',
                    type: 'name',
                    validator: validator.name,
                    view: 'name_edit'
                },
                {
                    label: this.accountNameText,
                    name: 'AccountName',
                    property: 'AccountName',
                    type: 'text',
                    validator: validator.notEmpty
                },
				{
                    label: this.legalnameText,
                    name: 'LegalName',
                    property: 'LegalName',                   
                    type: 'text',  
                    maxTextLength: 128,
					notificationTrigger: 'blur',
                    validator: validator.exceedsMaxTextLength
                },
                {
                    label: this.emailText,
                    name: 'Contacts.$resources[0].Email',
                    property: 'Contacts.$resources[0].Email',
                    type: 'text',
                    inputType: 'email'
                },
                {
                    label: this.webText,
                    name: 'WebAddress',
                    property: 'WebAddress',
                    type: 'text',
                    inputType: 'url',
                    maxTextLength: 128,
                    validator: validator.exceedsMaxTextLength
                },
                {
                    label: this.workText,
                    name: 'MainPhone',
                    property: 'MainPhone',
                    type: 'phone',
                    maxTextLength: 32,
                    validator: validator.notEmpty
                },
				 {
                    title: this.detailsAccountText,
                    name: 'AccountInfoSection',
                    children: [{
                            name: 'Fax',
                            property: 'Fax',
                            label: this.faxText,
                            type: 'phone',
                            maxTextLength: 32,
                            validator: validator.exceedsMaxTextLength
                        },
                        {
                            name: 'Type',
                            property: 'Type',
                            label: this.typeText,
                            type: 'text',
                            //picklist: 'Account Type',
                            title: this.accountTypeTitleText,
							readonly: true							 
                        },
                       /* {
                            name: 'SubType',
                            property: 'SubType',
                            label: this.subTypeText,
                            type: 'picklist',
                            requireSelection: false,
                            picklist: this.formatDependentPicklist.bindDelegate(
                                this, 'Account ${0}', true
                            ),
                            title: this.accountSubTypeTitleText,
                            dependsOn: 'Type'
                        },*/
                        {
                            name: 'Status',
                            property: 'Status',
                            label: this.statusText,
                            type: 'text',
                            //picklist: 'Account Status',
                            title: this.accountStatusTitleText,
							readonly: true
                        },
                        /*{
                            name: 'Industry',
                            property: 'Industry',
                            label: this.industryText,
                            type: 'picklist',
                            picklist: 'Industry',
                            title: this.industryTitleText
                        },*/
						{
		                    label: 'MKT Segment',
		                    name: 'Indsgmst',
		                    property: 'Indsgmst',
		                    textProperty: 'Cmktsgdesc',
		                    type: 'lookup',
		                    view: 'Indsgmst_list'
		                },
                        {
                            name: 'BusinessDescription',
                            property: 'BusinessDescription',
                            label: this.descriptionText,
                            type: 'text'
                        },
                        {
                            label: this.acctMgrText,
                            name: 'AccountManager',
                            property: 'AccountManager',
                            textProperty: 'UserInfo',
                            textTemplate: template.nameLF,
                            type: 'lookup',
                            view: 'user_list'
                        },
                        {
                            label: this.ownerText,
                            name: 'Owner',
                            property: 'Owner',
                            textProperty: 'OwnerDescription',
                            type: 'lookup',
                            view: 'owner_list'
                        },
                        {
                            emptyText: '',
                            formatValue: format.address.bindDelegate(this, true, true),
                            label: this.addressText,
                            name: 'Address',
                            property: 'Address',
                            type: 'address',
                            view: 'address_edit',
                            entityName: 'Account',
							validator: validator.exists
                        }
                    ]
                },
                {
                    title: this.detailsContactText,
                    name: 'ContactInfoSection',
                    children: [{
                            label: this.contactTitleText,
                            name: 'Contacts.$resources[0].Title',
                            property: 'Contacts.$resources[0].Title',
                            picklist: 'Title',
                            title: this.contactTitleText,
                            type: 'picklist',
                            orderBy: 'text asc'
                        },
                        {
                            label: this.homePhoneText,
                            name: 'Contacts.$resources[0].HomePhone',
                            property: 'Contacts.$resources[0].HomePhone',
                            type: 'phone',
                            maxTextLength: 15,
							validator: validator.exceedsMaxTextLength
                        },
                        {
                            name: 'Contacts.$resources[0].Mobile',
                            property: 'Contacts.$resources[0].Mobile',
                            label: this.mobileText,
                            type: 'phone',
                            maxTextLength: 32,
                            validator: [validator.exists,validator.exceedsMaxTextLength]
                        },
                        {
                            name: 'Contacts.$resources[0].Fax',
                            property: 'Contacts.$resources[0].Fax',
                            label: this.faxText,
                            type: 'phone',
                            maxTextLength: 32,
                            validator: validator.exceedsMaxTextLength
                        },
                        {
                            emptyText: '',
                            formatValue: format.address.bindDelegate(this, true, true),
                            label: this.addressText,
                            name: 'Contacts.$resources[0].Address',
                            property: 'Contacts.$resources[0].Address',
                            type: 'address',
                            view: 'address_edit',
                            entityName: 'Contact'
                        }]
                }
               
            ]);
        }
    });
});

