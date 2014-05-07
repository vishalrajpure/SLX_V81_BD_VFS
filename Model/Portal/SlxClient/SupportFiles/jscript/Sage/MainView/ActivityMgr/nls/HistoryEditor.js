﻿define([
        'Sage/LanguageList',
        'dojo/_base/lang'
],
function (LanguageList, lang) {
    var nls = {
        root: {
            labelWidth: '100',
            tabNameGeneralText: 'General',
            tabNameAttachmentsText: 'Attachments',
            scheduleText: 'Schedule',
            startTimeText: 'Scheduled',
            completedDateText: 'Completed',
            timeLessText: 'Timeless',
            durationText: 'Duration',
            contactText: 'Contact',
            accountText: 'Account',
            leadText: 'Lead',
            opportunityText: 'Opportunity',
            ticketText: 'Ticket',
            companyText: 'Company',
            regardingText: 'Regarding',
            resultText: 'Result',
            notesText: 'Notes',
            priorityText: 'Priority',
            leaderText: 'Leader',
            categoryText: 'Category',
            locationText: 'Location',
            scheduledByFormatText: 'Scheduled by ${user} on ${date}',
            cancelText: 'Cancel',
            okText: 'OK',
            deleteText: 'Delete',
            lookupActText: 'Lookup Account',
            lookupContactText: 'Lookup Contact',
            lookupOpportunityText: 'Lookup Opportunity',
            lookupTicketText: 'Lookup Ticket',
            lookupLeadText: 'Lookup Lead',
            lookupLeaderText: 'Lookup Leader',
            lookupResourcesText: 'Lookup',
            mainPhoneText: 'Main Phone',
            typeText: 'Type',
            subTypeText: 'Sub-Type',
            nameText: 'Name',
            cityText: 'City',
            stateText: 'State',
            workphoneText: 'Work Phone',
            emailText: 'Email',
            acctMgrText: 'Acct Manager',
            descriptionText: 'Description',
            stageText: 'Stage',
            statusText: 'Status',
            ownerText: 'Owner',
            ticketNumberText: 'Ticket Number',
            phoneText: 'Phone',
            urgencyText: 'Urgency',
            areaText: 'Area',
            recurringText: 'Recurring',
            followupText: 'Follow-up',
            noneText: 'None',
            carryOverAttachmentsText: 'Carry Over Attachments',
            carryOverNotesText: 'Carry Over Notes',
            asScheduledText: 'As Scheduled',
            insertText: 'Insert',
            couldNotSaveErrorText: 'We\'re sorry, the history could not be saved because an error occurred.',
            deleteMessage: 'You are about to permanently delete this record.',
            deleteTitle: 'Delete History',
            couldNotDeleteErrorText: 'We\'re sorry, the history could not be deleted because an error occurred.',
            postalText: 'Postal Code',
            tabNameParticipants: 'All Participants'
        }
    };
    return lang.mixin(LanguageList, nls);
});
