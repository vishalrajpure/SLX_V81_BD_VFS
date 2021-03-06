﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
            header_Name: 'Name',
            header_AccountName: "Account/Company",
            header_Type: "Type",
            header_Primary: "Primary",
            header_RoleName: "Role",
            header_Phone: "Phone",
            header_Email: "Email",
            header_TimeZone: "Time Zone",
            header_Notes: "Notes",
            header_Status: "Status"
        }
    };
    return lang.mixin(LanguageList, nls);
});