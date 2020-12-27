<cfcomponent output="false">
	
	<cfscript>
	this.name = "ApplicationName1";
	this.applicationTimeout = createTimeSpan(0,2,0,0);
	this.clientManagement = true;
	this.clientStorage = "cookie";
	this.loginStorage = "session";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,0,10);
	this.setClientCookies = true;
	this.setDomainCookies = false;
	this.scriptProtect = false;
	</cfscript>

	<cffunction name="onApplicationStart" output="false">
	
		<cfscript>
		// create default stat structure and pre-request values
		application._stat = structNew();
		application._stat.started = now();
		application._stat.thisHit = now();
		application._stat.hits = 0;
		application._stat.sessions = 0;
		</cfscript>

	</cffunction>


	<cffunction name="onSessionStart" output="false">
  <cfscript>
    // create default session stat structure and pre-request values
    session._stat.started = now();
    session._stat.thisHit = now();
    session._stat.hits = 0;
    // at start of each session update count for application stat
    application._stat.sessions += 1;
    // create an instance of the user class
    session._user = createObject("component","user").init();
  </cfscript>
</cffunction>


	<cffunction name="onRequestStart" output="false">
		<cfargument name="thePage" type="string" required="true">
		
		<cfscript>
		var myReturn = true;
		// fancy code to block pages that start with underscore
		if(left(listLast(arguments.thePage,"/"),1) EQ "_"){
			 myReturn = false;
		}
		// update application stat on each request
		application._stat.lastHit = application._stat.thisHit;
		application._stat.thisHit = now();
		application._stat.hits += 1;
		// update session stat on each request
		session._stat.lastHit = session._stat.thisHit;
		session._stat.thisHit = now();
		session._stat.hits += 1;
		/*
		*/
		</cfscript>

		 <cfreturn myReturn>
	</cffunction>
	
	<!--- *** This is generally not used ***
	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		<cfinclude template="#arguments.thePage#">
	</cffunction>
	 --->

	<cffunction name="onRequestEnd" returnType="void" output="false">
		<cfargument name="thePage" type="string" required="true">
	</cffunction>

	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>

	<cffunction name="onSessionEnd" returnType="void" output="false">
		<cfargument name="SessionScope" type="struct" required="true">
		<cfargument name="ApplicationScope" type="struct" required="false">
		
		<cfscript>
		// NOTE: You must use the variable scope below to acces the appliation structure inside this method.
		arguments.ApplicationScope._stat.sessions -= 1;
		</cfscript>
		
	</cffunction>

	<cffunction name="onError" returnType="void" output="true">
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		
		<cfif arguments.eventName NEQ "2">
			<cfdump var="#arguments.exception#" label="Application core exception">
		<cfelse>
			<cfdump var="#arguments.exception#" label="Application exception">
		</cfif>
		
	</cffunction>

</cfcomponent>