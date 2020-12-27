<cfcomponent output="false">
	<cffunction name="doDivide" access="remote">
		<cfargument name="number1">
		<cfargument name="number2">
		<cfreturn arguments.number1 / arguments.number2>
	</cffunction>
	<cffunction name="doMultiply" access="remote">
		<cfargument name="number1">
		<cfargument name="number2">
		<cfreturn arguments.number1 * arguments.number2>
	</cffunction>
</cfcomponent>