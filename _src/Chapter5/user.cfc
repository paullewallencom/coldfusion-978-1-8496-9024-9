<cfcomponent output="false">

	<cffunction name="init" output="false">
		<cfscript>
		variables.user = "test";
		variables.password = "password";
		variables.visitor = true;
		</cfscript>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="login" output="false" returntype="boolean">
		<cfargument name="user">
		<cfargument name="password">
		
		<cfif arguments.user EQ variables.user AND arguments.user EQ variables.user>
			<cfset variables.visitor = false>
		<cfelse>
			<cfset variables.visitor = true>
		</cfif>
		
		<cfreturn isUser()>
	</cffunction>
	
	<cffunction name="isUser" output="false">
		<cfreturn NOT variables.visitor>
	</cffunction>

</cfcomponent>