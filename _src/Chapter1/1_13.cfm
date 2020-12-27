<!--- Example: 1_13.cfm --->
<!--- Processing --->
<cfparam name="url.name" default="( unknown user )">
<!--- Content --->
<cftry>
	
<cfoutput>
My name is #url.name#.<br />

<a href="?name=Ted">Show this page with Ted for the name.</a><br />
<a href="?name=Fred">Show this page with Fred for the name.</a><br />
</cfoutput>

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>

