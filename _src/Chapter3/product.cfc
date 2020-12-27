<cfcomponent output="false" extends="_sdo">

	<!--- Constructor Methods --->
	<cffunction name="init" access="public" output="false">
		<cfargument name="dsn" required="true">
		<cfargument name="id" default="0">
		
		<cfscript>
		variables.field.name = "id,name,description,price";
		variables.field.defaults = "0,'','',0";
		variables.field.allowNull = "0,0,0,0";
		variables.table = "product";
		variables.pKeyField = "id";
		variables.pKeyNew = 0;
		variables.pKeyType = "autoInteger";
		variables.dsn = arguments.dsn;
		setDefaults();
		</cfscript>
		<cfreturn this />
	</cffunction>
	
</cfcomponent>