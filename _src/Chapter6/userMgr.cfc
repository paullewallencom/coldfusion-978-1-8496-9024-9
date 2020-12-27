<cfcomponent output="false" extends="_derbyDAO">

	<cffunction name="init" output="false">
		<cfargument name="dsn">
		
		<cftry>
		<cfscript>
		variables.fields = 'active,authCheck,authExp_on,created_on,email,password,passwordAnswer,passwordQuestion,suspend,suspendReason,system,updated_on,user_id,user_main';
		variables.defaults = '1,@@,@@,##now()##,,@@,@@,@@,@@,0,@@,0,##now()##,0,@@';
		variables.pkey = 'user_id';
		variables.required = 'email,password,user_main';
		variables.numeric = 'active,suspend,system,user_id';
		variables.autoUpdate = 'updated_on';
		variables.table = 'users';
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
	
	<cffunction name="get_groups" access="public" output="false">
		<cfargument name="id" required="true">
		
		<cfset var rs="">
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT g.group_id
		FROM users u
			JOIN groups_users gu ON u.user_ID = gu.user_ID
			JOIN groups g ON gu.group_ID = g.group_ID
		WHERE
			u.user_id = #arguments.id#
		</cfquery>
		
		<cfreturn valueList(rs.group_id)>
		
	</cffunction>
	
	<cffunction name="set_groups" access="public" output="false">
		<cfargument name="id" required="true">
		<cfargument name="groups" required="true">
		
		<cfscript>
		var rs="";
		var idList="";
		var insertID=0;
		</cfscript>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		DELETE
		FROM groups_users
		WHERE
			user_ID = #arguments.id#<cfif listLen(arguments.groups)>
			AND
			group_ID NOT IN(#arguments.groups#)</cfif>
		</cfquery>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT group_ID
		FROM groups_users
		WHERE
			user_ID = #arguments.id#
		</cfquery>
		
		<cfset idList = valueList(rs.group_ID)>
		
		<cfloop index="insertID" list="#arguments.groups#">
			<cfif NOT listFind(idList,insertID)>
				<cfquery name="rs" datasource="#variables.dsn#">
				INSERT INTO groups_users
				(user_ID,group_ID)
				VALUES
				(#arguments.id#,#insertID#)
				</cfquery>
			</cfif>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="get_roleNames" access="public" output="false">
		<cfargument name="id" required="true">
		
		<cfset var rs="">
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT r.role_main
		FROM users u
			JOIN groups_users gu ON u.user_ID = gu.user_ID
			JOIN groups_roles gr ON gu.group_ID = gr.group_ID
			JOIN roles r ON gr.role_ID = r.role_ID
		WHERE
			u.user_id = #arguments.id#
		</cfquery>
		
		<cfreturn valueList(rs.role_main)>
		
	</cffunction>
	
	<cffunction name="userLookup" access="private" output="false">
		<cfargument name="user">
		<cfargument name="password">
		
		<cfset var rs="">
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT u.user_ID, u.user_main, r.role_main
		FROM users u
			JOIN groups_users gu ON u.user_ID = gu.user_ID
			JOIN groups_roles gr ON gu.group_ID = gr.group_ID
			JOIN roles r ON gr.role_ID = r.role_ID
		WHERE
			u.user_main = '#arguments.user#'
			AND
			u.password = '#arguments.password#'
		</cfquery>
		
		<cfreturn rs>
	
	</cffunction>

</cfcomponent>