<cfset REQUEST._api.wsdlRequest = false>
<cftry>
	<cfparam name="COOKIE.sessionScopeTested" type="numeric" default="0" />
	<cfparam name="COOKIE.hasSessionScope" type="numeric" default="0" />
	<cfparam name="COOKIE.error" type="numeric" default="0" />
	<cfcatch>
		<cfset COOKIE.sessionScopeTested = 0 />
		<cfset COOKIE.hasSessionScope = 0 />
		<cfset COOKIE.error = 1 />
	</cfcatch>
</cftry>
<cfif listLast(CGI.SCRIPT_NAME,".") EQ "cfc">
	<cftry>
		<cfif structKeyExists(url,"wsdl")>
			<cfset REQUEST._api.wsdlRequest = true>
		</cfif>
		<cfcatch>
		// add logic later to deal with issues if any
		</cfcatch>
	</cftry>
</cfif>
<cfscript>
strTempUserAgent = LCase( CGI.http_user_agent );

// Check user agent.
if (
		REQUEST._api.wsdlRequest OR
		(NOT Len(strTempUserAgent)) OR 
	//	(
	//		COOKIE.SessionScopeTested
	//		AND
	//		(NOT COOKIE.HasSessionScope)
	//	) OR
		// This will check for bots at large.
		REFind( "bot\b", strTempUserAgent ) OR 
		// This will try to get any RSS feed readers.
		REFind( "\brss", strTempUserAgent ) OR 
		Find( "slurp", strTempUserAgent ) OR
		Find( "mediapartners-google", strTempUserAgent ) OR
		Find( "zyborg", strTempUserAgent ) OR
		Find( "emonitor", strTempUserAgent ) OR
		Find( "jeeves", strTempUserAgent ) OR
		Find( "sbider", strTempUserAgent ) OR
		Find( "findlinks", strTempUserAgent ) OR
		Find( "yahooseeker", strTempUserAgent ) OR
		Find( "mmcrawler", strTempUserAgent ) OR
		Find( "jbrowser", strTempUserAgent ) OR
		Find( "java", strTempUserAgent ) OR
		Find( "pmafind", strTempUserAgent ) OR
		Find( "blogbeat", strTempUserAgent ) OR
		Find( "converacrawler", strTempUserAgent ) OR
		Find( "ocelli", strTempUserAgent ) OR
		Find( "labhoo", strTempUserAgent ) OR
		Find( "validator", strTempUserAgent ) OR
		Find( "sproose", strTempUserAgent ) OR
		Find( "ia_archiver", strTempUserAgent ) OR
		Find( "larbin", strTempUserAgent ) OR
		Find( "psycheclone", strTempUserAgent ) OR 
		Find( "arachmo", strTempUserAgent )
	)
{
	// Set the flag for session use.
	REQUEST.cookie = duplicate(COOKIE);
	REQUEST._api.hasSession = false;
	if(! REQUEST._api.wsdlRequest) {
		COOKIE.sessionScopeTested = 1;	 
		COOKIE.hasSessionScope = 0;
	}
} else {
	REQUEST._api.hasSession = true;
	if(! REQUEST._api.wsdlRequest) {
		COOKIE.sessionScopeTested = 1;	 
		COOKIE.hasSessionScope = 1;
	}
}
REQUEST._api.cookieTestPerformed = true;
</cfscript>

<cfif ! REQUEST._api.wsdlRequest && REQUEST._api.cookieTestPerformed>
	 
	<!--- Write the cookie value for the test. --->
	<cfcookie 
		name="sessionScopeTested" 
		value="#COOKIE.sessionScopeTested#" 
		expires="NEVER"
		/>
	 
	<!--- Write the cookie value for the test outcome. --->
	<cfcookie 
		name="hasSessionScope" 
		value="#COOKIE.hasSessionScope#" 
		expires="NEVER"
		/>
	 
</cfif>