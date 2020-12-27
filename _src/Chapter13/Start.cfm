<!--- custom coprocessor methods --->
<cffunction name="setHit" access="remote">
  <cfscript>
    SESSION.page_hit = now();
    return timeFormat(SESSION.page_hit,"h:mm:ss tt");
  </cfscript>
</cffunction>
