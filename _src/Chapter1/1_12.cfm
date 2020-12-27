<!--- Example: 1_12.cfm --->
<!--- Processing --->
<cfparam name="url.name" default="( unknown user )">
<!--- Content --->
<cftry>
	
<cfoutput>
My name is #url.name#.<br />
</cfoutput>

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

