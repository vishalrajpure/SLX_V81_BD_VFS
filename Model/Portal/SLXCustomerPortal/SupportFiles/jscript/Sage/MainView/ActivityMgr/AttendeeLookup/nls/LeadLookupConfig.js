﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
            contactText: 'Contact',
            accountText: 'Account',
            lookupContactText: 'Lookup Contact',
            nameText: 'Name',
            cityText: 'City',
            stateText: 'State',
            workphoneText: 'Work Phone',
            emailText: 'Email',
            dialogButtonText: 'Add Selected',
            cancelText: 'Close',
            colFirstName: 'First Name',
            colLastName: 'Last Name',
            colTitle: 'Title',
            colCompany: 'Company',
            colWorkPhone: 'Work Phone',
            colEmail: 'Email',
            dialogTitleText: 'Lookup Leads'
        }
    };
    return lang.mixin(LanguageList, nls);
});