<cfcomponent>

	<cffunction name="hasTestPermission" roles="test">
		<cfreturn "This user has permission to access this method.">
	</cffunction>

	<cffunction name="hasOneOfRoles" roles="test,test2">
		<cfreturn "This user has permission to access this method.">
	</cffunction>

</cfcomponent>