﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
        emailDroppedText: 'Dropped Email',
        attachmentTitleText: 'Save Attachements',
         attachmentQuestionText: 'Would you like to keep a copy of these attachment(s) in Saleslogix? <br />The attachments will be stored under the Attachments tab for relevant entities.'
    }
    };
    return lang.mixin(LanguageList, nls);
});
