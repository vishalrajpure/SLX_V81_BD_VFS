/*
 * Copyright (c) 1997-2013, SalesLogix, NA., LLC. All rights reserved.
 */
define('Mobile/SalesLogix/Views/Indsgmst/List', [
    'dojo/_base/declare',
    'dojo/string',
    'Sage/Platform/Mobile/List'
], function(
    declare,
    string,
    List
) {

    return declare('Mobile.SalesLogix.Views.Indsgmst.List', [List], {
        //Templates
        itemTemplate: new Simplate([
            '<h3>{%: $.Cmktsgdesc %}</h3>',
            '<h4>{%: $.Cindsgdesc %}</h4>'
        ]),

        //Localization
        titleText: 'MKT Segment',

        //View Properties
        icon: 'content/images/Accounts_24x24.gif',
        id: 'Indsgmst_list',
        security: 'Entities/Account/View',
        queryOrderBy: 'Cmktsgdesc',
        querySelect: [
            'Cmktsgdesc',
            'Cindsgdesc'
        ],
        resourceKind: 'Indsgmsts',

        formatSearchQuery: function(searchQuery) {
            return string.substitute('upper(Cmktsgdesc) like "${0}%"', [this.escapeSearchQuery(searchQuery.toUpperCase())]);
        }
    });
});

