<cfcomponent output="false">
	<cffunction name="getUsers" access="remote" output="false">
		<cfargument name="suggestValue" required="true">
		
		<cfset var retNames = ArrayNew(1)>
		<cfset var myNames = "Albert,Amos,Andy,Ann,Betty,Bob,Charlie,Dan,Doug,Ernest,Frank,Fred,Sam,Samantha,Stan">
		<cfset var iName = "">
		<cfloop list="#myNames#" index="iName">
			<cfif findNoCase(arguments.suggestValue,iName)>
				<cfset arrayAppend(retNames,iName)>
			</cfif>
		</cfloop>
		
		<cfreturn retNames>
	</cffunction>
</cfcomponent>