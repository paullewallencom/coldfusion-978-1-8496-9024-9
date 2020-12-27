<cfcomponent output="false" extends="_derbyDAO">

	<cffunction name="init" output="false">
		<cfargument name="dsn">
		
		<cftry>
		<cfscript>
		variables.fields = 'group_id,group_main,description,active,system';
		variables.defaults = '1,@@,@@,1,0';
		variables.pkey = 'group_id';
		variables.required = 'group_main';
		variables.numeric = 'group_id,active,system';
		variables.autoUpdate = '';
		variables.table = 'groups';
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
	
	<cffunction name="get_roles" access="public" output="false">
		<cfargument name="id" required="true">
		
		<cfset var rs="">
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT role_id
		FROM groups_roles
		WHERE
			group_id = #arguments.id#
		</cfquery>
		
		<cfreturn valueList(rs.role_id)>
		
	</cffunction>
	
	<cffunction name="set_roles" access="public" output="false">
		<cfargument name="id" required="true">
		<cfargument name="roles" required="true">
		
		<cfscript>
		var rs="";
		var idList="";
		var insertID=0;
		</cfscript>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		DELETE
		FROM groups_roles
		WHERE
			group_ID = #arguments.id#<cfif listLen(arguments.roles)>
			AND
			role_ID NOT IN(#arguments.roles#)</cfif>
		</cfquery>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT role_ID
		FROM groups_roles
		WHERE
			group_ID = #arguments.id#
		</cfquery>
		
		<cfset idList = valueList(rs.role_ID)>
		
		<cfloop index="insertID" list="#arguments.roles#">
			<cfif NOT listFind(idList,insertID)>
				<cfquery name="rs" datasource="#variables.dsn#">
				INSERT INTO groups_roles
				(group_ID,role_ID)
				VALUES
				(#arguments.id#,#insertID#)
				</cfquery>
			</cfif>
		</cfloop>
		
	</cffunction>

</cfcomponent>