﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
        errFulFillmentCancelled: 'The fulfillment of the literature request was canceled for LitReqId {0}.',
        errFulFillmentFailed: 'The literature request could not be fulfilled for LitReqId {0}.',
        errMailMergeService: 'The literature request(s) could not be fulfilled because the mail merge service could not be loaded. This may happen if Saleslogix Desktop Integration is not installed or is not installed properly.',
        errFulFillmentRequest: 'The literature request(s) could not be fulfilled.',
        errFulFillmentRequestEx: 'The following literature request(s) could not be fulfilled:',
        fulFillmentSuccess: 'The literature request fulfillment was successful.'
    }
    };
    return lang.mixin(LanguageList, nls);
});
