define(["doh", "require"], function(doh, require){
    if(doh.isBrowser){
        doh.register("Sage.tests.UI.SDataLookup", require.toUrl("./SDataLookup.html"), 30000);
    }
});