<cfcomponent output="false">

	<cffunction name="init" output="false">
		<cfargument name="dsn" required="true">
		<cfargument name="defaultGroups" required="true">
		<cfargument name="emailFrom" required="true">
		
		<cfscript>
		setGuest();
		variables.dsn = arguments.dsn;
		variables.created = now();
		variables.userChanged = variables.created;
		variables.defaultGroups = arguments.defaultGroups;
		variables.emailFrom = arguments.emailFrom;
		
		return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="createdOn" output="false">
		<cfreturn variables.created>
	</cffunction>
	
	<cffunction name="userChangedOn" output="false">
		<cfreturn variables.userChanged>
	</cffunction>
	
	<cffunction name="login" output="false" returntype="boolean">
		<cfargument name="user" default="">
		<cfargument name="password" default="">
		<cfargument name="url" default="">
		<cfargument name="type" default="cf">
		<cfargument name="typeTarget" default="" hint="This is for using with CFAjax IDs.">
		
		<cfscript>
		userLoad(user:arguments.user,password:arguments.password);
		
		if(isUser() AND arguments.url NEQ "")
			_location(
				url:arguments.url,
				type:arguments.type,
				typeTarget:arguments.typeTarget
			);
		
		return isUser();
		</cfscript>
	</cffunction>
	
	<cffunction name="logout" output="false">
		<cfargument name="url" default="">
		<cfargument name="type" default="cf">
		<cfargument name="typeTarget" default="">
		
		<cfscript>
			setGuest();
			if(arguments.url NEQ ""){
				_location(
					url:arguments.url,
					type:arguments.type,
					typeTarget:arguments.typeTarget
				);
			}
		</cfscript>
	</cffunction>
	
	<!--- User Methods:Start --->
	<!--- * Public Methods * --->
	<cffunction name="getUserName" output="false">
		<cfreturn variables.user>
	</cffunction>
	
	<cffunction name="isUser" output="false">
		<cfreturn NOT variables.isVisitor>
	</cffunction>
	
	<!--- * Private Methods * --->
	<cffunction name="userLoad" access="private" output="false">
		<cfargument name="user">
		<cfargument name="password">
		
		<cfscript>
		var rsUser = "";
		</cfscript>
		
		<cfquery name="rsUser" datasource="#variables.dsn#">
		SELECT u.user_ID, u.user_main, u.email, r.role_main, u.password
		FROM users u
			JOIN groups_users gu ON u.user_ID = gu.user_ID
			JOIN groups_roles gr ON gu.group_ID = gr.group_ID
			JOIN roles r ON gr.role_ID = r.role_ID
		WHERE
			u.user_main = '#arguments.user#'
			AND
			u.password = '#arguments.password#'
		</cfquery>
		
		<cfscript>
		variables.userChanged = now();
		setGuest(rsUser);
		</cfscript>
		
		
	</cffunction>
	
	<cffunction name="userLookup" access="private" output="false">
		<cfargument name="user">
		<cfargument name="password">
		
		<cfset var rsUser="">
		
		<cfquery name="rsUser" datasource="#variables.dsn#">
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
		
		<cfreturn rsUser>
	
	</cffunction>
	
	<cffunction name="passwordLookup" access="private" output="false">
		<cfargument name="email">
		
		<cfset var rsUser=queryNew("")>
		
		<cfquery name="rsUser" datasource="#variables.dsn#">
		SELECT user_ID, user_main, password, email
		FROM users
		WHERE
			email = '#arguments.email#'
		</cfquery>
		
		<cfreturn rsUser>
	
	</cffunction>
	
	<cffunction name="sendEmail" output="false" access="public">
		<cfargument name="message" required="true">
		<cfargument name="subject" required="true">
		<cfargument name="email" default="#variables.email#">
		
		<cfmail from="#variables.emailFrom#"
				to="#arguments.email#"
				subject="#arguments.subject#"
					>#arguments.message#</cfmail>
	</cffunction>
	
	<cffunction name="getPassword" output="false" access="public">
		<cfargument name="email" required="true">
		<cfargument name="url" required="true">
		
		<cfscript>
		var rs = passwordLookup(arguments.email);
		if(rs.recordCount GT 0){
			sendEmail(
				message:"Your user name is #rs.user_main# and password is #rs.password#.",
				email:rs.email,
				subject:"Requested Site Password"
			);
		}
		
		_location(
			url:arguments.url,
			type:"js"
		);
		</cfscript>
		
	</cffunction>
	
	<cffunction name="sendRegistration" output="false" access="private">
		<cfargument name="email" required="true">
		<cfargument name="user" required="true">
		<cfargument name="password" required="true">
		
		<cfscript>
		sendEmail(
			message:"Your user name is #arguments.user# and password is #arguments.password#.",
			subject:"Site Registration",
			email:arguments.email
		);
		</cfscript>
	</cffunction>
	
	<cffunction name="register" access="public" output="false">
		<cfargument name="user_main" required="true">
		<cfargument name="email" required="true">
		<cfargument name="password" required="true">
		<cfargument name="question" required="true">
		<cfargument name="answer" required="true">
		<cfargument name="_url" default="">
		<cfargument name="_type" default="js">
		<cfargument name="_typeTarget" default="">
		
		<cfscript>
		var myResult = saveUser(arguments);
		if(isNumeric(myResult)){
			set_groups(myResult,variables.defaultGroups);
			sendRegistration(
				email:arguments.email,
				user:arguments.user_main,
				password:arguments.password
			);
			if(structKeyExists(arguments,"_url") AND arguments._url NEQ "")
				_location(
					url:arguments._url,
					type:arguments._type,
					typeTarget:arguments._typeTarget
				);
			return "";
		} else {
			return myResult;
		}
		
		</cfscript>
		
	</cffunction>
	
	<cffunction name="saveUser" output="false" access="private">
		<cfargument name="data" required="true">
		
		<cfscript>
		var rs="";
		var result = "";
		
		arguments.data = _param(arguments.data,'user_id',0);
		
		if(arguments.data.user_id EQ 0){
			result = insertUser(arguments.data);
		} else {
			// Not managed by prototype
			// result = updateUser(arguments.data);
		}
		
		return result;
		</cfscript>
	</cffunction>
	
	<cffunction name="insertUser" output="false" access="private">
		<cfargument name="data" required="true">
		
		<cfset var rs="">
		
		<cftry>
			<cfquery name="rs" datasource="#variables.dsn#">
			INSERT INTO users
			(user_main,
			email,
			password,
			passwordQuestion,
			passwordAnswer)
			VALUES
			('#arguments.data.user_main#',
			'#arguments.data.email#',
			'#arguments.data.password#',
			'#arguments.data.question#',
			'#arguments.data.answer#')
			</cfquery>
			<cfcatch>
				<cfdump var="#cfcatch#"><cfabort>
				<cfreturn "User already exists.">
			</cfcatch>
		</cftry>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT user_ID
		FROM users
		WHERE
			user_main = '#arguments.data.user_main#'
			AND
			email = '#arguments.data.email#'
			AND
			password = '#arguments.data.password#'
			AND
			passwordQuestion = '#arguments.data.question#'
			AND
			passwordAnswer = '#arguments.data.answer#'
		</cfquery>
		
		<cfreturn rs.user_ID>
		
	</cffunction>
	
	<cffunction name="set_groups" access="public" output="false">
		<cfargument name="id" required="true">
		<cfargument name="groups" required="true">
		
		<cfscript>
		var rs="";
		var groupIDs = "";
		var idList="";
		var insertID=0;
		</cfscript>
		<cftry>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT group_ID
		FROM groups
		WHERE
			group_Main IN ('#arguments.groups#')
		</cfquery>
		<cfset groupIDs = valueList(rs.group_ID)>
			
		<cfquery name="rs" datasource="#variables.dsn#">
		DELETE
		FROM groups_users
		WHERE
			user_ID = #arguments.id#<cfif listLen(arguments.groups)>
			AND
			group_ID NOT IN(#groupIDs#)</cfif>
		</cfquery>
		
		<cfquery name="rs" datasource="#variables.dsn#">
		SELECT group_ID
		FROM groups_users
		WHERE
			user_ID = #arguments.id#
		</cfquery>
		
		<cfset idList = valueList(rs.group_ID)>
		
		<cfloop index="insertID" list="#groupIDs#">
			<cfif NOT listFind(idList,insertID)>
				<cfquery name="rs" datasource="#variables.dsn#">
				INSERT INTO groups_users
				(user_ID,group_ID)
				VALUES
				(#arguments.id#,#insertID#)
				</cfquery>
			</cfif>
		</cfloop>
		
			<cfcatch>
				<cfdump var="#cfcatch#">
				<cfabort>
			</cfcatch>
		</cftry>
	</cffunction>

	<!--- User Methods:End --->
	
	<cffunction name="mixin" access="public" output="false">
		<cfargument name="mixinCode" required="true">
		<cfscript>
		structAppend(this,arguments.mixinCode);
		structAppend(variables,arguments.mixinCode);
		arguments.mixinCode.inject(this);
		</cfscript>
	</cffunction>
	
	<cffunction name="setGuest" access="private" output="false">
		<cfargument name="rs" default="#queryNew('')#">
		
		<cfscript>
		if(rs.recordCount){
			variables.id = rs.user_id;
			variables.user = rs.user_main;
			variables.email = rs.email;
			variables.password = rs.password;
			variables.roles = valueList(rs.role_main);
			variables.isVisitor = false;
		} else {
			variables.id = 0;
			variables.user = "guest";
			variables.email = "";
			variables.password = "";
			variables.roles = "";
			variables.isVisitor = true;
		}
		</cfscript>
	</cffunction>
	
	<cffunction name="isAuthorized" access="public" output="false">
		<cfargument name="roles">
		<cfargument name="failLocation" default="">
		
		<cfscript>
		var authorized = false;
		var innerAuth = false;
		var iGroup = 0;
		var roleGroup = "";
		var iRole = "";
		
		for(iGroup=1; iGroup LTE listLen(arguments.roles,"|"); iGroup++){
			roleGroup = listGetAt(arguments.roles,iGroup,"|");
			innerAuth = false;
			for(iRole=1; iRole LTE listLen(roleGroup); iRole++){
				if(listFind(variables.roles,listGetAt(roleGroup,iRole)))
					innerAuth = true;
			}
			if(NOT authorized)
				authorized = innerAuth;
		}
		
		if(arguments.failLocation NEQ "" AND NOT authorized){
			_location(arguments.failLocation);
		}
		
		return authorized;
		</cfscript>
		
		
	</cffunction>
	
</cfcomponent>