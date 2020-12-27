<cfcomponent output="false" extends="_derbyDAO">

	<cffunction name="init" output="false">
		<cfargument name="dsn">
		
		<cftry>
		<cfscript>
		variables.fields = 'role_id,role_main,description,active,system';
		variables.defaults = '1,@@,@@,1,0';
		variables.pkey = 'role_id';
		variables.required = 'role_main';
		variables.numeric = 'role_id,active,system';
		variables.autoUpdate = '';
		variables.table = 'roles';
		variables.dsn = arguments.dsn;
		setRecord();
		
		return this;
		</cfscript>
			<cfcatch><cfdump var="#cfcatch#"><cfabort></cfcatch>
		</cftry>
	</cffunction>
	
	// This is purely a MIXIN method.
	<cffunction name="inject" access="public" output="false"></cffunction>
	
	<!--- Custom Methods --->

</cfcomponent>