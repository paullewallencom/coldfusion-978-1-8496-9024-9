<cfcomponent output="false">
	<cffunction name="getDivContent" returntype="string" access="remote">
		<cfargument name="edit">
		<cfreturn "This is the content returned from the CFC for the div, the calling page variable is '<strong>#arguments.edit#</strong>'.">
	</cffunction>
</cfcomponent>