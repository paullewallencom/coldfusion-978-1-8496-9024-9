<cfcomponent>
	<cffunction name="init">
		<cfscript>
		variables.attributes = structNew();
		variables.attributes.name = "";
		variables.attributes.description = "";
		variables.attributes.price = "";
		</cfscript>
		<cfreturn this>
	</cffunction>
	<!--- get/set attribute:name --->
	<cffunction name="get_name">
		<cfreturn variables.attributes.name>
	</cffunction>
	<cffunction name="set_name">
		<cfargument name="name">
		<cfset variables.attributes.name = arguments.name>
	</cffunction>
	<!--- get/set attribute:description --->
	<cffunction name="get_description">
		<cfreturn variables.attributes.description>
	</cffunction>
	<cffunction name="set_description">
		<cfargument name="description">
		<cfset variables.attributes.description = arguments.description>
	</cffunction>
	<!--- get/set attribute:price --->
	<cffunction name="get_price">
		<cfreturn variables.attributes.price>
	</cffunction>
	<cffunction name="set_price">
		<cfargument name="price">
		<cfset variables.attributes.price = arguments.price>
	</cffunction>
</cfcomponent>