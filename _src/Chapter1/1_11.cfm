<!--- Example: 1_11.cfm --->
<!--- Processing --->
<!--- Content --->
<cftry>
	
<cfoutput>
My name is #url.name#.<br />
</cfoutput>

	<cfcatch>
		<cfdump var="#cfcatch.TagContext[1].template#">
	</cfcatch>
</cftry>

