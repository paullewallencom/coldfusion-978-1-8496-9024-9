<cfcomponent output="false">

	<cffunction name="init" access="public" output="false">
		<cfscript>
		variables.attributes = structNew();
		variables.attributes.name = "";
		variables.attributes.description = "";
		variables.attributes.price = 0;
		</cfscript>
		<cfreturn this />
	</cffunction>

	<!--- Getter and Setter Methods --->
	<cffunction name="get" access="public" output="false">
		<cfargument name="attribute" required="true">
		
		<cfset var myReturn = "">
		
		<cfif structKeyExists(variables.attributes,arguments.attribute)>
			<cfreturn variables.attributes[arguments.attribute] />
		<cfelse>
			<cfreturn "">
		</cfif>
		
	</cffunction>

	<cffunction name="set_name" access="public" output="false">
		<cfargument name="name" type="any" required="true" />
		<cfset variables.attributes.name = arguments.name />
		<cfreturn />
	</cffunction>

	<cffunction name="get_description" access="public" output="false">
		<cfreturn variables.attributes.description />
	</cffunction>

	<cffunction name="set_description" access="public" output="false">
		<cfargument name="description" type="any" required="true" />
		<cfset variables.attributes.description = arguments.description />
		<cfreturn />
	</cffunction>

	<cffunction name="get_price" access="public" output="false">
		<cfreturn variables.attributes.price />
	</cffunction>

	<cffunction name="set_price" access="public" output="false">
		<cfargument name="price" required="true" />
		<cfset variables.attributes.price = arguments.price />
		<cfreturn />
	</cffunction>

	<!--- Data Methods --->
	<cffunction name="getRecordset" access="public" output="false">
		<cfargument name="where" default="" />
		
		<cfscript>
		var rsReturn = "";
		</cfscript>
		
		<cfquery datasource="cfb" name="rsReturn">
		SELECT 
			id, name, description, price
		FROM
			product<cfif arguments.where NEQ "">
		WHERE 
			1=1 
			AND
			#arguments.where#</cfif>
		</cfquery>
		
		<cfreturn rsReturn/>
	</cffunction>

	<cffunction name="load" access="public" output="false">
		<cfargument name="id" required="false" />
		
		<cfscript>
		var myReturn = getRecordset(where = "id = #arguments.id#");
		setAttributes(myReturn);
		</cfscript>
		
		<cfreturn myReturn />
	</cffunction>
	
	<cffunction name="setAttributes" access="public" output="false">
		<cfargument name="record" required="true">
		
		<cfscript>
		if(arguments.record.recordCount == 0){
			variables.attributes.page = "";
			variables.attributes.description = "";
			variables.attributes.price = 0;
		} else {
			variables.attributes.name = arguments.record.name;
			variables.attributes.description = arguments.record.description;
			variables.attributes.price = arguments.record.price;
		}
		</cfscript>
	</cffunction>
</cfcomponent>