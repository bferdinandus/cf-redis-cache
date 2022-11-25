<cfscript>
    run();

    function run()
    {
        runCacheTest("PascalCaseCache", 50);
        runCacheTest("lower-case-cache", 50);

    }

    private void function runCacheTest(required string cacheName, required numeric amount)
    {
        writeOutput("<h3>Putting #arguments.amount# keys in #arguments.cacheName#</h3>");
        for (var i=0; i < arguments.amount; i++) {
            cachePut(id="key-#i#", value="value-#i#", cacheName=arguments.cacheName);
        }
        writeOutput("<h3>Getting #arguments.amount# keys from #arguments.cacheName#</h3>");
        for (var i=0; i < arguments.amount; i++) {
            var sValue=cacheGet(id="key-#i#", cacheName=arguments.cacheName);
            writeOutput("#sValue# ");
        }

        writeOutput("<h3>cacheGetAllIds from #arguments.cacheName#</h3>");
        var d=cacheGetAllIds(cacheName=arguments.cacheName);
        writeDump(serializeJSON(d));

        writeOutput("<h3>clearing all keys from #arguments.cacheName# using cacheClear</h3>");
        cacheClear(cacheName=arguments.cacheName);

        writeOutput("<h3>Again Getting #arguments.amount# keys from #arguments.cacheName# to check it's empty</h3>");
        for (var i=0; i < arguments.amount; i++) {
            var sValue=cacheGet(id="key-#i#", cacheName=arguments.cacheName);
            if (!isNull(sValue)) {
                writeOutput("#sValue# ");
            }
        }
        writeOutput("<h3>There should be NO values above this line!</h3>");
        writeOutput("<br><br>");
    }

</cfscript>
