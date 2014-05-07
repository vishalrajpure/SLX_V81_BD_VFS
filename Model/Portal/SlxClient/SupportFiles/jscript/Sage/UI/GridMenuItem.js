﻿/*globals Sage, dojo, dojox, dijit, Simplate, window, Sys, define */
define([
       'dijit/MenuItem',
       'dojox/grid/EnhancedGrid',
       'dojo/text!../templates/GridMenuItem.html',
       'dojo/_base/declare',
       'dojo/dom-style',
       'dojo/dom-construct',
       'dojo/aspect',
       'dojo/_base/lang',
       'dojo/topic'
],
function (MenuItem, EnhancedGrid, template, declare, domStyle, domConstruct, aspect, lang, topic) {
    var widget = declare('Sage.UI.GridMenuItem', MenuItem, {
        grid: null,
        templateString: template,
        startup: function() {
            this.inherited(arguments);
            aspect.after(this.getParent(), 'onOpen', lang.hitch(this, this.startGrid));
            var h = this.gridOptions.height || this.height || '250px',
                w = this.gridOptions.width || this.width || '150px';
            domStyle.set(this.focusNode, {height: h, width: w});
        },
        startGrid: function() {
            if(this.grid && this.grid.started) {
                if(this.grid.lastScrollTop === 0) {
                    this.grid.resize();
                }
                else {
                    // IE remembers its last scroll location, but chooses to set the scrollbar to the top
                    this.grid.setScrollTop(this.grid.lastScrollTop);
                }
                return;
            }
            else {
            if (typeof this.gridOptions !== 'undefined') {
                var cssClass = (this.gridOptions.hasOwnProperty('cssClass')) ? this.gridOptions.cssClass : '',
                    handle;
                    
                this.gridOptions.cssClass = cssClass + ' menuGrid';
                if(this.grid) {
                        // retain the existing hidden state when recreating,
                        //  as this.gridOptions is only from page load
                        var hidden = this.grid.layout.cells[2].hidden;
                        if(hidden !== this.gridOptions.structure[2].hidden) {
                            if(hidden) {
                                this.gridOptions.structure[1].width = '260px';
                            }
                            else {
                                this.gridOptions.structure[1].width = '205px';
                            }
                            this.gridOptions.structure[2].hidden = hidden;
                        }
                    this.grid.destroyRecursive();
                }
                this.grid = new EnhancedGrid(this.gridOptions);
                domConstruct.place(this.grid.domNode, this.containerNode, 'only');
                
                this.grid.canSort = function(col) {
                    // Disable sorting of the active group column
                    if (Math.abs(col) === 1) {
                        return false;
                    }
                    
                    return true;
                };
                
                //ToDo:  these are for trying out purposes - probably want to remove this...
                if (this.gridOptions.hasOwnProperty('_onCellClick')) {
                    this.grid.on('cellClick', lang.hitch(this.gridOptions, this.gridOptions._onCellClick));
                }        
                if (this.gridOptions.hasOwnProperty('_onCanSelect')) {
                    this.grid.on('canSelect', lang.hitch(this.gridOptions, this.gridOptions._onCanSelect));
                }         
                //end of trying out...
                this.grid.startup();
                this.grid.started = true;
                handle = aspect.after(this.grid, "_onFetchComplete", lang.hitch(this, function () {
                    topic.publish("sage/ui/groups/gridMenuStarted", this);
                    handle.remove();
                }));
                }
            }
        },
        _onClick: function(e) {
            // because we live in a menu, we don't want the menu's click handling to hide 
            // us when the user selects a row.
            e.stopPropagation();
        }
    });

    return widget;
});

