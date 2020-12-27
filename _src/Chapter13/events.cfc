<cfcomponent extends="share.objects.coop.coop">
</cfcomponent>
<cffunction name="onPageStart">
  <cfargument name="init">
  <cfscript>
    var _init = ARGUMENTS.init;

    _param(
      structure: SESSION,
      variable: 'page_first_hit,page_hit',
      value: now()
    );
    setHit();

    _dump(
      var: VARIABLES.attributes,
      abort: true,
      label: 'onPageStart'|
    );

    // set initial common preDOM
    _init.persona.data = "user,designer,developer";

    return _init;
  </cfscript>
</cffunction>
<!--- custom coprocessor methods --->
<cffunction name="setHit" access="remote">
  <cfscript>
    SESSION.page_hit = now();
    return timeFormat(SESSION.page_hit,"h:mm:ss tt");
  </cfscript>
</cffunction>
