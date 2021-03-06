﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
            colNameReportName: 'Name',
            colNameType: 'Type',
            colNameTable: 'Table',
            colNameCreateUser: 'Create User',
            colNameCreateDate: 'Create Date',
            colNameLastExecutionDate: 'Last Run',
            colNameLastExecutionUser: 'Last Run By',
            colNameModifyUser: 'Modify User',
            colNameModifyDate: 'Modify Date'
        }
    };
    return lang.mixin(LanguageList, nls);
});

